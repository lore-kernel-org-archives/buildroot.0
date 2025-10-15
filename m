Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C6FCCD193
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 23:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFECE84429;
	Wed, 15 Oct 2025 23:06:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zSFww6Plf4uF; Wed, 15 Oct 2025 23:06:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 070278442C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 070278442C;
	Wed, 15 Oct 2025 23:06:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 75F3F968
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 23:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B9E08442D
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 23:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Duvjg8p0ML6V for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 23:06:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5AE1784429
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AE1784429
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AE1784429
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 23:06:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6A8BEB978DE7; Wed, 15 Oct 2025 21:50:23 +0200 (CEST)
Message-ID: <81b9aa9b-4904-4296-96a8-81de83f8575c@rnout.be>
Date: Wed, 15 Oct 2025 21:50:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Pierre FICHEUX <pierre.ficheux@smile.fr>, buildroot@buildroot.org
References: <CAFc1U0tQYsSWe1=EtduNZogzNTtJHGr4eX3pjnYro5zJeArniA@mail.gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <CAFc1U0tQYsSWe1=EtduNZogzNTtJHGr4eX3pjnYro5zJeArniA@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1760557823; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=2A4LhvAUhvaD1Lzp94YpJ/gb2ojQ2ctheRqgquqK5h0=;
 b=MosdJlUFe416lnDovBrQzpCG4ZeaOKP6035XZ/i2rWraL5E5rkm2WoI6dAkvn1IgEbzUGU
 Cr8JprluKU0jOdv+gDYFEDeHLt5xMTYaerltRUqBjaXVYZvyUtuf/h1kYbz0eOTZ2zM6WQ
 2nvIKS2gH6dNVjjULXhm0ayYfklHHzmuMAfwwCtSEi1zl8xh73YzyrqvFryZIf1Ii+mDxf
 W/Bosyo+Y+q9W8Q7vrj9JEKdmtKqomUMGMQz7hCZJsuPSNE3LGLJXIJFLlmyUAM67CYhLG
 /mbTwD83NnFtlRQr9VCwAuZO/9wRGot2Gbc6qtxSHykCl30nR4X0/n8cotvMDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=MosdJlUF
Subject: Re: [Buildroot] PocketBeagle2 support
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



On 13/10/2025 08:07, Pierre FICHEUX via buildroot wrote:
> Hi all,
> 
> Are you considering any BR support for PB2 ? I saw the following link but it's old:
> 
> https://github.com/mixaz/buildroot-pocketbeagle
  I expect that the pocketbeagle can use the same config as the 
beaglebone_defconfig, just add ti/omap/am335x-pocketbeagle.dts to 
BR2_LINUX_KERNEL_INTREE_DTS_NAME.

  If that works, we'd welcome a patch. Make sure you also update 
board/beagleboard/beaglebone/readme.txt

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
