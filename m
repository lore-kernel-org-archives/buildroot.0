Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D555AC88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 19:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D5D580A82;
	Sun, 13 Sep 2026 19:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6baepSF9PUk; Sun, 13 Sep 2026 19:36:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B892280CEE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789328199;
	b=bs56ylWIulhI4ND/pp+L1VRM3fEtSuU1DFyj6OkCt5rqoPpLOBwbeoADbEjJaA4YdlcN
	 M2bwaEsDfX/H12cCPnbCA8tokDrNSRn20bG+QpvpP62mRe50qIEQ0zZeur0BNHvv8g0kR
	 RA9EKw1r4Pi9wP9zSGaNG9hegQxJbUnYDAVqw/KtN7LgcCNvt2poDmyH87a4fHwBtsrZJ
	 zohuud/FsUrgoSAg8mED6gxVOa0lgrpO5tF/6cHV+qrFGDcExNosqd8L4DcDT8UJ7oEpo
	 pUjq8c0HRgxaFzc7NiVFRiYer/ll04Ab8Ucnau9OheiZ1+5JQt9gXSH8/m3s1QTyHWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789328199;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=0lp8jvkQZ9MgOUHOkfrta2GMEL3ulpKvQRlaB0xbHy8=;
	b=pUbRzMDqDCEIpEosvPNd3hmF6woU4o7eSYVh+E0oMwl4PAOgnc1o/kDMRcvleJM/51gT
	 EOzQYsZSxwohpABz40cn6y/c8F93+21STyUFN5xU5sPwQBa8B50llCL2gqDpEaJgC10qG
	 9ZtICnvif20a8/aVJR4xxy+XfDiinNTSxw/EFY2np6/tj5O662NSIm1oHU6SVzOP4AFKR
	 1XOXDyb+pEHOo4JwRzS8lIzg35DjvVwvbvNlUWzBv2eB2cvovFOCeJbZeJiGObKzUsu3s
	 hJAlb/WlijJ1MNYva5uGKUOgzmSYesklMHIHv0ozMnhcVBNXcgQtCGXjktOrev9tRig==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789328199;
	bh=0lp8jvkQZ9MgOUHOkfrta2GMEL3ulpKvQRlaB0xbHy8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=H4yTsNUNTM7nKsuFLUq+AkkvHlmtcurQLUFrRk8+MDlOaTOgkopnMKPQMR7P4rg7x
	 7wecheCez4amjGkJFUvG3IimZe75PTNi6Y+Xs9ov0Tu9vwhAt4CaFR3hRlza3DRYgx
	 JSurkqrxf6r28Oc9Gz6vGL8LHpwofPqaUpZ+NU6HNFl3a2TWCm+i7YmC2lVIb+cYgj
	 CHB5rcm78VdKIqnyNDwJdmKi4mac54fsAABWwuv3AU2WsTVr5zF8KMi107TONWWWXn
	 XLCg9gWoHE68Tu3rJPG/xL7+RWCxnfMFu4i/hJvt3N5lx05DW/Ue32B4a/zNe/NCzZ
	 MexPfXq+CtZOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B892280CEE;
	Sun, 13 Sep 2026 19:36:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 72AE4259
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6444B40063
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R1TrVyBQcZrG for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 19:36:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org AE7B240022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789328197;
 b=UvMXcGxGXqi1NvXrDKPQ4Llyz1/iaH+KsFOIHQAQieLqq7X1dSoorozzcBXdQXYi6J+b
 oemyJhI6HHVskL02mTVcght7dVXUjwjJ6PI1bnK7sYNIdaYyELqyHS0xW8+VCkTUD0L6c
 r65OT/zyFQ5u8mkm92cZXXnarMQ4eM/W2jh50PrLuRo1QNtD3KYYUA5zlg0lBmL7Bt5tW
 30/882MjtREcK7RKSXHeNe2B/YnGWLKCK/CZtOPAdt2HqZVGsfhAVrorjPCDjPReKfY/W
 CWA77YVJiyfV4qHhyZc+pyZGNOj9zuNCPwX84YAS25+5iKDL2FYDXonBMaZqkstz8zA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789328197;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=Um1/nPsXD9XQN8MpnE+ERQ8rREdu3TfLlH8LhOaTzyY=;
 b=Sw9vkDD75PEcS7iBRjRpw0+tbjWaH3FwYa1zcxGZNVA5AciYdRXyPvq2Yp5l3bmQWEhz
 va6EEya9fZO/EGFtMp1XrDN6elvY1z/X6lL+PvlxxP+WnmOtwwIL/Rya9UADWgwtjB2BC
 YbHxr2+PjviF0c6VI7A4+tDxZo3ldMM4yXW0zmvpN68FUxnXdNMU1vRqSGWZGpGrtSfej
 WVgmqA102Jz9tTuhpiV5NmAdrg08AbQ4ZbBEJgGTttqP+VxjHhG52omm1vZwb9a0MXuoR
 XaaJlGwBf3Vj5m6/IVZr9Xf2J16Zs1XRT1Wm+AY1YMcf0MQ+QSocMiR1fkLXzYPqVPQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=R01jgFKX; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE7B240022
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:36:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 5BB812003B4;
 Sun, 13 Sep 2026 21:36:33 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 21:36:33 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 21:36:33 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>
In-Reply-To: <20260913165418.1693180-1-thomas.petazzoni@bootlin.com>
References: <20260913165418.1693180-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <ef6eff065057838ff9169f69930d0273@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/webkit: fix kernel headers
 dependency due to seccomp select
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

On 13/09/2026 18:54, Thomas Petazzoni via buildroot wrote:
> In commit
> 0e2c958e053fae6e33bc7ca230ac4326a6ac5aaa ("package/libseccomp: bump to
> version 2.5.3"), the kernel headers dependency of seccomp was bumped
> from 3.12 to 3.17, but BR2_PACKAGE_WEBKITGTK_SANDBOX, which is a
> reverse dependency of BR2_PACKAGE_LIBSECCOMP was forgotten.
> 
> This commit fixes this inconsistency.
> 
> Fixes: 0e2c958e053fae6e33bc7ca230ac4326a6ac5aaa ("package/libseccomp: 
> bump to version 2.5.3")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
