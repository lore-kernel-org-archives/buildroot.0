From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue,  9 Apr 2019 15:17:54 +0200
Subject: [Buildroot] [PATCH] package/android-tools: host-android-tools need
 pkg-conf
Message-ID: <20190409131754.24516-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Host version of this package needs pkg-conf the same way as target
package: for Makefiles library dependencies retrieving.

Set HOST_ANDROID_TOOLS_DEPENDENCIES = $(ANDROID_TOOLS_DEPENDENCIES) to
provide host-pkg-conf.

Fixes:
http://autobuild.buildroot.net/results/854/8543eb3815a67747349a2e60654d19b9804a3a89/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/android-tools/android-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/android-tools/android-tools.mk b/package/android-tools/android-tools.mk
index 3a63139014..b8808057a2 100644
--- a/package/android-tools/android-tools.mk
+++ b/package/android-tools/android-tools.mk
@@ -12,6 +12,7 @@ HOST_ANDROID_TOOLS_EXTRA_DOWNLOADS = $(ANDROID_TOOLS_EXTRA_DOWNLOADS)
 ANDROID_TOOLS_LICENSE = Apache-2.0
 ANDROID_TOOLS_LICENSE_FILES = debian/copyright
 ANDROID_TOOLS_DEPENDENCIES = host-pkgconf
+HOST_ANDROID_TOOLS_DEPENDENCIES = $(ANDROID_TOOLS_DEPENDENCIES)
 
 # Extract the Debian tarball inside the sources
 define ANDROID_TOOLS_DEBIAN_EXTRACT
-- 
2.17.1
