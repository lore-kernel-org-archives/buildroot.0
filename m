From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 May 2012 09:58:32 +0200
Subject: [Buildroot] [PATCH] toolchain/crosstool-NG: disable decimal
	floats
In-Reply-To: <87ehqkr2tm.fsf@macbook.be.48ers.dk>
References: <1337116550-12175-1-git-send-email-yann.morin.1998@free.fr>
 <4FB2D9B7.6050705@mind.be> <87ehqkr2tm.fsf@macbook.be.48ers.dk>
Message-ID: <201205160958.32997.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 16 May 2012 09:40:37 Peter Korsgaard wrote:
> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
>  Arnout> On 05/15/12 23:15, Yann E. MORIN wrote:
>  >> Decimal floats were introduced circa gcc-4.2 or -4.3, and requires
>  >> the floating-point environement fenv.h in the C library.
>  >> 
>  >> The uClibc .config file used by crosstool-NG to build uClibc is the
>  >> same as used by the internal buildroot mechanism, and explcitly
>  >> disables fenv support.
>  >> 
>  >> The quick workaround is to simply disable decimal floats in all
>  >> crosstool-NG config files.
> 
>  Arnout>  Wouldn't it be better to enable FENV in buildroot's uClibc config?

I did not want to impact the internal backend, thus the workaround is
limited to the crosstool-NG backend. This limits the impact for the
now-woon-to-be-released next version of BR.

Switching to enabling fenv by default can be done in the next cycle.

> It's afaik only available for i386, and even then I believe some things
> are missing.

khem told me yesterday on IRC that uClibc had a working fenv for all
supported architectures, with no _known_ problems (which does not mean
there is none, just that none is known so far):
  http://ibot.rikers.org/%23uclibc/20120515.html.gz  @ 20:20:25 - 20:56.17

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
