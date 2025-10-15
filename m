Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489D4CCD193
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 23:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4F37616EE;
	Wed, 15 Oct 2025 23:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2X-0w0D1pGip; Wed, 15 Oct 2025 23:06:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AECD616EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AECD616EC;
	Wed, 15 Oct 2025 23:06:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88CE4116F
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 23:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AA9184429
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 23:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id imPCozue92qJ for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 23:06:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5AE778442C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AE778442C
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AE778442C
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 23:06:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 23D62B978FB1; Wed, 15 Oct 2025 21:59:23 +0200 (CEST)
Message-ID: <e89880b1-870e-4ba4-aa54-47653e56926d@rnout.be>
Date: Wed, 15 Oct 2025 21:59:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20251015172003.1893707-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251015172003.1893707-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1760558363; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=e3xPrMEJVUoZQb20lw2wD+fDO7WJGJ41QyzJIXHtTxo=;
 b=b3QT6SQNPUkvsXlFQXBk/xFyYTSvZDVyLUNvFkPb5mSnHRnKXMWcYqdyWYkSpN7cuDfqcR
 NB4Mri+xwmg4+0i/fTJB8zoU2lvL36X8Dx/KWdvkasPIVhG814d/K70/vPq8KL1gDgwYDh
 01rxqqHvDl02jGdPlSWRhODIJyN7AxbqeFlD5J+yYhWP7vTYHntoVHW1b9rhy1wlMhphgC
 41mZf03sKSeXQDw8GDj6c9pF673WpYeWDcBJTU9SvLCztv4doqfU9GkYgnzN2rR6YIy9+f
 6GSRNbWqNWdeJKUmEgyWrctz4WhsQKq1utlf1Nr3FHTiEzcbImEYBV647TyDNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=b3QT6SQN
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: security bump version
 to 4.22.5
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



On 15/10/2025 19:20, Bernd Kuhls wrote:
> Release notes: https://www.samba.org/samba/history/samba-4.22.5.html
> 
> Fixes CVE-2025-9640 & CVE-2025-10230.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Any chance of a patch for 2025.02.x, which is still on 4.21?

  Regards,
  Arnout

> ---
>   package/samba4/samba4.hash | 4 ++--
>   package/samba4/samba4.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
> index f0e19d8741..0668a9e8db 100644
> --- a/package/samba4/samba4.hash
> +++ b/package/samba4/samba4.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after checking pgp signature
> -# https://download.samba.org/pub/samba/stable/samba-4.22.4.tar.asc
> -sha256  a41a828848abdf5e942c900ca178597e18aab7b61d3c06a9b5ba43661988010b  samba-4.22.4.tar.gz
> +# https://download.samba.org/pub/samba/stable/samba-4.22.5.tar.asc
> +sha256  d8566a15d3dbfc0b777d1e8fbb2eee988a024ca9c786dcac65dd10347307400d  samba-4.22.5.tar.gz
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
> index c1d1b0b160..688d5177bc 100644
> --- a/package/samba4/samba4.mk
> +++ b/package/samba4/samba4.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SAMBA4_VERSION = 4.22.4
> +SAMBA4_VERSION = 4.22.5
>   SAMBA4_SITE = https://download.samba.org/pub/samba/stable
>   SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
>   SAMBA4_INSTALL_STAGING = YES

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
