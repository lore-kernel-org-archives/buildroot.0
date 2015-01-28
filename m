From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 Jan 2015 19:34:10 +0100
Subject: [Buildroot] [PATCH] toolchain/external: do not accept
 distro-class toolchains
In-Reply-To: <20150127221604.134cffdb@free-electrons.com>
References: <1422225691-15930-1-git-send-email-yann.morin.1998@free.fr>
 <54C7FF64.3030501@mind.be>
 <20150127221604.134cffdb@free-electrons.com>
Message-ID: <20150128183410.GA4231@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Thomas, All,

On 2015-01-27 22:16 +0100, Thomas Petazzoni spake thusly:
> On Tue, 27 Jan 2015 22:13:08 +0100, Arnout Vandecappelle wrote:
> 
> >  This sounds as if the problem is that the binary can't be moved to a different
> > place. But for pre-installed external toolchains, we don't do that.
> > 
> >  But I guess the real problem is that we can't copy the libs to the staging dir,
> > right? So perhaps that should be written in this remark.
> 
> Yes the problem is more that such toolchains typically don't have a
> clean sysroot, with just the C library, C library headers and kernel
> headers.

Well, both.

They are tainted with a lot of cruft we are not interested in, indeed.

But since the sysroot is not a sub-directory of the --prefix, they are
not relocatable either.

I'll update the error message to take your comments into account.
Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
