From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 25 Sep 2012 19:18:22 +0200
Subject: [Buildroot] [PATCH v8 06/11] perl: add GDBM_File
In-Reply-To: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
References: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1348593508-14254-6-git-send-email-francois.perrad@gadz.org>
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
index e0dbbdf..8d8430d 100644
--- a/package/perl/Config.in
+++ b/package/perl/Config.in
@@ -26,4 +26,10 @@ config BR2_PACKAGE_PERL_DB_FILE
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
index 0c69e0b..71762e1 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -16,6 +16,9 @@ PERL_DEPENDENCIES = host-qemu
 ifeq ($(BR2_PACKAGE_PERL_DB_FILE),y)
     PERL_DEPENDENCIES += berkeleydb
 endif
+ifeq ($(BR2_PACKAGE_PERL_GDBM_FILE),y)
+    PERL_DEPENDENCIES += gdbm
+endif
 
 ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
     PERL_USE_DEVEL=-Dusedevel
-- 
1.7.9.5
