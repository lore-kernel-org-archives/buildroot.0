Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F880FF8868
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 20:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3172D8114A;
	Mon, 27 Apr 2026 20:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zpElNCs3hyrh; Mon, 27 Apr 2026 20:31:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7150681142
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777321871;
	bh=ip2ermjVl7a2ykc4fSOwn9TegKQeiSh7ehJ7rLO3ms8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xo9DwVb3x4FF9v8hQQIspxWmJ5vpd1oBLMwVR3UaCWV794kK1DgByyTdyAmCV/L8L
	 5bZ7Zpads6CbrImDNyXxWQCqrHgTeDm1f0TccTTQ9sjIFLB+YbH6VgeOfl23BrBPHe
	 iXa3mHzitv97dP0EQejoX/eWP7DLjayFldRctZn8xLuLOd1Irb6jDWqnPLZGR7UUAC
	 pdZcHHk8DLwcCRhnIdB2BQo41eNqnSDA61gZF2JaRBafMLqMshFGMqph9TUShLEQhy
	 /nfizrL3pd+yv/G0QZwwGiirzHQR1Dn0sNHZu3AbGfHMTnmrUSSgqay7ZauOyqGLJ5
	 41eDKpJvCl68g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7150681142;
	Mon, 27 Apr 2026 20:31:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AF7441B8
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 951B78113E
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:31:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id reEjRksw4iAi for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 20:31:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C969981142
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C969981142
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C969981142
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:31:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id BE23719F5BA;
 Mon, 27 Apr 2026 22:31:02 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 27 Apr 2026 22:31:02 +0200
MIME-Version: 1.0
Date: Mon, 27 Apr 2026 22:31:02 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20260427153731.3792798-1-peter@korsgaard.com>
References: <20260427153731.3792798-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <467e4d32a9f990cd714c668fa0ae37e3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777321866;
 bh=PpIY07nP8dHyBRKSs1PSBLKQEBudJX/N78BGmdiE8j4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KsgL12nb2Vdr1FowuSHKgSn+QyRcfi/ycnlGcgHXJWlazX5bRlteE9PHqZv5qeHJi
 OsaZcJ+P/hgqDXf4YZECghDzlItAFNLunlz/VXJsDUdoHKjMuNOGBvPXsSw4mZPUT4
 DUpEFh+6K1TSuv7QuSNZZ4TbFAOmWTHAoz2gx4BjrzgdMnKUt/boptoHWV2i/eyxtU
 +9vpQfDqB6Sobe7/Di3tS2X3euAuBaZaM0E0PvmVJJaBmsHu1ki3L2orEFZFT+eYjA
 YiPgxnhxeuHZG1uzf1HLWKRK70TqRmOWABcFLFdq3HjP9TIHyfUkgcyDda+llwH2xl
 X5wA+D/Y+6iVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KsgL12nb
Subject: Re: [Buildroot] [PATCH] package/liburiparser: security bump to
 version 1.0.1
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

On 27/04/2026 17:37, Peter Korsgaard wrote:
> Fixes the following vulnerability:
> 
> CVE-2026-42371: integer overflow in text range comparison
> https://github.com/uriparser/uriparser/pull/298
> 
> For details, see the announcement:
> https://www.openwall.com/lists/oss-security/2026/04/27/2
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
