From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 22:37:01 +0200
Subject: [Buildroot] [git commit] squid: adjust style
Message-ID: <20150330203707.D62577FB72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=37e2e3d318b7bb400c153cf54225c55d861879d5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squid/squid.mk |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index fdf540e..f4d6ae3 100644
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
@@ -48,19 +48,19 @@ SQUID_CONF_OPTS = \
 # architectures, it would be provided by libatomic, but Buildroot
 # typically doesn't provide it.
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
