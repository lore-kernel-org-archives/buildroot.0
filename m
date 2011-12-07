From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 7 Dec 2011 11:37:07 +0100
Subject: [Buildroot] [PATCH 1/1] Add new package libesmtp library for
	sending mail through smtp
Message-ID: <F1714CE52FFD41F7963A43CAB26BF2BC@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Add new package libesmtp  library for sending mail through smtp


diff -rupN buildroot-2011.11/package/libesmtp/Config.in
buildroot-2011.11js/package/libesmtp/Config.in
--- buildroot-2011.11/package/libesmtp/Config.in	1970-01-01
01:00:00.000000000 +0100
+++ buildroot-2011.11js/package/libesmtp/Config.in	2011-12-03
20:20:00.000000000 +0100
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBESMTP
+	bool "libesmtp"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Library for smtp mailing
+	  
+	  http://www.stafford.uklinux.net/libesmtp
diff -rupN buildroot-2011.11/package/libesmtp/libesmtp.mk
buildroot-2011.11js/package/libesmtp/libesmtp.mk
--- buildroot-2011.11/package/libesmtp/libesmtp.mk	1970-01-01
01:00:00.000000000 +0100
+++ buildroot-2011.11js/package/libesmtp/libesmtp.mk	2011-12-03
20:20:00.000000000 +0100
@@ -0,0 +1,14 @@
+#############################################################
+#
+# libesmtp
+#
+#############################################################
+LIBESMTP_VERSION = 1.0.6
+LIBESMTP_SOURCE = libesmtp-$(LIBESMTP_VERSION).tar.bz2
+LIBESMTP_SITE = http://www.stafford.uklinux.net/libesmtp
+LIBESMTP_DEPENDENCIES = openssl
+LIBESMTP_INSTALL_STAGING = YES
+LIBESMTP_INSTALL_TARGET = YES
+#LIBESMTP_CONF_OPT = --disable-libftdipp --without-docs --with-examples
+
+$(eval $(call AUTOTARGETS,package,libesmtp))



Johan
