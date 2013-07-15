From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:40 -0500
Subject: [Buildroot] [PATCH 57/67] gst-plugin-x170: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-58-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/multimedia/gst-plugin-x170/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/multimedia/gst-plugin-x170/Config.in b/package/multimedia/gst-plugin-x170/Config.in
index 9a1ae63..142367b 100644
--- a/package/multimedia/gst-plugin-x170/Config.in
+++ b/package/multimedia/gst-plugin-x170/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_GST_PLUGIN_X170
 	bool "gst-plugin-x170"
 	depends on BR2_PACKAGE_GSTREAMER
 	depends on BR2_arm926t
+	# glibc toolchain includes WCHAR and threading for libglib2
 	depends on BR2_TOOLCHAIN_USES_GLIBC # on2-8170-libs
 	select BR2_PACKAGE_ON2_8170_LIBS
 	help
@@ -9,3 +10,6 @@ config BR2_PACKAGE_GST_PLUGIN_X170
 	  ATMEL AT91SAM9M10 SoC.
 
 	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SAM9M10Gstreamer
+
+comment "gst-plugin-x170 requires a toolchain which uses eglibc/glibc"
+	depends on BR2_PACKAGE_GSTREAMER && BR2_arm926t && !BR2_TOOLCHAIN_USES_GLIBC
-- 
1.8.1.2
