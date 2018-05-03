From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 21:53:43 +0200
Subject: [Buildroot] [git commit] ltp-testsuite: add
 --with-open-posix-testsuite
Message-ID: <20180503195407.27BF78B537@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45719594d08024df97db55333f8ab3ba2b4fc23e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The issues mentioned on the removed comments were resolved,
tested in QEMU x86_64 and aarch64.

Signed-off-by: Ciro Santilli <ciro.santilli@gmail.com>
Acked-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ltp-testsuite/ltp-testsuite.mk | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index c47f587836..f5ea4344ed 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -10,16 +10,8 @@ LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download
 LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
 LTP_TESTSUITE_LICENSE_FILES = COPYING
 
-# Do not enable Open POSIX testsuite as it doesn't cross-compile
-# properly: t0 program is built for the host machine. Notice that due
-# to a bug, --without-open-posix-testsuite actually enables the test
-# suite.
-# See https://github.com/linux-test-project/ltp/issues/143 (invalid
-# autoconf test) and
-# https://github.com/linux-test-project/ltp/issues/144 (Open POSIX
-# testsuite not cross-compiling).
 LTP_TESTSUITE_CONF_OPTS += \
-	--with-realtime-testsuite
+	--with-realtime-testsuite --with-open-posix-testsuite
 
 ifeq ($(BR2_LINUX_KERNEL),y)
 LTP_TESTSUITE_DEPENDENCIES += linux
