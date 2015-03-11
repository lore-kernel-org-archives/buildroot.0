From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Mar 2015 15:04:48 -0300
Subject: [Buildroot] [PATCH] dhcp: bump to version 4.1-ESV-R11
Message-ID: <1426097088-32132-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash file and drop upstreamed patch.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dhcp/0001-fix-configure-debug.patch | 23 -----------------------
 package/dhcp/dhcp.hash                      |  2 ++
 package/dhcp/dhcp.mk                        |  2 +-
 3 files changed, 3 insertions(+), 24 deletions(-)
 delete mode 100644 package/dhcp/0001-fix-configure-debug.patch
 create mode 100644 package/dhcp/dhcp.hash

diff --git a/package/dhcp/0001-fix-configure-debug.patch b/package/dhcp/0001-fix-configure-debug.patch
deleted file mode 100644
index 19c9bfe..0000000
--- a/package/dhcp/0001-fix-configure-debug.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-AC_ARG_ENABLE is passed wrong parameters for action-if-given:
-If someone passed --enable-debug to configure enable_debug was set to 'yes',
-but if --disable-debug was passed the action is also called and debug was
-also set to 'yes' which is wrong.
-Use $enableval for this case.
-
-Reported upstream as ISC-Bugs #37780 (not publicly accesible).
-Thanks to Nathaniel Roach for pointing out the problem.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura dhcp-4.1-ESV-R10.orig/configure.ac dhcp-4.1-ESV-R10/configure.ac
---- dhcp-4.1-ESV-R10.orig/configure.ac	2014-11-11 09:50:07.719277076 -0300
-+++ dhcp-4.1-ESV-R10/configure.ac	2014-11-11 09:51:10.722432148 -0300
-@@ -53,7 +53,7 @@
- AC_ARG_ENABLE(debug,
- 	AC_HELP_STRING([--enable-debug],
- 		[create a debug-only version of the software (default is no).]),
--		[enable_debug=yes],[enable_debug=no])
-+		[enable_debug=$enableval],[enable_debug=no])
- # This is very much off by default.
- if test "$enable_debug" = "yes" ; then
- 	AC_DEFINE([DEBUG], [1],
diff --git a/package/dhcp/dhcp.hash b/package/dhcp/dhcp.hash
new file mode 100644
index 0000000..d488004
--- /dev/null
+++ b/package/dhcp/dhcp.hash
@@ -0,0 +1,2 @@
+# Verified from ftp://ftp.isc.org/isc/dhcp/4.1-ESV-R11/dhcp-4.1-ESV-R11.tar.gz.sha256.asc
+sha256	b643d11a50fba66bb1c118f47642eb3fac1e26989d3c0bf8a2471e83c06ac485	dhcp-4.1-ESV-R11.tar.gz
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 2aa690f..f01a5fa 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCP_VERSION = 4.1-ESV-R10
+DHCP_VERSION = 4.1-ESV-R11
 DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = ISC
-- 
2.0.5
