Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FBEC3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 677D180E9D;
	Sun, 18 May 2025 14:47:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pfv7RrjGm2pd; Sun, 18 May 2025 14:47:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A641D80F1C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A641D80F1C;
	Sun, 18 May 2025 14:47:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 58BE01BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49520403CD
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r6hC8Z4as_mg for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:47:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B1E04403D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1E04403D3
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1E04403D3
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C2FD91C1060; Sun, 18 May 2025 16:47:00 +0200 (CEST)
Message-ID: <4882a48d-f91d-4a08-a5b6-9ae043a64a41@rnout.be>
Date: Sun, 18 May 2025 16:46:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com
References: <20250512094324.127864-1-dario.binacchi@amarulasolutions.com>
 <20250512094324.127864-2-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250512094324.127864-2-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747579621; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=tXxQ3CToXBYfyHGq0q8DvQ2NPBLC2O/oEX3SUOORVZg=;
 b=mjt7h3VTMmowl+QGeQwRPBPmSI4+uHpMMVrZgtTzuyFu66Ue5y+J0Zk63tp7DDjNjJ5+Y+
 mUd9wZvTcawlWQNeqJNJsfJzeCa2cYwnSwAln3jPHRpqbXcLEDdA98KJwVT+t32uy6BZfo
 tlR47sfnksg1KRNY3Xb3Rk0KeZWvrq4ZFTbCA1yEKhpPuUWbYLUFTDF3R2PvIluHC1SWaq
 mUROscLuJOZIFCSwluKy64dYIZ1LwG5du4bd5IZKV+KxiEodgYPFY5DVJ54i+43o61qlH9
 NYZGztLvvQE2/6wtri2Lw3nsitt6maYdRJqC62jctXWIIOOA71FH2x56HJdhMw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=mjt7h3VT
Subject: Re: [Buildroot] [PATCH 2/2] DEVELOPERS: add Dario Binacchi for inih
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



On 12/05/2025 11:43, Dario Binacchi wrote:
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 7f01b46c70cd..c4d14aa87589 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -809,6 +809,7 @@ F:	package/aespipe/
>   F:	package/armadillo/
>   F:	package/babeld/
>   F:	package/iana-assignments/
> +F:	package/inih/
>   F:	package/sscep/
>   F:	package/tinyinit/
>   F:	package/ufs-utils/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
