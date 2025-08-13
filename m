Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1F1C87FCF
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 16:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF5D860B5D;
	Wed, 13 Aug 2025 16:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qbtrS8NjmIC6; Wed, 13 Aug 2025 16:23:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33B5B6065F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33B5B6065F;
	Wed, 13 Aug 2025 16:23:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A73CB1B5
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98BCC60664
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:23:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yf3UbYRpSzr9 for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 16:23:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9E7636065F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E7636065F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E7636065F
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:23:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id A136E6013C;
 Wed, 13 Aug 2025 18:23:21 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 13 Aug 2025 18:23:21 +0200
MIME-Version: 1.0
Date: Wed, 13 Aug 2025 18:23:21 +0200
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250812073351.1205506-1-nemaakhilesh@gmail.com>
References: <20250812073351.1205506-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <8feb34cd59668626ca924e7f5c6b3b1b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755102202;
 bh=3785EfKFWoCjicm+s+6QRdnXXck1x1XwnRH2oMaDhK4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XHQWvoY9Iu+AiXYL6E836gDrlWpeAXq7Wtvze/Bi4ZKBCs0kHFqd0UzDLnAFoB2Yt
 dTCC0qc4SWQGJhLPcvAtqqQyF5ZMWU7i5x0iWVONkcFvi0Gh7kvbd7BWv4jWP1CCwK
 ReCdZBTrVpPfkbYqRF8KY2QZyiVc3pM5NJMc42ymBEuzo/44H/BuhFiP3x+BGy67Pc
 n81d9LxJAzIE37FTQzWXbMQMsIGd4TKjz2u28cKUbdOGZ8lkPOaLDa9DQeRlQmL6vR
 EwxxEuamOZwk7dQXwDfqdvaL+tGFw1PT1uGp2UaknmG4rHN1CLpGRi196d8q0xoqJX
 TsQQ3eYHE0o9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XHQWvoY9
Subject: Re: [Buildroot] [PATCH 1/1] package/libwebsockets: bump to version
 4.4.1
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

On 12/08/2025 09:33, Akhilesh Nema wrote:
> Changelog:
> https://github.com/warmcat/libwebsockets/compare/v4.3.5...v4.4.1
> 
> LICENSE hash changed due to multiple updates.
> 
> Drop the upstream patches listed below:
> 0001-lib-tls-CMakeLists.txt-fix-build-with-pkg-config.patch
> 0002-cmake-upgrade-everyone-to-3.5-minimum-version.patch
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
