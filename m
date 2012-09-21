From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 21 Sep 2012 23:39:00 +0200
Subject: [Buildroot] [PATCH v7 05/13] perl: add GDBM_File
In-Reply-To: <1348263548-12975-1-git-send-email-francois.perrad@gadz.org>
References: <1348263548-12975-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1348263548-12975-5-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/Config.in |    6 ++++++
 package/perl/perl.mk   |    3 +++
 2 files changed, 9 insertions(+)

diff --git a/package/perl/Config.in b/package/perl/Config.in
index 2e627da..f616485 100644
--- a/package/perl/Config.in
+++ b/package/perl/Config.in
@@ -25,4 +25,10 @@ config BR2_PACKAGE_PERL_DB_FILE
 	help
 	  Build the DB_File module.
 
+config BR2_PACKAGE_PERL_GDBM_FILE
+	bool "GDBM_File"
+	select BR2_PACKAGE_GDBM
+	help
+	  Build the GDBM_File module.
+
 endif
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index aca5fb0..4590c7a 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -15,6 +15,9 @@ PERL_INSTALL_STAGING = YES
 ifeq ($(BR2_PACKAGE_PERL_DB_FILE),y)
     PERL_DEPENDENCIES += berkeleydb
 endif
+ifeq ($(BR2_PACKAGE_PERL_DB_FILE),y)
+    PERL_DEPENDENCIES += gdbm
+endif
 HOST_PERL_DEPENDENCIES =
 
 ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
-- 
1.7.9.5
