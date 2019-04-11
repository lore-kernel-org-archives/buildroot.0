From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 08:20:32 +0200
Subject: [Buildroot] [git commit] package/android-tools: host-android-tools
 need pkg-conf
Message-ID: <20190411061655.5A25C8E16E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8bd63b0b4a39d42ff35132a8fd18f50722bb6b1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Host version of this package needs pkg-conf the same way as target
package: for Makefiles library dependencies retrieving.

Fixes:

  http://autobuild.buildroot.net/results/8543eb3815a67747349a2e60654d19b9804a3a89/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/android-tools/android-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/android-tools/android-tools.mk b/package/android-tools/android-tools.mk
index 3a63139014..3d5c76a322 100644
--- a/package/android-tools/android-tools.mk
+++ b/package/android-tools/android-tools.mk
@@ -12,6 +12,7 @@ HOST_ANDROID_TOOLS_EXTRA_DOWNLOADS = $(ANDROID_TOOLS_EXTRA_DOWNLOADS)
 ANDROID_TOOLS_LICENSE = Apache-2.0
 ANDROID_TOOLS_LICENSE_FILES = debian/copyright
 ANDROID_TOOLS_DEPENDENCIES = host-pkgconf
+HOST_ANDROID_TOOLS_DEPENDENCIES = host-pkgconf
 
 # Extract the Debian tarball inside the sources
 define ANDROID_TOOLS_DEBIAN_EXTRACT
