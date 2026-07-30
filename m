Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBABEC55164
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 16:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C30A402B2;
	Thu, 30 Jul 2026 16:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pZOU8-my9YOC; Thu, 30 Jul 2026 16:26:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CFBA402F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785428764;
	bh=H9Idt0+eUf8tpJD9o8YojpEf4gqk5ziuw7+AXJrSUZ8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=K23wR9s48xEZHR0EwA3ylzPJL1bsUgr1Ic8/Yoy+f7JAwBR5BrJByAJOPXC4vLPNz
	 Yyo+ytbBfEKeKWEz6mHkRt9vXAX84oK2qnZwUTMR5Gc6h4mejiAPnXY0a8koV0Wulm
	 nf9VdGpdsLVkUgiqS0zL7NsKj3Qq76YIf+do7+K7VTWPyFTtxmg40GpQSGz2jhbWS+
	 uS2gmiAhe3gehKA4rqxwjztpKOAgYe4WxBh/SMKU8+ZohhOUOffQOEAdGMGbOA913m
	 vpqPPa4vMI1p+m7HRSIJ/+LpAaaX/BQYXrwQpxkBpWUVVhZfBm555wYfJnDsLIRKub
	 h/WTAc8GsV3wQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CFBA402F8;
	Thu, 30 Jul 2026 16:26:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 34BBB352
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 16:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2642880F30
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 16:26:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hsCdwYD7hVc5 for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 16:26:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1275C80ED5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1275C80ED5
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1275C80ED5
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 16:26:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7B1A6B977D96; Thu, 30 Jul 2026 18:25:53 +0200 (CEST)
Message-ID: <2424f6f7-89d4-4e65-ab69-370a1eee29e1@rnout.be>
Date: Thu, 30 Jul 2026 18:25:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Ernberg <john.ernberg@actia.se>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <3c4de0c8-dcd8-444d-ad65-a023e782a346@actia.se>
Content-Language: en-GB, fr-BE
In-Reply-To: <3c4de0c8-dcd8-444d-ad65-a023e782a346@actia.se>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1785428754; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=FZSU+OhUD5Cpc7Og1ikXQToNORmUqBmvip382m7gf5g=;
 b=UNaweHIWc64mg4qNktX+cSrkACiT+mAV7GFIv97Ux+qHDXBJ1Iejp/qm1SJ5hBDj3xFJFU
 jzGFQmF6f9gZE8F3qpgyeCMgo3aUZ5T3Cyg//D8bBS0ehXTByxhSlR1ytyXIzBJmnGU6nB
 PwlD18pHxZjE7x6hYIhc3rnncINd/+9/9KvK60eMhVt+tNx90cCxGadZMeXcwIyYBRbTLy
 OYHeVVyZ9pHojbsZJVYE2ONB/UOCySXhhl0iTkTAwkOBScQYuNYcjR82w9i7aiuqxKlWS7
 vtgFRa+zmA8SpQcN+dKPrDufkycTbL9hllmIOl7/Xo8hbFTDUeTIHjky1fKUbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=UNaweHIW
Subject: Re: [Buildroot] Correct approach for supporting multiple SoCs with
 otherwise same board?
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi John,


On 13/07/2026 10:17, John Ernberg via buildroot wrote:
> Hi,
> 
> We have a board with a few different iMX8X series SoCs,
> which we have worked around by having a custom imx-seco package that
> installs the different AHAB containers we need.
> 
> Now we're introducing a new SoC onto this board that is not compatible
> with the iMX8X. However, Linux and userspace will be the same for all
> boards as they need to be interchangeable with each other.
> 
> The only things we need to generate differently now is the bootloader
> and ATF.
> 
> The bootflow is bootloader -> ATF -> Linux
> 
> What is the correct way to handle this?
> Should we separate the firmwares + bootloader + ATF configs from
> the Linux + userspace build config?

  Assuming you don't want to try to generate a single userspace image for both 
boards, the best approach is to create a separate config for each board type. If 
you want to make it explicit that it's mostly the same, you can split that 
config into a "boot" part and a "userspace" part, where the same userspace part 
is used for both. You simply add a Makefile or other script (to your external, I 
presume) that concatenates them and then calls `make defconfig DEFCONFIG=...` 
pointing to the generated file.

  Note that there's also a script, support/kconfig/merge_config.sh. It checks 
for conflicting options, but it's far from foolproof. `cat` mostly works as well.

  The annoying part of a split config is that you can't easily change it with 
menuconfig followed by savedefconfig. After the savedefconfig, you have to 
extract the changed part. There is a script utils/diffconfig that can help, but 
it's probably best to manually apply the changes to the original split 
configurations.


> Separation feels odd though as that means we need to let the
> post-image.sh script we have for producing boot images (ATF + Linux +
> DTBs)  wander into other build directories.
  OK, this does sound like the idea is to reuse the same userspace image for 
both. For me, it doesn't sound weird at all to look for images in other build 
directories. For example, I typically have a separate config for generating a 
custom toolchain that can be built as an external toolchain. I put all the build 
directories in a fixed place under the external, so I can refer to the external 
toolchain as $(BR2_EXTERNAL_..._PATH)/output/host/bin/gcc.

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
