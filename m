From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2013 10:09:45 +0100
Subject: [Buildroot] [git commit] qt5base: use ccache if enabled
Message-ID: <20131201201520.B33A79BE78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cb08d7b05db54eb7b2c52deabbd57c541777a422
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For now, it doesn't use ccache when compiling host tools (e.g. qmake).
It seems the fix is not trivial.

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qt5base.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
