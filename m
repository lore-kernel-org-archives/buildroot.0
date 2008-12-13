From: tpetazzoni at uclibc.org <tpetazzoni@uclibc.org>
Date: Sat, 13 Dec 2008 02:55:49 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lighttpd
Message-ID: <20081213105549.7A1D23C5FA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: tpetazzoni
Date: 2008-12-13 02:55:48 -0800 (Sat, 13 Dec 2008)
New Revision: 24401

Log:
Bump lighttpd to 1.4.20.

Initial patch provided by Gustavo Zacarias <gustavo@zacarias.com.ar>.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>



Added:
   trunk/buildroot/package/lighttpd/lighttpd-1.4.20-configure.patch

Removed:
   trunk/buildroot/package/lighttpd/lighttpd-1.4.19-configure.patch

Modified:
   trunk/buildroot/package/lighttpd/lighttpd.mk


Changeset:
Deleted: trunk/buildroot/package/lighttpd/lighttpd-1.4.19-configure.patch
===================================================================
--- trunk/buildroot/package/lighttpd/lighttpd-1.4.19-configure.patch	2008-12-13 03:34:47 UTC (rev 24400)
+++ trunk/buildroot/package/lighttpd/lighttpd-1.4.19-configure.patch	2008-12-13 10:55:48 UTC (rev 24401)
@@ -1,11 +0,0 @@
---- lighttpd-1.4.19-org/configure	2008-03-10 21:46:12.000000000 +0000
-+++ lighttpd-1.4.19/configure	2008-03-31 06:58:41.000000000 +0000
-@@ -23971,7 +23971,7 @@
- { echo "$as_me:$LINENO: result: $WITH_PCRE" >&5
- echo "${ECHO_T}$WITH_PCRE" >&6; }
- 
--if test "x$cross_compiling" = xno -a "$WITH_PCRE" != "no"; then
-+if test "$WITH_PCRE" != "no"; then
-   # Extract the first word of "pcre-config", so it can be a program name with args.
- set dummy pcre-config; ac_word=$2
- { echo "$as_me:$LINENO: checking for $ac_word" >&5

Copied: trunk/buildroot/package/lighttpd/lighttpd-1.4.20-configure.patch (from rev 24400, trunk/buildroot/package/lighttpd/lighttpd-1.4.19-configure.patch)
===================================================================
--- trunk/buildroot/package/lighttpd/lighttpd-1.4.20-configure.patch	                        (rev 0)
+++ trunk/buildroot/package/lighttpd/lighttpd-1.4.20-configure.patch	2008-12-13 10:55:48 UTC (rev 24401)
@@ -0,0 +1,11 @@
+--- lighttpd-1.4.19-org/configure	2008-03-10 21:46:12.000000000 +0000
++++ lighttpd-1.4.19/configure	2008-03-31 06:58:41.000000000 +0000
+@@ -23971,7 +23971,7 @@
+ { echo "$as_me:$LINENO: result: $WITH_PCRE" >&5
+ echo "${ECHO_T}$WITH_PCRE" >&6; }
+ 
+-if test "x$cross_compiling" = xno -a "$WITH_PCRE" != "no"; then
++if test "$WITH_PCRE" != "no"; then
+   # Extract the first word of "pcre-config", so it can be a program name with args.
+ set dummy pcre-config; ac_word=$2
+ { echo "$as_me:$LINENO: checking for $ac_word" >&5


Property changes on: trunk/buildroot/package/lighttpd/lighttpd-1.4.20-configure.patch
___________________________________________________________________
Name: svn:mergeinfo
   + 

Modified: trunk/buildroot/package/lighttpd/lighttpd.mk
===================================================================
--- trunk/buildroot/package/lighttpd/lighttpd.mk	2008-12-13 03:34:47 UTC (rev 24400)
+++ trunk/buildroot/package/lighttpd/lighttpd.mk	2008-12-13 10:55:48 UTC (rev 24401)
@@ -3,7 +3,7 @@
 # lighttpd
 #
 #############################################################
-LIGHTTPD_VERSION:=1.4.19
+LIGHTTPD_VERSION:=1.4.20
 LIGHTTPD_SOURCE:=lighttpd-$(LIGHTTPD_VERSION).tar.bz2
 LIGHTTPD_SITE:=http://www.lighttpd.net/download
 LIGHTTPD_INSTALL_STAGING = NO
