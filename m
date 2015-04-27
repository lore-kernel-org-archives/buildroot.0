From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Apr 2015 23:30:41 +0200
Subject: [Buildroot] [git commit] package/vlc: libX11 is an optional
	dependency for the qt4 module
Message-ID: <20150427213049.AE24781D53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a14570fe719848b4c8a4522565ac9fd39280c6f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/d15/d158095d4caa8f58f1d205aeeb1ae707a1311ea5/
http://autobuild.buildroot.net/results/343/343e2981b60d9d09a4fcd8e2109540f0dc11b402/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vlc/0006-qt-x11.patch |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/package/vlc/0006-qt-x11.patch b/package/vlc/0006-qt-x11.patch
new file mode 100644
index 0000000..316a31f
--- /dev/null
+++ b/package/vlc/0006-qt-x11.patch
@@ -0,0 +1,16 @@
+libX11 is an optional dependency for the qt4 module
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr vlc-2.2.1.org/modules/gui/qt4/Makefile.am vlc-2.2.1/modules/gui/qt4/Makefile.am
+--- vlc-2.2.1.org/modules/gui/qt4/Makefile.am	2014-11-29 12:34:15.000000000 +0100
++++ vlc-2.2.1/modules/gui/qt4/Makefile.am	2015-04-27 18:53:36.968611490 +0200
+@@ -22,7 +22,7 @@
+ if HAVE_WIN32
+ libqt4_plugin_la_LIBADD += -lole32 -lcomctl32 -luuid
+ else
+-libqt4_plugin_la_LIBADD += $(X_LIBS) $(X_PRE_LIB) -lX11
++libqt4_plugin_la_LIBADD += $(X_LIBS) $(X_PRE_LIB)
+ endif
+ endif
+ if HAVE_DARWIN
