From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 May 2016 22:45:25 +0200
Subject: [Buildroot] [git commit] android-tools: fix Config.in indentation
Message-ID: <20160511204933.6EE048050E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cfac2c01c368a0127a6e33c5790a1a8bf3862a33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Config.in files should be indented using <tab>.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/android-tools/Config.in | 58 ++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
index f84f698..2517370 100644
--- a/package/android-tools/Config.in
+++ b/package/android-tools/Config.in
@@ -1,40 +1,40 @@
 config BR2_PACKAGE_ANDROID_TOOLS
-       bool "android-tools"
-       select BR2_PACKAGE_ANDROID_TOOLS_ADBD if \
-              !BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT && \
-              !BR2_PACKAGE_ANDROID_TOOLS_ADB
-       help
-         This package contains the fastboot and adb utilities, that
-         can be used to interact with target devices using of these
-         protocols.
+	bool "android-tools"
+	select BR2_PACKAGE_ANDROID_TOOLS_ADBD if \
+	      !BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT && \
+	      !BR2_PACKAGE_ANDROID_TOOLS_ADB
+	help
+	  This package contains the fastboot and adb utilities, that
+	  can be used to interact with target devices using of these
+	  protocols.
 
 if BR2_PACKAGE_ANDROID_TOOLS
 
 config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
-       bool "fastboot"
-       select BR2_PACKAGE_LIBSELINUX
-       select BR2_PACKAGE_ZLIB
-       help
-         This option will build and install the fastboot utility for
-         the target, which can be used to reflash other target devices
-         implementing the fastboot protocol.
+	bool "fastboot"
+	select BR2_PACKAGE_LIBSELINUX
+	select BR2_PACKAGE_ZLIB
+	help
+	  This option will build and install the fastboot utility for
+	  the target, which can be used to reflash other target devices
+	  implementing the fastboot protocol.
 
 config BR2_PACKAGE_ANDROID_TOOLS_ADB
-       bool "adb"
-       select BR2_PACKAGE_OPENSSL
-       select BR2_PACKAGE_ZLIB
-       help
-         This option will build and install the adb utility for the
-         target, which can be used to interact with other target
-         devices implementing the ADB protocol.
+	bool "adb"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
+	help
+	  This option will build and install the adb utility for the
+	  target, which can be used to interact with other target
+	  devices implementing the ADB protocol.
 
 config BR2_PACKAGE_ANDROID_TOOLS_ADBD
-       bool "adbd"
-       select BR2_PACKAGE_OPENSSL
-       select BR2_PACKAGE_ZLIB
-       help
-         This option will build and install the adbd utility for the
-         target, which can be used to interact with a host machine
-         implementing the ADB protocol.
+	bool "adbd"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
+	help
+	  This option will build and install the adbd utility for the
+	  target, which can be used to interact with a host machine
+	  implementing the ADB protocol.
 
 endif
