From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Tue, 14 Jul 2015 15:20:19 -0500
Subject: [Buildroot] [PATCH v9 07/15] busybox: added linux-pam support
In-Reply-To: <1436905227-26937-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1436905227-26937-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <1436905227-26937-8-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <Matthew.Weber@rockwellcollins.com>

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

---
Changes v8 -> v9:
  - No changes

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
index 94f3b47..8ef31ff 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -180,6 +180,13 @@ define BUSYBOX_INSTALL_INDIVIDUAL_BINARIES
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
