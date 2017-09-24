From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Sep 2017 17:46:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/ngircd: fix pam support
Message-ID: <20170924154641.14759-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix type introduced by
https://git.buildroot.net/buildroot/commit/?id=13755ca3056e4793e483c2ec634c06ac017088d2

Fixes
http://autobuild.buildroot.net/results/461/461fa08ef11dc4ae8074a2d634138e4fcfaa8d16/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ngircd/ngircd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index 37c4f87d43..9b330fab53 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -14,7 +14,7 @@ ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 NGIRCD_CONF_OPTS += --with-pam=$(STAGING_DIR)/usr
 NGIRCD_DEPENDENCIES += linux-pam
 else
-NGIRCD_CONF_OPTS += --with-pam
+NGIRCD_CONF_OPTS += --without-pam
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.11.0
