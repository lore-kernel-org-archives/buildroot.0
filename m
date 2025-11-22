Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2F6CFC538
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 13:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7B8E42A79;
	Sat, 22 Nov 2025 13:37:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6SDASJwlifs; Sat, 22 Nov 2025 13:37:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 308D942A60
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 308D942A60;
	Sat, 22 Nov 2025 13:37:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 99B4A34E
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 13:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C1C460A80
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 13:37:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7p56CcHsglnJ for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 13:37:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 79E0960647
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79E0960647
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79E0960647
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 13:37:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id C8A0A7804FD;
 Sat, 22 Nov 2025 14:37:38 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Nov 2025 14:37:38 +0100
MIME-Version: 1.0
Date: Sat, 22 Nov 2025 14:37:38 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Daniel Crowe <daniel.crowe@maxmine.com.au>
In-Reply-To: <20251122115500.3779137-1-bernd@kuhls.net>
References: <20251122115500.3779137-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <f60aa75b613a27d3ba91630afc4e98a7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763818662;
 bh=QXHjm2PqVRWEGL9C5jxoVh5i4u5LuFL8OVudxSEDzMU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Hz+bDGAdmlCiGRe2lH7OSyafn6n1dvKMoYgLsrQgEaPTrJTwxcx93FuvXngq8ieGC
 EX1sm5dAr2AJe7F9wydB2Crdpx4FG3IEKRoRk1xAfEhwzilMvKR/5MZHerm1FO46yr
 tSEMJpCXSXpf3lAAHPd5/7tjOHH6jpgg5FBVHTJzwHHWBEhvSN1cIbrjSMiy/D6Bg5
 drXPg7lb2ICB5dTusqA3M8uy/kkaBJgfX9LoLAO42VhcaSVI+BnV0mIWt3SVaoaceX
 /xs65z4PRMfdWpxZu5DtLzHmiHjeWndp3r/QJ4YLE51MPPNM2cSxjtc+NlxfvO9+cc
 i8LvH+iydDkhg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Hz+bDGAd
Subject: Re: [Buildroot] [PATCH 1/1] python-flask-restx: re-add dependency
 to BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
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

On 22/11/2025 12:55, Bernd Kuhls wrote:
> Buildroot commit 2ecb2d2847701795d384ee9e4eaeb0669dcc2bef removed the
> dependency to BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS while still
> selecting packages which depend on it:
> 
> WARNING: unmet direct dependencies detected for 
> BR2_PACKAGE_PYTHON_JSONSCHEMA
>   Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && 
> BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n]
>   Selected by [y]:
>   - BR2_PACKAGE_PYTHON_FLASK_RESTX [=y] && BR2_PACKAGE_PYTHON3 [=y]
> 
> WARNING: unmet direct dependencies detected for 
> BR2_PACKAGE_PYTHON_REFERENCING
>   Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && 
> BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n]
>   Selected by [y]:
>   - BR2_PACKAGE_PYTHON_FLASK_RESTX [=y] && BR2_PACKAGE_PYTHON3 [=y]
> 
> Seen with defconfig:
> https://autobuild.buildroot.org/results/ebf9a81f7e225ecdab20bbad8ad8daa136fddb46/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
