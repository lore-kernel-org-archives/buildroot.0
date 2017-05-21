From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 May 2017 23:41:20 +0200
Subject: [Buildroot] [PATCH/next 5/9] package/c-icap: add optional support
	for libmemcached
In-Reply-To: <20170521214124.20328-1-bernd.kuhls@t-online.de>
References: <20170521214124.20328-1-bernd.kuhls@t-online.de>
Message-ID: <20170521214124.20328-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for libmemcached was added in 2014:
https://sourceforge.net/p/c-icap/code/1103/#diff-2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/c-icap/c-icap.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index 674192bf1..fee9695c1 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -41,6 +41,13 @@ else
 C_ICAP_CONF_OPTS += --without-bzlib
 endif
 
+ifeq ($(BR2_PACKAGE_LIBMEMCACHED),y)
+C_ICAP_CONF_OPTS += --with-memcached
+C_ICAP_DEPENDENCIES += libmemcached
+else
+C_ICAP_CONF_OPTS += --without-memcached
+endif
+
 ifeq ($(BR2_PACKAGE_OPENLDAP),y)
 C_ICAP_CONF_OPTS += --with-ldap
 C_ICAP_DEPENDENCIES += openldap
-- 
2.11.0
