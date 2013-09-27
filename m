From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 27 Sep 2013 22:11:14 +0200
Subject: [Buildroot] [git commit] package/gst1-plugins-bad: fix decklink
	comment
Message-ID: <20130927201422.A37219B8A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0c4c5619d0bb32e45a5be4f8d6e6f15cd2df9d2d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It was missing the dependency on the toolchain features.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gstreamer1/gst1-plugins-bad/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
