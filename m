Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0451F606D80C
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Bg+0PfB9
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6D7E81206;
	Wed,  4 Nov 2026 21:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GuHcmCNESv6U; Wed,  4 Nov 2026 21:54:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7C2C8811DD
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793829284;
	b=oz7c/5pD1j0FGH03wjREfE95psn4NkWI6uslfYeauOeNrEEO4EkLBqYcBLwc1lzHTGQT
	 RUz5dV8/opYxIMtdA7fRek79AWhuRSv5XEhmYtvdFl1IkX5oHDoCq8Z+XkVsp7+GghMbv
	 s6+M+8bvJdMXf/x+go4KwaFNFutdOftgIQnsSc1Hnk2SE3uaCdtJZJu7YVZK7PK1SWOYa
	 SwQxVFI4PEZkB4DnGKZZeiTZrYk64ALUdNKhAjpeNorlhBMG+EcBtxfgAA3aXPNiq/3ns
	 c36ejg/NVKAbZkI5jJBi1U8t2BVYIJSUj5B1Ezp1Zdd/+gM2jIZ0Jdto4Hbl/zfYWhQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793829284;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=gqyNMif9ihOGCwPWnQAFxB7NLK91xLDSyrTEojXuETI=;
	b=GMgUGh7wqb0VPfErF1sbhCO3edfxPMmgTRPx8X3iXZAi2iQg47RA6Xsj7ScEDdzeWu4g
	 7Zg6Uwt3HqZ2CkrT0mt3fvtY5TPTLvhzdjvFuMBhM3nwH7lIrIJIi/V5ii/5VlC2IU/Gv
	 MbCXS7jfYw4FddohiZ4Oukx6bsLRDMOjSVgxrJKMFKE9stlieMu58pQpq0KYIx2CBbG0m
	 hIciW6NEpxUaEcvH4JL+ej2ApPnjTOladIDbcQaZXywddiWpj/glFfh/48Pawi0NcQQxv
	 0oRBnlqNvsowQNLxNXytJ1HxuU81zXEk7OzPlfqW/bhiADI+qR0BD8VBAGTsV3CLifQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793829284;
	bh=gqyNMif9ihOGCwPWnQAFxB7NLK91xLDSyrTEojXuETI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Bg+0PfB9jBKOKgm1kFIuFi6BL0wsvHVBuH7jJP3zLe1gWDcm8LKJvb0izbM4NVaHz
	 46/5CYL53uQZiQcE12CE0FZTjb/KlS8qIat8Egd3oiFN+2vkAjYwBg5dsdtmXVAib5
	 TZQd6gDZWTYMZQsSEwOz+GcEFIvzyNRstCqkOqEXYn2cz9ybemQIgqVrLIwPZUEVqI
	 TU7q63inuLQw/rMFvJxnCgmWq0rQMPDWXDpTsRvhowXHsyD3LKiYPjjpolAfv3EBPP
	 o8jU3ZVcGyenq5v6a/ycTeLEO23z7RhIqZUyWCei+KgB3maNTKz7ngd1NWRk+HA3zj
	 gENYpfAGPws0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C2C8811DD;
	Wed,  4 Nov 2026 21:54:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E405B6C
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2441C607BE
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sfb56UHQ2G_b for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:54:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 301726074A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 301726074A
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:54:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B85D51A06D3;
 Wed,  4 Nov 2026 21:54:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7B7585FD65;
 Wed,  4 Nov 2026 21:54:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A606510328E67; Wed,  4 Nov 2026 22:54:38 +0100 (CET)
Date: Wed, 4 Nov 2026 22:54:38 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
Message-ID: <auupaGsvjx-bAkAK@windsurf>
References: <20261102143754.18923-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261102143754.18923-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/esp-hosted: fix build failure with
 Linux >= 7.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 03:37:54PM +0100, Giulio Benetti wrote:
> Espressif moved esp-hosted NG driver to a separate repository so let's
> point ESP_HOSTED_SITE accordingly(esp-hosted-linux) taking into account
> the slight difference of folder structure.
> Let's also bump to latest version 2026-11-01 and drop local patch that has
> been applied to master branch.
> So let's add local patch pending upstream to fix build failure with Linux
> 7.3.0.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thanks, applied after doing one small fix, see below.

> diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
> index b478d412f4..8b8347ebf4 100644
> --- a/package/esp-hosted/esp-hosted.hash
> +++ b/package/esp-hosted/esp-hosted.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  b8baa6d1c8576f5453e382333bc4aafef1293b4705f073dff5b08d900d10d68c  ng-v1.0.6.tar.gz
> +sha256  02abcfea2bf8e040d7fb6af19de155d19cf0a7f698dc069639ec0ab5f2dedf4b  ng-v54d53676e36850e53d82ee779b6d65dff8e65967.tar.gz
>  sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  esp_hosted_ng/host/LICENSE

You had forgotten to update the hash file for the license file, in
relation to...

>  ESP_HOSTED_LICENSE = GPL-2.0
> -ESP_HOSTED_LICENSE_FILES = esp_hosted_ng/host/LICENSE
> -ESP_HOSTED_MODULE_SUBDIRS = esp_hosted_ng/host
> +ESP_HOSTED_LICENSE_FILES = host/LICENSE

...this change.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
