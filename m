From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Thu, 12 Nov 2009 23:33:15 +0100
Subject: [Buildroot] [PATCH 3/6] Fix gst-plugins-bad dependency on openssl
	through the apexsink element
In-Reply-To: <1258065198-22972-1-git-send-email-llandwerlin@gmail.com>
References: <1258065198-22972-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1258065198-22972-4-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/multimedia/gst-plugins-bad/Config.in       |    4 ++++
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    7 +++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index 6aebefd..3061822 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -21,6 +21,10 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AIFFPARSE
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AMRPARSE
 	bool "amrparse"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK
+	bool "apexsink"
+	select BR2_PACKAGE_OPENSSL
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUTOCONVERT
 	bool "autoconvert"
 
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index 282445e..8c73bf0 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -33,6 +33,13 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-amrparse
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-apexsink
+GST_PLUGINS_BAD_DEPENDENCIES += openssl
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-apexsink
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUTOCONVERT),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-autoconvert
 else
-- 
1.6.5.2
