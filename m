From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Dec 2017 22:22:41 +0100
Subject: [Buildroot] [git commit] axel: bump to version 2.16.1
Message-ID: <20171206211714.AA0CF80FA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e716e1f3fbb5c7a90d36779b4426ebee25725ad8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes building against static libssl:

  http://autobuild.buildroot.net/results/7edb3756a07bbac27f852332b81677feb6156a48/

The major change between 2.16 and 2.16.1 that fixes static linking
with libssl is that pkg-config is now used to detect
libssl. Therefore, we add a dependency on host-pkgconf.

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/axel/axel.hash | 2 +-
 package/axel/axel.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/axel/axel.hash b/package/axel/axel.hash
index 1fc1c55..c317fb8 100644
--- a/package/axel/axel.hash
+++ b/package/axel/axel.hash
@@ -1 +1 @@
-sha256 bd65f8d8add34ab61ce1fb9e1c7b1c3449b1cfd981ce48aeee218e755ba0d6fb  axel-2.16.tar.xz
+sha256 d34094eb63eaebc989f96eabdda091dcfb28e840bb8d274a5f216775941f59e4  axel-2.16.1.tar.xz
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 136c2e2..129ea29 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-AXEL_VERSION = 2.16
+AXEL_VERSION = 2.16.1
 AXEL_SITE = https://github.com/axel-download-accelerator/axel/releases/download/v$(AXEL_VERSION)
 AXEL_SOURCE = axel-$(AXEL_VERSION).tar.xz
 AXEL_LICENSE = GPL-2.0+
 AXEL_LICENSE_FILES = COPYING
-AXEL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+AXEL_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 
 # ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
 # provided by autoconf relies on wchar_t.
