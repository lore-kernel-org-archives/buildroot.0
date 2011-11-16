From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 16 Nov 2011 22:53:33 +0100
Subject: [Buildroot] [git commit] gst-plugins-bad: decklink plugin needs C++
	support
Message-ID: <20111116215357.20E468F58A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bcde677598286b8fa39dce48112f1d209c40484e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst-plugins-bad/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index a8d01bc..e772930 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -55,8 +55,12 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DEBUGUTILS
 	bool "debugutils"
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DECKLINK
+	depends on BR2_INSTALL_LIBSTDCPP
 	bool "decklink"
 
+comment "decklink requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DTMF
 	bool "dtmf"
 
