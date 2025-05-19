Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83F3C3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 17:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 596BE60E31;
	Mon, 19 May 2025 17:21:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0aRcxQX5rAKu; Mon, 19 May 2025 17:21:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CD6B60E43
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CD6B60E43;
	Mon, 19 May 2025 17:21:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 56B12196
 for <buildroot@buildroot.org>; Mon, 19 May 2025 17:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B36E84078A
 for <buildroot@buildroot.org>; Mon, 19 May 2025 17:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pmdSzBoAKa2V for <buildroot@buildroot.org>;
 Mon, 19 May 2025 17:21:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D7A1D40781
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7A1D40781
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7A1D40781
 for <buildroot@buildroot.org>; Mon, 19 May 2025 17:21:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 9D2D713FA43;
 Mon, 19 May 2025 19:21:34 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 19 May 2025 19:21:34 +0200
MIME-Version: 1.0
Date: Mon, 19 May 2025 19:21:34 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250518205708.203005-1-kadambini.nema@gmail.com>
References: <20250518205708.203005-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <19a72e573b8e6c037a3cca226ac0608d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747675295;
 bh=rfpwmjbtAcRUkZqHLmfDRLAXa5+gLgQnDW6fnhifWtk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=feUhm3NT/2BzELLFR+on4kavgWcGvgpyuFlXNJligxqGNTpfy521RI5ETZ+KcolMR
 iBvaIjFJd8Ay1D9A1jQ9kS41RBxm1BDBld+O4rVeYDErHCOJzlbZJSq37tOaA8jBPL
 ZNFEQm4VSpTGtcZmqF6xFng5CW24Nq6X0KdDvDfqRSHM/8AcC0IpmIxpSvJocw2i6a
 05pgc42SJRS5Zs9Zwm7yndZ8wTdyN4BKQSCHAbIWH9sxNF4Pem1XOQhhaK2c3whIo5
 1iV5Ie5tR16H1XNSKsqwEftD22roYv6NHeo+ySu85Oio2fHLJGqCWdMtnIQjdzexw/
 DCvtzpnBJAT0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=feUhm3NT
Subject: Re: [Buildroot] [PATCH 1/1] package/nmap: bump to version 7.97
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

On 18/05/2025 22:57, Kadambini Nema wrote:
> Changelog:
> https://nmap.org/changelog.html#7.97
> https://nmap.org/changelog.html#7.96
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
