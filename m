Return-Path: <SRS0=xEd5=PS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF13C433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 23:00:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C40360E8B
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 23:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C40360E8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 418D360785;
	Sat, 30 Oct 2021 23:00:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id viVokXJe1_hc; Sat, 30 Oct 2021 23:00:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEA2860763;
	Sat, 30 Oct 2021 23:00:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 128F91BF5DF
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 23:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1195401FF
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 23:00:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1XOGHnRPGc8A for <buildroot@lists.busybox.net>;
 Sat, 30 Oct 2021 23:00:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44E69401EA
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 23:00:23 +0000 (UTC)
Received: from [192.168.153.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id gxKmmoPb1rIRlgxKmm6qfN; Sun, 31 Oct 2021 01:00:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1635634821; bh=yiK1PUclbcmpcqo76KG6lV0p8oOc55soC6s4RX5ZFu0=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=B8elwZ8JK1DYsPUKWUM8Bz/5EtISrFsIe7lgsQLdoY1yiyizqRfq/NYxG0pGTXo86
 D2qsUlmF+MQmBxuc2YE0NO/cACvV891Lk2MYDpkBzvEAv+yl8AyWtz14++JEpN6qmU
 m4Bo4fHCzX+0XaTVnm8Fp663ylT1o5b096PPVdORQRH8ACyNLw/lfWxEap3eljr/CP
 gBMBL4+cyUal/aZ3l1IXDS3+qPTB1pJhdWDtJsi+NCqIOoTTengmyB6vclyTvk7mwU
 B2aZMiOdyZxodNd6AF97zGIh4cdxeW5WU6ehxzJgkVukRN/oCU36DO3kTKCnlQ/6n2
 jGYJki8/kD2UQ==
To: buildroot@buildroot.org
References: <20211030192416.4012437-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <0f410564-4c79-feed-568c-c747cea4950e@benettiengineering.com>
Date: Sun, 31 Oct 2021 01:00:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211030192416.4012437-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfPYQ9rGZa6PgSCTkuBZOBLKkGfLwV+glPyHowyaQtccjooJDxQK6t7BNaYTuubLTBhnWilskvbJ5ibMvFz14DUU7A3VF7oXxBMDyntscHl7MnsPG19K+
 1s4T1NsrdXi1IUFF8kgxVJ6dYiVThEBFhVdXmcMkodbNAqWYSX1r6Asr9QQyqJyrcIBqfPXnBcqp+UuJ0hvIU8fjESudUDy+Np+96PI1dd6zOQJMtXGpUjF2
 2lRCxQKZ5UPHBxv4nMzWCA==
Subject: Re: [Buildroot] [PATCH 1/2] configs/amarula_vyasa_rk3288: u-boot
 2021.10 needs python3
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
Cc: Jagan Teki <jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Please drop this patch, I'm going to reword it and send the v2.

Sorry for the noise.

-- 
Giulio Benetti
Benetti Engineering sas

On 10/30/21 9:24 PM, Giulio Benetti wrote:
> When using pylibfdt on u-boot 2021.10 we need also to enable
> BR2_TARGET_UBOOT_NEEDS_PYTHON3. This fix CI failure:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729667
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   configs/amarula_vyasa_rk3288_defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
> index 916a639387..ff96019e1e 100644
> --- a/configs/amarula_vyasa_rk3288_defconfig
> +++ b/configs/amarula_vyasa_rk3288_defconfig
> @@ -13,6 +13,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="vyasa-rk3288"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>   BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>   BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
