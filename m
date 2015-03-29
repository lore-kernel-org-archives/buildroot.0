From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 29 Mar 2015 11:33:32 -0300
Subject: [Buildroot] [PATCH 2/2] squid: adjust style
In-Reply-To: <1427639612-25592-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427639612-25592-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427639612-25592-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/squid/squid.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index fc82392..ee30908 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -10,7 +10,7 @@ SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
 SQUID_LICENSE_FILES = COPYING
-# For squid-01-assume-get-certificate-ok.patch
+# For 0001-assume-get-certificate-ok.patch
 SQUID_AUTORECONF = YES
 SQUID_DEPENDENCIES = libcap host-libcap host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
@@ -45,19 +45,19 @@ SQUID_CONF_OPTS = \
 # Atomics support requires __sync_add_and_fetch_8 (64-bits)
 # That's only handled in gcc's libatomic for 32-bit arches
 ifeq ($(BR2_ARCH_HAS_ATOMICS)$(BR2_ARCH_IS_64),yy)
-	SQUID_CONF_ENV += squid_cv_gnu_atomics=yes
+SQUID_CONF_ENV += squid_cv_gnu_atomics=yes
 else
-	SQUID_CONF_ENV += squid_cv_gnu_atomics=no
+SQUID_CONF_ENV += squid_cv_gnu_atomics=no
 endif
 
 # On uClibc librt needs libpthread
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)$(BR2_TOOLCHAIN_USES_UCLIBC),yy)
-	SQUID_CONF_ENV += ac_cv_search_shm_open="-lrt -lpthread"
+SQUID_CONF_ENV += ac_cv_search_shm_open="-lrt -lpthread"
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	SQUID_CONF_OPTS += --enable-ssl
-	SQUID_DEPENDENCIES += openssl
+SQUID_CONF_OPTS += --enable-ssl
+SQUID_DEPENDENCIES += openssl
 endif
 
 define SQUID_CLEANUP_TARGET
-- 
2.0.5
