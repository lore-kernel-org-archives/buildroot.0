From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Oct 2010 13:34:56 +0200
Subject: [Buildroot] [PATCH 01/12] BugFix - buildroot-libtool.patch -
	Removed Useless Code
In-Reply-To: <cover.1287833623.git.thomas.petazzoni@free-electrons.com>
References: <cover.1287833623.git.thomas.petazzoni@free-electrons.com>
Message-ID: <fda95b5b10be51cb8d73448fc0f2208921e6d07e.1287833623.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Martin Banky <martin.banky@gmail.com>

The code that was removed only added commented out code. It neither added
needed code nor commented out existing code.

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
1.7.0.4
