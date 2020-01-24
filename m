From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Jan 2020 15:29:03 +1030
Subject: [Buildroot] [PATCH] package/kexec-lite: Bump version
Message-ID: <20200124045903.272466-1-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream changes include:

 - Fix loading FreeBSD kernels with multiple PT_LOAD sections.

 - Use autotools to configure and build kexec-lite

 - Add support for kexec_file_load

The packaging is adjusted to account for the change in build systems.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 package/kexec-lite/kexec-lite.hash |  2 +-
 package/kexec-lite/kexec-lite.mk   | 13 +++----------
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/package/kexec-lite/kexec-lite.hash b/package/kexec-lite/kexec-lite.hash
index d71e8d00a45f..91e39d68ee99 100644
--- a/package/kexec-lite/kexec-lite.hash
+++ b/package/kexec-lite/kexec-lite.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 2e9b131324cec9d27840179daa35e3159a4032ff78b74e301850faa007567d0e kexec-lite-87d044a895b1c004320a2676099a54a5a2a74f2e.tar.gz
+sha256 6eb115c8db3a071b970d7ba985ea5e2425e1e716952186f9a4fe329a2e2bb1ca kexec-lite-18ec88310c4134eca2f9e3c417cd09f5914bf633.tar.gz
diff --git a/package/kexec-lite/kexec-lite.mk b/package/kexec-lite/kexec-lite.mk
index 8e1ad8d52df6..e44c6df8f219 100644
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
-- 
2.24.1
