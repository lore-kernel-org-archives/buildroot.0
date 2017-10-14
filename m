From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Oct 2017 10:03:26 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] qemu: security bump to
	version 2.8.1.1
Message-ID: <20171014110317.CF185810FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37fa007ab6eda5d6f483d36ed83e2bf3f67dd659
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes the following security issues and adds a number of other bigfixes:

2.8.1: Changelog:
https://lists.gnu.org/archive/html/qemu-devel/2017-03/msg06332.html

CVE-2017-2615 - display: cirrus: oob access while doing bitblt copy backward
mode

CVE-2017-2620 - display: cirrus: out-of-bounds access issue while in
cirrus_bitblt_cputovideo

CVE-2017-2630 - nbd: oob stack write in client routine drop_sync

2.8.1.1 Changelog:
https://lists.gnu.org/archive/html/qemu-devel/2017-04/msg03460.html

CVE-2017-7471 - 9p: virtfs allows guest to change filesystem attributes on
host

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit af0f2d2bbcaca9000e62b5388f4c3cd8e700c6ff)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.hash | 2 +-
 package/qemu/qemu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 19cb306..5164303 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,2 +1,2 @@
 # Locally computed, tarball verified with GPG signature
-sha256 dafd5d7f649907b6b617b822692f4c82e60cf29bc0fc58bc2036219b591e5e62  qemu-2.8.0.tar.bz2
+sha256 f62ab18a1fb9ff5b4c81ed44becc945b11581eff777618141bdb787da55d3638  qemu-2.8.1.1.tar.bz2
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index e744556..1fe4da4 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QEMU_VERSION = 2.8.0
+QEMU_VERSION = 2.8.1.1
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
 QEMU_LICENSE = GPLv2, LGPLv2.1, MIT, BSD-3c, BSD-2c, Others/BSD-1c
