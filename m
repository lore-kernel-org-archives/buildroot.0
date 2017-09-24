From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Sep 2017 23:15:21 +0200
Subject: [Buildroot] [git commit] package/ngircd: fix pam support
Message-ID: <20170924210810.DC9C080257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f61400d2fc37ab54d266bde48c3b69261827f5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix type introduced by
https://git.buildroot.net/buildroot/commit/?id=13755ca3056e4793e483c2ec634c06ac017088d2

Fixes
http://autobuild.buildroot.net/results/461/461fa08ef11dc4ae8074a2d634138e4fcfaa8d16/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ngircd/ngircd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index 37c4f87..9b330fa 100644
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
