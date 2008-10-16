From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Oct 2008 23:38:29 +0200
Subject: [Buildroot] [PATCH 2/9] Fix link flags of mtdutils
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE1909B55B74@mi8nycmail19.Mi8.com>
References: <20081016203220.15826.26173.stgit@localhost.localdomain>
	<20081016203225.15826.71097.stgit@localhost.localdomain>
	<20081016225130.491d128c@surf>
	<BD79186B4FD85F4B8E60E381CAEE1909B55B74@mi8nycmail19.Mi8.com>
Message-ID: <20081016233829.1d5efba4@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 16 Oct 2008 17:15:40 -0400,
"hartleys" <hartleys@visionengravers.com> a ?crit :

> Just did a quick glance at the patch above, I don't think it would
> work for the mtd package. The patch add TARGET_LDFLAGS to the
> TARGET_CONFIGURE_OPTS. The mtd package doesn't use Autotools so I
> don't think it will see the change.

TARGET_CONFIGURE_OPTS is supposed to be used in all packages when
calling ./configure, as far as I understand (and it's the case in the
packages I had a look at). TARGET_CONFIGURE_OPTS is of course also used
by Makefile.autotools.in.

> It should work for usbutils. But I'm not sure if the "-Wl,--rpath-link
> -Wl,$(STAGING_DIR)/usr/lib" is also needed.

Without this, I get linking problems like:

http://buildroot.uclibc.org/lists/buildroot/2008-October/010917.html

(read the whole thread for an analysis of my issue, and how I found
this solution).

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
