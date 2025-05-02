Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1ADEC3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5076411A7;
	Fri,  2 May 2025 10:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eUvZQYUcc2km; Fri,  2 May 2025 10:43:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1EC1411C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1EC1411C8;
	Fri,  2 May 2025 10:43:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 18DAEEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F306340B0E
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:43:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JipdXNeCLBr3 for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:43:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2101740BFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2101740BFE
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2101740BFE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:43:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EB62B1C111C; Fri,  2 May 2025 12:43:21 +0200 (CEST)
Message-ID: <d816129a-6e72-453f-9cd1-7d6a8b8004cc@rnout.be>
Date: Fri, 2 May 2025 12:43:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 linux-amarula@amarulasolutions.com
References: <20250413164708.1943803-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250413164708.1943803-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746182602; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=V1+OIn8ChZcnJY2cDDxux2HX2LeO5s8b9+BLH4xUaFY=;
 b=OT+BvjmYnDhreG0vrsImnjmTRZ3XyiNOBJGHf2nHTq+bz6xBHdjxjtp1sYItVEBccOI6+3
 EcQJ4c5xw37Fe6dTikdd2W4Fyb53oooCh8P2TC86eS8tVBdVHDAv7y5sApKin7ct7w1eys
 4lHbiXBAO4slavlTere9vD7TtTciqYTQ171MuJ5U2hjnRPay+zKM/FoRkuHku2lFMyTDMN
 TuuXirS77OOHgL2YlYTuH7OO1bG3inggxeR/oBbeHiT/YPXqKn0iIWc+KAbSECU0IhISBk
 DgAxdar/ufJMd17VvwsgRQmatKlFKRt4D+BZhNsUKzclNWeP97GREa3TMHVOgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=OT+BvjmY
Subject: Re: [Buildroot] [PATCH v4 1/2] configs/stm32mp135f_dk: fix optee
 hash
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



On 13/04/2025 18:47, Dario Binacchi wrote:
> The build command:
> 
> make stm32mp135f_dk_defconfig
> 
> fails with the errors:
> 
> ERROR: No hash found for optee-client-4.3.0.tar.gz
> ERROR: No hash found for optee-os-4.3.0.tar.gz
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/9690369624
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> 
> ---
> 
> Changes v3 -> v4:
>   - Add Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/9690369624
>     in the commit message
> 
> Changes v2 -> v3:
>   - Added in v3
> 
>   .../common/stm32mp1xx/patches/optee-client/optee-client.hash    | 2 ++
>   .../common/stm32mp1xx/patches/optee-os/optee-os.hash            | 2 +-
>   2 files changed, 3 insertions(+), 1 deletion(-)
>   create mode 100644 board/stmicroelectronics/common/stm32mp1xx/patches/optee-client/optee-client.hash
> 
> diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/optee-client/optee-client.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/optee-client/optee-client.hash
> new file mode 100644
> index 000000000000..5423bf93a580
> --- /dev/null
> +++ b/board/stmicroelectronics/common/stm32mp1xx/patches/optee-client/optee-client.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  a9a91bdb433df795c87a6d15198effbd648e3671ae611f2a3f8b41229d61cce0  optee-client-4.3.0.tar.gz
> diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/optee-os/optee-os.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/optee-os/optee-os.hash
> index 73d4e2c4dafb..2e12a5cdea78 100644
> --- a/board/stmicroelectronics/common/stm32mp1xx/patches/optee-os/optee-os.hash
> +++ b/board/stmicroelectronics/common/stm32mp1xx/patches/optee-os/optee-os.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  03b91fd7dfdf890e3966f931f07634a2b6a2911bbee2a02ecc48d4a40cf6a9b8  optee-os-4.3.0-git4.tar.gz
> +sha256  390b271905c828d6def9fa6a77bbaa425f3b434d733c8eb18f582ccbc6896096  optee-os-4.3.0.tar.gz

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
