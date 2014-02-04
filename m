From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 15:12:00 +0100
Subject: [Buildroot] [git commit] qt5: Rename BUILDROOT_COMPILER_C{,
	XX}FLAGS to BR_COMPILER_C{, XX}FLAGS
Message-ID: <20140204141234.F0EFE9C7C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24badfe11024ef52ba950ac13ad239c9064e867e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No functional change, but internal variables should be name BR_foo, not
BUILDROOT_foo (I think ..).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../qt5/qt5base/qt5base-0002-mkspecs-files.patch   |    4 ++--
 package/qt5/qt5base/qt5base.mk                     |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch b/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
index 3fddeac..06436b4 100644
--- a/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
+++ b/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
@@ -18,8 +18,8 @@ Index: b/mkspecs/devices/linux-buildroot-g++/qmake.conf
 +include(../common/linux_device_pre.conf)
 +
 +#modifications to gcc-base.conf
-+QMAKE_CFLAGS           += $${BUILDROOT_COMPILER_CFLAGS}
-+QMAKE_CXXFLAGS         += $${BUILDROOT_COMPILER_CXXFLAGS}
++QMAKE_CFLAGS           += $${BR_COMPILER_CFLAGS}
++QMAKE_CXXFLAGS         += $${BR_COMPILER_CXXFLAGS}
 +QMAKE_CXXFLAGS_RELEASE += -O3
 +
 +QMAKE_LIBS             += -lrt -lpthread -ldl
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index fcfad4e..618251e 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -169,8 +169,8 @@ define QT5BASE_CONFIGURE_CMDS
 		-nomake tests \
 		-device buildroot \
 		-device-option CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
-		-device-option BUILDROOT_COMPILER_CFLAGS="$(TARGET_CFLAGS)" \
-		-device-option BUILDROOT_COMPILER_CXXFLAGS="$(TARGET_CXXFLAGS)" \
+		-device-option BR_COMPILER_CFLAGS="$(TARGET_CFLAGS)" \
+		-device-option BR_COMPILER_CXXFLAGS="$(TARGET_CXXFLAGS)" \
 		-device-option EGLFS_PLATFORM_HOOKS_SOURCES="$(QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES)" \
 		-no-c++11 \
 		$(QT5BASE_CONFIGURE_OPTS) \
