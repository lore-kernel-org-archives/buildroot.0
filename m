From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 20 Jan 2019 20:43:45 +0200
Subject: [Buildroot] [PATCH] rtc-tools: rtc-sync needs threads support
Message-ID: <8cd4bc1e90b3a5b0d4cf44a60f09168c4cf4d6a7.1548009825.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/573/57350271eff9284a8b07ceef02a9960f3568a0a3/
http://autobuild.buildroot.net/results/b6c/b6cf05deab77c7a84c721c95d9d618b1ddc2957e/
http://autobuild.buildroot.net/results/187/1877cfbbe37ef15c16cec5d6ad6e3d4d60bc3cbc/

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/rtc-tools/rtc-tools.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/rtc-tools/rtc-tools.mk b/package/rtc-tools/rtc-tools.mk
index fa187a84c273..2ef850a81f60 100644
--- a/package/rtc-tools/rtc-tools.mk
+++ b/package/rtc-tools/rtc-tools.mk
@@ -9,7 +9,11 @@ RTC_TOOLS_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tool
 RTC_TOOLS_LICENSE = GPL-2.0
 RTC_TOOLS_LICENSE_FILES = COPYING
 
-RTC_TOOLS_BINARIES = rtc rtc-sync rtc-range
+RTC_TOOLS_BINARIES = rtc rtc-range
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+RTC_TOOLS_BINARIES += rtc-sync
+endif
 
 define RTC_TOOLS_BUILD_CMDS
 	$(foreach bin,$(RTC_TOOLS_BINARIES),\
-- 
2.20.1
