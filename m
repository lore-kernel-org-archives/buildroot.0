From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 12:01:00 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] qt: don't download patch
	from Github
Message-ID: <20170921095847.5433B81060@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e55836dab0f0a5453a4725b10b5a8c240aa82aba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Patches downloaded from Github are not stable, so bring them in the
tree.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 35bc55eaaae8d9d463d3fddcf0b200685014865a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e-check-to-treat-alsalib-1.1.x-as-correct.patch | 29 ++++++++++++++++++++++
 .../{0001-configure.patch => 0002-configure.patch} |  0
 ...system.patch => 0003-eglwsegl-use-system.patch} |  0
 ...-atomics.patch => 0004-fix-const-atomics.patch} |  0
 ...attr_np.patch => 0005-pthread_getattr_np.patch} |  0
 ...o-gui.patch => 0006-script-qtdbus-no-gui.patch} |  0
 ...-Add-initial-support-of-ARC-architecture.patch} |  0
 ... => 0008-Prevent-unaligned-access-on-ARC.patch} |  0
 ...on-constructor-error-for-legacy-c-compil.patch} |  0
 ...inclusion-order-when-building-statically.patch} |  0
 ...form-socklen_t-on-other-C-libraries-than.patch} |  0
 ...ith-ldl-option-only-when-it-is-supported.patch} |  0
 ...13-OpenGL-EGL-Avoid-X11-header-collision.patch} |  0
 package/qt/qt.hash                                 |  1 -
 package/qt/qt.mk                                   |  3 ---
 15 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/package/qt/0001-alsatest-fix-the-check-to-treat-alsalib-1.1.x-as-correct.patch b/package/qt/0001-alsatest-fix-the-check-to-treat-alsalib-1.1.x-as-correct.patch
