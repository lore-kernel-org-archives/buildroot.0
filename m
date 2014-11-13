From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Nov 2014 18:45:25 +0100
Subject: [Buildroot] [PATCH v4 2/2] elfutils: bump version to 0.160
In-Reply-To: <54620B25.4050306@mind.be>
References: <1415706464-15288-1-git-send-email-Vincent.Riera@imgtec.com>
 <1415706464-15288-3-git-send-email-Vincent.Riera@imgtec.com>
 <54620B25.4050306@mind.be>
Message-ID: <20141113174525.GB3641@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Vicente, All,

On 2014-11-11 14:12 +0100, Arnout Vandecappelle spake thusly:
> On 11/11/14 12:47, Vicente Olivert Riera wrote:
> > +sha256  741b556863c069ceab2d81eb54aeda8c34f46728859704eaf9baef8503e9a9d1  elfutils-0.160.tar.bz2
> > +sha256  feb307acf472598ea7af4e4b439251613a8f5d81e804b4abf9aeca195a5d4254  elfutils-portability.patch
> 
>  Forgot to mention in my previous review: I verified the first hash against the
> upstream gpg signature, and I verified the second hash against my local download.
> 
>  I also did a simple build test. So:
> 
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>  [for -next, and if the 0006 patch subject is modified]

Vicente noticed I replied to the v3, not this v4, so I'll repeat it
here, in case my explanations went un-noticed:

Well, if you look a few lines further in config/eu.am you'll see:

    if BUILD_WERROR
    AM_CFLAGS += $(if $($(*F)_no_Werror),,-Werror)
    endif

So, this patch remove the duplicate setting of -Werror in the place
where it is not wanted, because it is already conditional to
BUILD_WERROR, even though it should be BUILD_WERROR_TRUE that should be
tested.

But the real automake conditional is really called BUILD_WERROR:

    ./configure.ac:AM_CONDITIONAL(BUILD_WERROR, test "$enable_werror" =
yes)

So, I still believe the patch title is correct, except upstream may have
messed up their conditional test (and we could help them fix it, maybe).

So my reviewed-by tag, which this patch already bears, still stands.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
