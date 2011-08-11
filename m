From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 11 Aug 2011 09:56:05 +0200
Subject: [Buildroot] util-linux compile problems
In-Reply-To: <87hb5qk6rn.fsf@macbook.be.48ers.dk>
References: <1312804690-21977-1-git-send-email-s.neumann@raumfeld.com>
 <87fwlblqxr.fsf@macbook.be.48ers.dk> <87y5z3k92i.fsf@macbook.be.48ers.dk>
 <1312883451.1593.3.camel@sven> <87hb5qk6rn.fsf@macbook.be.48ers.dk>
Message-ID: <1313049366.16546.4.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 2011-08-09 at 16:18 +0200, Peter Korsgaard wrote:

>  Sven> Well, it works for me in that configuration as well. But it
>  Sven> doesn't work for the configuration that has locale support
>  Sven> enabled and gettext/libintl:
> 
>  Sven> BR2_ENABLE_LOCALE=y
>  Sven> BR2_NEEDS_GETTEXT=y
>  Sven> BR2_NEEDS_GETTEXT_IF_LOCALE=y
>  Sven> BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
>  Sven> BR2_PACKAGE_GETTEXT=y
>  Sven> BR2_PACKAGE_LIBINTL=y
> 
>  Sven> I've tried the following patch, but it doesn't seem to help:
> 
> Ahh, ok - That's easy to fix, similar to how we do it E.G. with
> avahi. I've committed a fix doing that.

That fix seems to do the trick. But now the build fails when it tries to
install the translations:

Making install in po
make[2]: Entering directory
`/home/sven/git/buildroot/output/build/util-linux-2.19.1/po'
/bin/sh
@MKINSTALLDIRS@ /home/sven/git/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/share
/bin/sh: Can't open @MKINSTALLDIRS@
make[2]: *** [install-data-yes] Error 127


Sven
