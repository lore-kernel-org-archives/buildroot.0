Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DF7E810B1
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 09:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E30CC41F8B;
	Wed, 27 Sep 2023 09:28:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E30CC41F8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Hkal29M67u1; Wed, 27 Sep 2023 09:28:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D31A0420A8;
	Wed, 27 Sep 2023 09:28:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D31A0420A8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 030031BF2A6
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 09:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD74660BE4
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 09:28:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD74660BE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EYMoc5HnuG11 for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 09:28:52 +0000 (UTC)
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A63C260BA2
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 09:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A63C260BA2
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id lQqeqhCS9nT8IlQqeqJrVn; Wed, 27 Sep 2023 11:28:48 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 11:28:47 +0200
Message-Id: <20230927092847.503224-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKD8EG843REzTKBdzXmRCW+Po+AdvwfqLjGp9TYUuPCpRskTdN4UgTkG3zfl06IdYg+BQNqnOmLqvOoI13HCRHLzQZM84/zy71ntdleVDYY6oJUIUYa7
 duWq9+MsQDvEapnG7TtRhdonvjp5IJr/xf+vHG18GW/f7b/B5mZfc2a7lDzyM2XfKlialPvng1mlsSpUmBr6qWcmL6ZKtHCjAXBmgEGbioWC5k+rHH8cj6iA
 tA5W7Fx8LZYoMHanHTecT6htr9u+WPWryh3Cw7Zs8CwKmtM3uUIMyJEcSYF3Vb7MdprPJg2SiSW5bpEYXu494Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1695806928; bh=SHzZQvAnZvAA/84U4FvoetCxVLZFxPGUvlmDKTx+zzo=;
 h=From:To:Subject:Date:MIME-Version;
 b=O1akVfuxvX3L5OQn8XZM/o9NC9KNQ76+BW4ULmq6cJ3r9206C0c0BKahrSbkaLRxt
 qWmbuFQgGAWMsYCNGrRBoux6BptSG+qysVJrh8ctLrtkWsjgUal4WAOOJA9VQ5IddP
 E/nRobchZxNJwmMNriurRrD/FaeWRBuWm3cQwMSR6bPP7qnCZuy6hQfDQiE/zG96a5
 M3Zo5F0QwNyWOJNC0PVOF+T8P903pM76UnZyNFwQrxonZxR/4O6jqd1+mpCwntE4Tc
 kfmxe0XcS0BWZf+YpZ9f0csj+4CSfqBPhAh8TtyVUY6O54No0h4GhBaXaBfk8yTok9
 tLQZ2JqIzkbVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=O1akVfux
Subject: [Buildroot] [PATCH] package/wilc-driver: fix build failure with
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
 .../wilc-driver/0006-Support-Linux-6.3.patch  | 48 +++++++++++++++++++
 .../wilc-driver/0007-Support-Linux-6.4.patch  | 36 ++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 package/wilc-driver/0006-Support-Linux-6.3.patch
 create mode 100644 package/wilc-driver/0007-Support-Linux-6.4.patch

diff --git a/package/wilc-driver/0006-Support-Linux-6.3.patch b/package/wilc-driver/0006-Support-Linux-6.3.patch
new file mode 100644
index 0000000000..58239b5dc9
--- /dev/null
+++ b/package/wilc-driver/0006-Support-Linux-6.3.patch
@@ -0,0 +1,48 @@
+From 1b6e5e4acfcca58094fb4bb6e2bfc0461c5b411d Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 27 Sep 2023 10:54:18 +0200
+Subject: [PATCH] Support Linux 6.3
+
+With Linux 6.3 commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=40fc56ee608cdb20022c225ac6f1e4b7ba63f8f1
+function of_get_named_gpio_flags() has been dropped but it was only a
+wrapper to call of_get_named_gpio() if the flags passed was NULL and this
+is the case. So let's use of_get_named_gpio() in place of
+of_get_named_gpio_flags() if Linux version >= 6.3
+
+Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/4
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ power.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/power.c b/power.c
+index 6c59e0b..c957c7b 100644
+--- a/power.c
++++ b/power.c
+@@ -25,13 +25,21 @@ int wilc_of_parse_power_pins(struct wilc *wilc)
+ 	const struct wilc_power_gpios *gpios = &default_gpios[0];
+ 	int ret;
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 3, 0)
++	power->gpios.reset = of_get_named_gpio(of, "reset-gpios", 0);
++#else
+ 	power->gpios.reset = of_get_named_gpio_flags(of, "reset-gpios", 0,
+ 						     NULL);
++#endif
+ 	if (!gpio_is_valid(power->gpios.reset))
+ 		power->gpios.reset = gpios->reset;
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 3, 0)
++	power->gpios.chip_en = of_get_named_gpio(of, "chip_en-gpios", 0);
++#else
+ 	power->gpios.chip_en = of_get_named_gpio_flags(of, "chip_en-gpios", 0,
+ 						       NULL);
++#endif
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
