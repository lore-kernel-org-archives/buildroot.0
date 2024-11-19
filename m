Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E1ED6C29E
	for <buildroot@archiver.kernel.org>; Tue, 19 Nov 2024 21:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D361852AA;
	Tue, 19 Nov 2024 21:23:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T6wreND15AbB; Tue, 19 Nov 2024 21:23:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A00A0852B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A00A0852B1;
	Tue, 19 Nov 2024 21:23:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A61DDB3
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 21:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5ABED4ADC2
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 21:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id czN4ZUbHrf9g for <buildroot@buildroot.org>;
 Tue, 19 Nov 2024 21:23:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1BC654AD66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BC654AD66
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BC654AD66
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 21:23:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 101CE780331;
 Tue, 19 Nov 2024 22:23:31 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:32986])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 19 Nov 2024 22:23:31 +0100
MIME-Version: 1.0
Date: Tue, 19 Nov 2024 22:23:31 +0100
From: Julien Olivain <ju.o@free.fr>
To: yann.morin@orange.com
Cc: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <cf517426f7868af6c3e80e5016ac23759bf75290.1726556733.git.yann.morin@orange.com>
References: <cf517426f7868af6c3e80e5016ac23759bf75290.1726556733.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <61de7fdb70abf609b4e52a0b7765152c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732051415;
 bh=pSuCFE6zittqBg5gyBnc6JFLCPHzJxks+pPtePoSaak=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rqipyQ/1GXZYYdwNKoj5S55X5DiCZ6O0FalXrvs/wC4Q3nvRRPZM2IXI9I9yXoic1
 ioTOkMgcX5TtWQFYCrMm7KYpcNasHGWlWDL9yyu1wYVi0iAHVrqN7FQbKWbWGIikk6
 nl2+3rZV4lCsHeo4qM7h2630o/zW+b0DEkmxxLKE8H+Xeb4FuPqbMqb1FI52Cax13j
 G9vsDSIGh3Hx33TEFpM3g1/4P36jJmoCRMAkRHQRbd9GfVvK3MezbNEJgN+uXVphgj
 1aDq5WrtDcaIotWaz/2oDA+v0GwmcvokiHTQL7ydoWgi8wo1affDvEal1ykhiNteS/
 YJENx7cKDJa+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rqipyQ/1
Subject: Re: [Buildroot] [PATCH] package/go: ensure there is a host-go
 provider, take 2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 17/09/2024 09:05, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Commit 7b2a164b7460 (package/go/go-bin: new host-go provider) broke the
> case for prompt-less, host-only go packages, as the main host-go symbol
> would not be selected.
> 
> This very same use-case was initially broken when the first go-src
> provider was introduced with fa2536ec9401 (package/go: make host 
> package
> a virtual package), and subsequently fixed in 99a5d51c6e9f (package/go:
> ensure there is a host-go provider), so 7b2a164b7460 is causing a
> regression of a fixed regression.
> 
> Fix that the very same way it was originally fixed.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.

> ---
>  package/go/Config.in.host | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/go/Config.in.host b/package/go/Config.in.host
> index 30260b573b..7e354b3298 100644
> --- a/package/go/Config.in.host
> +++ b/package/go/Config.in.host
> @@ -78,13 +78,13 @@ config BR2_PACKAGE_HOST_GO_BIN
> 
>  endchoice
> 
> +endif
> +
>  config BR2_PACKAGE_PROVIDES_HOST_GO
>  	string
> -	# Default to host-go-src
> +	# Default to host-go-bin unless src explicitly requested
>  	default "host-go-src" if BR2_PACKAGE_HOST_GO_SRC
> -	default "host-go-bin" if BR2_PACKAGE_HOST_GO_BIN
> -
> -endif
> +	default "host-go-bin"
> 
>  source "package/go/go-bin/Config.in.host"
>  source "package/go/go-bootstrap-stage1/Config.in.host"
> --
> 2.34.1
> 
> ____________________________________________________________________________________________________________
> Ce message et ses pieces jointes peuvent contenir des informations 
> confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez 
> recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les 
> messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme 
> ou falsifie. Merci.
> 
> This message and its attachments may contain confidential or privileged 
> information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and 
> delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have 
> been modified, changed or falsified.
> Thank you.
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
