Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9358CCCD1BF
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 17:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BE2781236;
	Sat, 25 Oct 2025 17:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bBfx1JKFotjA; Sat, 25 Oct 2025 17:17:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92D2681222
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92D2681222;
	Sat, 25 Oct 2025 17:17:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B576443F
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 17:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B287381200
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 17:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PMVEh_znkm-t for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 17:16:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA0A8811F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA0A8811F2
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA0A8811F2
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 17:16:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 7869E78034E;
 Sat, 25 Oct 2025 19:16:54 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Oct 2025 19:16:54 +0200
MIME-Version: 1.0
Date: Sat, 25 Oct 2025 19:16:54 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Murat Demirten <mdemirten@yh.com.tr>
In-Reply-To: <20251022163627.20002-1-dario.binacchi@amarulasolutions.com>
References: <20251022163627.20002-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <15dce89205fae37c639933ed2c16969e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761412616;
 bh=4NdXntNEJZSpNqouV39eouFmGf8CGat689fMcsqYPlA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H1DvUPV7FSMeX8sEu88IgazCNPojO+4HqzhXgVZHTXAgefS4TxNMam0MLeWTS5aFt
 1XQMSnOzWNe0xl86NteKa3gGkpAsnsz31oqt3qOjJC8Me128JynlnKgUR2o7wlTT03
 X/h8R++ZlZYHFvtuZ3YJPPRHrgAAvKKk151kA+vbJTIlg7cLx18SkoV2BekWSpWjg6
 JB/2wPIDZaJLssA2uZB/r46HTThVR0IkIK+8pRVKQkWNTnKifIfkAOyD6hBjWCXmOb
 b2q9A2yXYvrQhXvC/U/Udj/Wcpl3ZfWT9sX+NC/DS4T/ENdY4OmIFdOiuz/izcsGMR
 sm9xjUD3IoWvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=H1DvUPV7
Subject: Re: [Buildroot] [PATCH 1/1] package/libgeotiff: bump to version
 1.7.4
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

On 22/10/2025 18:36, Dario Binacchi wrote:
> Release notes:
> https://github.com/OSGeo/libgeotiff/releases/tag/1.7.4
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
