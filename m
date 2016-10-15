From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 12:26:13 +0200
Subject: [Buildroot] [git commit] package/assimp: wrap long lines
Message-ID: <20161015102617.4C01881D87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=609f58b80aa000fecb9b24ba8069f7205e887e7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
