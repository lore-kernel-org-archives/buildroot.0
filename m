From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  1 Mar 2020 21:19:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/tftpd: annotate CVE-2008-1403
Message-ID: <20200301201928.212671-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVE-2008-1403 is misclassified (by our CVE tracker) as affecting tftpd,
while in fact it affects BootManage TFTPD.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tftpd/tftpd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index 57905fda05..d7b0c12dc6 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -11,6 +11,10 @@ TFTPD_CONF_OPTS = --without-tcpwrappers
 TFTPD_LICENSE = BSD-4-Clause
 TFTPD_LICENSE_FILES = tftpd/tftpd.c
 
+# CVE-2008-1403 is misclassified (by our CVE tracker) as affecting tftpd, while
+# in fact it affects BootManage TFTPD.
+TFTPD_IGNORE_CVES += CVE-2008-1403
+
 define TFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/tftp/tftp $(TARGET_DIR)/usr/bin/tftp
 	$(INSTALL) -D $(@D)/tftpd/tftpd $(TARGET_DIR)/usr/sbin/tftpd
-- 
2.25.0
