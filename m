From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 11:41:39 +0200
Subject: [Buildroot] [git commit] package/vlc: Fix compile warning being
	treated as error
Message-ID: <20150425094158.ABDF380830@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=34eddf9f5c4c3a862a7551a072e232a0493b85db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/b14/b149dcd9bfcf9e69cf7fa16636c3089a6673769a/
http://autobuild.buildroot.net/results/d45/d45c4abcd22d99edaff8943b0073a94dcd972ab5/
http://autobuild.buildroot.net/results/1f6/1f6a4a9084a9d07bdd8d6c6dafeedb38d27c0b8f/
http://autobuild.buildroot.net/results/8f0/8f05242257a0ed059d5258c4a83ab26095516917/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../vlc/0004-implicit-function-declaration.patch   |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

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
