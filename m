From: hartleys <hartleys@visionengravers.com>
Date: Wed, 18 Jun 2008 19:50:16 -0400
Subject: [Buildroot] trouble building grep
In-Reply-To: <06ee01c8a512$ccac08c0$ad289e86@LPSC0173W>
References: <1CF6EDDF0820924DA43C9A52FE7325950ABFA085@MI8NYCMAIL17.Mi8.com>
	<06ee01c8a512$ccac08c0$ad289e86@LPSC0173W>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909182E0D@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > As far as I can tell the dependants (uclibc, gettext and libintl)
are 
> > being built with no problem. When the make runs for grep it appears
to 
> > get configured fine but during the actual build I get error messages

> > that I think are during the link of libgreputils.a. I get undefined 
> > reference messages for libintl_gettext at various lines in the
source 
> > then the build stops.
>
> All I can offer is that the grep from busybox works fine, and doesn't
> need gettext.
> 
> I assume you have selected BR2_PACKAGE_GETTEXT in the main config of
> buildroot.
>
> But I think the main problem is with locales (intl) and/or wchar
> dependencies missing from the uclibc config.

I've done some googling and "think" the problem has something to do with
the configure for grep.

http://www.haible.de/bruno/gettext-FAQ.html

During the configure it finds libintl.h and ends up defining
HAVE_LIBINTL_H in config.h. But none of the final links during the build
of grep include the option '-lintl' to link the library.

According to the website above, this has something to do with @INTLLIBS@
in Makefile.in but my knowledge of how the autoconf stuff works is
pretty limited so I'm not sure how to fix it.

Can anyone offer any help?

Thanks,
Hartley
