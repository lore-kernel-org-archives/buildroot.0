From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Feb 2021 10:54:34 +0100
Subject: [Buildroot] [git commit branch/2020.02.x]
 package/intel-mediadriver: drop unrecognized options
Message-ID: <20210201094917.603F28367F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cbbf4bb708cc4bc5eb460219028932e2cd81f69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

BUILD_ALONG_WITH_CMRTLIB has been dropped since version 18.2.0 and
https://github.com/intel/media-driver/commit/c3e13c175d12790ab70c4de3521e47f62be780de

RUN_TEST_SUITE is also unrecognized (only MEDIA_RUN_TEST_SUITE is
recognized)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8a0cbe94747a83790a6d97e3e479c97ff5771dee)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-mediadriver/intel-mediadriver.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 0acac52e35..094aca7985 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -22,9 +22,7 @@ INTEL_MEDIADRIVER_DEPENDENCIES = \
 INTEL_MEDIADRIVER_SUPPORTS_IN_SOURCE_BUILD = NO
 
 INTEL_MEDIADRIVER_CONF_OPTS = \
-	-DBUILD_ALONG_WITH_CMRTLIB=1 \
 	-DINSTALL_DRIVERS_SYSCONF=OFF \
-	-DMEDIA_RUN_TEST_SUITE=OFF \
-	-DRUN_TEST_SUITE=OFF
+	-DMEDIA_RUN_TEST_SUITE=OFF
 
 $(eval $(cmake-package))
