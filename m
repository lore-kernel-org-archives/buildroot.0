From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 20 Jan 2019 20:58:53 +0100
Subject: [Buildroot] [git commit] rtc-tools: rtc-sync needs threads support
Message-ID: <20190120195832.28D4786D62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c4d8c078320d8d7eaa3d028b172b4546c9bba0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/573/57350271eff9284a8b07ceef02a9960f3568a0a3/
http://autobuild.buildroot.net/results/b6c/b6cf05deab77c7a84c721c95d9d618b1ddc2957e/
http://autobuild.buildroot.net/results/187/1877cfbbe37ef15c16cec5d6ad6e3d4d60bc3cbc/

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtc-tools/rtc-tools.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/rtc-tools/rtc-tools.mk b/package/rtc-tools/rtc-tools.mk
index fa187a84c2..2ef850a81f 100644
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
