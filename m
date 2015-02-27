From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 27 Feb 2015 23:25:49 +0100
Subject: [Buildroot] [PATCH v2 4/7] directfb: add new TIFF option
In-Reply-To: <1425075952-24699-1-git-send-email-ps.report@gmx.net>
References: <1425075952-24699-1-git-send-email-ps.report@gmx.net>
Message-ID: <1425075952-24699-4-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/directfb/Config.in   | 5 +++++
 package/directfb/directfb.mk | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 7759f8f..d0b7167 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -108,6 +108,11 @@ config BR2_PACKAGE_DIRECTFB_GIF
 	bool "enable GIF support"
 	default y
 
+config BR2_PACKAGE_DIRECTFB_TIFF
+	bool "enable TIFF support"
+	default y
+	select BR2_PACKAGE_TIFF
+
 config BR2_PACKAGE_DIRECTFB_IMLIB2
 	bool "enable IMLIB2 support"
 	select BR2_PACKAGE_IMLIB2
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 1aeab9f..117f450 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -100,6 +100,13 @@ else
 DIRECTFB_CONF_OPTS += --disable-gif
 endif
 
+ifeq ($(BR2_PACKAGE_DIRECTFB_TIFF),y)
+DIRECTFB_CONF_OPTS += --enable-tiff
+DIRECTFB_DEPENDENCIES += tiff
+else
+DIRECTFB_CONF_OPTS += --disable-tiff
+endif
+
 ifeq ($(BR2_PACKAGE_DIRECTFB_PNG),y)
 DIRECTFB_CONF_OPTS += --enable-png
 DIRECTFB_DEPENDENCIES += libpng
-- 
2.1.4
