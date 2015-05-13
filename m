From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Wed, 13 May 2015 16:39:30 -0500
Subject: [Buildroot] [PATCH v5 17/24] rsyslog: fix config file comment style
In-Reply-To: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <1431553177-7280-18-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/rsyslog/rsyslog.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 99e6eba..2254b60 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -75,6 +75,10 @@ endef
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
