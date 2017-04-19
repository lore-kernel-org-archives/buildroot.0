From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 19 Apr 2017 22:00:04 +0200
Subject: [Buildroot] [PATCH 6/9] xenomai: update list of testsuite files
In-Reply-To: <20170419200007.12590-1-patrickdepinguin@gmail.com>
References: <20170419200007.12590-1-patrickdepinguin@gmail.com>
Message-ID: <20170419200007.12590-7-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Since Xenomai 3, the list of installed binaries/scripts of the testsuite is
different than before.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/xenomai/xenomai.mk | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index a9cb296..30bdcdb 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -56,13 +56,11 @@ XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_DEVFILES
 ifeq ($(BR2_PACKAGE_XENOMAI_TESTSUITE),)
 define XENOMAI_REMOVE_TESTSUITE
 	rm -rf $(TARGET_DIR)/usr/share/xenomai/
-	for i in klatency rtdm xeno xeno-load check-vdso \
-		irqloop cond-torture-posix switchtest arith \
-		sigtest clocktest cyclictest latency wakeup-time \
-		xeno-test cond-torture-native mutex-torture-posix \
-		mutex-torture-native ; do \
+	for i in clocktest gpiotest latency spitest switchtest \
+		xeno-test-run-wrapper dohell xeno-test-run xeno-test ; do \
 		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
 	done
+	rm -rf $(TARGET_DIR)/usr/demo/
 endef
 
 XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_TESTSUITE
-- 
2.10.2
