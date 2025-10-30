Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E563CCF9F8
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7242583ED4;
	Thu, 30 Oct 2025 08:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tFCkeXSEou-j; Thu, 30 Oct 2025 08:15:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC5B283E7F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC5B283E7F;
	Thu, 30 Oct 2025 08:15:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C4E6160
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E04C4110B
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FOeGRJeW52tN for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:15:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2C3994101E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C3994101E
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C3994101E
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:15:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 284D3B979355; Thu, 30 Oct 2025 09:15:13 +0100 (CET)
Message-ID: <ac3078c9-f25d-44c9-b40e-d29bffec6723@rnout.be>
Date: Thu, 30 Oct 2025 09:15:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20251027214413.67587-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251027214413.67587-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1761812113; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=UXnxg1PdYdSm4aayrC7Tdgw4jhbhFQ5XtvIxNGpzcjw=;
 b=LKXAvNHv+YOVDHBtX55O8M2fbotNXWjwzxH7vJvCIMc8gXXnVWLSXJEukreE+ARi5H3mqw
 umEnrQrw299CWuONnU6OikqKZInBINN/OYdnqJqT8xj9Px8J8LUvLFn614lao2QcarZMuN
 qkli3aS/EOlq7HkvJib/TD8DybbVWw3chpSGaVzQDcZBSV1j3P9IB0VlQTtGca+78Jh7oD
 KXy1yMPJHPuY5KA/aC/RWy0DYFNYd7bAVvvIZJv1cVr1Lu34fBA4vuKasOai8qhhlPoWqu
 oSFqoUE2OMJzrKECVLtK2bqElDSdAnSEJAG9IRVlCbURgEwrFicmUDI7suHC0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=LKXAvNHv
Subject: Re: [Buildroot] [2025.02.x,
 PATCH] DEVELOPERS: remove 'board/engicam' entry
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



On 27/10/2025 22:44, Thomas Perale via buildroot wrote:
> In commit [1], the only 'engicam' board config present on the 2025.02.x
> branch was removed.
> 
> On the master branch the 'px30core' board is present because it was
> added in commit [2] not picked on LTS branch.
> 
> So the DEVELOPERS entry for Jagan Teki that match every 'engicam' board
> was not removed.
> 
> This patch removes this entry to remove the post commit hook warning.
> 
> [1] 13eb6c293e configs/engicam_imx6*: remove defconfigs, broken
> [2] 6e6bd098c3 configs/engicam_px30_core_defconfig: new defconfig
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index dc094eb8fb..624e9b8d62 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1462,7 +1462,6 @@ N:	Jagan Teki <jagan@amarulasolutions.com>
>   F:	board/amarula/
>   F:	board/asus/
>   F:	board/bananapi/
> -F:	board/engicam/
>   F:	board/olimex/a33_olinuxino/
>   F:	board/olimex/a64-olinuxino/
>   F:	board/orangepi/orangepi-zero-plus2/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
