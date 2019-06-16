From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 16 Jun 2019 22:23:37 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/flatbuffers: Enable host build
In-Reply-To: <20190616202337.27216-1-bernd.kuhls@t-online.de>
References: <20190616202337.27216-1-bernd.kuhls@t-online.de>
Message-ID: <20190616202337.27216-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Host version of flatc compiler is needed for Kodi 18.x:
https://github.com/xbmc/xbmc/blob/master/cmake/modules/FindFlatBuffers.cmake#L51

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: removed upstream patch after version bump to v1.11.0

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
-- 
2.20.1
