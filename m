From: Markos Chandras <markos.chandras@imgtec.com>
Date: Thu, 7 Jun 2012 10:58:14 +0100
Subject: [Buildroot] [PATCH] synergy: Remove -Werror from CXXFLAGS
Message-ID: <1339063094-25298-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/synergy/synergy-1.3.1-remove-werror.patch |   29 +++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 package/synergy/synergy-1.3.1-remove-werror.patch

diff --git a/package/synergy/synergy-1.3.1-remove-werror.patch b/package/synergy/synergy-1.3.1-remove-werror.patch
new file mode 100644
index 0000000..fe55778
--- /dev/null
+++ b/package/synergy/synergy-1.3.1-remove-werror.patch
@@ -0,0 +1,29 @@
+Remove -Werror from CXXFLAGS
+
+Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
+
+Index: synergy-1.3.1/configure
+===================================================================
+--- synergy-1.3.1.orig/configure
++++ synergy-1.3.1/configure
+@@ -10835,20 +10835,6 @@ echo $ECHO_N "checking for C++ compiler 
+ echo "${ECHO_T}$acx_cxx_warnings" >&6
+ 
+ 
+-	echo "$as_me:$LINENO: checking for C++ compiler warning are errors flags" >&5
+-echo $ECHO_N "checking for C++ compiler warning are errors flags... $ECHO_C" >&6
+-	if test "$GXX" = "yes"; then
+-		acx_cxx_warnings_are_errors="-Werror"
+-	fi
+-	if test -n "$acx_cxx_warnings_are_errors"; then
+-		CXXFLAGS="$CXXFLAGS $acx_cxx_warnings_are_errors"
+-	else
+-		acx_cxx_warnings_are_errors="unknown"
+-	fi
+-	echo "$as_me:$LINENO: result: $acx_cxx_warnings_are_errors" >&5
+-echo "${ECHO_T}$acx_cxx_warnings_are_errors" >&6
+-
+-
+ CXXFLAGS="$CXXFLAGS $SYNERGY_CXXFLAGS $ARCH_CFLAGS"
+ OBJCXXFLAGS="$OBJCXXFLAGS $CXXFLAGS $ARCH_CFLAGS"
+ LIBS="$NANOSLEEP_LIBS $INET_ATON_LIBS $ARCH_LIBS $LIBS"
-- 
1.7.1
