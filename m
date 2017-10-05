From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu,  5 Oct 2017 17:06:20 +0200
Subject: [Buildroot] [PATCH 1/2] lvm2: add host variant
Message-ID: <20171005150621.19570-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is only for the device-mapper library, so a user selectable
Config.in.host option isn't needed.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lvm2/lvm2.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index f7f706976f..5783ab08be 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -51,4 +51,16 @@ ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 LVM2_CONF_ENV += ac_cv_flag_HAVE_PIE=no
 endif
 
+HOST_LVM2_CONF_OPTS = \
+	--enable-write_install \
+	--enable-pkgconfig \
+	--disable-cmdlib \
+	--disable-dmeventd \
+	--disable-applib \
+	--disable-fsadm \
+	--disable-readline
+HOST_LVM2_MAKE_OPTS = device-mapper
+HOST_LVM2_INSTALL_OPTS = install_device-mapper
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.11.0
