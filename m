From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Jan 2013 08:17:01 -0300
Subject: [Buildroot] [PATCH 2/3] nettle: bump to version 2.6
In-Reply-To: <1358853422-24670-1-git-send-email-gustavo@zacarias.com.ar>
References: <1358853422-24670-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1358853422-24670-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../nettle-Added-lm-when-linking-nettle-benchmark.patch | 17 -----------------
 package/nettle/nettle.mk                                |  2 +-
 2 files changed, 1 insertion(+), 18 deletions(-)
 delete mode 100644 package/nettle/nettle-Added-lm-when-linking-nettle-benchmark.patch

diff --git a/package/nettle/nettle-Added-lm-when-linking-nettle-benchmark.patch b/package/nettle/nettle-Added-lm-when-linking-nettle-benchmark.patch
deleted file mode 100644
index ca4d639..0000000
--- a/package/nettle/nettle-Added-lm-when-linking-nettle-benchmark.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Added -lm when linking nettle-benchmark.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff --git a/examples/Makefile.in b/examples/Makefile.in
-index 909fdda..3becd08 100644
---- a/examples/Makefile.in
-+++ b/examples/Makefile.in
-@@ -11,7 +11,7 @@ PRE_CPPFLAGS = -I.. -I$(top_srcdir)
- PRE_LDFLAGS = -L..
- 
- OPENSSL_LIBFLAGS = @OPENSSL_LIBFLAGS@
--BENCH_LIBS = @BENCH_LIBS@
-+BENCH_LIBS = @BENCH_LIBS@ -lm
- 
- RSA_TARGETS = rsa-keygen$(EXEEXT) rsa-sign$(EXEEXT) \
- 	      rsa-verify$(EXEEXT) rsa-encrypt$(EXEEXT) rsa-decrypt$(EXEEXT)
diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index ae09ecc..5080fab 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -1,4 +1,4 @@
-NETTLE_VERSION = 2.5
+NETTLE_VERSION = 2.6
 NETTLE_SITE = http://www.lysator.liu.se/~nisse/archive
 NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
-- 
1.7.12.4
