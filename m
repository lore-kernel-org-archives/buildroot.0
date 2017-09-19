From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Sep 2017 12:43:49 +0200
Subject: [Buildroot] [PATCH] cmake: expose the host variant in menuconfig
Message-ID: <20170919104349.18781-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the addition of the sdk support it may be interesting to build
host-cmake even though no packages need it, so expose it in menuconfig.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in.host       |  1 +
 package/cmake/Config.in.host | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 package/cmake/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index c5a852b858..9ae19ec4b3 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -4,6 +4,7 @@ menu "Host utilities"
 	source "package/android-tools/Config.in.host"
 	source "package/cbootimage/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
+	source "package/cmake/Config.in.host"
 	source "package/cramfs/Config.in.host"
 	source "package/dfu-util/Config.in.host"
 	source "package/dos2unix/Config.in.host"
diff --git a/package/cmake/Config.in.host b/package/cmake/Config.in.host
new file mode 100644
index 0000000000..b2e210ee2c
--- /dev/null
+++ b/package/cmake/Config.in.host
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HOST_CMAKE
+	bool "host cmake"
+	help
+	  CMake is an open-source, cross-platform family of tools
+	  designed to build, test and package software. CMake is used
+	  to control the software compilation process using simple
+	  platform and compiler independent configuration files, and
+	  generate native makefiles and workspaces that can be used in
+	  the compiler environment of your choice.
+
+	  http://www.cmake.org/
-- 
2.11.0
