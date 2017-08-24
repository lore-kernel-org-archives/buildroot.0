From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 24 Aug 2017 14:41:52 -0700
Subject: [Buildroot] [PATCH 3/3] package/nss-pam-ldapd: Do not mark .service
	file executable
In-Reply-To: <20170824214152.5742-1-andrew.smirnov@gmail.com>
References: <20170824214152.5742-1-andrew.smirnov@gmail.com>
Message-ID: <20170824214152.5742-3-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do not mark .service file executable, otherwise systemd
will give us a warning about it.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/nss-pam-ldapd/nss-pam-ldapd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nss-pam-ldapd/nss-pam-ldapd.mk b/package/nss-pam-ldapd/nss-pam-ldapd.mk
index 1c4f73521a..3eddb5e2a1 100644
--- a/package/nss-pam-ldapd/nss-pam-ldapd.mk
+++ b/package/nss-pam-ldapd/nss-pam-ldapd.mk
@@ -27,7 +27,7 @@ NSS_PAM_LDAPD_CONF_OPTS += --disable-pam
 endif
 
 define NSS_PAM_LDAPD_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -m 755 -D package/nss-pam-ldapd/nslcd.service \
+	$(INSTALL) -m 644 -D package/nss-pam-ldapd/nslcd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/nslcd.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	ln -fs ../../../../usr/lib/systemd/system/nslcd.service \
-- 
2.13.5
