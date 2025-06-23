Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83907C7115B
	for <buildroot@archiver.kernel.org>; Mon, 23 Jun 2025 12:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D99E407E3;
	Mon, 23 Jun 2025 12:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yT214DYcZxJc; Mon, 23 Jun 2025 12:35:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 748E540834
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 748E540834;
	Mon, 23 Jun 2025 12:35:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 711FB154
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 12:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C488407E3
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 12:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yZLspP6-Snlk for <buildroot@buildroot.org>;
 Mon, 23 Jun 2025 12:35:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.146;
 helo=smtpweb146.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 31B8140834
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31B8140834
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31B8140834
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 12:35:30 +0000 (UTC)
Received: from [172.25.4.128] ([212.103.203.10]) by Aruba SMTP with ESMTPSA
 id TgOVuNUSa2QPuTgOVuNv56; Mon, 23 Jun 2025 14:35:28 +0200
Message-ID: <fe2dfb0d-0642-42f8-a6c4-20792eb426bd@benettiengineering.com>
Date: Mon, 23 Jun 2025 14:35:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com, Andreas Ziegler <br015@umbiko.net>,
 "Yann E . MORIN" <yann.morin@orange.com>
References: <20250623115102.2284223-1-maxime.chevallier@bootlin.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20250623115102.2284223-1-maxime.chevallier@bootlin.com>
X-CMAE-Envelope: MS4xfExka7FVwWWUINCYFCE5NYmHW/Vu4HLb0iaBDtbIPhksm5gL7HnAaSfwj4PmsBYdKiSJhr6QU/LPjZ27bnCO9iFzdqJkm8SaAmZiyLAuZT1Fe9xe1U2k
 QBPNmKCbbpBhJMnKTR4NawI4VLc2zSu5/T2Glu1lXXsKcdvaD2DNNjzzdtzsbWLm9j1Eki+TgIEI2VM/x0hMCrK7h99scEGlBNwGlhe3kygC7gvanVZ9EL8i
 vg6BSX6+TjBph6aFDeNFSpVItq3kfLXqTD2T+Q7RHpav6DDUj1UoXK/7NJz0t34tYVVlo8wRg69EWy/idCMNzeRmxeQ9aq/wviRRxexkqlxDf8oi5LwpOmvD
 h+oUAddnA1YJQvN9udUAr3Cza7Nrvg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1750682128; bh=zpLEYhQy4SQveKoTVblaDzkDubRQlVwTBRMNBGMKjjU=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Tgkb4PIP+AkdBoQ0N3KdqIravLrMsD/C6ad4T7SxjhRrgFiiBuX32TC6nRV6M/PNA
 AwsJ7hWdXapqzVS2fMi4ZCq8SdqgNegSxEKJswanJ5f9UApcEBx+ZpZtB9ZBCe014F
 ifjG5mMZO3QSJTrNI4+YlIJwUvk+nhj0BXINRNsRs0voOMdipifO5VavlQjSM952L1
 95CH/6XdZQjulAWm1BwEZn06H2L2TFXlptD056I58Fa2MHUKQ+Lrp2TsoJY6UmD1uo
 VNt9reBmXQQusi7NF7pwwexX/1wNAISE4or5T1UcmCaOYvrp7M6pesc2OfBF1SEtb4
 2it8u/rjDkStw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Tgkb4PIP
Subject: Re: [Buildroot] [PATCH] package/linux-tools: rtla: Pass TARGET_LD
 to the make arguments
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Maxime,

On 6/23/25 13:51, Maxime Chevallier wrote:
> In Linux v6.8,  the rtla Makefile was rewritten :
> 
>    01474dc706ca ("tools/rtla: Use tools/build makefiles to build rtla")
> 
> The new Makefile uses default linker values, so the host linker being used to
> produce the final rtla binary.
> 
> This results in the following error :
> 
> ld: [...] trace.o: error adding symbols: file in wrong format
> 
> Add LD=$(TARGET_LD) to the RTLA_MAKE_OPTS to fix rtla cross-compilation.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> ---
>   package/linux-tools/linux-tool-rtla.mk.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/linux-tools/linux-tool-rtla.mk.in b/package/linux-tools/linux-tool-rtla.mk.in
> index 449371ddfe..d9bdcc3016 100644
> --- a/package/linux-tools/linux-tool-rtla.mk.in
> +++ b/package/linux-tools/linux-tool-rtla.mk.in
> @@ -9,6 +9,7 @@ LINUX_TOOLS += rtla
>   RTLA_DEPENDENCIES = host-pkgconf libtracefs
>   RTLA_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
>   	CC=$(TARGET_CC) \
> +	LD=$(TARGET_LD) \
>   	EXTRA_CFLAGS="-D_GNU_SOURCE" \
>   	LDFLAGS="$(TARGET_LDFLAGS)" \
>   	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
