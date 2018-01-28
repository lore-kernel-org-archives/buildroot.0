From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Jan 2018 17:20:04 +0100
Subject: [Buildroot] [git commit] package/pure-ftpd: Add uploadscript option
Message-ID: <20180128162108.B0ED084406@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef9be80526dc9740cbde6bfcfb3a229f06def63c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable option to compile with '--with-uploadscript' to allow running
script after successful uploads.

Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
Acked-by: Bryce Ferguson <bryce.ferguson at rockwellcollins.com
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
