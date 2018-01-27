From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Jan 2018 11:17:48 +0100
Subject: [Buildroot] [git commit] ltp-testsuite: disable numa tests
Message-ID: <20180127101815.AA72780AEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c937807a3921c87c6463f9dbb7e225dd711fd45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The LTP_CHECK_SYSCALL_NUMA autoconf macro uses AC_RUN_IFELSE when it
detects the numaif.h header. This is incompatible with cross
compilation.

Fixes:
http://autobuild.buildroot.net/results/21a/21a6eeddbf5ccffc34c38527d0807305a5eb3917/
http://autobuild.buildroot.net/results/fc0/fc01921e8e8e1ea100461b29137c4219e6686c58/
http://autobuild.buildroot.net/results/962/96285d154abd65838ff5c66e96db309d9ac26c80/

Cc: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ltp-testsuite/ltp-testsuite.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 8785456..28dc247 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -56,7 +56,8 @@ LTP_TESTSUITE_CONF_ENV += \
 	CFLAGS="$(LTP_TESTSUITE_CFLAGS)" \
 	CPPFLAGS="$(LTP_TESTSUITE_CPPFLAGS)" \
 	LIBS="$(LTP_TESTSUITE_LIBS)" \
-	SYSROOT="$(STAGING_DIR)"
+	SYSROOT="$(STAGING_DIR)" \
+	have_numa_headers=no
 
 # Requires uClibc fts and bessel support, normally not enabled
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
