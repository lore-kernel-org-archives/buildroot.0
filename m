From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Nov 2019 22:15:29 +0100
Subject: [Buildroot] [git commit] Revert "package/dtc: fix license hashes"
Message-ID: <20191105211322.8E7988E846@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=607369d0816f881c9460ca57d9f6ddc31740b37d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit ae0dabd8620cc5fb345096beecef681d19699cd4.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dtc/dtc.hash | 5 ++---
 package/dtc/dtc.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/dtc/dtc.hash b/package/dtc/dtc.hash
index e4d6c02544..3adfcc45a9 100644
--- a/package/dtc/dtc.hash
+++ b/package/dtc/dtc.hash
@@ -2,6 +2,5 @@
 sha256 660b74039690fc37013660544d09191834efb58503c73c555c5513ba75ab031f  dtc-1.5.1.tar.xz
 
 # Hash for license files
-sha256 78e1e1ce5728a990d59c7de61d4741c49185d5129daf783b386380a214328d68  README.license
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  GPL
-sha256 6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  BSD-2-Clause
+sha256 171ce1c292cf148a5be9ff95ce7e5c3d79a002721ab8e119eae3c0f5336d2b3d  README.license
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  GPL
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 7fde0dc968..7587638016 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -8,7 +8,7 @@ DTC_VERSION = 1.5.1
 DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
 DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
 DTC_LICENSE = GPL-2.0+ or BSD-2-Clause (library)
-DTC_LICENSE_FILES = README.license GPL BSD-2-Clause
+DTC_LICENSE_FILES = README.license GPL
 DTC_INSTALL_STAGING = YES
 DTC_DEPENDENCIES = host-bison host-flex
 HOST_DTC_DEPENDENCIES = host-bison host-flex
