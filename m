Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2297FEEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 10:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1A4C60A60;
	Thu,  1 Jan 2026 10:48:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CivVx4bzzOe6; Thu,  1 Jan 2026 10:48:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DECF760791
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767264480;
	bh=Rxy/DGmy3v26ZOQO1wTouUM/2L5p8Vpb27ssyBvNERA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=INWzr/fTwSEi5mrEIjCMXNXh/u89DIOAGsDTJQd9sPuYuhQWQrxA9feIx7qBxmbGL
	 dHF3OV+x04YrNtxs/rxUY1Bbv7YHpKpIjJ2/mt421gxMvPXpY99aO1ySu/uzPCUB9g
	 MD6z+LdCstCj+qO6qHOG42vdd2ym2efoaDRyKmro9tElHpxB43XRyj9sVOSJV/oyPL
	 gkpzjR9olkTZgUtL3B999ASv2aEQEM9eYAVfj1gfENQQDX8Tdgir2zbVe2jehd2+sj
	 phnO3J624Lj5XjfHLK+fCSX7Gf/twj7vR9yaRxaSHRzHcL13DRBVi8x70Vlu9NSjDN
	 MfrEu5Il0EXLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DECF760791;
	Thu,  1 Jan 2026 10:47:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 111FF19D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 10:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAE1460791
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 10:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMExekdIeChv for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 10:47:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8B77460776
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B77460776
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B77460776
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 10:47:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 802C519F5C2;
 Thu,  1 Jan 2026 11:47:53 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 01 Jan 2026 11:47:53 +0100
MIME-Version: 1.0
Date: Thu, 01 Jan 2026 11:47:53 +0100
To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20251231182743.2150393-1-pkerbrat@free.fr>
References: <20251231182743.2150393-1-pkerbrat@free.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <37aab23a0481c61ebe303d5384bc6fa1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767264474;
 bh=oVtdC1PflC1rBqwjJTqwmGAO4MNjnjPSZLZBpziGKjc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GzbJABkn8DuwduAOYPqO7wD1UWVLCEymHJJHPtStqQ0nb1NrH5ytrOkBUDac0UN0G
 ZamzBZFjTH1SEsiN+1hJFNgrIVJov7/fLLvlFUCTsNg/rtZoDP5DXNdudB/erwR105
 qx1AjVyUK13866RRMCGrrvmzQHHmXxiG9LSghiTOxH/49Ac/Picot8KGjpGqItDwQP
 RE6mlgw3Awuo/ur5p88sg93UlJeHrjK0Pf5gcGm33nK0rO6mN4d+gW7dGXPccKCAxI
 RsDvdCEpk7r28gjcK6pVzvQotPDdR7rzI8vE45dr+hPWqy/pTXLYny3APERRdRy3Ez
 +hsNCxQ/rlVSg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=GzbJABkn
Subject: Re: [Buildroot] [PATCH] package/feh: bump to 3.11.2
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

On 31/12/2025 19:27, Pierre-Yves Kerbrat via buildroot wrote:
> Changelog:
> https://github.com/derf/feh/blob/3.11.2/ChangeLog
> 
> COPYING hash updated with this commit:
> https://github.com/derf/feh/commit/e4eebe54d5ebca968d0d9643eb15a0ee407d1e70
> 
> Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
