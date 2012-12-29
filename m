From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 29 Dec 2012 14:23:56 +0100
Subject: [Buildroot] [git commit] nettle: fix missing link to libm
Message-ID: <20121229133117.BF1589A51C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7665bab422e79a252a4a45cfd696c34a19dabfdf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nettle-benchmark uses ldexp without explicitly linking to libm, fixes:
http://autobuild.buildroot.net/results/c8e64fabcb98b1ff4bf737e2181b7cf2ae731550

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...le-Added-lm-when-linking-nettle-benchmark.patch |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

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
