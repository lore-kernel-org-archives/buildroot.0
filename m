From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  1 Sep 2012 09:25:32 +0200
Subject: [Buildroot] [PATCH 14/14] perl: add GDBM_File
In-Reply-To: <1346484332-31433-1-git-send-email-francois.perrad@gadz.org>
References: <1346484332-31433-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1346484332-31433-14-git-send-email-francois.perrad@gadz.org>
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
index 9df487a..8a042cc 100644
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
index 7785322..b5dd4bd 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -15,6 +15,9 @@ PERL_INSTALL_STAGING = YES
 ifdef BR2_PACKAGE_PERL_DB_FILE
     PERL_DEPENDENCIES += berkeleydb
 endif
+ifdef BR2_PACKAGE_PERL_GDBM_FILE
+    PERL_DEPENDENCIES += gdbm
+endif
 HOST_PERL_DEPENDENCIES =
 
 ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
-- 
1.7.9.5
