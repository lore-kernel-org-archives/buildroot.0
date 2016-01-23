From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 14:06:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/qt: Fix musl build
Message-ID: <1453554406-14574-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/709/709d547699596d09b4601a7940677d2010adeedf/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/qt/0010-musl-socklen.patch | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 package/qt/0010-musl-socklen.patch

diff --git a/package/qt/0010-musl-socklen.patch b/package/qt/0010-musl-socklen.patch
new file mode 100644
index 0000000..58f0d30
--- /dev/null
+++ b/package/qt/0010-musl-socklen.patch
@@ -0,0 +1,21 @@
+Fix musl build
+
+Downloaded from
+http://git.alpinelinux.org/cgit/aports/plain/main/qt5-qtbase/qt-musl-socklen.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- qt-everywhere-opensource-src-4.8.5/mkspecs/linux-g++/qplatformdefs.h.orig
++++ qt-everywhere-opensource-src-4.8.5/mkspecs/linux-g++/qplatformdefs.h
+@@ -86,11 +86,7 @@
+ 
+ #undef QT_SOCKLEN_T
+ 
+-#if defined(__GLIBC__) && (__GLIBC__ >= 2)
+ #define QT_SOCKLEN_T            socklen_t
+-#else
+-#define QT_SOCKLEN_T            int
+-#endif
+ 
+ #if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE >= 500)
+ #define QT_SNPRINTF		::snprintf
-- 
2.7.0.rc3
