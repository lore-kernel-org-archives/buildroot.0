Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F78C8303D
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 16:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 892F1406F9;
	Fri,  4 Jul 2025 16:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4pSjPMxqPsYF; Fri,  4 Jul 2025 16:50:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1B9440719
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1B9440719;
	Fri,  4 Jul 2025 16:50:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D81207AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9C9A83E00
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6-uCYtpPXRtj for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 16:50:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 19EC3822E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19EC3822E2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19EC3822E2
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:50:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id EB98719F734;
 Fri,  4 Jul 2025 18:49:56 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 04 Jul 2025 18:49:56 +0200
MIME-Version: 1.0
Date: Fri, 04 Jul 2025 18:49:56 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250703210124.1519578-1-bernd@kuhls.net>
References: <20250703210124.1519578-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <3217d74f96ec1a3268a01712a089a766@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751647798;
 bh=S/YQl8Jib3i9cN1vOaFZmGsKTUjAKm2ccZSHML/eC4g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Pj0Mgd2siVXCkh1a9iJvy63UysNNFFUxRRmB9haC8PFc1rr/lM7sldl5YezHKNGul
 A9IaRB3LBHoK/IfOUdnBe7jtB5PmX370Boe7g7SfN/KCP0LnRQEHB5pAj5waUiBL+h
 uvtHH7dBbJ20Yw2Yepgzc6aKqQBgBHOIrqjYS6JGfQvOBqWih3kX2nyJGMm+nUARYu
 pIWzJ4hncZWBYufRSaEbtBLh+GF6iYnflTWIAYjuKaLySDesLHTAppcKtW+1KgIEdy
 7eUL3/ERAJW/YW2lCOrvnyndJc08/1PdZFo023/bU6uy4Qy6vH6OE7SI7Po5pPQO7f
 tOuh/QzqSZ6vA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Pj0Mgd2s
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-iptvsimple: bump
 version to 21.11.0-Omega
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

On 03/07/2025 23:01, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
