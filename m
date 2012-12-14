From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 14 Dec 2012 13:48:10 +0100
Subject: [Buildroot] [git commit] package/libiscsi: new package
Message-ID: <20121214125328.2E4959A219@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=599b97203012dbdc4a6663be717d6f1162ff26d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in            |    1 +
 package/libiscsi/Config.in   |   12 ++++++++++++
 package/libiscsi/libiscsi.mk |   15 +++++++++++++++
 3 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index cad1221..dbb6704 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -466,6 +466,7 @@ source "package/libesmtp/Config.in"
 source "package/libeXosip2/Config.in"
 source "package/libfcgi/Config.in"
 source "package/libidn/Config.in"
+source "package/libiscsi/Config.in"
 source "package/liboauth/Config.in"
 source "package/libmicrohttpd/Config.in"
 source "package/neon/Config.in"
diff --git a/package/libiscsi/Config.in b/package/libiscsi/Config.in
new file mode 100644
index 0000000..f3fc29e
--- /dev/null
+++ b/package/libiscsi/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBISCSI
+	bool "libiscsi"
+	select BR2_PACKAGE_POPT
+	help
+	  Libiscsi is a client-side library to implement the iSCSI protocol
+	  that can be used to access resource of an iSCSI Target.
+	  
+	  The library is fully async with regards to iscsi commands and scsi
+	  tasks, but a sync layer is also provided for ease of use for simpler
+	  applications.
+	  
+	  https://github.com/sahlberg/libiscsi  (no proper homepage)
diff --git a/package/libiscsi/libiscsi.mk b/package/libiscsi/libiscsi.mk
new file mode 100644
index 0000000..bfebd7e
--- /dev/null
+++ b/package/libiscsi/libiscsi.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# libiscsi
+#
+#############################################################
+
+LIBISCSI_VERSION         = 1.6.0
+LIBISCSI_SOURCE          = libiscsi-$(LIBISCSI_VERSION).tar.gz
+LIBISCSI_SITE            = https://github.com/downloads/sahlberg/libiscsi
+LIBISCSI_LICENSE         = GPLv2+ LGPLv2.1+
+LIBISCSI_LICENSE_FILES   = COPYING LICENCE-GPL-2.txt LICENCE-LGPL-2.1.txt
+LIBISCSI_INSTALL_STAGING = YES
+LIBISCSI_DEPENDENCIES    = popt
+
+$(eval $(autotools-package))
