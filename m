Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67B1C71136
	for <buildroot@archiver.kernel.org>; Fri, 13 Jun 2025 21:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A71D60F00;
	Fri, 13 Jun 2025 21:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mXebjudvBdGK; Fri, 13 Jun 2025 21:39:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7A1D60ED8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7A1D60ED8;
	Fri, 13 Jun 2025 21:39:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 867B71BD
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 21:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7818681470
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 21:39:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cL29a-rtWfsY for <buildroot@buildroot.org>;
 Fri, 13 Jun 2025 21:39:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D931E8443B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D931E8443B
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D931E8443B
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 21:39:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 43B9E19F5A5;
 Fri, 13 Jun 2025 23:39:23 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 13 Jun 2025 23:39:23 +0200
MIME-Version: 1.0
Date: Fri, 13 Jun 2025 23:39:23 +0200
From: Julien Olivain <ju.o@free.fr>
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <5496754635235785aacbf2f359f2a498d4e02274.1749793479.git.yann.morin@orange.com>
References: <cover.1749793479.git.yann.morin@orange.com>
 <5496754635235785aacbf2f359f2a498d4e02274.1749793479.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <3d1d2f58f0b99b535ae2b50baae16307@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749850764;
 bh=eistuzhV6gRQ6zbRHKlbr6WDxBADCeg3eFIY16hTZwA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=t+MxtIejCdu9n0w0GjTShcPkg+vs7LCRQMbdCtdpzjV5r8FXb6McKX02dd7paELsr
 EcsGNJQT47wWNTz0/4WHYEauSUQQ3K9H/60gd9tulnh33n0u2hCkFWRa9Q9GFv6BKL
 KstbG1LaFlvqC9giSDmCgRNEIN+wlRKTY/qO83xRUZakYLyQcCfweMZXN9Ff1elFoB
 UcPmoiUAZRQaLTxJQ1aba8SM0OVK9wYQYAXoc1aO85qSt2dgVgM1yEJS6MB1qGRBxr
 JH5OEZY++t+yNbsQfVpGOdjHXDw99KDJBA5ZJlvhoUFoYJ3h44Rw2UCIXCfQqqYbqg
 JtzHcvFoAfW3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=t+MxtIej
Subject: Re: [Buildroot] [PATCH 1/3] package/amazon-ecr-credential-helper:
 add LICENSE hash
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

On 13/06/2025 07:44, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> The hash has for the license file been missing since the package was
> introduced in commit 9a9580622545 
> (package/amazon-ecr-credential-helper:
> new package).
> 
> Add it now.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
