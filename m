From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 11 Feb 2015 07:47:11 +0100
Subject: [Buildroot] [PATCH v1] qt5base: disable gold linker
Message-ID: <1423637231-4145-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1],[2]:
powerpc-ctng_e500v2-linux-gnuspe-g++: error: unrecognized command line option '-fuse-ld=gold'
Makefile:1192: recipe for target '../../lib/libQt5Core.so.5.4.0' failed

[1] http://autobuild.buildroot.net/results/92c/92c3fb4ddb934115b228652bb8c972bb7459bb40/
[2] http://autobuild.buildroot.net/results/384/384db0b6b29fc434da73f78cb872080fde918aee/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5base/qt5base.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index aaf4da0..478d355 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -26,7 +26,8 @@ QT5BASE_CONFIGURE_OPTS += \
 	-no-iconv \
 	-system-zlib \
 	-system-pcre \
-	-no-pch
+	-no-pch \
+	-no-use-gold-linker
 
 ifeq ($(BR2_ENABLE_DEBUG),y)
 QT5BASE_CONFIGURE_OPTS += -debug
-- 
2.1.4
