Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F53C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 923F56FBDE;
	Tue, 21 Feb 2023 02:01:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 923F56FBDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IDoLX0UPYZjM; Tue, 21 Feb 2023 02:01:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4B7B70241;
	Tue, 21 Feb 2023 02:01:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4B7B70241
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A3511BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D746270042
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D746270042
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LGZoJDevSwDF for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 230FB70024
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 230FB70024
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 112D1828C8; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 22:42:21 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 295baf16a181b110eba09007f6ad7ac384914581
X-Git-Newrev: f16b97eab1859395ddd74f557d33ef8a1f2447d6
X-Patchwork-Hint: ignore
Message-Id: <20230220205301.112D1828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/davinci-bootcount:
 bump to version 2.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f16b97eab1859395ddd74f557d33ef8a1f2447d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- stm32mp1: support for STM32 TAMP_BKP21R bootcount register
- tab formatting
- gitignore: added autoscan files
- updated documentation
- i2c_eeprom: bootcount does not use two uint16s
- am33xx: declare registers as 'volatile'
- src/am33xx: do not close fd, it seems to prevent reliably writing register
- configure.ac: update version, homepage
- Added EEPROM read/write for non-TI AM335x platforms

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/davinci-bootcount/davinci-bootcount.hash | 2 +-
 package/davinci-bootcount/davinci-bootcount.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/davinci-bootcount/davinci-bootcount.hash b/package/davinci-bootcount/davinci-bootcount.hash
index ef4bca2b7d..53435b1d1d 100644
--- a/package/davinci-bootcount/davinci-bootcount.hash
+++ b/package/davinci-bootcount/davinci-bootcount.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  de7843cf1245a739b6d18d4db478893e50c2de0ee19bbce96dc323065d28c3e4  davinci-bootcount-0973689c7556a953d2b468e4d8d46758c6d467b4.tar.gz
+sha256  12b5aa83736efb2fefd22cd4d9f305a25c68dfaa10401d5efb17e55a5163934e  davinci-bootcount-2.0.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/davinci-bootcount/davinci-bootcount.mk b/package/davinci-bootcount/davinci-bootcount.mk
index 385d96d5a2..695d39688a 100644
--- a/package/davinci-bootcount/davinci-bootcount.mk
+++ b/package/davinci-bootcount/davinci-bootcount.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DAVINCI_BOOTCOUNT_VERSION = 0973689c7556a953d2b468e4d8d46758c6d467b4
-DAVINCI_BOOTCOUNT_SITE = $(call github,VoltServer,uboot-davinci-bootcount,$(DAVINCI_BOOTCOUNT_VERSION))
+DAVINCI_BOOTCOUNT_VERSION = 2.0.0
+DAVINCI_BOOTCOUNT_SITE = $(call github,VoltServer,uboot-davinci-bootcount,v$(DAVINCI_BOOTCOUNT_VERSION))
 DAVINCI_BOOTCOUNT_LICENSE = GPL-3.0
 DAVINCI_BOOTCOUNT_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
