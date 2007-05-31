From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 31 May 2007 18:29:30 +0200
Subject: [Buildroot] Need to bump versions due to disappearance of tarballs.
Message-ID: <465EF7EA.1010909@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author:	ulf
Date:	2007-05-30 18:23

Log
	Several tarballs has disappeared from download site
	and some have newer versions, even if old one remains.
	These patches will bump to latest version.

Modifed:
	package/curl/curl.mk
	package/dmalloc/dmalloc.mk
	package/dmraid/dmraid.mk
	package/file/file.mk
	package/hostap/hostap.mk
	package/l2tp/l2tp.mk
	package/libevent/libevent.mk
	package/libglib2/libglib2.mk
	package/libgtk/libgtk.mk
	package/mdadm/mdadm.mk
	package/microperl/microperl.mk
	package/mrouted/mrouted.mk
	package/portage/portage.mk
	package/python/python.mk

----------------------------------------------------------------------------------

diff -urN buildroot-0rig/package/curl/curl.mk buildroot/package/curl/curl.mk
--- buildroot-0rig/package/curl/curl.mk	2007-05-31 14:31:16.000000000 +0200
+++ buildroot/package/curl/curl.mk	2007-05-31 15:13:22.000000000 +0200
@@ -3,7 +3,7 @@
 # curl
 #
 #############################################################
-CURL_VERSION:=7.13.1
+CURL_VERSION:=7.16.2
 CURL_SOURCE:=curl-$(CURL_VERSION).tar.bz2
 CURL_SITE:=http://curl.haxx.se/download/
 CURL_CAT:=$(BZCAT)
diff -urN buildroot-0rig/package/dmalloc/dmalloc.mk buildroot/package/dmalloc/dmalloc.mk
--- buildroot-0rig/package/dmalloc/dmalloc.mk	2007-05-31 14:31:22.000000000 +0200
+++ buildroot/package/dmalloc/dmalloc.mk	2007-05-31 15:22:07.000000000 +0200
@@ -3,7 +3,7 @@
 # dmalloc
 #
 #############################################################
-DMALLOC_VER:=5.4.2
+DMALLOC_VER:=5.5.2
 DMALLOC_SOURCE:=dmalloc-$(DMALLOC_VER).tgz
 DMALLOC_SITE:=http://dmalloc.com/releases
 DMALLOC_DIR:=$(BUILD_DIR)/dmalloc-$(DMALLOC_VER)
diff -urN buildroot-0rig/package/dmraid/dmraid.mk buildroot/package/dmraid/dmraid.mk
--- buildroot-0rig/package/dmraid/dmraid.mk	2007-05-31 14:31:16.000000000 +0200
+++ buildroot/package/dmraid/dmraid.mk	2007-05-31 15:23:13.000000000 +0200
@@ -4,7 +4,7 @@
 #
 #############################################################

-DMRAID_VERSION=1.0.0.rc13
+DMRAID_VERSION=1.0.0.rc14
 DMRAID_SOURCE:=dmraid-$(DMRAID_VERSION).tar.bz2
 DMRAID_SITE:=http://people.redhat.com/~heinzm/sw/dmraid/src
 DMRAID_DIR:=$(BUILD_DIR)/dmraid/$(DMRAID_VERSION)
diff -urN buildroot-0rig/package/file/file.mk buildroot/package/file/file.mk
--- buildroot-0rig/package/file/file.mk	2007-05-31 14:31:17.000000000 +0200
+++ buildroot/package/file/file.mk	2007-05-31 15:25:04.000000000 +0200
@@ -3,7 +3,7 @@
 # file
 #
 #############################################################
-FILE_VER:=4.19
+FILE_VER:=4.21
 FILE_SOURCE:=file-$(FILE_VER).tar.gz
 FILE_SITE:=ftp://ftp.astron.com/pub/file
 FILE_SOURCE_DIR:=$(BUILD_DIR)/file-$(FILE_VER)
diff -urN buildroot-0rig/package/hostap/hostap.mk buildroot/package/hostap/hostap.mk
--- buildroot-0rig/package/hostap/hostap.mk	2007-05-31 14:31:15.000000000 +0200
+++ buildroot/package/hostap/hostap.mk	2007-05-31 15:33:54.000000000 +0200
@@ -3,12 +3,17 @@
 # hostap
 #
 #############################################################
-HOSTAP_SOURCE_URL=http://hostap.epitest.fi/cgi-bin/viewcvs.cgi/hostap/hostap.tar.gz?tarball=1
-HOSTAP_SOURCE=hostap.tar.gz
+#HOSTAP_SOURCE_URL=http://hostap.epitest.fi/cgi-bin/viewcvs.cgi/hostap/hostap.tar.gz?tarball=1
+#HOSTAP_SOURCE=hostap.tar.gz
+#	$(WGET) -P $(DL_DIR) $(HOSTAP_SOURCE_URL) -O $(DL_DIR)/$(HOSTAP_SOURCE)
+HOSTAP_VER=0.5.8
+HOSTAP_SITE=http://hostap.epitest.fi/releases
+HOSTAP_SOURCE=hostapd-$(HOSTAP_VER).tar.gz
 HOSTAP_DIR=$(BUILD_DIR)/hostap-snapshot

