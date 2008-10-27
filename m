From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Oct 2008 10:12:15 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package: audio/libogg
	audio/libvorbis docker edit etc...
In-Reply-To: <200810270759.28374.markus.heidelberg@web.de> (Markus
	Heidelberg's message of "Mon\, 27 Oct 2008 07\:59\:27 +0100")
References: <20081026061944.0F6DE3C2B3@busybox.net>
	<200810261437.05446.markus.heidelberg@web.de>
	<87r663f91t.fsf@macbook.be.48ers.dk>
	<200810270759.28374.markus.heidelberg@web.de>
Message-ID: <87iqrebdw0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:

Hi,

 Markus> After looking into it again, the package seems a bit
 Markus> broken. `$(PKG_CONFIG) --cflags glib-2.0` evaluates to
 Markus> "-I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include", not
 Markus> the ones in staging_dir, so it uses the system include
 Markus> files. PKG_CONFIG_PATH has to be defined and
 Markus> PKG_CONFIG_SYSROOT_DIR, too. But it also uses the staging
 Markus> files hardcoded in the Makefile. Then have a look at XLIBPATH
 Markus> in the Makefile, which points to the system files. And
 Markus> LDFLAGS is never used.

Yeah, the docker build system seems pretty broken :/

-- 
Bye, Peter Korsgaard
