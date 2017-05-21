From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 May 2017 23:41:18 +0200
Subject: [Buildroot] [PATCH/next 3/9] package/c-icap: add optional support
	for openldap
In-Reply-To: <20170521214124.20328-1-bernd.kuhls@t-online.de>
References: <20170521214124.20328-1-bernd.kuhls@t-online.de>
Message-ID: <20170521214124.20328-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/c-icap/c-icap.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index 7925f5bc3..388979f3a 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -13,7 +13,6 @@ C_ICAP_INSTALL_STAGING = YES
 C_ICAP_CONFIG_SCRIPTS = c-icap-config c-icap-libicapapi-config
 C_ICAP_CONF_OPTS = \
 	--with-process-mutexes=posix \
-	--without-ldap \
 	--without-perl \
 	--enable-large-files \
 	--enable-ipv6
@@ -42,6 +41,13 @@ else
 C_ICAP_CONF_OPTS += --without-bzlib
 endif
 
+ifeq ($(BR2_PACKAGE_OPENLDAP),y)
+C_ICAP_CONF_OPTS += --with-ldap
+C_ICAP_DEPENDENCIES += openldap
+else
+C_ICAP_CONF_OPTS += --without-ldap
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 C_ICAP_CONF_OPTS += --with-zlib
 C_ICAP_DEPENDENCIES += zlib
-- 
2.11.0
