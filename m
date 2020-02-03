From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 14:12:44 +0100
Subject: [Buildroot] [git commit] package/kexec-lite: bump version
Message-ID: <20200203130421.6DD00887A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a35294564c058c0e0eae62ec67a09c82d556a5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream changes include:

 - Fix loading FreeBSD kernels with multiple PT_LOAD sections.

 - Use autotools to configure and build kexec-lite

 - Add support for kexec_file_load

The packaging is adjusted to account for the change in build systems.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kexec-lite/kexec-lite.hash |  2 +-
 package/kexec-lite/kexec-lite.mk   | 13 +++----------
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/package/kexec-lite/kexec-lite.hash b/package/kexec-lite/kexec-lite.hash
index d71e8d00a4..91e39d68ee 100644
--- a/package/kexec-lite/kexec-lite.hash
+++ b/package/kexec-lite/kexec-lite.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 2e9b131324cec9d27840179daa35e3159a4032ff78b74e301850faa007567d0e kexec-lite-87d044a895b1c004320a2676099a54a5a2a74f2e.tar.gz
+sha256 6eb115c8db3a071b970d7ba985ea5e2425e1e716952186f9a4fe329a2e2bb1ca kexec-lite-18ec88310c4134eca2f9e3c417cd09f5914bf633.tar.gz
diff --git a/package/kexec-lite/kexec-lite.mk b/package/kexec-lite/kexec-lite.mk
index 8e1ad8d52d..e44c6df8f2 100644
--- a/package/kexec-lite/kexec-lite.mk
+++ b/package/kexec-lite/kexec-lite.mk
@@ -4,18 +4,11 @@
 #
 ################################################################################
 
-KEXEC_LITE_VERSION = 87d044a895b1c004320a2676099a54a5a2a74f2e
+KEXEC_LITE_VERSION = 18ec88310c4134eca2f9e3c417cd09f5914bf633
 KEXEC_LITE_SITE = $(call github,antonblanchard,kexec-lite,$(KEXEC_LITE_VERSION))
 KEXEC_LITE_LICENSE = GPL-2.0+
 KEXEC_LITE_LICENSE_FILES = COPYING
 KEXEC_LITE_DEPENDENCIES = elfutils dtc
+KEXEC_LITE_AUTORECONF = YES
 
-define KEXEC_LITE_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
-endef
-
-define KEXEC_LITE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 755 $(@D)/kexec $(TARGET_DIR)/usr/sbin/kexec
-endef
-
-$(eval $(generic-package))
+$(eval $(autotools-package))
