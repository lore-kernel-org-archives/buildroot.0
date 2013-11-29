From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 29 Nov 2013 10:47:49 +0200
Subject: [Buildroot] [PATCH v2] qt5base: use ccache if enabled
Message-ID: <1385714869-10115-1-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For now, it doesn't use ccache when compiling host tools (e.g. qmake).
It seems the fix is not trivial.

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>

---
Changes v1 -> v2:
  - pass ccache path to CROSS_COMPILE instead of setting another device
    variable (suggested by Peter Korsgaard)
---
 package/qt5/qt5base/qt5base.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index febdc9b..d95b186 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -167,7 +167,7 @@ define QT5BASE_CONFIGURE_CMDS
 		-no-rpath \
 		-nomake examples -nomake tests \
 		-device buildroot \
-		-device-option CROSS_COMPILE="$(TARGET_CROSS)" \
+		-device-option CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
 		-device-option BUILDROOT_COMPILER_CFLAGS="$(TARGET_CFLAGS)" \
 		-device-option BUILDROOT_COMPILER_CXXFLAGS="$(TARGET_CXXFLAGS)" \
 		-device-option EGLFS_PLATFORM_HOOKS_SOURCES="$(QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES)" \
-- 
1.8.4.rc3
