From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  4 Dec 2013 07:37:27 -0300
Subject: [Buildroot] [PATCH] lighttpd: fix systemd service file permission
Message-ID: <1386153447-27448-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Systemd service files don't need to be +x so switch the installation to
mode 644.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lighttpd/lighttpd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index c820a73..70421cf 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -98,7 +98,7 @@ endef
 
 define LIGHTTPD_INSTALL_INIT_SYSTEMD
 	[ -f $(TARGET_DIR)/etc/systemd/system/lighttpd.service ] || \
-		$(INSTALL) -D -m 755 package/lighttpd/lighttpd.service \
+		$(INSTALL) -D -m 644 package/lighttpd/lighttpd.service \
 			$(TARGET_DIR)/etc/systemd/system/lighttpd.service
 
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-- 
1.8.3.2
