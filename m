From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Fri, 12 Jan 2018 13:53:45 -0600
Subject: [Buildroot] [PATCH] package/pure-ftpd: Add uploadscript option
Message-ID: <1515786826-41633-1-git-send-email-sam.voss@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable option to compile with '--with-uploadscript' to allow running
script after successful uploads.

Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
---
 package/pure-ftpd/Config.in    | 6 ++++++
 package/pure-ftpd/pure-ftpd.mk | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/package/pure-ftpd/Config.in b/package/pure-ftpd/Config.in
index b5eca87..d03170b 100644
--- a/package/pure-ftpd/Config.in
+++ b/package/pure-ftpd/Config.in
@@ -30,4 +30,10 @@ config BR2_PACKAGE_PURE_FTPD_QUOTAS
 	  his account. In addition, restrictions can also be placed on
 	  the total size.
 
+config BR2_PACKAGE_PURE_FTPD_UPLOADSCRIPT
+	bool "uploadscript"
+	help
+	  Enable pure-upload script. Automatically run an external program
+	  after a successful upload.
+
 endif
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 815de90..457e67e 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -53,4 +53,8 @@ ifeq ($(BR2_PACKAGE_PURE_FTPD_QUOTAS),y)
 PURE_FTPD_CONF_OPTS += --with-quotas
 endif
 
+ifeq ($(BR2_PACKAGE_PURE_FTPD_UPLOADSCRIPT),y)
+PURE_FTPD_CONF_OPTS += --with-uploadscript
+endif
+
 $(eval $(autotools-package))
-- 
1.9.1
