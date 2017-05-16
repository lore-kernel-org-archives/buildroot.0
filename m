From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 May 2017 09:23:13 +0200
Subject: [Buildroot] [git commit] package/x11vnc: fix build issue with
	--without-ssl
Message-ID: <20170516072322.ADAED818D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1dd696ffe26fda96c315329e0dd3880273439e12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/873/873ed8f2ade1d969abdff15b7b6d63e04819af9a

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...r-detection-when-using-without-crypt-cryp.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/x11vnc/0001-Fix-compiler-detection-when-using-without-crypt-cryp.patch b/package/x11vnc/0001-Fix-compiler-detection-when-using-without-crypt-cryp.patch
new file mode 100644
index 0000000..31b5cfe
--- /dev/null
+++ b/package/x11vnc/0001-Fix-compiler-detection-when-using-without-crypt-cryp.patch
@@ -0,0 +1,27 @@
+From d6919c0be7f531b20cbfcb9929d697ac3c132c40 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <github@kempniu.pl>
+Date: Wed, 12 Oct 2016 15:17:51 +0200
+Subject: [PATCH] Fix compiler detection when using
+ --without-{crypt,crypto,ssl}
+
+(cherry picked from commit d6919c0be7f531b20cbfcb9929d697ac3c132c40)
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index 55724bc..bdfff94 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -5,6 +5,7 @@ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+ AM_CONFIG_HEADER(config.h)
+ AC_CONFIG_MACRO_DIR([m4])
+ 
++AC_PROG_CC
+ AC_PROG_SED
+ 
+ # some OS's need both -lssl and -lcrypto on link line:
+-- 
+2.9.3
+
