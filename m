From: Ciro Santilli <ciro.santilli@gmail.com>
Date: Thu, 3 May 2018 17:03:16 +0100
Subject: [Buildroot] [PATCH] ltp-testsuite: add --with-open-posix-testsuite
Message-ID: <CAFXrp_cbD89wmzAf44aNjHfQS+ixvMUqMmxFxeLjLbvGDr3FFA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The issues mentioned on the removed comments were resolved,
tested in QEMU x86_64 and aarch64.

Signed-off-by: Ciro Santilli <ciro.santilli@gmail.com>
---
This patch supposes that the removed comments imply that a default
--with-open-posix-testsuite
is desirable (and I confirm that it does not take unreasoble build
time or disk space),
and that there is no generic way to add autotools configs to packages:
https://stackoverflow.com/questions/44341188/how-to-pass-extra-custom-configure-autotools-options-to-a-buildroot-package

 package/ltp-testsuite/ltp-testsuite.mk | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk
b/package/ltp-testsuite/ltp-testsuite.mk
index c47f587836..4584ca45da 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -9,17 +9,8 @@ LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE =
https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
 LTP_TESTSUITE_LICENSE_FILES = COPYING
-
-# Do not enable Open POSIX testsuite as it doesn't cross-compile
-# properly: t0 program is built for the host machine. Notice that due
-# to a bug, --without-open-posix-testsuite actually enables the test
-# suite.
-# See https://github.com/linux-test-project/ltp/issues/143 (invalid
-# autoconf test) and
-# https://github.com/linux-test-project/ltp/issues/144 (Open POSIX
-# testsuite not cross-compiling).
 LTP_TESTSUITE_CONF_OPTS += \
- --with-realtime-testsuite
+ --with-realtime-testsuite --with-open-posix-testsuite

 ifeq ($(BR2_LINUX_KERNEL),y)
 LTP_TESTSUITE_DEPENDENCIES += linux
-- 
2.17.0
