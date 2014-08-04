From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Mon,  4 Aug 2014 20:14:16 +0200
Subject: [Buildroot] [PATCH 1/2] samba: Remove execution rights from smb.conf
Message-ID: <1407176057-13180-1-git-send-email-benoit.thebaudeau@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

/etc/samba/smb.conf should be installed without execution rights since it is a
simple text configuration file.

Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>
---
 package/samba/samba.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 6d379b5..84e525f 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -167,7 +167,7 @@ define SAMBA_INSTALL_INITSCRIPTS_CONFIG
 	fi
 	# install config
 	@if [ ! -f $(TARGET_DIR)/etc/samba/smb.conf ]; then \
-		$(INSTALL) -m 0755 -D package/samba/simple.conf $(TARGET_DIR)/etc/samba/smb.conf; \
+		$(INSTALL) -m 0644 -D package/samba/simple.conf $(TARGET_DIR)/etc/samba/smb.conf; \
 	fi
 endef
 
-- 
1.9.1
