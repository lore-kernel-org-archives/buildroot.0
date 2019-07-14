From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Jul 2019 16:07:36 +0200
Subject: [Buildroot] [git commit] package/xscreensaver: bump to version 5.43
Message-ID: <20190714140544.DB91F813B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86ade1a56c64a7b6bc570e3b3846437373df779a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patch (not needed anymore)
- Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-fix-cross-compile-ansi-c-bailout.patch       | 19 -------------------
 package/xscreensaver/xscreensaver.hash                |  4 +++-
 package/xscreensaver/xscreensaver.mk                  |  2 +-
 3 files changed, 4 insertions(+), 21 deletions(-)

diff --git a/package/xscreensaver/0001-fix-cross-compile-ansi-c-bailout.patch b/package/xscreensaver/0001-fix-cross-compile-ansi-c-bailout.patch
deleted file mode 100644
index 6da9419e08..0000000000
--- a/package/xscreensaver/0001-fix-cross-compile-ansi-c-bailout.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-The configure bails out when cross-compiling, because it is over-cautious
-about ANSI support in the C compiler. Work around this by disabling the
-bail-out code.
-
-[Peter: updated for 5.32]
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-
-diff -Nurp a/configure b/configure
---- a/configure	2013-07-16 10:23:32.000000000 +0100
-+++ b/configure	2013-09-22 14:50:07.186953454 +0100
-@@ -4374,7 +4374,6 @@ $as_echo "Solaris: adding -D__EXTENSIONS
-   { $as_echo "$as_me:${as_lineno-$LINENO}: checking whether the compiler works on ANSI C" >&5
- $as_echo_n "checking whether the compiler works on ANSI C... " >&6; }
-   if test "$cross_compiling" = yes; then :
--  as_fn_error $? "Couldn't build even a trivial ANSI C program: check CC." "$LINENO" 5
- else
-   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
- /* end confdefs.h.  */
diff --git a/package/xscreensaver/xscreensaver.hash b/package/xscreensaver/xscreensaver.hash
index 48bc2b1eb2..c1198b7558 100644
--- a/package/xscreensaver/xscreensaver.hash
+++ b/package/xscreensaver/xscreensaver.hash
@@ -1,2 +1,4 @@
 # Locally calculated
-sha256 6b8b5238047f1613d99149bb02d5ed3384675f3ce74a0a8ba25290bd61abc06c  xscreensaver-5.36.tar.gz
+sha256 17eab67f3554e21c23b1526ec48a06a9ec8605baffee48f91f603f7599b383d4  xscreensaver-5.43.tar.gz
+sha256 8a03451ba5c4c9af669b53e47e50c38c149b9e152d3d627809b962da7b760bbd  hacks/screenhack.h
+sha256 56db580415bb313a4a82c5e08f106304904d15d42faf8e6ab14b34e14e2087a5  hacks/glx/chessmodels.h
diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index 34b116387b..642d65f0c6 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSCREENSAVER_VERSION = 5.36
+XSCREENSAVER_VERSION = 5.43
 XSCREENSAVER_SITE = https://www.jwz.org/xscreensaver
 
 # N.B. GPL-2.0+ code (in the hacks/glx subdirectory) is not currently built.
