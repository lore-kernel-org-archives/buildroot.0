From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 27 Oct 2017 18:25:35 +0200
Subject: [Buildroot] [PATCH v1 1/2] gstreamer1: add config option for
	building unit test libraries
Message-ID: <20171027162536.4665-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gstreamer1/Config.in     | 6 ++++++
 package/gstreamer1/gstreamer1/gstreamer1.mk | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gstreamer1/Config.in b/package/gstreamer1/gstreamer1/Config.in
index 274171b639..c5839f546d 100644
--- a/package/gstreamer1/gstreamer1/Config.in
+++ b/package/gstreamer1/gstreamer1/Config.in
@@ -16,6 +16,12 @@ config BR2_PACKAGE_GSTREAMER1
 
 if BR2_PACKAGE_GSTREAMER1
 
+config BR2_PACKAGE_GSTREAMER1_CHECK
+	bool "enable building unit test libraries"
+	default n
+	help
+	  Enable building unit test libraries for gstreamer.
+
 config BR2_PACKAGE_GSTREAMER1_PARSE
 	bool "enable command-line parser"
 	default y
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 723e59b208..c2da60182a 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -17,7 +17,7 @@ GSTREAMER1_CONF_OPTS = \
 	--disable-failing-tests \
 	--disable-valgrind \
 	--disable-benchmarks \
-	--disable-check \
+	$(if $(BR2_PACKAGE_GSTREAMER1_CHECK),,--disable-check) \
 	$(if $(BR2_PACKAGE_GSTREAMER1_TRACE),,--disable-trace) \
 	$(if $(BR2_PACKAGE_GSTREAMER1_PARSE),,--disable-parse) \
 	$(if $(BR2_PACKAGE_GSTREAMER1_GST_DEBUG),,--disable-gst-debug) \
-- 
2.14.2
