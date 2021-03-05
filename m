From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Mar 2021 13:21:42 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/intel-mediasdk:
 disable samples and tutorials
Message-ID: <20210305120445.C9BF68702A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1bc0963ebd77102599bcbfa79a91a4a8a4a79d91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Disable samples and tutorials which are enabled by default and fail to
build with gcc 10 without upstream commit:
https://github.com/Intel-Media-SDK/MediaSDK/commit/c7d40371eb0c2042261fe1f91a364f69a1457235

Fixes:
 - http://autobuild.buildroot.org/results/9ee28e5dc0b2ba854766d9bc82b95c28be2722d3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit aead2e1ec2c563e85c33431e3301f454a1924cc0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
