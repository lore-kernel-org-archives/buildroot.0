From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Aug 2015 20:38:49 +0200
Subject: [Buildroot] [PATCH] [autobuild] package/elfutils: does not
 build with musl
In-Reply-To: <20150808111537.18bbf886@free-electrons.com>
References: <1438983471-26367-1-git-send-email-yann.morin.1998@free.fr>
 <20150808111537.18bbf886@free-electrons.com>
Message-ID: <20150808183849.GA3594@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-08-08 11:15 +0200, Thomas Petazzoni spake thusly:
> On Fri,  7 Aug 2015 23:37:51 +0200, Yann E. MORIN wrote:
> 
> > diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
> > index 6c6856e..19ab8fc 100644
> > --- a/package/elfutils/Config.in
> > +++ b/package/elfutils/Config.in
> > @@ -1,6 +1,7 @@
> > -comment "elfutils needs a toolchain w/ wchar, dynamic library"
> > +comment "elfutils needs a uClibc or (e)glibc toolchain w/ wchar, dynamic library"
> >  	depends on !BR2_bfin
> >  	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
> > +	depends on !BR2_TOOLCHAIN_USES_UCLIBC && !BR2_TOOLCHAIN_USES_GLIBC
> 
> Now that I read this again, I believe this is wrong. It should be:
> 
> 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
> 		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
> 
> with your version, the comment can only be visible when a toolchain
> that is *not* uclibc and *not* glibc is used. I.e, the comment is now
> only visible when musl is used. Which is not what we want.
> 
> Can you send a follow-up patch to fix this (I already pushed and
> applied your patch).

Dang... Yes, will do.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
