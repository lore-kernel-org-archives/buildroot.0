Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED9CCCD1BB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94CCC40D07;
	Wed, 22 Oct 2025 16:43:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O_djwEjHUBiM; Wed, 22 Oct 2025 16:43:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A44FE40B97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A44FE40B97;
	Wed, 22 Oct 2025 16:43:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D55F343F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2F6B83DB0
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9nOJ2qZY5IMP for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:43:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C871D83D82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C871D83D82
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C871D83D82
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EA9EBB97918D; Wed, 22 Oct 2025 18:43:14 +0200 (CEST)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:43:14 +0200
Message-ID: <20251022164314.286289-1-arnout@rnout.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009143216.2282077-4-fiona.klute@gmx.de>
References: <20251009143216.2282077-4-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1761151395; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=msytcsy2z3VCISO+EXgLDScQSrneujei2eTt6dmgwYA=;
 b=IrVXXW8ZTRaZ1O1pNVF0GL9gXbbzCwX3xH1ezLDmTNvctXecYcp6tyaGG3sa13tRtZ7hLm
 +2VyLRhrkLiokvnKuqFG/lWI6gBJRc7jJrzggmutPhusbClunmqKWN4XgUwt7wBqLb1En3
 gfqSjlU4aLQ07K4ze+WudUcFmdxuLacWuwSJGwxXa4v62Ub4/t6gFxdZ7y5venL1y5mmFo
 nLE1tJDSeU84Vtky6zhuTJs4N2kdTmKJkpaTZ6kNGEkKogftiGFpu+s3uLoH7d2NZ1n6/j
 GoGOKbUBkh3M9C6R7Ey6wv2pun6NO+cGlTh7csnWU60gczKeMfFld6iVS1ebgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=IrVXXW8Z
Subject: Re: [Buildroot] [PATCH 3/4] package/refpolicy: fix upstream URL in
 help text
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The previous URL currently redirects to
> https://github.com/Exact-Realty/refpolicy, which as of this commit is
> about two months old and contains a readme that just says "PoC by
> Callgh0st". When the package was added with commit
> bb442abdf18d6a4673ffa1f19e2a62f36c5d3038 the help text URL matched
> REFPOLICY_SITE, so presumably the help was forgotten when the site URL
> was updated, and there has been some kind of hostile takeover of the
> former upstream repository since.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  package/refpolicy/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
> index 8ae8f0448d..7aea39b223 100644
> --- a/package/refpolicy/Config.in
> +++ b/package/refpolicy/Config.in
> @@ -26,7 +26,7 @@ config BR2_PACKAGE_REFPOLICY
>  	  policies is not correct.  Individual policies would need to
>  	  be tweaked to get everything functioning properly.
>  
> -	  https://github.com/TresysTechnology/refpolicy
> +	  https://github.com/SELinuxProject/refpolicy
>  
>  if BR2_PACKAGE_REFPOLICY
>  
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
