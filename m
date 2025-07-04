Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECB4C8303D
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 21:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E02B41207;
	Fri,  4 Jul 2025 21:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iCTBXmNfqOfr; Fri,  4 Jul 2025 21:17:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C02341209
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C02341209;
	Fri,  4 Jul 2025 21:17:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E430E7AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 21:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C97AB83F23
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 21:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KiQhCzvk_coF for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 21:17:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 01E1883F22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01E1883F22
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01E1883F22
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 21:17:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0694C19F593;
 Fri,  4 Jul 2025 23:17:03 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 04 Jul 2025 23:17:03 +0200
MIME-Version: 1.0
Date: Fri, 04 Jul 2025 23:17:03 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250704165758.3784635-1-bernd@kuhls.net>
References: <20250704165758.3784635-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <ad4076a044cc6ffe38d3831a077358ea@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751663825;
 bh=cZlqQcJ4YxYBUbbin/a+e8T3TOaEeTINDfwLalhZtJU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ey4MtjH18eut2kE0h6R4S5sYV5aX3s84rZHsK3OO06LLtfCVR5IMYHs6xwuTsMekP
 G1P+ODvATYEJlxPxLE3yZpfzCC5M+Tw0Evx5ejxvhIT0OHs6VVfRnhKH8XtpisimjW
 a+omD6VKNsAWDRHqXE7GRZS06A+mBaF1tY0urIh8YybHrcZ4GCpG2ayx5WZBawUNKm
 CBvtAS6+nvpqikOL95StHKQ4nwFh18eGVOMk2PXNjbUs0efRNIygSizW68zV9gK51I
 E5/BmDpKFd1+evIPjbIZkpKOr0de/g9AQvcigy765NWM1xA0Z/qLnxFpw+9ouRVaob
 tsTQ+p/n+URtQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ey4MtjH1
Subject: Re: [Buildroot] [PATCH 1/1] package/opus: bump version to 1.5.2
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

On 04/07/2025 18:57, Bernd Kuhls wrote:
> Release notes:
> https://opus-codec.org/release/stable/2024/03/04/libopus-1_5.html
> https://opus-codec.org/release/stable/2024/03/04/libopus-1_5_1.html
> https://opus-codec.org/release/stable/2024/04/12/libopus-1_5_2.html
> 
> Updated license hash due to copyright year bump:
> https://gitlab.xiph.org/xiph/opus/-/commit/254b5ee7b2e7c89aaddbf7a994fea0563842873f
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
