From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 15 Oct 2016 11:44:31 +0200
Subject: [Buildroot] [PATCH v3 2/8] package/assimp: wrap long lines
In-Reply-To: <20161015094437.6989-1-s.martin49@gmail.com>
References: <20161015094437.6989-1-s.martin49@gmail.com>
Message-ID: <20161015094437.6989-3-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/assimp/assimp.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index cda02dd..08893ff 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -16,6 +16,7 @@ ifeq ($(BR2_m68k),y)
 ASSIMP_CXXFLAGS += -mxgot
 endif
 
-ASSIMP_CONF_OPTS += -DASSIMP_BUILD_TESTS=OFF -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(ASSIMP_CXXFLAGS)"
+ASSIMP_CONF_OPTS += -DASSIMP_BUILD_TESTS=OFF \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(ASSIMP_CXXFLAGS)"
 
 $(eval $(cmake-package))
-- 
2.10.0
