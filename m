From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 29 Dec 2012 08:52:35 -0300
Subject: [Buildroot] [PATCH 1/2] nettle: fix missing link to libm
Message-ID: <1356781956-19977-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nettle-benchmark uses ldexp without explicitly linking to libm, fixes:
http://autobuild.buildroot.net/results/c8e64fabcb98b1ff4bf737e2181b7cf2ae731550

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...le-Added-lm-when-linking-nettle-benchmark.patch |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 package/nettle/nettle-Added-lm-when-linking-nettle-benchmark.patch

diff --git a/package/nettle/nettle-Added-lm-when-linking-nettle-benchmark.patch b/package/nettle/nettle-Added-lm-when-linking-nettle-benchmark.patch
new file mode 100644
index 0000000..ca4d639
--- /dev/null
+++ b/package/nettle/nettle-Added-lm-when-linking-nettle-benchmark.patch
@@ -0,0 +1,17 @@
+Added -lm when linking nettle-benchmark.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff --git a/examples/Makefile.in b/examples/Makefile.in
+index 909fdda..3becd08 100644
+--- a/examples/Makefile.in
++++ b/examples/Makefile.in
+@@ -11,7 +11,7 @@ PRE_CPPFLAGS = -I.. -I$(top_srcdir)
+ PRE_LDFLAGS = -L..
+ 
+ OPENSSL_LIBFLAGS = @OPENSSL_LIBFLAGS@
+-BENCH_LIBS = @BENCH_LIBS@
++BENCH_LIBS = @BENCH_LIBS@ -lm
+ 
+ RSA_TARGETS = rsa-keygen$(EXEEXT) rsa-sign$(EXEEXT) \
+ 	      rsa-verify$(EXEEXT) rsa-encrypt$(EXEEXT) rsa-decrypt$(EXEEXT)
-- 
1.7.8.6
