Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A6FC433FE
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 10:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2348640A9E;
	Tue, 18 Oct 2022 10:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2348640A9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 85D59c7myhq2; Tue, 18 Oct 2022 10:00:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 430CE408ED;
	Tue, 18 Oct 2022 10:00:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 430CE408ED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF65D1BF281
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 10:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAA2761002
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 10:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAA2761002
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZv528ih1IuW for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 10:00:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C720160FE0
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C720160FE0
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 10:00:13 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id g28so13595071pfk.8
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 03:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kfuq+QG0JR17nPvz9JIQihw0Ty5YtS8nk0EGEg1HfFU=;
 b=SjchkEZZF0/cYfn4pd/nsXBbAt9n6xZwVp9d0I62DSg9cmXxm3vUE8YB/oRSMziYl6
 O7wZ6ycRPaNjhznpcvxn2r5EsEDPZtkqrLEXhxt0G1lHWYvdBKkRoowVyP7s+q46cQsM
 k1QS82PDstNSUJA0QCyvTRGDXwNS+oceppkE3+Yc4Ib/gv86QDJNRj7SDP/zWhAMmqLO
 PpG5Y/sQU+GOL3P06dK9X07Xl4pwZ3nZ6IhzlS6xFfGQvOSOqq8eQyNDrE+BYJUsw1+y
 7XQ1AWxCHvWuDmH8mwKrD6/2+Thm4FcmWL6G92xhxg3rBS5AjJ+PQNB+VzvJeTDkv7bt
 g7+A==
X-Gm-Message-State: ACrzQf1/tVX27GKr5t5n1eEZrzjal+nrL0jKaE8BqSDaQsxHlX2oFVNF
 HEOmuTQDV6JdOtAaWKNevI07xl9n3uof26H7tWGp3mV0f4A=
X-Google-Smtp-Source: AMsMyM70kHe0bN34r70/gjEr2i1+0uLSSn+X5jLVtnGsDhxHBa49I36uwH6ubgEO7XX3VMbiOJ9DSeBBmeQwLR180qo=
X-Received: by 2002:a63:d551:0:b0:452:87e0:73d5 with SMTP id
 v17-20020a63d551000000b0045287e073d5mr1906443pgi.488.1666087211994; Tue, 18
 Oct 2022 03:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221018080653.1586970-1-heiko.thiery@gmail.com>
In-Reply-To: <20221018080653.1586970-1-heiko.thiery@gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 18 Oct 2022 11:59:59 +0200
Message-ID: <CAEyMn7apv=JQ+2Ot0dv-=hmhCA-eziCWudw=rMcR59fZfNu_qg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kfuq+QG0JR17nPvz9JIQihw0Ty5YtS8nk0EGEg1HfFU=;
 b=W6yOiftjEAcA603ZkCJVPrYlmgG8wdJbEOuWcfPSLJhKmWT7M7abGITy0ziS19x4XL
 OA4B4XxuS2vBC+WmvOJiisOQQPrqdUHxYGOVZ77cZ6dhS2kY6vfsvZ0PeOAHUdXWrUPe
 OtGT3XarZqo/LoDzcWP5DWtqhkNejO5SUrLoOguAoxntioFNxxOknpIMRAxSK9pPzBOX
 y9NsXuKza0D1xcjh15z7LzaaEIEjG0jHjjyx2yVTmazYFoarmTZV81NhPMPtwVkvB6Ej
 3OAMGqxCwWyOXm7y971zxWJeeHgSNLC+Mx58/ObSmUZ/1KuciZFythhmw8BhX3ZgAEWU
 1KfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=W6yOiftj
Subject: Re: [Buildroot] [PATCH 1/2] configs/kontron_smarc_sal28: use U-Boot
 2022.10
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
Cc: Michael Walle <michael@walle.cc>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Am Di., 18. Okt. 2022 um 10:07 Uhr schrieb Heiko Thiery
<heiko.thiery@gmail.com>:
>
> Add BR2_TARGET_UBOOT_NEEDS_GNUTLS=y and BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
> since this are dependencies for building mkeficapsule u-boot tool.


please ignore it and the one for the kernel update.. it does not fit
in the image. Damn (@michael ;-/)

-- 
Heiko


> Cc: Michael Walle <michael@walle.cc>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  configs/kontron_smarc_sal28_defconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/configs/kontron_smarc_sal28_defconfig b/configs/kontron_smarc_sal28_defconfig
> index 877903a1fe..25846c8cbd 100644
> --- a/configs/kontron_smarc_sal28_defconfig
> +++ b/configs/kontron_smarc_sal28_defconfig
> @@ -22,11 +22,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.01"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron_sl28"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>  BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
> +BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
>  # BR2_TARGET_UBOOT_FORMAT_BIN is not set
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.rom"
> --
> 2.30.2
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
