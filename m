From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Sep 2011 21:38:56 +0200
Subject: [Buildroot] [git commit] gst-plugins-bad: audioparsers plugin is
	moved to -good
Message-ID: <20110929193944.D6D328DBD3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ebe28cce6fe5218058aa6b610325f142e930386
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to Sven for noticing.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst-plugins-bad/Config.in       |    3 ---
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    6 ------
 2 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index cd9249a..cfd9b70 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -24,9 +24,6 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AIFF
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ASFMUX
 	bool "asfmux"
 
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUDIOPARSERS
-	bool "audioparsers"
-
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUTOCONVERT
 	bool "autoconvert"
 
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index dee440a..9b2a738 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -40,12 +40,6 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-asfmux
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUDIOPARSERS),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-audioparsers
-else
-GST_PLUGINS_BAD_CONF_OPT += --disable-audioparsers
-endif
-
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUTOCONVERT),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-autoconvert
 else
