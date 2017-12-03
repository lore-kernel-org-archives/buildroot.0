From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 23:49:25 +0100
Subject: [Buildroot] [git commit] gstreamer1: add config option for building
 unit test libraries
Message-ID: <20171203224212.8A3178282C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29458dca787106112ad66f8e6178ed530241b999
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Thomas: remove "default n", simplify option prompt.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gstreamer1/Config.in     | 5 +++++
 package/gstreamer1/gstreamer1/gstreamer1.mk | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gstreamer1/Config.in b/package/gstreamer1/gstreamer1/Config.in
index 274171b..3d6b1b9 100644
--- a/package/gstreamer1/gstreamer1/Config.in
+++ b/package/gstreamer1/gstreamer1/Config.in
@@ -16,6 +16,11 @@ config BR2_PACKAGE_GSTREAMER1
 
 if BR2_PACKAGE_GSTREAMER1
 
+config BR2_PACKAGE_GSTREAMER1_CHECK
+	bool "enable unit test libraries"
+	help
+	  Enable building unit test libraries for gstreamer.
+
 config BR2_PACKAGE_GSTREAMER1_PARSE
 	bool "enable command-line parser"
 	default y
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 723e59b..c2da601 100644
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
