From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 3 May 2012 15:54:05 +0200
Subject: [Buildroot] [git commit] toolchain/uClibc: enable
	UCLIBC_SUPPORT_AI_ADDRCONFIG
Message-ID: <20120503135521.66CC196C56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3e061fc770275c018c809baa1d449142fc9d10e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable AI_ADDRCONFIG support in uClibc otherwise we don't get the
ifaddrs.h header installed and thus lack getifaddrs support.
Quite useful for samba for example so we can use interfaces=eth0 statements in
the configuration file rather than klunkier
interfaces=192.168.1.1/255.255.255.0 ones.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/uClibc-0.9.31.config   |    2 +-
 toolchain/uClibc/uClibc-0.9.32.config   |    2 +-
 toolchain/uClibc/uClibc-0.9.33.config   |    2 +-
 toolchain/uClibc/uClibc-snapshot.config |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/toolchain/uClibc/uClibc-0.9.31.config b/toolchain/uClibc/uClibc-0.9.31.config
index fd1ab98..2f363db 100644
--- a/toolchain/uClibc/uClibc-0.9.31.config
+++ b/toolchain/uClibc/uClibc-0.9.31.config
@@ -135,7 +135,7 @@ UCLIBC_HAS_IPV4=y
 # UCLIBC_HAS_FULL_RPC is not set
 # UCLIBC_HAS_REENTRANT_RPC is not set
 UCLIBC_USE_NETLINK=y
-# UCLIBC_SUPPORT_AI_ADDRCONFIG is not set
+UCLIBC_SUPPORT_AI_ADDRCONFIG=y
 # UCLIBC_HAS_BSD_RES_CLOSE is not set
 UCLIBC_HAS_COMPAT_RES_STATE=y
 # UCLIBC_HAS_EXTRA_COMPAT_RES_STATE is not set
diff --git a/toolchain/uClibc/uClibc-0.9.32.config b/toolchain/uClibc/uClibc-0.9.32.config
index 0782b6f..68efac9 100644
--- a/toolchain/uClibc/uClibc-0.9.32.config
+++ b/toolchain/uClibc/uClibc-0.9.32.config
@@ -160,7 +160,7 @@ UCLIBC_HAS_IPV4=y
 # UCLIBC_HAS_FULL_RPC is not set
 # UCLIBC_HAS_REENTRANT_RPC is not set
 UCLIBC_USE_NETLINK=y
-# UCLIBC_SUPPORT_AI_ADDRCONFIG is not set
+UCLIBC_SUPPORT_AI_ADDRCONFIG=y
 # UCLIBC_HAS_BSD_RES_CLOSE is not set
 UCLIBC_HAS_COMPAT_RES_STATE=y
 # UCLIBC_HAS_EXTRA_COMPAT_RES_STATE is not set
diff --git a/toolchain/uClibc/uClibc-0.9.33.config b/toolchain/uClibc/uClibc-0.9.33.config
index 4ce643a..eb39df6 100644
--- a/toolchain/uClibc/uClibc-0.9.33.config
+++ b/toolchain/uClibc/uClibc-0.9.33.config
@@ -168,7 +168,7 @@ UCLIBC_HAS_IPV4=y
 # UCLIBC_HAS_FULL_RPC is not set
 # UCLIBC_HAS_REENTRANT_RPC is not set
 UCLIBC_USE_NETLINK=y
-# UCLIBC_SUPPORT_AI_ADDRCONFIG is not set
+UCLIBC_SUPPORT_AI_ADDRCONFIG=y
 # UCLIBC_HAS_BSD_RES_CLOSE is not set
 UCLIBC_HAS_COMPAT_RES_STATE=y
 # UCLIBC_HAS_EXTRA_COMPAT_RES_STATE is not set
diff --git a/toolchain/uClibc/uClibc-snapshot.config b/toolchain/uClibc/uClibc-snapshot.config
index 4ce643a..eb39df6 100644
--- a/toolchain/uClibc/uClibc-snapshot.config
+++ b/toolchain/uClibc/uClibc-snapshot.config
@@ -168,7 +168,7 @@ UCLIBC_HAS_IPV4=y
 # UCLIBC_HAS_FULL_RPC is not set
 # UCLIBC_HAS_REENTRANT_RPC is not set
 UCLIBC_USE_NETLINK=y
-# UCLIBC_SUPPORT_AI_ADDRCONFIG is not set
+UCLIBC_SUPPORT_AI_ADDRCONFIG=y
 # UCLIBC_HAS_BSD_RES_CLOSE is not set
 UCLIBC_HAS_COMPAT_RES_STATE=y
 # UCLIBC_HAS_EXTRA_COMPAT_RES_STATE is not set
