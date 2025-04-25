Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EC3C369D3
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 19:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A81C640949;
	Fri, 25 Apr 2025 19:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUDJ196zpiPC; Fri, 25 Apr 2025 19:17:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D55C840847
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D55C840847;
	Fri, 25 Apr 2025 19:17:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA5C8159
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 19:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 912EF80F8B
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 19:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1oXFA9TiBQio for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 19:17:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F40E680F48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F40E680F48
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F40E680F48
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 19:17:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A393278034D;
 Fri, 25 Apr 2025 21:17:06 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 25 Apr 2025 21:17:06 +0200
MIME-Version: 1.0
Date: Fri, 25 Apr 2025 21:17:06 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?=
 <jezz@sysmic.org>
In-Reply-To: <20250425170107.1110426-1-thomas.perale@mind.be>
References: <20250425170107.1110426-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <b662304d7c9b5999876aba7cd8b28b43@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745608629;
 bh=QGffThR/wLgW9vo5hweSgKep6nCYRI66OpIAo/QEtto=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iPXWmQnvCkPpFZcLLnHuc6JQWtT1tAgLCnB2D+mYR/GGlYP+0JSQllORUcqJLBVBm
 gpCq2Wu0JvKpU3VipKQ0IIXpazZ3FdtrRFM7TrzER1ZUPb3PZGxTOq0Uihj3Uvtxj2
 jaXdAzxJQj+3WmZjuZuLRVTYlFF5zoV2EZ/QKhwFUrMo6s2UuEl08tW56duP63BZIG
 PBTvZGQMKqrQ1x4DaUb6MXosCLhk0V/ACFNWXx8hl8WhizsoGeVcwOTMGGq4JCWO1E
 8gZK8pwJv4MlmSvWkKqE+gmk7rPTRDF7Wg17ImdRtco1Ej6NVLWIkxVT9XiObp7rwI
 1kNqiY6C50A3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iPXWmQnv
Subject: Re: [Buildroot] [PATCH 1/1] package/strongswan: fix build w/ wolfssl
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

On 25/04/2025 19:01, Thomas Perale via buildroot wrote:
> The package strongswan relies on the `wc_RsaKeyToDer` & `wc_MakeRsaKey`
> functions of WolfSSL. Building this package with the WolfSSL backend
> by selecting the variable `BR2_PACKAGE_STRONGSWAN_WOLFSSL` would give
> the following error:
[...]
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
