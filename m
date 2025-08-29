Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D2BCA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 17:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77E5D844C7;
	Fri, 29 Aug 2025 17:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wjSXcPgiumLw; Fri, 29 Aug 2025 17:17:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 749B6844CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 749B6844CE;
	Fri, 29 Aug 2025 17:17:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A9E1DD2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9081F61529
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uAcuwgeRkZqN for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 17:17:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E6301614FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6301614FB
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E6301614FB
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:17:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EF921B978462; Fri, 29 Aug 2025 19:16:56 +0200 (CEST)
Message-ID: <f686ae5b-7112-4267-85e6-ead3ff77649c@rnout.be>
Date: Fri, 29 Aug 2025 19:16:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
References: <20250826072652.1581813-1-neal.frager@amd.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250826072652.1581813-1-neal.frager@amd.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756487818; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=wczyEp+0dDr8iZepn+gtDgHbTEEjIsss3VkSu+MRw6Y=;
 b=Lr01xF5LhaQ56ekI0mshXpOMcD3i7G7d3qaNT3i5R7BVozbHbq5Eg7xDLweZKHbdf7vrBk
 ldOHjrAwSo+lwSvB5vI5icM5uKHEjrr0HhF8YyvTBDU4pM3F9wWyNYs6HtFE/qrlQL16gT
 0xQfgHRWgQh0RglWicixHozC6XAgwOcc1CAxJnQhqFJMiP4naBp82QHv2Rq8GVaD/DLZHc
 QtPAO0yVNStQlTvTtpafy2hjl397v40pIpnBoWyaIed67/Vlfv3WLCzRDbGjf9OjgXee3F
 0OXSjwoGpYM8yJbrSLsdR2yEHV531HzgBYKb4GSb1eUcho1PRfkLZq6MkRbYCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Lr01xF5L
Subject: Re: [Buildroot] [PATCH v1 1/2] board/zynqmp: increase vfat
 partition to 64M
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/08/2025 09:26, Neal Frager wrote:
> Now that the qspi.bin file is included for zynqmp images, the 32M vfat
> partition is getting dangerously close to being full.
> 
> In the process of bumping Linux kernel 6.12.10 to 6.12.40, the size of the
> default Linux kernel Image file for zynqmp products is increasing from 23.4M
> to 26.9M. This is leaving less than 1M of free space in the vfat partition
> meaning users may unknowingly exceed the 32M size by just adding Linux kernel
> configs.
> 
> To avoid potential problems, this patch doubles the size of the vfat partition
> to 64M, which should be plenty of space for any configuration.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

  Applied both to master, thanks.

  If you bump versal as well, don't forget to remove the patches.

  Regards,
  Arnout

> ---
>   board/zynqmp/genimage.cfg | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/zynqmp/genimage.cfg b/board/zynqmp/genimage.cfg
> index 0a6aea7a29..193aff2a2d 100644
> --- a/board/zynqmp/genimage.cfg
> +++ b/board/zynqmp/genimage.cfg
> @@ -12,7 +12,7 @@ image boot.vfat {
>   		}
>   	}
>   
> -	size = 32M
> +	size = 64M
>   }
>   
>   image sdcard.img {

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
