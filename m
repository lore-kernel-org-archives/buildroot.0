From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 Jan 2015 20:16:58 -0300
Subject: [Buildroot] [PATCH 3/7] rsyslog: rename sysv initscript to
	S01logging
In-Reply-To: <1421191022-5509-1-git-send-email-gustavo@zacarias.com.ar>
References: <1421191022-5509-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1421191022-5509-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do it to avoid having duplicate and conflicting functionality with
busybox's S01logging.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rsyslog/{S01rsyslog => S01logging} | 0
 package/rsyslog/rsyslog.mk                 | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename package/rsyslog/{S01rsyslog => S01logging} (100%)

diff --git a/package/rsyslog/S01rsyslog b/package/rsyslog/S01logging
similarity index 100%
rename from package/rsyslog/S01rsyslog
rename to package/rsyslog/S01logging
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 688a335..27a72da 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -39,8 +39,8 @@ else
 endif
 
 define RSYSLOG_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D package/rsyslog/S01rsyslog \
-		$(TARGET_DIR)/etc/init.d/S01rsyslog
+	$(INSTALL) -m 0755 -D package/rsyslog/S01logging \
+		$(TARGET_DIR)/etc/init.d/S01logging
 endef
 
 define RSYSLOG_INSTALL_INIT_SYSTEMD
-- 
2.0.5
