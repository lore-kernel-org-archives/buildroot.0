From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Oct 2011 11:56:42 -0300
Subject: [Buildroot] [PATCH 3/3] uClibc: update snapshot config to avoid
	stalling
Message-ID: <1318431402-2461-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/uClibc/uClibc-snapshot.config |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/toolchain/uClibc/uClibc-snapshot.config b/toolchain/uClibc/uClibc-snapshot.config
index bff7584..a3fe200 100644
--- a/toolchain/uClibc/uClibc-snapshot.config
+++ b/toolchain/uClibc/uClibc-snapshot.config
@@ -88,9 +88,12 @@ LDSO_LDD_SUPPORT=y
 # LDSO_CACHE_SUPPORT is not set
 LDSO_PRELOAD_ENV_SUPPORT=y
 # LDSO_PRELOAD_FILE_SUPPORT is not set
+# LDSO_STANDALONE_SUPPORT is not set
+# LDSO_PRELINK_SUPPORT is not set
 # UCLIBC_STATIC_LDCONFIG is not set
 LDSO_RUNPATH=y
 LDSO_SEARCH_INTERP_PATH=y
+# LDSO_NO_CLEANUP is not set
 UCLIBC_CTOR_DTOR=y
 # LDSO_GNU_HASH_SUPPORT is not set
 # HAS_NO_THREADS is not set
@@ -164,6 +167,7 @@ UCLIBC_USE_NETLINK=y
 # UCLIBC_HAS_BSD_RES_CLOSE is not set
 UCLIBC_HAS_COMPAT_RES_STATE=y
 # UCLIBC_HAS_EXTRA_COMPAT_RES_STATE is not set
+UCLIBC_HAS_RESOLVER_SUPPORT=y
 UCLIBC_HAS_LIBRESOLV_STUB=y
 UCLIBC_HAS_LIBNSL_STUB=y
 
-- 
1.7.3.4
