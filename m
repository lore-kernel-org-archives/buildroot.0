From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 Sep 2013 19:26:42 +0200
Subject: [Buildroot] [PATCH] package/gst1-plugins-bad: fix decklink comment
Message-ID: <1380302802-28015-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

It was missing the dependency on the toolchain features.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index f30f2b3..0903aee 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -346,6 +346,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DECKLINK
 	  Blackmagic Decklink plugin
 
 comment "decklink requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB
 	bool "directfb"
-- 
1.8.1.2
