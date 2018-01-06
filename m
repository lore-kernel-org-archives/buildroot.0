From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  6 Jan 2018 18:50:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.7.4
Message-ID: <20180106175020.28092-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://www.samba.org/samba/history/samba-4.7.4.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...-patch-source3__libads__kerberos_keytab.c.patch | 31 ++++++++++++++++++++++
 package/samba4/samba4.hash                         |  2 +-
 package/samba4/samba4.mk                           |  2 +-
 3 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 package/samba4/0002-patch-source3__libads__kerberos_keytab.c.patch

diff --git a/package/samba4/0002-patch-source3__libads__kerberos_keytab.c.patch b/package/samba4/0002-patch-source3__libads__kerberos_keytab.c.patch
new file mode 100644
index 0000000000..1213659c8d
--- /dev/null
+++ b/package/samba4/0002-patch-source3__libads__kerberos_keytab.c.patch
@@ -0,0 +1,31 @@
+From: Timur I. Bakeyev <timur@freebsd.org>
+Subject: Fix compilation of Samba 4.7.4 with disabled ADS
+
+Downloaded from upstream mailinglist
+https://lists.samba.org/archive/samba-technical/2017-December/124629.html
+
+Patch originates from FreeBSD:
+https://svnweb.freebsd.org/ports/head/net/samba47/files/patch-source3__libads__kerberos_keytab.c?revision=457119&view=markup
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- a/source3/libads/kerberos_keytab.c.orig	2017-12-23 14:23:53.247467000 +0100
++++ b/source3/libads/kerberos_keytab.c	2017-12-23 18:57:07.135340000 +0100
+@@ -32,8 +32,6 @@
+ 
+ #ifdef HAVE_KRB5
+ 
+-#ifdef HAVE_ADS
+-
+ /* This MAX_NAME_LEN is a constant defined in krb5.h */
+ #ifndef MAX_KEYTAB_NAME_LEN
+ #define MAX_KEYTAB_NAME_LEN 1100
+@@ -85,6 +83,8 @@
+ 	return ret;
+ }
+ 
++#ifdef HAVE_ADS
++
+ /**********************************************************************
+  Adds a single service principal, i.e. 'host' to the system keytab
+ ***********************************************************************/
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 49122c60cb..28765440d1 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 06e4152ca1cb803f005e92eb6baedb6cc874998b44ee37c2a7819e77a55bfd2c  samba-4.7.3.tar.gz
+sha256 fb12d0c4452f85b67b78bbeabd4c762d8feb8ff83e39d044d285120c2c488247  samba-4.7.4.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index ba31d4ccd9..6f3207fb64 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.7.3
+SAMBA4_VERSION = 4.7.4
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.11.0
