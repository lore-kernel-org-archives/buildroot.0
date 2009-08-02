From: Daniele Salvatore Albano <d.albano@gmail.com>
Date: Sun, 2 Aug 2009 23:09:07 +0200
Subject: [Buildroot] [git commit] Update gamin to 0.1.10 to fix compilation
Message-ID: <20090802211635.79803777BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9be449ff55e2b25c4b44a76bb9d5040cb73ebea5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #533

Signed-off-by: Daniele Salvatore Albano <d.albano@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    1 +
 ...onfigure.patch => gamin-0.1.10-configure.patch} |   31 +++++++++++++------
 package/gamin/gamin.mk                             |    2 +-
 3 files changed, 23 insertions(+), 11 deletions(-)
 rename package/gamin/{gamin-0.1.9-configure.patch => gamin-0.1.10-configure.patch} (74%)

diff --git a/CHANGES b/CHANGES
index 322458a..096f4b2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -55,6 +55,7 @@
 	#497: OpenSSL RSA key generation hangs on x86_64
 	#509: Bump sqlite package to 3.6.16
 	#523: pciutils broken with external toolchain
+	#533: Update gamin to 0.1.10 to fix compilation
 
 2009.05, Released June 1st, 2009:
 
diff --git a/package/gamin/gamin-0.1.9-configure.patch b/package/gamin/gamin-0.1.10-configure.patch
similarity index 74%
rename from package/gamin/gamin-0.1.9-configure.patch
rename to package/gamin/gamin-0.1.10-configure.patch
index 1a8b7dc..b4e4503 100644
--- a/package/gamin/gamin-0.1.9-configure.patch
+++ b/package/gamin/gamin-0.1.10-configure.patch
@@ -1,6 +1,6 @@
---- a/configure	2007-07-27 10:27:34.000000000 -0400
-+++ b/configure	2008-02-13 15:00:27.000000000 -0500
-@@ -23161,89 +23161,6 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS con
+--- a/configure.fixed	2009-08-02 18:00:54.000000000 +0200
++++ b/configure	2008-11-24 16:23:27.000000000 +0100
+@@ -23581,100 +23581,6 @@
  ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
  ac_compiler_gnu=$ac_cv_c_compiler_gnu
  
@@ -60,13 +60,22 @@
 -}
 -_ACEOF
 -rm -f conftest$ac_exeext
--if { (eval echo "$as_me:$LINENO: \"$ac_link\"") >&5
--  (eval $ac_link) 2>&5
+-if { (ac_try="$ac_link"
+-case "(($ac_try" in
+-  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+-  *) ac_try_echo=$ac_try;;
+-esac
+-eval "echo \"\$as_me:$LINENO: $ac_try_echo\"") >&5
+-  (eval "$ac_link") 2>&5
 -  ac_status=$?
 -  echo "$as_me:$LINENO: \$? = $ac_status" >&5
 -  (exit $ac_status); } && { ac_try='./conftest$ac_exeext'
--  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
--  (eval $ac_try) 2>&5
+-  { (case "(($ac_try" in
+-  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+-  *) ac_try_echo=$ac_try;;
+-esac
+-eval "echo \"\$as_me:$LINENO: $ac_try_echo\"") >&5
+-  (eval "$ac_try") 2>&5
 -  ac_status=$?
 -  echo "$as_me:$LINENO: \$? = $ac_status" >&5
 -  (exit $ac_status); }; }; then
@@ -79,14 +88,16 @@
 -( exit $ac_status )
 -have_abstract_sockets=no
 -fi
--rm -f core *.core gmon.out bb.out conftest$ac_exeext conftest.$ac_objext conftest.$ac_ext
+-rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext conftest.$ac_objext conftest.$ac_ext
 -fi
+-
+-
 -ac_ext=c
 -ac_cpp='$CPP $CPPFLAGS'
 -ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
 -ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
 -ac_compiler_gnu=$ac_cv_c_compiler_gnu
 -
- echo "$as_me:$LINENO: result: $have_abstract_sockets" >&5
- echo "${ECHO_T}$have_abstract_sockets" >&6
+ { echo "$as_me:$LINENO: result: $have_abstract_sockets" >&5
+ echo "${ECHO_T}$have_abstract_sockets" >&6; }
  
diff --git a/package/gamin/gamin.mk b/package/gamin/gamin.mk
index 180d89e..ffd9be8 100644
--- a/package/gamin/gamin.mk
+++ b/package/gamin/gamin.mk
@@ -3,7 +3,7 @@
 # gamin
 #
 #############################################################
-GAMIN_VERSION = 0.1.9
+GAMIN_VERSION = 0.1.10
 GAMIN_SOURCE = gamin-$(GAMIN_VERSION).tar.gz
 GAMIN_SITE = http://www.gnome.org/~veillard/gamin/sources
 GAMIN_AUTORECONF = NO
-- 
1.6.3.3
