From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 May 2014 12:32:44 +0200
Subject: [Buildroot] [PATCH 2/2] mysql: Add optional OpenSSL dependency
In-Reply-To: <1400322764-24571-1-git-send-email-bernd.kuhls@t-online.de>
References: <1400322764-24571-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1400322764-24571-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make sure OpenSSL is build before mysql.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mysql/mysql.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index d338c31..808abce 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -33,6 +33,10 @@ MYSQL_CONF_OPT = \
 	--enable-thread-safe-client \
 	--disable-mysql-maintainer-mode
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+MYSQL_DEPENDENCIES += openssl
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 MYSQL_DEPENDENCIES += zlib
 endif
-- 
1.7.10.4
