From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 22 Feb 2021 18:00:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/intel-mediasdk: disable samples and
 tutorials
Message-ID: <20210222170048.409719-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable samples and tutorials which are enabled by default and fail to
build with gcc 10 without upstream commit:
https://github.com/Intel-Media-SDK/MediaSDK/commit/c7d40371eb0c2042261fe1f91a364f69a1457235

Fixes:
 - http://autobuild.buildroot.org/results/9ee28e5dc0b2ba854766d9bc82b95c28be2722d3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/intel-mediasdk/intel-mediasdk.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/intel-mediasdk/intel-mediasdk.mk b/package/intel-mediasdk/intel-mediasdk.mk
index a2ffe081db..5467c96380 100644
--- a/package/intel-mediasdk/intel-mediasdk.mk
+++ b/package/intel-mediasdk/intel-mediasdk.mk
@@ -12,6 +12,9 @@ INTEL_MEDIASDK_LICENSE_FILES = LICENSE
 INTEL_MEDIASDK_INSTALL_STAGING = YES
 INTEL_MEDIASDK_DEPENDENCIES = intel-mediadriver
 
-INTEL_MEDIASDK_CONF_OPTS = -DMFX_INCLUDE="$(@D)/api/include"
+INTEL_MEDIASDK_CONF_OPTS = \
+	-DBUILD_SAMPLES=OFF \
+	-DBUILD_TUTORIALS=OFF \
+	-DMFX_INCLUDE="$(@D)/api/include"
 
 $(eval $(cmake-package))
-- 
2.30.0
