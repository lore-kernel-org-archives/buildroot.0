From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Fri, 10 Jul 2015 18:27:52 -0500
Subject: [Buildroot] [PATCH v8 06/16] busybox: added linux-pam support
In-Reply-To: <1436570882-56442-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1436570882-56442-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <1436570882-56442-7-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <Matthew.Weber@rockwellcollins.com>

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

---
Changes v7 -> v8:
  - No changes

Changes v6 -> v7:
  - No changes

Changes v5 -> v6:
  - No changes

Changes v4 -> v5:
  - No changes

Changes v1 -> v4:
  - Did not exist
---
 package/busybox/busybox.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 1df629b..098c24f 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -172,6 +172,13 @@ define BUSYBOX_INSTALL_INDIVIDUAL_BINARIES
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+define BUSYBOX_LINUX_PAM
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PAM,$(BUSYBOX_BUILD_CONFIG))
+endef
+BUSYBOX_DEPENDENCIES += linux-pam
+endif
+
 ifeq ($(BR2_PACKAGE_BUSYBOX_SELINUX),y)
 BUSYBOX_DEPENDENCIES += host-pkgconf libselinux libsepol
 define BUSYBOX_SET_SELINUX
-- 
1.9.1
