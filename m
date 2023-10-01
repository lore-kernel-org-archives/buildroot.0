Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8196EE78482
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 19:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CE3481EFE;
	Sun,  1 Oct 2023 19:07:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CE3481EFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lhd3VF7OBnXz; Sun,  1 Oct 2023 19:07:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27E5781E74;
	Sun,  1 Oct 2023 19:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27E5781E74
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B1DD1BF588
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 19:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EFA260C15
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 19:07:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EFA260C15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XU_5gx24Nb-D for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 19:06:59 +0000 (UTC)
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A688560BEB
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 19:06:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A688560BEB
Received: from [192.168.50.162] ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id n1mKqxcTs8jsqn1mKq47hW; Sun, 01 Oct 2023 21:06:56 +0200
Message-ID: <cbec2537-52d8-4396-8503-06d584abf8ac@benettiengineering.com>
Date: Sun, 1 Oct 2023 21:06:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20231001190101.2640495-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20231001190101.2640495-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfBC+R3Jo+YvBUI1MIXP7GVlNyUKoxPEYHxMX1J5rwB0RFlM7PzQhHMp5PGc4I5kfxtbismbfFBUrp296XQ0D6vlNJMKo3sBqpyQN9QdSGxEEzyxz70HY
 u49jYHk6gGj8/ThfLt1c8o1ixwHiYTF2UArXqs4Tr/7NIPcDqHaP66AvkBbPzfEpWbjWrxuc3N6Ald9mbyzrhAivhXTAXYWXwn0QHBJHPraeAdy73Pri6mih
 NkQ3AmQn+tuTJsIzkVEkSA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1696187216; bh=nn2Q1XYfBEM41UQBjo218yGridrmXvLCROYsQegEq5M=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=XaNDT4pwtD92x0KZfenUIS0bkutYNgcp2GEZ9WBKIJVCmQEb77tuLurQolkwOWFjV
 C3NJ3UtNSiLCMG7RYh6PcVA3vzmcwqDKP64Fa72rkwkiZpZx0V72BqlBjnSOaQPmsq
 BcufiqFswbGRGMipB6HuQbxUt51jc8qCpAoI9MuJ6hFQGvSl957asRna5iw50idTXB
 8B07MaAJkVs39rZH+AxO6Y+yv+labsQZN0PiiGj0/TNHXvdxvHWYFQHeoSMrfZGOll
 ESCH7GzlyNg+WsFO3EniYr9rIdrbZp23YszgMW3hlh6IgvERgpd0ETQSzDsvFLBBQI
 TcpRpArbOQKaA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=XaNDT4pw
Subject: Re: [Buildroot] [PATCH v2] package/wilc-driver: fix build failure
 with Linux 6.3+
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
Cc: Kris Bahnsen <kris@embeddedTS.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 01/10/23 21:01, Giulio Benetti wrote:
> Add local patches pending upstream to fix build failure on Linux 6.3+
> 
> Fixes:
> http://autobuild.buildroot.net/results/3b954399aa3ffab9609da1fc381f38f28bd8eb9f
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

---
V1->V2:
* update Linux 6.3 gpio patch as suggested by Peter

> ---
>   .../wilc-driver/0006-Support-Linux-6.3.patch  | 43 +++++++++++++++++++
>   .../wilc-driver/0007-Support-Linux-6.4.patch  | 36 ++++++++++++++++
>   2 files changed, 79 insertions(+)
>   create mode 100644 package/wilc-driver/0006-Support-Linux-6.3.patch
>   create mode 100644 package/wilc-driver/0007-Support-Linux-6.4.patch
> 
> diff --git a/package/wilc-driver/0006-Support-Linux-6.3.patch b/package/wilc-driver/0006-Support-Linux-6.3.patch
> new file mode 100644
> index 0000000000..f5a92027da
> --- /dev/null
> +++ b/package/wilc-driver/0006-Support-Linux-6.3.patch
> @@ -0,0 +1,43 @@
> +From 14b5eccf4145e7a5afc8bc65a15f26ac691f98d8 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Wed, 27 Sep 2023 10:54:18 +0200
> +Subject: [PATCH] Support Linux 6.3
> +
> +With Linux 6.3 commit:
> +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=40fc56ee608cdb20022c225ac6f1e4b7ba63f8f1
> +function of_get_named_gpio_flags() has been dropped but it was only a
> +wrapper to call of_get_named_gpio() if the flags passed was NULL and this
> +is the case. So let's use of_get_named_gpio() in place of
> +of_get_named_gpio_flags() since of_get_named_gpio() never changed
> +after its adding in Linux version 3.1.
> +
> +Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/4
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + power.c | 6 ++----
> + 1 file changed, 2 insertions(+), 4 deletions(-)
> +
> +diff --git a/power.c b/power.c
> +index 6c59e0b..6ab8d63 100644
> +--- a/power.c
> ++++ b/power.c
> +@@ -25,13 +25,11 @@ int wilc_of_parse_power_pins(struct wilc *wilc)
> + 	const struct wilc_power_gpios *gpios = &default_gpios[0];
> + 	int ret;
> +
> +-	power->gpios.reset = of_get_named_gpio_flags(of, "reset-gpios", 0,
> +-						     NULL);
> ++	power->gpios.reset = of_get_named_gpio(of, "reset-gpios", 0);
> + 	if (!gpio_is_valid(power->gpios.reset))
> + 		power->gpios.reset = gpios->reset;
> +
> +-	power->gpios.chip_en = of_get_named_gpio_flags(of, "chip_en-gpios", 0,
> +-						       NULL);
> ++	power->gpios.chip_en = of_get_named_gpio(of, "chip_en-gpios", 0);
> + 	if (!gpio_is_valid(power->gpios.chip_en))
> + 		power->gpios.chip_en = gpios->chip_en;
> +
> +--
> +2.34.1
> +
> diff --git a/package/wilc-driver/0007-Support-Linux-6.4.patch b/package/wilc-driver/0007-Support-Linux-6.4.patch
> new file mode 100644
> index 0000000000..8339cc3cb6
> --- /dev/null
> +++ b/package/wilc-driver/0007-Support-Linux-6.4.patch
> @@ -0,0 +1,36 @@
> +From 94fc4594659494b8c5cbdf1a719aea4d66d3398d Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Wed, 27 Sep 2023 11:20:50 +0200
> +Subject: [PATCH] Support Linux 6.4
> +
> +With Linux 6.4 commit:
> +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1aaba11da9aa7d7d6b52a74d45b31cac118295a1
> +class_create() doesn't require first argument THIS_MODULE anymore so let's
> +drop first argument if Linux version >= 6.4
> +
> +Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/5
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + bt.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/bt.c b/bt.c
> +index 48a5302..a752457 100644
> +--- a/bt.c
> ++++ b/bt.c
> +@@ -135,7 +135,11 @@ static void wilc_bt_create_device(void)
> + 	ret = alloc_chrdev_region(&chc_dev_no, 0, 1, "atmel");
> + 	if (ret < 0)
> + 		return;
> ++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 4, 0)
> ++	chc_dev_class = class_create("atmel");
> ++#else
> + 	chc_dev_class = class_create(THIS_MODULE, "atmel");
> ++#endif
> + 	if (IS_ERR(chc_dev_class)) {
> + 		unregister_chrdev_region(chc_dev_no, 1);
> + 		return;
> +--
> +2.34.1
> +

-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
