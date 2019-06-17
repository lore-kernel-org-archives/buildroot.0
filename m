From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jun 2019 20:06:36 +0200
Subject: [Buildroot] [git commit] package/flatbuffers: enable host build
Message-ID: <20190617181036.827EB8132B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=865883f57527fb9d12c3c3a0871acd8d9ee403af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Host version of flatc compiler is needed for Kodi 18.x:
https://github.com/xbmc/xbmc/blob/master/cmake/modules/FindFlatBuffers.cmake#L51

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flatbuffers/flatbuffers.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
index 8252a1616c..3664cc79cb 100644
--- a/package/flatbuffers/flatbuffers.mk
+++ b/package/flatbuffers/flatbuffers.mk
@@ -20,4 +20,14 @@ else
 FLATBUFFERS_CONF_OPTS += -DFLATBUFFERS_BUILD_SHAREDLIB=ON
 endif
 
+HOST_FLATBUFFERS_CONF_OPTS += \
+	-DCMAKE_CXX_FLAGS="-std=c++11" \
+	-DFLATBUFFERS_BUILD_FLATLIB=OFF \
+	-DFLATBUFFERS_BUILD_FLATC=ON \
+	-DFLATBUFFERS_BUILD_FLATHASH=OFF \
+	-DFLATBUFFERS_BUILD_GRPCTEST=OFF \
+	-DFLATBUFFERS_BUILD_SHAREDLIB=OFF \
+	-DFLATBUFFERS_BUILD_TESTS=OFF
+
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
