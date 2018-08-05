From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Aug 2018 14:40:28 +0200
Subject: [Buildroot] [git commit] package/pure-ftpd: add optional support
 for linux-pam
Message-ID: <20180805123459.268718B4AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85dd98c31e93114995b36ccd398493cd5375ab94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Artem Panfilov <apanfilov@spectracom.com>
[Thomas: add explicit --without-pam when linux-pam is not enabled.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pure-ftpd/pure-ftpd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 457e67ea60..ae3ca9d1f0 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -57,4 +57,11 @@ ifeq ($(BR2_PACKAGE_PURE_FTPD_UPLOADSCRIPT),y)
 PURE_FTPD_CONF_OPTS += --with-uploadscript
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+PURE_FTPD_CONF_OPTS += --with-pam
+PURE_FTPD_DEPENDENCIES += linux-pam
+else
+PURE_FTPD_CONF_OPTS += --without-pam
+endif
+
 $(eval $(autotools-package))
