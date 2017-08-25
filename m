From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Aug 2017 16:09:58 +0200
Subject: [Buildroot] [git commit] package/nss-pam-ldapd: Do not mark
	.service file executable
Message-ID: <20170825140416.43D8F805FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06cf5c1812e13e9ffd5d4040f2dbaf0f41a8e181
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do not mark .service file executable, otherwise systemd
will give us a warning about it.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nss-pam-ldapd/nss-pam-ldapd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nss-pam-ldapd/nss-pam-ldapd.mk b/package/nss-pam-ldapd/nss-pam-ldapd.mk
index 1c4f735..3eddb5e 100644
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
