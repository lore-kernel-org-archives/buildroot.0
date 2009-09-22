From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Sep 2009 00:38:54 +0200
Subject: [Buildroot] [pull request] Buildroot cleanup, v2
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901D422CB@mi8nycmail19.Mi8.com>
References: <1253135266-26880-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<BD79186B4FD85F4B8E60E381CAEE190901D422CB@mi8nycmail19.Mi8.com>
Message-ID: <20090923003854.134a1993@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 22 Sep 2009 18:16:48 -0400,
"H Hartley Sweeten" <hartleys@visionengravers.com> a ?crit :

> Nice work with the cleanup!

Thanks!

> To further cleanup the build do you think it's worthwhile to create a
> "Makefile.autotools.host.in" or just extend "Makefile.autotools.in" to
> handle the various packages that do a make for the host?  At a quick
> glance it appears they all go thru the same steps for the host build.

That's definitely on my TODO-list. But don't hesitate to step-up with a
patch, since I'm very busy these days and don't know when I'll be able
to work on this again (next week ?).

However, for me, it's not only about Makefile.autotools.in. I also
would like to see all packages use some infrastructure similar to
Makefile.autotools.in. Of course, this infrastructure would be more
flexible that Makefile.autotools.in, but could at least automate the
download, extraction and patch process, and could allow to do some
common things before/after the configuration, compilation and
installation to the staging/target. This will be very useful to, for
example, properly handle the removal of a package from the target.

I've started to prototype such a thing, and got something simple such
as zlib.mk working, with a significant reduction in size of zlib.mk.
However, with slightly more complex things such as icu.mk (which
requires the tool for the host), my prototype isn't yet advanced enough.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
