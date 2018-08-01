From: Artem Panfilov <apanfilov@spectracom.com>
Date: Wed,  1 Aug 2018 16:21:14 +0300
Subject: [Buildroot] [PATCH 1/1] package/pure-ftpd: add optional support for
 linux-pam
Message-ID: <20180801132114.24273-1-apanfilov@spectracom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Artem Panfilov <apanfilov@spectracom.com>
---
 package/pure-ftpd/pure-ftpd.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 457e67ea60..ea7578c2cd 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -57,4 +57,9 @@ ifeq ($(BR2_PACKAGE_PURE_FTPD_UPLOADSCRIPT),y)
 PURE_FTPD_CONF_OPTS += --with-uploadscript
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+PURE_FTPD_CONF_OPTS += --with-pam
+PURE_FTPD_DEPENDENCIES += linux-pam
+endif
+
 $(eval $(autotools-package))
-- 
2.17.1
