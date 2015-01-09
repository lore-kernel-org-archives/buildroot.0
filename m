From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri,  9 Jan 2015 09:11:25 -0600
Subject: [Buildroot] [PATCH v4 24/27] rsyslog: fix config file comment style
In-Reply-To: <1420816288-8750-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1420816288-8750-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1420816288-8750-25-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/rsyslog/rsyslog.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 688a335..58f588d 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -54,6 +54,10 @@ endef
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
