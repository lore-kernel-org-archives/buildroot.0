Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C2DD60CE5
	for <buildroot@archiver.kernel.org>; Mon, 18 Nov 2024 21:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F197342F4B;
	Mon, 18 Nov 2024 21:30:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ajX7iH1WMuav; Mon, 18 Nov 2024 21:30:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FDE442EFC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FDE442EFC;
	Mon, 18 Nov 2024 21:30:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C719DB3
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 21:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89FC942E69
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 21:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5JzcU3Z7kv19 for <buildroot@buildroot.org>;
 Mon, 18 Nov 2024 21:30:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4F27842F0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F27842F0A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F27842F0A
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 21:30:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id BADD32003B4;
 Mon, 18 Nov 2024 22:30:28 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:37642])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 18 Nov 2024 22:30:28 +0100
MIME-Version: 1.0
Date: Mon, 18 Nov 2024 22:30:28 +0100
From: Julien Olivain <ju.o@free.fr>
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <33d2cab38fd2a37a7240b00b0391de8244c5b58f.1731916620.git.yann.morin@orange.com>
References: <33d2cab38fd2a37a7240b00b0391de8244c5b58f.1731916620.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <d4b2a6d01129df0ace236f20b58e19e1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731965429;
 bh=+66Qq2oADImmytcCijBu8FZQaAczw7ASsLFeTvhIJT8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SF3f1PJs33tc0xl7sEHxVsfhkCoabsuPIc7llEJL0BdwpNwqMwFeXSzd0/J3tzQuM
 YLcA3yNFj9C5nHwU0s00RtXi2XmTEhte8ZAWrL/GXD1R5MyI5AVVqcKXEO98P2B6XY
 cg2EjdLNrzibaxnVU0Gf6/ViUVkRXW2l2GUI/beVmJrF1aj4ZzchAmyLHmfRM/Ant4
 12p3SBDMQjG22CEOOLUKOpy1NtowinXbGYemYrHdXuADKc09ysEYmCB+3Kz70H7OLT
 /rKkKTsrve63Vy4t4TU3pmxVzqOGPSdQEbs0xDOCxw0/F1RxIXBjfNdcW1KfWPc/UI
 4gmqL0XaHpvpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SF3f1PJs
Subject: Re: [Buildroot] [PATCH] package/skopeo: bump to version 1.17.0
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

On 18/11/2024 08:57, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Applied to next, thanks!

> ---
>  package/skopeo/skopeo.hash | 2 +-
>  package/skopeo/skopeo.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/skopeo/skopeo.hash b/package/skopeo/skopeo.hash
> index c523dea46a..684232b350 100644
> --- a/package/skopeo/skopeo.hash
> +++ b/package/skopeo/skopeo.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  
> 9402e71f3fba979d0c0509240b963847bfeda2eac60be83eb5a628fd67d098e6  
> skopeo-1.16.1-go2.tar.gz
> +sha256  
> e548c044c7b644ba455f482df387ec90aceea432b9c61a0bab0ec8534970eb69  
> skopeo-1.17.0-go2.tar.gz
>  sha256  
> 716a8b80635c394681e652823e1e42e411ad2d254e1f202403422d74f4b0b106  
> LICENSE
> diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
> index e2f7b8e889..2e0cb8e1cc 100644
> --- a/package/skopeo/skopeo.mk
> +++ b/package/skopeo/skopeo.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -SKOPEO_VERSION = 1.16.1
> +SKOPEO_VERSION = 1.17.0
>  SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
> 
>  SKOPEO_LICENSE = Apache-2.0
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
