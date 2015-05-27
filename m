From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Wed, 27 May 2015 17:17:20 -0500
Subject: [Buildroot] [PATCH v6 16/22] rsyslog: fix config file comment style
In-Reply-To: <1432765046-1223-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1432765046-1223-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <1432765046-1223-17-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
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
