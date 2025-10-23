Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2518CCF9E3
	for <buildroot@archiver.kernel.org>; Thu, 23 Oct 2025 19:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C99F4849FF;
	Thu, 23 Oct 2025 19:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 32doRbG84ZaP; Thu, 23 Oct 2025 19:57:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8FDD849FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8FDD849FB;
	Thu, 23 Oct 2025 19:57:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E5EE19D
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 19:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9085660E24
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 19:57:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FzddcqeJC6L0 for <buildroot@buildroot.org>;
 Thu, 23 Oct 2025 19:57:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C5D0E60D56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5D0E60D56
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5D0E60D56
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 19:57:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 6956719F59C;
 Thu, 23 Oct 2025 21:57:24 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Oct 2025 21:57:24 +0200
MIME-Version: 1.0
Date: Thu, 23 Oct 2025 21:57:24 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20251020203428.2751864-1-bernd@kuhls.net>
References: <20251020203428.2751864-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <7ea04f939fac66de403e15f169e7743a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761249446;
 bh=1I282vK54yuD/DjJvY+CBitcpjq7kmszdcihnOtqxJo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hAMZg2JjlId8oTq7w+sDhPYW9YNfQdTa3wk0mzL/pMWx2pHAI7ugG5qm6tlPCRcYA
 0V4y977RYzcPYKdDM0Htgvl9ZdzPAsLnPh86freU65WIxrETfTP1nPCXYbsRfKJPBp
 IRV43NabHmhLIUvZgJhit1gpXASy7H/Y3DPeJ1IcsCx1727HmwgvocNp0zbru5rtZC
 g6Crr279Fxo4ee9aVTGOqr6LwC22qUigym/I7XY5lZOgQolj7U7w5gAf4Vf/bupZHI
 8ojbvPtp0TidhqONuNGHr9CwQx+oqsZwg9+t3D5M7HQkVvtStauH5g6hzRxKxNht0K
 ZfTO2IOK7xEIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hAMZg2Jj
Subject: Re: [Buildroot] [PATCH 1/4] package/i2pd: bump version to 2.58.0
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

On 20/10/2025 22:34, Bernd Kuhls wrote:
> Changelog: https://github.com/PurpleI2P/i2pd/blob/2.58.0/ChangeLog
> 
> Needed for bump of libminiupnpc to version 2.3.3:
> https://github.com/PurpleI2P/i2pd/blob/openssl/ChangeLog#L176
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