+
 $(DL_DIR)/$(HOSTAP_SOURCE):
-	$(WGET) -P $(DL_DIR) $(HOSTAP_SOURCE_URL) -O $(DL_DIR)/$(HOSTAP_SOURCE)
+	$(WGET) -P $(DL_DIR) $(HOSTAP_SITE)/$(HOSTAP_SOURCE)

 hostap-source: $(DL_DIR)/$(HOSTAP_SOURCE)

diff -urN buildroot-0rig/package/l2tp/l2tp.mk buildroot/package/l2tp/l2tp.mk
--- buildroot-0rig/package/l2tp/l2tp.mk	2007-05-31 14:31:11.000000000 +0200
+++ buildroot/package/l2tp/l2tp.mk	2007-05-31 15:36:15.000000000 +0200
@@ -5,7 +5,7 @@
 #############################################################
 L2TP_VER:=0.70-pre20031121
 L2TP_SOURCE:=l2tpd_$(L2TP_VER).orig.tar.gz
-L2TP_PATCH:=l2tpd_$(L2TP_VER)-2.1.diff.gz
+L2TP_PATCH:=l2tpd_$(L2TP_VER)-2.2.diff.gz
 L2TP_SITE:=ftp://ftp.debian.org/debian/pool/main/l/l2tpd/
 L2TP_DIR:=$(BUILD_DIR)/l2tpd-$(L2TP_VER)
 L2TP_CAT:=$(ZCAT)
diff -urN buildroot-0rig/package/libevent/libevent.mk buildroot/package/libevent/libevent.mk
--- buildroot-0rig/package/libevent/libevent.mk	2007-05-31 14:31:17.000000000 +0200
+++ buildroot/package/libevent/libevent.mk	2007-05-31 15:43:37.000000000 +0200
@@ -3,7 +3,7 @@
 # libevent
 #
 #############################################################
-LIBEVENT_VER:=1.2
+LIBEVENT_VER:=1.3b
 LIBEVENT_SOURCE:=libevent-$(LIBEVENT_VER).tar.gz
 LIBEVENT_SITE:=http://monkey.org/~provos/
 LIBEVENT_DIR:=$(BUILD_DIR)/libevent-$(LIBEVENT_VER)
diff -urN buildroot-0rig/package/libglib2/libglib2.mk buildroot/package/libglib2/libglib2.mk
--- buildroot-0rig/package/libglib2/libglib2.mk	2007-05-31 14:31:11.000000000 +0200
+++ buildroot/package/libglib2/libglib2.mk	2007-05-31 15:53:34.000000000 +0200
@@ -3,9 +3,11 @@
 # libglib2
 #
 #############################################################
-LIBGLIB2_VERSION:=2.12.9
+#LIBGLIB2_VERSION:=2.12.9
+#LIBGLIB2_SITE:=http://ftp.gtk.org/pub/glib/2.12
+LIBGLIB2_VERSION:=2.13.2
+LIBGLIB2_SITE:=http://ftp.gtk.org/pub/glib/2.13
 LIBGLIB2_SOURCE:=glib-$(LIBGLIB2_VERSION).tar.bz2
-LIBGLIB2_SITE:=http://ftp.gtk.org/pub/glib/2.12
 LIBGLIB2_CAT:=$(BZCAT)
 LIBGLIB2_DIR:=$(BUILD_DIR)/glib-$(LIBGLIB2_VERSION)
 LIBGLIB2_BINARY:=libglib-2.0.a
diff -urN buildroot-0rig/package/libgtk2/libgtk2.mk buildroot/package/libgtk2/libgtk2.mk
--- buildroot-0rig/package/libgtk2/libgtk2.mk	2007-05-31 14:31:15.000000000 +0200
+++ buildroot/package/libgtk2/libgtk2.mk	2007-05-31 15:41:52.000000000 +0200
@@ -3,7 +3,8 @@
 # libgtk2.0
 #
 #############################################################
-LIBGTK2_VERSION:=2.10.9
+#LIBGTK2_VERSION:=2.10.9
+LIBGTK2_VERSION:=2.10.12
 LIBGTK2_SOURCE:=gtk+-$(LIBGTK2_VERSION).tar.bz2
 LIBGTK2_SITE:=ftp://ftp.gtk.org/pub/gtk/v2.10
 LIBGTK2_CAT:=$(BZCAT)
diff -urN buildroot-0rig/package/mdadm/mdadm.mk buildroot/package/mdadm/mdadm.mk
--- buildroot-0rig/package/mdadm/mdadm.mk	2007-05-31 14:31:22.000000000 +0200
+++ buildroot/package/mdadm/mdadm.mk	2007-05-31 16:11:37.000000000 +0200
@@ -3,7 +3,7 @@
 # mdadm
 #
 #############################################################
