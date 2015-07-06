From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 6 Jul 2015 10:02:04 +0200
Subject: [Buildroot] [PATCH 3/4] squid: bump to version 3.5.6
In-Reply-To: <1436169725-26108-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1436169725-26108-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1436169725-26108-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump to version 3.5.6
- Update hash file
- Change configure options according to release notes

Release notes:

  http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.6-RELEASENOTES.html

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/squid/squid.hash | 6 +++---
 package/squid/squid.mk   | 7 +++----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 64d2fac..d5738c7 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.5.tar.xz.asc
-md5	9a323a97753143ddd935aed58a0193ae	squid-3.5.5.tar.xz
-sha1	2c168e8b13251ed8050d9e780127c4de016dcb61	squid-3.5.5.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.6.tar.xz.asc
+md5  93e18bd257857e35bb634ddb8a348563  squid-3.5.6.tar.xz
+sha1  c5f3ab47e61a08fa6a8767d45befeffd7d26fd9f  squid-3.5.6.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index adc09e5..469fb1b 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).5
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).6
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
@@ -29,7 +29,7 @@ SQUID_CONF_OPTS = \
 	--enable-removal-policies="lru,heap" \
 	--with-filedescriptors=1024 \
 	--disable-ident-lookups \
-	--with-krb5-config=no \
+	--without-mit-krb5 \
 	--enable-auth-basic="fake getpwnam" \
 	--enable-auth-digest="file" \
 	--enable-auth-negotiate="wrapper" \
@@ -39,7 +39,6 @@ SQUID_CONF_OPTS = \
 	--with-logdir=/var/log/squid/ \
 	--with-pidfile=/var/run/squid.pid \
 	--with-swapdir=/var/cache/squid/ \
-	--enable-icap-client \
 	--with-default-user=squid
 
 # Atomics in Squid use __sync_add_and_fetch_8, i.e a 64 bits atomic
@@ -59,7 +58,7 @@ SQUID_CONF_ENV += ac_cv_search_shm_open="-lrt -lpthread"
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-SQUID_CONF_OPTS += --enable-ssl
+SQUID_CONF_OPTS += --with-openssl
 SQUID_DEPENDENCIES += openssl
 endif
 
-- 
2.3.6
