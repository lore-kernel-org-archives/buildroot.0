From: hartleys <hartleys@visionengravers.com>
Date: Wed, 18 Jun 2008 19:58:41 -0400
Subject: [Buildroot] trouble building grep
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE1909182E0D@mi8nycmail19.Mi8.com>
References: <1CF6EDDF0820924DA43C9A52FE7325950ABFA085@MI8NYCMAIL17.Mi8.com><06ee01c8a512$ccac08c0$ad289e86@LPSC0173W>
	<BD79186B4FD85F4B8E60E381CAEE1909182E0D@mi8nycmail19.Mi8.com>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909182E0E@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I've done some googling and "think" the problem has
> something to do with the configure for grep.
>
> http://www.haible.de/bruno/gettext-FAQ.html
>
> During the configure it finds libintl.h and ends up
> defining HAVE_LIBINTL_H in config.h. But none of the
> final links during the build of grep include the
> option '-lintl' to link the library.
>
> According to the website above, this has something to
> do with @INTLLIBS@ in Makefile.in but my knowledge of
> how the autoconf stuff works is pretty limited so I'm
> not sure how to fix it.

Looks like this is a known issue.

http://bugs.busybox.net/view.php?id=1549

Hartley
