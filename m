From: Jiri Novotny <jiri.novotny@logicelements.cz>
Date: Thu, 19 May 2016 09:34:10 +0200
Subject: [Buildroot] [PATCH 1/1] qt5base: fix alsa-lib version check during
	configure Current version check ignores MINOR version number
Message-ID: <1463643250-13396-1-git-send-email-jiri.novotny@logicelements.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jiri Novotny <jiri.novotny@logicelements.cz>
---
 .../qt5/qt5base/0002-qtmultimedia-fix-alsa-version.patch    | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 package/qt5/qt5base/0002-qtmultimedia-fix-alsa-version.patch

diff --git a/package/qt5/qt5base/0002-qtmultimedia-fix-alsa-version.patch b/package/qt5/qt5base/0002-qtmultimedia-fix-alsa-version.patch
new file mode 100644
index 0000000..17da58f
--- /dev/null
+++ b/package/qt5/qt5base/0002-qtmultimedia-fix-alsa-version.patch
@@ -0,0 +1,13 @@
+diff --git a/config.tests/unix/alsa/alsatest.cpp b/config.tests/unix/alsa/alsatest.cpp
+index cab6533..90dc9d0 100644
+--- a/config.tests/unix/alsa/alsatest.cpp
++++ b/config.tests/unix/alsa/alsatest.cpp
+@@ -32,7 +32,7 @@
+ ****************************************************************************/
+ 
+ #include <alsa/asoundlib.h>
+-#if(!(SND_LIB_MAJOR == 1 && SND_LIB_MINOR == 0 && SND_LIB_SUBMINOR >= 10))
++#if(!((SND_LIB_MAJOR == 1 && SND_LIB_MINOR == 0 && SND_LIB_SUBMINOR >= 10) || (SND_LIB_MAJOR == 1 && SND_LIB_MINOR == 1 && SND_LIB_SUBMINOR >= 0)))
+ #error "Alsa version found too old, require >= 1.0.10"
+ #endif
+ 
-- 
2.7.4
