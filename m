From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Fri,  8 Oct 2010 08:55:03 +0200
Subject: [Buildroot] [PATCH 1/7] BugFix - buildroot-libtool.patch - Removed
	Useless Code
In-Reply-To: <1286520909-3436-1-git-send-email-llandwerlin@gmail.com>
References: <1286520909-3436-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1286520909-3436-2-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Martin Banky <martin.banky@gmail.com>

The code that was removed only added commented out code. It neither added
needed code nor commented out existing code.

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/buildroot-libtool.patch |   17 -----------------
 1 files changed, 0 insertions(+), 17 deletions(-)

diff --git a/package/buildroot-libtool.patch b/package/buildroot-libtool.patch
index 277719d..57a7c58 100644
--- a/package/buildroot-libtool.patch
+++ b/package/buildroot-libtool.patch
@@ -38,23 +38,6 @@
  	  fi
  	  # This is a shared library
  
-@@ -2889,6 +2896,16 @@ EOF
- 		esac
- 		if grep "^installed=no" $deplib > /dev/null; then
- 		  path="$absdir/$objdir"
-+#		This interferes with crosscompilation. -CL
-+#		else
-+#		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
-+#		  if test -z "$libdir"; then
-+#		    $echo "$modename: \`$deplib' is not a valid libtool archive" 1>&2
-+#		    exit 1
-+#		  fi
-+#		  if test "$absdir" != "$libdir"; then
-+#		    $echo "$modename: warning: \`$deplib' seems to be moved" 1>&2
-+#		  fi
- 		else
- 		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
- 		  if test -z "$libdir"; then
 @@ -5606,6 +5623,10 @@ fi\
  	    # Replace all uninstalled libtool libraries with the installed ones
  	    newdependency_libs=
-- 
1.7.1
