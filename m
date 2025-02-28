Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDACC282C5
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 22:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56C8183C06;
	Fri, 28 Feb 2025 22:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EKfuOVf-CoWz; Fri, 28 Feb 2025 22:39:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC56D84F7D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC56D84F7D;
	Fri, 28 Feb 2025 22:32:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 933E768
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 22:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 222984525D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 22:19:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ouO9D74jsTpW for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 22:19:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D25AB4FEDE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D25AB4FEDE
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D25AB4FEDE
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 21:58:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 1B5B419F522;
 Fri, 28 Feb 2025 22:58:12 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Feb 2025 22:58:12 +0100
MIME-Version: 1.0
Date: Fri, 28 Feb 2025 22:58:12 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250227185538.3305700-1-bernd@kuhls.net>
References: <20250227185538.3305700-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <390290c5ebd98ec098e1248b41508262@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740779893;
 bh=uVuVCYAdM3sc4Ilz3MbSFjD0Q2ttCeIAPKdntIjraIM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UQ1Xz0GwyWUTQCVY5SW6g0+VB9ZTlq7Ed58LHIVHTAgN9nRmS2UNzCO2obPEsvzL+
 BRliPQZ0//jK047sFfxna71TqLgm95V2QuHgJX/48aQo2pK9SbzwqAIKIl7fUqXisz
 4mXCFqO9olUCBEJS47UVX5Xn2HDLf/al2KM6CcO0r/GCmlVLByErJzF7Kk0MMb3+kM
 loMbDsPnGFJ7xY+WV76T+o9bL+p104vky9kHpYxMCb7UC7V8KemN7uDq85Cp9PDi/d
 S57RWLK9NVLuA7NPfRWS4SuXbhDRul0ILSY5Q772L09xtY6fn5yvUkBiAFAv00wUt3
 D2N7JumU5mZxA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UQ1Xz0Gw
Subject: Re: [Buildroot] [PATCH 1/1] package/libcec: bump version to 7.0.0
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

On 27/02/2025 19:55, Bernd Kuhls wrote:
> Release notes:
> https://github.com/Pulse-Eight/libcec/releases/tag/libcec-7.0.0
> 
> Removed patch which is included in this release.
> 
> License file was renamed upstream:
> https://github.com/Pulse-Eight/libcec/commit/da640961528178e82a447038446db4afe31a899e
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
For info, I also updated checkpackageignore to fix a check-package 
error.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
