From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Wed, 12 Dec 2018 10:20:04 +0800
Subject: [Buildroot] [PATCH 1/1] package/acpid: fix acpid.service permissions
Message-ID: <1544581204-28402-1-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/acpid/acpid.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index 514fd31..adcc175 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -11,7 +11,7 @@ ACPID_LICENSE = GPL-2.0+
 ACPID_LICENSE_FILES = COPYING
 
 define ACPID_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0755 package/acpid/acpid.service \
+	$(INSTALL) -D -m 0644 package/acpid/acpid.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/acpid.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	ln -sf ../../../../usr/lib/systemd/system/acpid.service \
-- 
2.7.4