new file mode 100644
index 0000000..4cec4bd
--- /dev/null
+++ b/package/qt/0001-alsatest-fix-the-check-to-treat-alsalib-1.1.x-as-correct.patch
@@ -0,0 +1,29 @@
+From b8f98d956501dfa4ce03a137f15d404930a56066 Mon Sep 17 00:00:00 2001
+From: Dmitry Shachnev <mitya57@gmail.com>
+Date: Sat, 5 Mar 2016 10:25:33 +0300
+Subject: [PATCH] alsatest: Fix the check to treat alsalib 1.1.x as correct
+ version
+
+Task-number: QTBUG-51681
+Change-Id: I63266c33342f02f4d1a5ea5786f5fbc5a1b421b3
+Reviewed-by: Oswald Buddenhagen <oswald.buddenhagen@theqtcompany.com>
+[Upstream commit: https://github.com/qtproject/qtbase/commit/b8f98d956501dfa4ce03a137f15d404930a56066]
+[Patch fixing ALSA detection. Taken from Qt5, but applies fine to Qt4.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ config.tests/unix/alsa/alsatest.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config.tests/unix/alsa/alsatest.cpp b/config.tests/unix/alsa/alsatest.cpp
+index cab6533977..0b45819b61 100644
+--- a/config.tests/unix/alsa/alsatest.cpp
++++ b/config.tests/unix/alsa/alsatest.cpp
+@@ -32,7 +32,7 @@
+ ****************************************************************************/
+ 
+ #include <alsa/asoundlib.h>
+-#if(!(SND_LIB_MAJOR == 1 && SND_LIB_MINOR == 0 && SND_LIB_SUBMINOR >= 10))
++#if SND_LIB_VERSION < 0x1000a  // 1.0.10
+ #error "Alsa version found too old, require >= 1.0.10"
+ #endif
+ 
diff --git a/package/qt/0001-configure.patch b/package/qt/0002-configure.patch
similarity index 100%
rename from package/qt/0001-configure.patch
rename to package/qt/0002-configure.patch
diff --git a/package/qt/0002-eglwsegl-use-system.patch b/package/qt/0003-eglwsegl-use-system.patch
similarity index 100%
rename from package/qt/0002-eglwsegl-use-system.patch
rename to package/qt/0003-eglwsegl-use-system.patch
diff --git a/package/qt/0003-fix-const-atomics.patch b/package/qt/0004-fix-const-atomics.patch
similarity index 100%
rename from package/qt/0003-fix-const-atomics.patch
rename to package/qt/0004-fix-const-atomics.patch
diff --git a/package/qt/0004-pthread_getattr_np.patch b/package/qt/0005-pthread_getattr_np.patch
similarity index 100%
rename from package/qt/0004-pthread_getattr_np.patch
rename to package/qt/0005-pthread_getattr_np.patch
diff --git a/package/qt/0005-script-qtdbus-no-gui.patch b/package/qt/0006-script-qtdbus-no-gui.patch
similarity index 100%
rename from package/qt/0005-script-qtdbus-no-gui.patch
rename to package/qt/0006-script-qtdbus-no-gui.patch
diff --git a/package/qt/0006-Add-initial-support-of-ARC-architecture.patch b/package/qt/0007-Add-initial-support-of-ARC-architecture.patch
similarity index 100%
rename from package/qt/0006-Add-initial-support-of-ARC-architecture.patch
rename to package/qt/0007-Add-initial-support-of-ARC-architecture.patch
diff --git a/package/qt/0007-Prevent-unaligned-access-on-ARC.patch b/package/qt/0008-Prevent-unaligned-access-on-ARC.patch
similarity index 100%
rename from package/qt/0007-Prevent-unaligned-access-on-ARC.patch
rename to package/qt/0008-Prevent-unaligned-access-on-ARC.patch
diff --git a/package/qt/0008-Fix-conversion-constructor-error-for-legacy-c-compil.patch b/package/qt/0009-Fix-conversion-constructor-error-for-legacy-c-compil.patch
similarity index 100%
rename from package/qt/0008-Fix-conversion-constructor-error-for-legacy-c-compil.patch
rename to package/qt/0009-Fix-conversion-constructor-error-for-legacy-c-compil.patch
diff --git a/package/qt/0009-Fix-library-inclusion-order-when-building-statically.patch b/package/qt/0010-Fix-library-inclusion-order-when-building-statically.patch
similarity index 100%
rename from package/qt/0009-Fix-library-inclusion-order-when-building-statically.patch
rename to package/qt/0010-Fix-library-inclusion-order-when-building-statically.patch
diff --git a/package/qt/0010-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch b/package/qt/0011-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch
similarity index 100%
rename from package/qt/0010-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch
rename to package/qt/0011-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch
diff --git a/package/qt/0011-Link-with-ldl-option-only-when-it-is-supported.patch b/package/qt/0012-Link-with-ldl-option-only-when-it-is-supported.patch
similarity index 100%
rename from package/qt/0011-Link-with-ldl-option-only-when-it-is-supported.patch
rename to package/qt/0012-Link-with-ldl-option-only-when-it-is-supported.patch
diff --git a/package/qt/0012-OpenGL-EGL-Avoid-X11-header-collision.patch b/package/qt/0013-OpenGL-EGL-Avoid-X11-header-collision.patch
similarity index 100%
rename from package/qt/0012-OpenGL-EGL-Avoid-X11-header-collision.patch
rename to package/qt/0013-OpenGL-EGL-Avoid-X11-header-collision.patch
diff --git a/package/qt/qt.hash b/package/qt/qt.hash
index de81368..301010c 100644
--- a/package/qt/qt.hash
+++ b/package/qt/qt.hash
@@ -1,4 +1,3 @@
 # md5 http://download.qt.io/official_releases/qt/4.8/4.8.7/md5sums-4.8.7, sha256 locally computed:
 md5    d990ee66bf7ab0c785589776f35ba6ad                                 qt-everywhere-opensource-src-4.8.7.tar.gz
 sha256 e2882295097e47fe089f8ac741a95fef47e0a73a3f3cdf21b56990638f626ea0 qt-everywhere-opensource-src-4.8.7.tar.gz
-sha256 e03740e20b8dbf52d163d8a4a37125e7c55b59a9a5e7cf7e89a08e07286b6135 b8f98d956501dfa4ce03a137f15d404930a56066.patch
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 29dcc46..8809b0c 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -15,9 +15,6 @@ QT_VERSION_MAJOR = 4.8
 QT_VERSION = $(QT_VERSION_MAJOR).7
 QT_SOURCE = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
 QT_SITE = http://download.qt-project.org/official_releases/qt/$(QT_VERSION_MAJOR)/$(QT_VERSION)
-# Patch fixing ALSA detection. Taken from Qt5, but applies fine to
-# Qt4.
-QT_PATCH = https://github.com/qtproject/qtbase/commit/b8f98d956501dfa4ce03a137f15d404930a56066.patch
 QT_DEPENDENCIES = host-pkgconf
 QT_INSTALL_STAGING = YES
 
