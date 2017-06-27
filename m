From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 27 Jun 2017 21:06:30 +0200
Subject: [Buildroot] [PATCH] squid: uClibc workaround no longer required
Message-ID: <20170627190629.GA1589@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As all librt and libpthread functions are integrated into
libc for a while, workaround no longer required.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/squid/squid.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 976ce6d..bcb3744 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -50,11 +50,6 @@ else
 SQUID_CONF_ENV += squid_cv_gnu_atomics=no
 endif
 
-# On uClibc librt needs libpthread
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)$(BR2_TOOLCHAIN_USES_UCLIBC),yy)
-SQUID_CONF_ENV += ac_cv_search_shm_open="-lrt -lpthread"
-endif
-
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SQUID_CONF_OPTS += --with-openssl
 SQUID_DEPENDENCIES += openssl
-- 
2.1.4
