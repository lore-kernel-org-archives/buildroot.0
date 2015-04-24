From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 24 Apr 2015 22:00:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: Fix compile warning being
	treated as error
Message-ID: <1429905652-16930-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/b14/b149dcd9bfcf9e69cf7fa16636c3089a6673769a/
http://autobuild.buildroot.net/results/d45/d45c4abcd22d99edaff8943b0073a94dcd972ab5/
http://autobuild.buildroot.net/results/1f6/1f6a4a9084a9d07bdd8d6c6dafeedb38d27c0b8f/
http://autobuild.buildroot.net/results/8f0/8f05242257a0ed059d5258c4a83ab26095516917/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../vlc/0004-implicit-function-declaration.patch   |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 package/vlc/0004-implicit-function-declaration.patch

diff --git a/package/vlc/0004-implicit-function-declaration.patch b/package/vlc/0004-implicit-function-declaration.patch
new file mode 100644
index 0000000..515453d
--- /dev/null
+++ b/package/vlc/0004-implicit-function-declaration.patch
@@ -0,0 +1,20 @@
+Fix compile warning being treated as error:
+
+codec/svg.c: In function 'DecodeBlock':
+codec/svg.c:240:5: error: implicit declaration of function 'rsvg_handle_render_cairo' [-Werror=implicit-function-declaration]
+cc1: some warnings being treated as errors
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr vlc-2.2.1.org/configure.ac vlc-2.2.1/configure.ac
+--- vlc-2.2.1.org/configure.ac	2015-04-13 09:57:54.000000000 +0200
++++ vlc-2.2.1/configure.ac	2015-04-24 20:54:35.349039010 +0200
+@@ -864,7 +864,7 @@
+ dnl  Compiler warnings
+ dnl
+ 
+-RDC_PROG_CC_WFLAGS([all extra sign-compare undef pointer-arith bad-function-cast write-strings missing-prototypes volatile-register-var error-implicit-function-declaration])
++RDC_PROG_CC_WFLAGS([all extra sign-compare undef pointer-arith bad-function-cast write-strings missing-prototypes volatile-register-var])
+ RDC_PROG_CC_FLAGS([-pipe])
+ AC_LANG_PUSH([C++])
+ RDC_PROG_CXX_WFLAGS([all extra sign-compare undef pointer-arith volatile-register-var])
-- 
1.7.10.4
