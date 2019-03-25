From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 22:17:30 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/beecrypt: fix
 build without C++
Message-ID: <20190325211603.AC1A281805@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3877d0fd0b9965362aa4461e3d3bd7dbe531914
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Do not check for C++ compiler as C++ support has been disabled since
commit dd4d3c18d6753e1224fbe59d91a4b44f39bc38c0 otherwise
build will fail on toolchains without a working C++ compiler:

checking how to run the C++ preprocessor... /lib/cpp
configure: error: in `/data/buildroot/buildroot-test/instance-1/output/build/beecrypt-4.2.1':
configure: error: C++ preprocessor "/lib/cpp" fails sanity check

Fixes:
 - http://autobuild.buildroot.org/results/3c79cc68f1b088ad24daf7f9bd70718d702be577

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6255c816232468b2e92cffcfa835aa79d8fcae04)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-don-t-check-for-cplusplus-compiler.patch  | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/beecrypt/0003-don-t-check-for-cplusplus-compiler.patch b/package/beecrypt/0003-don-t-check-for-cplusplus-compiler.patch
new file mode 100644
index 0000000000..32f167996f
--- /dev/null
+++ b/package/beecrypt/0003-don-t-check-for-cplusplus-compiler.patch
@@ -0,0 +1,27 @@
+configure.ac: don't check for C++ compiler
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -durN beecrypt-4.2.1-orig/configure.ac beecrypt-4.2.1/configure.ac
+--- beecrypt-4.2.1-orig/configure.ac	2019-03-01 19:58:16.516117640 +0100
++++ beecrypt-4.2.1/configure.ac	2019-03-01 21:10:17.707391803 +0100
+@@ -119,9 +119,6 @@
+ 
+ # Checks for C compiler and preprocessor
+ AC_PROG_CC
+-AC_PROG_CPP
+-AC_PROG_CXX
+-AC_PROG_CXXCPP
+ AM_PROG_AS
+ AC_PROG_LD
+ AC_PROG_LN_S
+@@ -133,9 +130,6 @@
+ AC_LANG_PUSH(C)
+ AC_OPENMP
+ AC_LANG_POP(C)
+-AC_LANG_PUSH(C++)
+-AC_OPENMP
+-AC_LANG_POP(C++)
+ 
+ # Checks for compiler characteristics and flags
+ if test "$ac_enable_expert_mode" = no; then
