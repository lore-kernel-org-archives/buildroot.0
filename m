Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D2CC61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 19:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DE094090C;
	Thu, 12 Jun 2025 19:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tNvez-39IcDo; Thu, 12 Jun 2025 19:54:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 983AA40905
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 983AA40905;
	Thu, 12 Jun 2025 19:54:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B49051BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1416408D0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z2VK2X_9GKlg for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 19:54:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B2093408D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2093408D3
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2093408D3
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:54:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 466991C0D69; Thu, 12 Jun 2025 21:54:04 +0200 (CEST)
Message-ID: <d04b7598-49be-48df-9259-11e0400d2c13@rnout.be>
Date: Thu, 12 Jun 2025 21:54:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20250516192540.84EF986D6D@busybox.osuosl.org>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250516192540.84EF986D6D@busybox.osuosl.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749758044; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=JRt6Xa2gDpPezGcQm1hVP/9hj/rREAcm/GHn53V58nU=;
 b=EIjth8a8yN84+Fm39CWhkTl+CGJ0YGisE0UVEnaKD3v2SkKJy9gYFJ55taonyCnTya+e4n
 zgUvJ8H2mmUkOVGvlb88eRvWNF8z9+TEfXDG/qpTlzz4VKXzPqwwpGjJZ8ZtnRPRmzpvuY
 MRaRfDsJpbUB+1V5RetNZUDtDetvaISSKyFflyQPORiTbeNB7zu9Cxiz2ndgvulytYQlgd
 FbZ5p5MwIbhxaPHiynM4Ilxd2O6SHXGoqRktHYjHYeUUNWdSwrFZT8PYA18IAy2zXybQyo
 KvtvqGXhB68q/E3rIEHA3kv571+DTP0KIjPLivrqtRyfZZm+bdQa0zZsZ59YTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=EIjth8a8
Subject: Re: [Buildroot] [git commit] package/freescale-imx/Config.in:
 introduce i.MX91 silicon revision
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



On 16/05/2025 21:24, Julien Olivain wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=0645c83cd6a6d2caf1fdc62cbed81023fb509a2a
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> This commit introduces the silicon revision number configuration.
> This value will be used by packages for specific configurations
> (such as security firmware).
> 
> Signed-off-by: Juan Pablo MONTERO CASTRO <juanpablo.monterocastro@nxp.com>
> [Julien: split original commit 1/3]
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to 2025.02.x, thanks. I should have done that way earlier already, 
before cherry-picking original commit 2/3...

  Regards,
  Arnout

> ---
>   package/freescale-imx/Config.in | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> index 6d196a052d..77d6547cec 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -93,6 +93,21 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA2
>   
>   endchoice
>   
> +choice
> +	prompt "i.MX 91 Silicon Revision"
> +	default BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91A0
> +	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91
> +	help
> +	  Some packages related to the selected i.MX platform need to
> +	  know the silicon revision of the platform they will run on.
> +
> +	  Note - mismatches may result in a failure to boot!
> +
> +config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91A0
> +	bool "imx91a0"
> +
> +endchoice
> +
>   choice
>   	prompt "i.MX 93 Silicon Revision"
>   	default BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A1
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
