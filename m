From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 Jan 2013 23:18:03 +0100
Subject: [Buildroot] [git commit] nettle: bump to version 2.6
Message-ID: <20130128221831.4BC379A865@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4160ccf159750b7efa94c946939e3f3f2c5ff394
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...le-Added-lm-when-linking-nettle-benchmark.patch |   17 -----------------
 package/nettle/nettle.mk                           |    2 +-
 2 files changed, 1 insertions(+), 18 deletions(-)

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
