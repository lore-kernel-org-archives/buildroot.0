From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 22:34:31 +0200
Subject: [Buildroot] [git commit] xenomai: update list of testsuite files
Message-ID: <20170420211016.F2BAC81E81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fb9a09d719270ff123d999ea183f6e7bd8f885f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Xenomai 3, the list of installed binaries/scripts of the testsuite is
different than before.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
