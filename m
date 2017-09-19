From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 19 Sep 2017 21:44:28 +0200
Subject: [Buildroot] [git commit] cmake: expose the host variant in
	menuconfig
Message-ID: <20170919193719.B21E6801E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d759d70accb375c8044354bdae38087776c887ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the addition of the sdk support it may be interesting to build
host-cmake even though no packages need it, so expose it in menuconfig.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in.host       |  1 +
 package/cmake/Config.in.host | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index df3893a..9e05ec6 100644
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
index 0000000..b2e210e
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
