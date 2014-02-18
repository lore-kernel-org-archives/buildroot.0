From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Feb 2014 23:14:47 +0100
Subject: [Buildroot] Switching from uClibc to glibc as the default in
	Buildroot?
Message-ID: <20140218231447.524a1a20@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The uClibc project has not released any new version since almost two
years, despite the fact that there are numerous known issues and
limitations in 0.9.33.2, and a good set of fixes in the 0.9.33 branch
that have never been part of any release.

This lack of stable releases is causing major issues for build systems
such as Buildroot. Not only do we have to carry a large number of
backported patches to fix uClibc bugs and add missing system calls and
functionalities needed to run modern software, but we also have issues
supporting uClibc toolchains provided by other parties (such as
processor vendors), because they are not using the same set of
backported patches. The lack of releases is causing fragmentation
between the various uClibc versions, making uClibc more and more
painful to support in Buildroot.

To give you an idea, Buildroot currently has more than 50 patches on
top of uClibc 0.9.33.2:

  http://git.buildroot.net/buildroot/tree/package/uclibc/0.9.33.2/

OpenEmbedded has to use a Git version of uClibc, with a few patches:

  https://github.com/openembedded/oe-core/blob/master/meta/recipes-core/uclibc/uclibc-git.inc

OpenWRT also has a good number of patches:

  https://dev.openwrt.org/browser/trunk/toolchain/uClibc/patches-0.9.33.2

We have already asked for stable releases in September 2013 [1], then
in November 2013 [2], and finally in December 2013 [3], and still no
release has been made.

Historically, Buildroot was created as a tool to generate small Linux
systems based on uClibc, in order to test and exercise uClibc. Since
its origin, Buildroot has had uClibc as its default C library, quite
certainly helping in propagating uClibc in embedded Linux systems.

However, due to the reasons mentioned above, supporting uClibc has
proven to be more and more complicated. Therefore, at the latest
Buildroot Developers Meeting, we discussed the idea of switching to
using glibc as the default C library in Buildroot for the
architectures that glibc supports.

But before doing that, we would like to discuss this problem again
with the uClibc community, and see if something can be done to revive
the project in terms of delivering releases. Adopting a time-based
release schedule has proven to work really well for Buildroot, and we
believe this solution should be considered by the uClibc developers.

Thanks!

Thomas, on behalf of the Buildroot core developers: Peter Korsgaard,
Yann E. Morin, Samuel Martin, Thomas De Schampheleire.

[1] http://lists.uclibc.org/pipermail/uclibc/2013-September/047942.html
[2] http://lists.uclibc.org/pipermail/uclibc/2013-November/048029.html
[3] http://lists.uclibc.org/pipermail/uclibc/2013-December/048102.html
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
