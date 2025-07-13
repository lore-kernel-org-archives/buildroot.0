Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86761C83F1D
	for <buildroot@archiver.kernel.org>; Sun, 13 Jul 2025 14:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 422F960B75;
	Sun, 13 Jul 2025 14:41:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AGSiYLHb2LVL; Sun, 13 Jul 2025 14:41:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7912060ADA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7912060ADA;
	Sun, 13 Jul 2025 14:41:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 679BE28B
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 14:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64F634073A
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 14:41:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lY1saB9GgW8T for <buildroot@buildroot.org>;
 Sun, 13 Jul 2025 14:41:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 338F9407A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 338F9407A0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 338F9407A0
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 14:41:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 30CD3B00571;
 Sun, 13 Jul 2025 16:41:03 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Jul 2025 16:41:03 +0200
MIME-Version: 1.0
Date: Sun, 13 Jul 2025 16:41:03 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>, Joseph Kogut
 <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>, Valentin
 Korenblit <valentinkorenblit@gmail.com>
In-Reply-To: <20250713124305.2659964-1-bernd@kuhls.net>
References: <20250713124305.2659964-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <7e301bac7dc4a919f4bca728c92d518a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752417668;
 bh=7UTrQqckd2pXYP+VHZh9ahT2GLqQWTrLo3mlMK8jI8c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=O+VuRu+IK9WIciQ/OmJEu0pIIWxAkh0uJtYaWUCGWZEkluW7yeNr61bwGqjOl3PXI
 iuJXpQUVl3EBRLbCMkM0jDQGCgEapVpa0UZ3CHD8OcTaf5xrOeWwofNI0pRvucb8Ep
 orPNQF2eJWoUeScAsW/IkctAblhzemGro5pQsQgjuBZruUoUvuZEeTNTNFrX8WJ0eU
 I0y8Y2+BK64HlKIdjhenn7hq+TTnn1MoJNZsD0axtn3oEVeDxvceaNWtVuJg/sYkwL
 2tiuR7hzDlj5zBHW2NInLqEKA1CeQMnzQwHoYzeCHZJEkva5Gqh1se2Da2tXbQVltL
 h6MXRgW+DhSYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=O+VuRu+I
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: bump to version
 20.1.8
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

On 13/07/2025 14:43, Bernd Kuhls wrote:
> Release notes:
> https://discourse.llvm.org/t/llvm-20-1-8-released/87259
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
