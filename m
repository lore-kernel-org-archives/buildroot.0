Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E95CFC539
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 16:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B91CD40B98;
	Sat, 22 Nov 2025 16:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6EnttElzz5K4; Sat, 22 Nov 2025 16:30:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 697B240B5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 697B240B5B;
	Sat, 22 Nov 2025 16:30:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CFD1350
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1447383C7A
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HRB9t4v4HPiB for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 16:30:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 486AE83CF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 486AE83CF5
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 486AE83CF5
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:30:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id A55CE2003C3;
 Sat, 22 Nov 2025 17:29:59 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Nov 2025 17:29:59 +0100
MIME-Version: 1.0
Date: Sat, 22 Nov 2025 17:29:59 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251122124909.2229139-1-bernd@kuhls.net>
References: <20251122124909.2229139-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <1b28f59255f52a34783c3ab3e20fe5cb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763829000;
 bh=XU1E0ZsDBMqfe2eOobMaTiFA1NfU+xM18Y5iNIMhKCs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nWRX7jboUovN4BWZPpelfTRzrll6Ij+OpGJoB9PjuAqCx6uBygLL2yVZtawHfB/Hd
 jaqdbc+E5EDen1IMvgdJwufoj5R2MblofSKSuZDsgovjLT6aIU61HFJPpRYmP6GKy6
 /hYzrahN4xxz/UlX7KUZqH5IxuGPbfmupGuNf+3lOQF98Fo5aKcktQ6Q4izgwizAv+
 olmECdPW04QJxq7fUZxR482BjWZUI1btGNSPT5GGBTg9QLtFAVc9USvxBUhSCxfxYs
 susj541iaz44HGLFQmk3hf1ENpd6kWM0V+LoXex2OKV9sEQRyBdA6FYIGn3Y+v36WZ
 6hI8n0tvhySEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nWRX7jbo
Subject: Re: [Buildroot] [PATCH 1/1] package/open-plc-utils: bump version
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

On 22/11/2025 13:49, Bernd Kuhls wrote:
> Changelog:
> https://github.com/qca/open-plc-utils/compare/1ba7d5a042e4e8ff6858b08e113eec5dc4e89cf2...46c3506453c15b873fd6ed3e76c9872cea5e143a
> 
> Upstream commit
> https://github.com/qca/open-plc-utils/commit/cbf52f68b5e2ab0c4071600ab34126120e54f5cd
> fixes build errors with newer gcc versions.
> 
> Instead of adding this patch to buildroot we bump to HEAD which also
> includes other bug fixes and documentation updates.
> 
> Fixes:
> https://autobuild.buildroot.net/results/c74/c74730bbadc9ba20cdccf448dbc508d0afbabf41/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
