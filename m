Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8BBCD342A
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 07:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10CEB40155;
	Tue,  3 Sep 2024 07:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FNq_MZfDfr1n; Tue,  3 Sep 2024 07:51:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B232740145
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B232740145;
	Tue,  3 Sep 2024 07:51:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F4841BF414
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 07:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 290EB80EB7
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 07:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HvNDemdY3I3Q for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 07:51:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BFB3080EA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFB3080EA0
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BFB3080EA0
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 07:51:44 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 7BF24440DA8;
 Tue,  3 Sep 2024 10:49:39 +0300 (IDT)
To: Lars Wikman <lars@underjord.io>
In-Reply-To: <20240903073929.3717568-1-lars@underjord.io> (Lars Wikman's
 message of "Tue, 3 Sep 2024 09:39:29 +0200")
References: <20240903073929.3717568-1-lars@underjord.io>
Date: Tue, 03 Sep 2024 10:51:40 +0300
Message-ID: <871q21i38z.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1725349779;
 bh=SSrWbO9qhrNWowf5jV0Vl76tgm0vHZZ8id3GN6VgS7M=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Zm80BPE5ZNsVgLfMO209mJrXdbyPHXk3pHRqOfLgxT2mkpvr0h7OP3yeJ0zeZy0Zo
 iutgocrGHBGFpYzktSk0RvQVE2XxLgbEUPbVlHsjdsghfByOouRG9h6bAWt9vD/YPK
 ReD0fkcvA4aa0Y2ZBW/M3pZsyo6kHjy4uYFQSyriwmFslICjZeJIw60Hl3/889D18H
 eE4fycAwbCEFf/UcHeklkDSOJr061nJKO2U+0Axf3BbMWG61WEZwHwUzrlm5dpbuJ9
 EHY799pjHz7JZ0Q0uJHfnN/sbZDTZT9TDYkzxPQ3Vs3GbkDQiRgwbKkAj383xMvGnu
 m9a0QP/EpsbBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=Zm80BPE5
Subject: Re: [Buildroot] [PATCH v2] package/wpa_supplicant: add Smart card
 option
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Lars,

On Tue, Sep 03 2024, Lars Wikman wrote:
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index 984959f679..a7b7800c99 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -24,8 +24,11 @@ WPA_SUPPLICANT_CONFIG_ENABLE = \
>  	CONFIG_INTERNAL_LIBTOMMATH \
>  	CONFIG_MATCH_IFACE
>  
> -WPA_SUPPLICANT_CONFIG_DISABLE = \
> -	CONFIG_SMARTCARD
> +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_SMARTCARD),y)
> +WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_SMARTCARD
> +else
> +WPA_SUPPLICANT_CONFIG_DISABLE = CONFIG_SMARTCARD

Should be += here. Otherwise WPA_SUPPLICANT_CONFIG_DISABLE is
overwritten.

baruch

> +endif
>  
>  # libnl-3 needs -lm (for rint) and -lpthread if linking statically
>  # And library order matters hence stick -lnl-3 first since it's appended

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
