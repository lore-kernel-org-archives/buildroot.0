From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Sep 2013 10:27:21 -0300
Subject: [Buildroot] [PATCH] libsecret: specify where libgcrypt lives
Message-ID: <1378214841-12006-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libgcrypt support is enabled the configure script will try to
find libgcrypt-config in the PATH. If the host distribution has it then
brokeness ensues. Fixes:
http://autobuild.buildroot.net/results/eca/eca10b8360354e7e51406f7ac942d343987bde5e/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libsecret/libsecret.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libsecret/libsecret.mk b/package/libsecret/libsecret.mk
index e445ea6..a0f39f8 100644
--- a/package/libsecret/libsecret.mk
+++ b/package/libsecret/libsecret.mk
@@ -16,7 +16,8 @@ LIBSECRET_CONF_OPT = --disable-manpages --disable-strict --disable-coverage --en
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 	LIBSECRET_DEPENDENCIES += libgcrypt
-	LIBSECRET_CONF_OPT += --enable-gcrypt
+	LIBSECRET_CONF_OPT += --enable-gcrypt \
+		--with-libgcrypt-prefix=$(STAGING_DIR)/usr
 else
 	LIBSECRET_CONF_OPT += --disable-gcrypt
 endif
-- 
1.8.1.5
