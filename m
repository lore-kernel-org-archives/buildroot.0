From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Oct 2019 20:52:26 +0200
Subject: [Buildroot] [git commit] package/dtc: fix license hashes
Message-ID: <20191026184556.5E94D888D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae0dabd8620cc5fb345096beecef681d19699cd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of license files and add BSD-2-Clause file, see
https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/?id=25bb080c18d1a8a96760e26257bf8c80ec7fcab4
https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/?id=702c1b6c0e73d2bcf24f0b8398aca6a940863e48

Fixes:
 - http://autobuild.buildroot.org/results/d3db8ddc096f09bb1728a0ba40b925fbf49c424b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dtc/dtc.hash | 5 +++--
 package/dtc/dtc.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/dtc/dtc.hash b/package/dtc/dtc.hash
index 3adfcc45a9..e4d6c02544 100644
--- a/package/dtc/dtc.hash
+++ b/package/dtc/dtc.hash
@@ -2,5 +2,6 @@
 sha256 660b74039690fc37013660544d09191834efb58503c73c555c5513ba75ab031f  dtc-1.5.1.tar.xz
 
 # Hash for license files
-sha256 171ce1c292cf148a5be9ff95ce7e5c3d79a002721ab8e119eae3c0f5336d2b3d  README.license
-sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  GPL
+sha256 78e1e1ce5728a990d59c7de61d4741c49185d5129daf783b386380a214328d68  README.license
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  GPL
+sha256 6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  BSD-2-Clause
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index ce094cfb86..0406ff7ca9 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -8,7 +8,7 @@ DTC_VERSION = 1.5.1
 DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
 DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
 DTC_LICENSE = GPL-2.0+ or BSD-2-Clause (library)
-DTC_LICENSE_FILES = README.license GPL
+DTC_LICENSE_FILES = README.license GPL BSD-2-Clause
 DTC_INSTALL_STAGING = YES
 DTC_DEPENDENCIES = host-bison host-flex
 HOST_DTC_DEPENDENCIES = host-bison host-flex
