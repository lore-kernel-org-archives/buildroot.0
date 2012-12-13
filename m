From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Dec 2012 22:47:02 +0100
Subject: [Buildroot] [PATCH 02/20] package/libiscsi: new package
In-Reply-To: <cover.1355435224.git.yann.morin.1998@free.fr>
References: <cover.1355435224.git.yann.morin.1998@free.fr>
Message-ID: <270885b540b0b51edc0b6bcd2b11264f44f35d05.1355435224.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |    1 +
 package/libiscsi/Config.in   |   12 ++++++++++++
 package/libiscsi/libiscsi.mk |   15 +++++++++++++++
 3 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 package/libiscsi/Config.in
 create mode 100644 package/libiscsi/libiscsi.mk

diff --git a/package/Config.in b/package/Config.in
index 2345b4b..8edadf9 100644
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
-- 
1.7.2.5
