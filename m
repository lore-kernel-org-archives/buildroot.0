Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43977E78482
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 19:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1F9D81D4D;
	Sun,  1 Oct 2023 19:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1F9D81D4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KjFcv8rZKGue; Sun,  1 Oct 2023 19:01:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1902281CDB;
	Sun,  1 Oct 2023 19:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1902281CDB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 528671BF5AA
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 19:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D75681CDB
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 19:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D75681CDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oNkyR-GtbszB for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 19:01:06 +0000 (UTC)
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C8BC81CA7
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 19:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C8BC81CA7
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id n1gcqxZcF8jsqn1gdq46ZM; Sun, 01 Oct 2023 21:01:03 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 21:01:01 +0200
Message-Id: <20231001190101.2640495-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGcMRtBw+Sq2ora9oE3lobqpTqfZDqFuNw+vuLv54wXSSws82bFDJCs85JoMkHyt4y28NcLV7Y1Hhd6n41925BKvOCrVJIOuh4wiuJnt/1BDAem5hPHP
 UBwsxYNB0ZiJCMfK8brB/xDwleu56VOPPAQ3XdSKAmB0LalNBzu85uOWBHvJIIg9B+wp/5eQwPZ/Si4/V5e7ajhe8q34E+mqOoRCXTrNGNB82QrhIf5cBANi
 LQTbImte86NKioT+s+tUu3Sqc4jUGsfvNk/6hSqJU0hM84eTEbMSvlaJeVg4RZrpqVWp6VUrBcYQ7bGGOzUS5A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1696186863; bh=IEU7KLv0XcOaq8R278801DMWISaowgYs3L5z4A4kscM=;
 h=From:To:Subject:Date:MIME-Version;
 b=TJl9YdY/7Kx89n9pyXmNJqGHhWVLk3PJUjKwkMfCyZCzw8TUlwLacZnWTgThit6R2
 qBapZ3PSnLDBMiejoKw+xXpex3RW5mi+MPxx/2nwutP5aZrCoOoKTR7EJ0S4IcfBI1
 JesXDhdRxza/+rl+uhtknobfDDqc2L4BBVcpy4zYqYakrEnKo3ZN2n/gFa4RLiPh0l
 LDYWjIahKHYXdvNE0oo9K1AJ5fFyFaAvtiCLQXLUKpkzZVbiHdVofeej8Q/O92oEUQ
 wnM9JRq4M34+zBGISPMxiOPKIURxi1+lS/OoSHGaCwmFL3Zg1l4V8TDdON0A+MOvxK
 6r1sACW9TzxEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=TJl9YdY/
Subject: [Buildroot] [PATCH v2] package/wilc-driver: fix build failure with
 Linux 6.3+
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kris Bahnsen <kris@embeddedTS.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add local patches pending upstream to fix build failure on Linux 6.3+

Fixes:
http://autobuild.buildroot.net/results/3b954399aa3ffab9609da1fc381f38f28bd8eb9f

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../wilc-driver/0006-Support-Linux-6.3.patch  | 43 +++++++++++++++++++
 .../wilc-driver/0007-Support-Linux-6.4.patch  | 36 ++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 package/wilc-driver/0006-Support-Linux-6.3.patch
 create mode 100644 package/wilc-driver/0007-Support-Linux-6.4.patch

diff --git a/package/wilc-driver/0006-Support-Linux-6.3.patch b/package/wilc-driver/0006-Support-Linux-6.3.patch
new file mode 100644
index 0000000000..f5a92027da
--- /dev/null
+++ b/package/wilc-driver/0006-Support-Linux-6.3.patch
@@ -0,0 +1,43 @@
+From 14b5eccf4145e7a5afc8bc65a15f26ac691f98d8 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 27 Sep 2023 10:54:18 +0200
+Subject: [PATCH] Support Linux 6.3
+
+With Linux 6.3 commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=40fc56ee608cdb20022c225ac6f1e4b7ba63f8f1
+function of_get_named_gpio_flags() has been dropped but it was only a
+wrapper to call of_get_named_gpio() if the flags passed was NULL and this
+is the case. So let's use of_get_named_gpio() in place of
+of_get_named_gpio_flags() since of_get_named_gpio() never changed
+after its adding in Linux version 3.1.
+
+Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/4
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ power.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/power.c b/power.c
+index 6c59e0b..6ab8d63 100644
+--- a/power.c
++++ b/power.c
+@@ -25,13 +25,11 @@ int wilc_of_parse_power_pins(struct wilc *wilc)
+ 	const struct wilc_power_gpios *gpios = &default_gpios[0];
+ 	int ret;
+ 
+-	power->gpios.reset = of_get_named_gpio_flags(of, "reset-gpios", 0,
+-						     NULL);
++	power->gpios.reset = of_get_named_gpio(of, "reset-gpios", 0);
+ 	if (!gpio_is_valid(power->gpios.reset))
+ 		power->gpios.reset = gpios->reset;
+ 
+-	power->gpios.chip_en = of_get_named_gpio_flags(of, "chip_en-gpios", 0,
+-						       NULL);
++	power->gpios.chip_en = of_get_named_gpio(of, "chip_en-gpios", 0);
+ 	if (!gpio_is_valid(power->gpios.chip_en))
+ 		power->gpios.chip_en = gpios->chip_en;
+ 
+-- 
+2.34.1
+
diff --git a/package/wilc-driver/0007-Support-Linux-6.4.patch b/package/wilc-driver/0007-Support-Linux-6.4.patch
new file mode 100644
index 0000000000..8339cc3cb6
--- /dev/null
+++ b/package/wilc-driver/0007-Support-Linux-6.4.patch
@@ -0,0 +1,36 @@
+From 94fc4594659494b8c5cbdf1a719aea4d66d3398d Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 27 Sep 2023 11:20:50 +0200
+Subject: [PATCH] Support Linux 6.4
+
+With Linux 6.4 commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1aaba11da9aa7d7d6b52a74d45b31cac118295a1
+class_create() doesn't require first argument THIS_MODULE anymore so let's
+drop first argument if Linux version >= 6.4
+
+Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/5
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bt.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/bt.c b/bt.c
+index 48a5302..a752457 100644
+--- a/bt.c
++++ b/bt.c
+@@ -135,7 +135,11 @@ static void wilc_bt_create_device(void)
+ 	ret = alloc_chrdev_region(&chc_dev_no, 0, 1, "atmel");
+ 	if (ret < 0)
+ 		return;
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 4, 0)
++	chc_dev_class = class_create("atmel");
++#else
+ 	chc_dev_class = class_create(THIS_MODULE, "atmel");
++#endif
+ 	if (IS_ERR(chc_dev_class)) {
+ 		unregister_chrdev_region(chc_dev_no, 1);
+ 		return;
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
