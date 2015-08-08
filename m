From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:47 -0000
Subject: [Buildroot] [git commit branch/next] busybox: added linux-pam
	support
Message-ID: <20150808105637.33160818F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=083aeac94e19cde6abd4b29cf29db589327d8c49
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 65ce7ef..ce6652b 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -141,6 +141,13 @@ define BUSYBOX_SET_INIT
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
