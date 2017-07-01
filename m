From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 10:01:59 +0200
Subject: [Buildroot] [git commit] squid: uClibc workaround no longer required
Message-ID: <20170701075908.64B2F80408@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7f878d2ae31230a013c2e2b10ce26338d240c5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As all librt and libpthread functions are integrated into
libc for a while, workaround no longer required.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
