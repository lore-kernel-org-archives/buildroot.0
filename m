From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Tue,  2 Jun 2015 08:28:32 -0500
Subject: [Buildroot] [PATCH v7 16/22] rsyslog: fix config file comment style
In-Reply-To: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <1433251718-3167-17-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

---
Changes v6 -> v7:
  - No changes

Changes v5 -> v6:
  - No changes
---
 package/rsyslog/rsyslog.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 261f59d..00c313a 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -73,6 +73,10 @@ endef
 define RSYSLOG_INSTALL_CONF
 	$(INSTALL) -m 0644 -D $(@D)/platform/redhat/rsyslog.conf \
 		$(TARGET_DIR)/etc/rsyslog.conf
+	# Fix invalid config file comment style
+	$(SED) 's~\/\* ~#  ~g' $(TARGET_DIR)/etc/rsyslog.conf
+	$(SED) 's~ \*\/~# ~g' $(TARGET_DIR)/etc/rsyslog.conf
+	$(SED) 's~ \*~# ~g' $(TARGET_DIR)/etc/rsyslog.conf
 	mkdir -p $(TARGET_DIR)/etc/rsyslog.d
 endef
 
-- 
1.9.1
