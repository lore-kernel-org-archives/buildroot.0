From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 19 Oct 2012 15:13:50 +0200
Subject: [Buildroot] [PATCH v11 5/9] perl: add GDBM_File
In-Reply-To: <1350652434-32020-1-git-send-email-francois.perrad@gadz.org>
References: <1350652434-32020-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1350652434-32020-5-git-send-email-francois.perrad@gadz.org>
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
index 6cb89f0..98b41da 100644
--- a/package/perl/Config.in
+++ b/package/perl/Config.in
@@ -22,6 +22,12 @@ config BR2_PACKAGE_PERL_DB_FILE
 	help
 	  Build the DB_File module.
 
+config BR2_PACKAGE_PERL_GDBM_FILE
+	bool "GDBM_File"
+	select BR2_PACKAGE_GDBM
+	help
+	  Build the GDBM_File module.
+
 endif
 
 comment "perl requires an architecture supported by qemu"
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 186158b..56abbc1 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -16,6 +16,9 @@ PERL_DEPENDENCIES = host-qemu
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
     PERL_DEPENDENCIES += berkeleydb
 endif
+ifeq ($(BR2_PACKAGE_GDBM),y)
+    PERL_DEPENDENCIES += gdbm
+endif
 
 PERL_CONF_OPT = -des \
 		-Dusecrosscompile \
-- 
1.7.9.5