-MDADM_VERSION:=2.6.1
+MDADM_VERSION:=2.6.2
 MDADM_SOURCE:=mdadm_$(MDADM_VERSION).orig.tar.gz
 MDADM_PATCH:=mdadm_$(MDADM_VERSION)-1.diff.gz
 MDADM_CAT:=$(ZCAT)
diff -urN buildroot-0rig/package/microperl/microperl.mk buildroot/package/microperl/microperl.mk
--- buildroot-0rig/package/microperl/microperl.mk	2007-05-31 14:31:12.000000000 +0200
+++ buildroot/package/microperl/microperl.mk	2007-05-31 16:30:48.000000000 +0200
@@ -4,9 +4,10 @@
 #
 #############################################################
 MICROPERL_MAJ=5
-MICROPERL_VER=$(MICROPERL_MAJ).8.8
-MICROPERL_SOURCE=perl-$(MICROPERL_VER).tar.bz2
-MICROPERL_CAT:=$(BZCAT)
+#MICROPERL_VER=$(MICROPERL_MAJ).8.8
+MICROPERL_VER=$(MICROPERL_MAJ).9.4
+MICROPERL_SOURCE=perl-$(MICROPERL_VER).tar.gz
+MICROPERL_CAT:=$(ZCAT)
 MICROPERL_SITE=ftp://ftp.cpan.org/pub/CPAN/src/5.0
 MICROPERL_DIR=$(BUILD_DIR)/perl-$(MICROPERL_VER)

diff -urN buildroot-0rig/package/mrouted/mrouted.mk buildroot/package/mrouted/mrouted.mk
--- buildroot-0rig/package/mrouted/mrouted.mk	2007-05-31 14:31:10.000000000 +0200
+++ buildroot/package/mrouted/mrouted.mk	2007-05-31 16:34:55.000000000 +0200
@@ -5,10 +5,12 @@
 #
 #############################################################
 MROUTED_SOURCE:=mrouted_3.9-beta3.orig.tar.gz
-MROUTED_SITE:=http://ftp.debian.org/debian/pool/non-free/m/mrouted
+#MROUTED_SITE:=http://ftp.debian.org/debian/pool/non-free/m/mrouted
+MROUTED_SITE=http://archive.debian.org/debian-archive/dists/Debian-2.2/non-free/source/net
 MROUTED_DIR:=$(BUILD_DIR)/mrouted-3.9-beta3.orig
 MROUTED_CAT:=$(ZCAT)
-MROUTED_PATCH:=mrouted_3.9-beta3-1.1.diff.gz
+#MROUTED_PATCH:=mrouted_3.9-beta3-1.1.diff.gz
+MROUTED_PATCH:=mrouted_3.9-beta3-1.diff.gz
 MROUTED_BINARY:=mrouted
 MROUTED_TARGET_BINARY:=usr/sbin/mrouted

diff -urN buildroot-0rig/package/portage/portage.mk buildroot/package/portage/portage.mk
--- buildroot-0rig/package/portage/portage.mk	2007-05-31 14:31:23.000000000 +0200
+++ buildroot/package/portage/portage.mk	2007-05-31 16:51:24.000000000 +0200
@@ -11,7 +11,7 @@
 PORTAGE_TARGET_DIR:=$(TARGET_DIR)/usr/lib/portage
 PORTAGE_TARGET_BINARY:=usr/bin/emerge

-SANDBOX_VERSION:=1.2.13
+SANDBOX_VERSION:=1.2.18.1
 SANDBOX_SOURCE:=sandbox-$(SANDBOX_VERSION).tar.bz2
 SANDBOX_SITE:=$(PORTAGE_SITE)
 SANDBOX_CAT:=$(PORTAGE_CAT)
diff -urN buildroot-0rig/package/python/python.mk buildroot/package/python/python.mk
--- buildroot-0rig/package/python/python.mk	2007-05-31 14:31:16.000000000 +0200
+++ buildroot/package/python/python.mk	2007-05-31 16:53:15.000000000 +0200
@@ -3,7 +3,7 @@
 # python
 #
 #############################################################
-PYTHON_VERSION=2.4.2
+PYTHON_VERSION=2.4.4
 PYTHON_SOURCE:=Python-$(PYTHON_VERSION).tar.bz2
 PYTHON_SITE:=http://python.org/ftp/python/$(PYTHON_VERSION)
 PYTHON_DIR:=$(BUILD_DIR)/Python-$(PYTHON_VERSION)



-- 
Best Regards,
Ulf Samuelsson
-------------- next part --------------
A non-text attachment was scrubbed...
Name: ulf.vcf
Type: text/x-vcard
Size: 301 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070531/64968034/attachment.vcf 
