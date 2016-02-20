From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 20:49:17 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/links: add --with/--without-ssl
Message-ID: <1455997757-9495-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: removed path from --with-ssl (Yann)

 package/links/links.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/links/links.mk b/package/links/links.mk
index 3515e5f..14e9e6e 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -44,7 +44,10 @@ LINKS_DEPENDENCIES += libevent
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LINKS_CONF_OPTS += --with-ssl --enable-ssl-pkgconfig
 LINKS_DEPENDENCIES += openssl
+else
+LINKS_CONF_OPTS += --without-ssl
 endif
 
 ifeq ($(BR2_PACKAGE_XZ),y)
-- 
2.7.0
