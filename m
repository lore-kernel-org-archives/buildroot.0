Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B3DCF9C71
	for <buildroot@archiver.kernel.org>; Mon, 23 Sep 2024 18:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82DA740C4F;
	Mon, 23 Sep 2024 18:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5oAt51-H6FP; Mon, 23 Sep 2024 18:51:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 400C240C57
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 400C240C57;
	Mon, 23 Sep 2024 18:51:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B9311BF41A
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 18:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A79460890
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 18:51:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w54q60emoez8 for <buildroot@lists.busybox.net>;
 Mon, 23 Sep 2024 18:51:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 33932606FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33932606FD
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33932606FD
 for <buildroot@buildroot.org>; Mon, 23 Sep 2024 18:51:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 361FC60129;
 Mon, 23 Sep 2024 20:51:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 23 Sep 2024 20:51:15 +0200
Date: Mon, 23 Sep 2024 20:51:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Parthiban Nallathambi <parthiban@linumiz.com>
Message-ID: <ZvG4oyq23JORDojj@landeda>
References: <20240914125406.3026002-1-parthiban@linumiz.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240914125406.3026002-1-parthiban@linumiz.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727117479;
 bh=jcdVmy4qOoqCTb/LQlUfV4tC2rAFMOAuVi/7lQlADHM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i0tgjEn8XqikAeKqQpIhlrdlzymu2Mdy0gClk9uopzzIKR0zxKbWfp8qWaU5JtXNl
 +o68hxOuUHRUQUg2vdcajuYkmg1AX4OVqOLUCin5ZasBng72ExrD+KQiqx0kPZBhba
 AdYpsfkyBIz+FMw4NjKtxaR5KBTktkpiQqHIsIy/SXDJqtHmsrtlX+wynh1Dv16mcN
 DTZ3s3KR3TNRerWan11kJp4bk7ycYtiPTigf03eDrGt4Qg8AozIwMIssu2tdL+nmaY
 /O3r+Wzu0f5MUw677+/AMWiO0KZ8j/zRMbHUtBFFXf37HIq54ZxS46SdKOkUOUseOZ
 ZAEhFU9pNpoVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=i0tgjEn8
Subject: Re: [Buildroot] [PATCH] bluez5_utils: disable asha profile
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
Cc: marcin@bis.org.pl, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Parthiban, Marcin, All,

On 2024-09-14 18:24 +0530, Parthiban Nallathambi spake thusly:
> asha profile as it depends on audio profile which isn't selected
> by default (BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO), results in
> below linking failure.
> 
> ld: profiles/audio/bluetoothd-asha.o: in function `get_transport':
> asha.c:(.text.get_transport+0x2c): undefined reference to `media_transport_get_path'

We still get a lot of similar failures:

https://autobuild.buildroot.org/results/730/730310de50273c503eca42e03c7ff263a3cc12b5/build-end.log
https://autobuild.buildroot.org/results/6f3/6f3a1dbd722286ae6a9e826ea21e9ca57d258ff3/build-end.log

Could you have a look, please?

Regards,
Yann E. MORIN.

> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  package/bluez5_utils/bluez5_utils.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
> index b1caef5cc5..59eb68de61 100644
> --- a/package/bluez5_utils/bluez5_utils.mk
> +++ b/package/bluez5_utils/bluez5_utils.mk
> @@ -28,6 +28,7 @@ BLUEZ5_UTILS_CONF_OPTS = \
>  	--disable-lsan \
>  	--disable-ubsan \
>  	--disable-pie \
> +	--disable-asha \
>  	--with-dbusconfdir=/etc
>  
>  ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_OBEX),y)
> -- 
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
