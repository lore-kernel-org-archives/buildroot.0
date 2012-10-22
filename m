From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Oct 2012 09:46:18 -0300
Subject: [Buildroot] [PATCH 01/12] libnetfilter_conntrack: bump to version
	1.0.2
Message-ID: <1350909989-1012-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnetfilter_conntrack/Config.in           |    5 +++++
 .../libnetfilter-conntrack.mk                      |    6 ++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/libnetfilter_conntrack/Config.in b/package/libnetfilter_conntrack/Config.in
index caf8a8a..9f7b42a 100644
--- a/package/libnetfilter_conntrack/Config.in
+++ b/package/libnetfilter_conntrack/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBNETFILTER_CONNTRACK
 	bool "libnetfilter_conntrack"
+	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_LIBMNL
 	select BR2_PACKAGE_LIBNFNETLINK
 	help
 	  libnetfilter_conntrack is a userspace library providing
@@ -7,3 +9,6 @@ config BR2_PACKAGE_LIBNETFILTER_CONNTRACK
 	  connection tracking state table.
 
 	  http://www.netfilter.org/projects/libnetfilter_conntrack/
+
+comment "libnetfilter_conntrack requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/libnetfilter_conntrack/libnetfilter-conntrack.mk b/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
index c602903..90aa8e9 100644
--- a/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
+++ b/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
@@ -4,10 +4,12 @@
 #
 #############################################################
 
-LIBNETFILTER_CONNTRACK_VERSION = 1.0.1
+LIBNETFILTER_CONNTRACK_VERSION = 1.0.2
 LIBNETFILTER_CONNTRACK_SOURCE = libnetfilter_conntrack-$(LIBNETFILTER_CONNTRACK_VERSION).tar.bz2
 LIBNETFILTER_CONNTRACK_SITE = http://www.netfilter.org/projects/libnetfilter_conntrack/files
 LIBNETFILTER_CONNTRACK_INSTALL_STAGING = YES
-LIBNETFILTER_CONNTRACK_DEPENDENCIES = host-pkg-config libnfnetlink
+LIBNETFILTER_CONNTRACK_DEPENDENCIES = host-pkg-config libnfnetlink libmnl
+LIBNETFILTER_CONNTRACK_LICENSE = GPLv2+
+LIBNETFILTER_CONNTRACK_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.7.8.6
