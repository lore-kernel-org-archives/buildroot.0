Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAC3CCFA13
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 17:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AD52406A7;
	Sun,  9 Nov 2025 17:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2SO05tkyJek; Sun,  9 Nov 2025 17:39:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A330A4025A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A330A4025A;
	Sun,  9 Nov 2025 17:39:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C280C25D
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 17:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A865260850
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 17:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dJyNrKccTJvc for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 17:39:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 99BD8600D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99BD8600D1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 99BD8600D1
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 17:39:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id D167013F8A9;
 Sun,  9 Nov 2025 18:39:07 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 09 Nov 2025 18:39:07 +0100
MIME-Version: 1.0
Date: Sun, 09 Nov 2025 18:39:07 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20251107214009.403006-1-yann.morin.1998@free.fr>
References: <20251107214009.403006-1-yann.morin.1998@free.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <e01431bc380da1bb46430bfb2be93f30@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762709950;
 bh=v2Cv15rMFJQ4O6cgiaYDRpI9rB0O1KMJrwzxhN2EC88=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DLtBHQCsHo/7rrURxRw2AI6PwiOxQ6uXvlFAqZBvLRb/50SM8eirbIoxnrOX2QVCX
 1P2FfLfWeSCtmC9+aHSooxdAdmQuyKjRp7St+Qi72mh0KBMOsbBCgUvCgte4+QZ3Yy
 tAc3YbTVUfSxecovhvaoJwmaMVC1renHhu/My3HGRluJJk4jlTz+EstE5flM+rkTme
 llGSg7BYORiJZSqTyUcXlLNtBBbVzf0sJpdHxqIu8P6ptHoShHIhFDaJiGhkjYjFnA
 caGpiTJj6k3kmkqNMKUx1iNhGiwrJHYQTs/JGGEcfGZXEmsGTuz6r734DlmXpSrumW
 92kxgVImwIfZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DLtBHQCs
Subject: Re: [Buildroot] [PATCH] docs/manual: add merged-bin details to
 customize rootfs
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 07/11/2025 22:40, Yann E. MORIN via buildroot wrote:
> As was done in dc7c6487cff0 (Makefile: check rootfs overlays with
> BR2_ROOTFS_MERGED_USR enabled) to document how overlays should be
> set up for the merged-usr case, and following 428ac6fcc4c2 (system:
> add support for merged /usr/sbin (aka merged-bin), extend the
> documentation to explain how rootfs overlays should be set up for
> the merged-bin case.
> 
> Reported-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
