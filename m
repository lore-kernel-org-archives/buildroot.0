From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2008 17:56:45 +0100
Subject: [Buildroot] Synchronisation of dependencies between Config.in and
	.mk files ?
Message-ID: <20081027175645.7e7cb096@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Currently, there are two complementary ways of expressing dependencies
between packages:

 * Through the select BR2_FOOBAR statements in the Config.in files ;

 * Through the FOOBAR_DEPS variable in the package makefiles.

The second one is absolutely necessary, as it makes sure that packages
are built in the proper order. The first one allows packages Makefiles
to adapt their configuration depending on the existing dependencies
(i.e if tslib is available, then enable support for touchscreens, etc.).

However, there are great chances for these two lists of dependencies
for each package to become unsynchronized.

What's the policy about this ? What are the current techniques to keep
them synchronized ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
