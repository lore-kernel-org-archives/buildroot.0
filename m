Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27614CD4F3E
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 16:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED72B40523;
	Sun, 16 Nov 2025 16:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RoZnSNeb6Gqc; Sun, 16 Nov 2025 16:50:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC7CE4047E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC7CE4047E;
	Sun, 16 Nov 2025 16:50:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8451E158
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 16:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A69B813C5
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 16:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uw2cm5L1OYjE for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 16:50:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2FA688135A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FA688135A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FA688135A
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 16:50:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E055813F88F;
 Sun, 16 Nov 2025 17:49:58 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Nov 2025 17:49:58 +0100
MIME-Version: 1.0
Date: Sun, 16 Nov 2025 17:49:58 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?Q?Jan_Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
In-Reply-To: <20251115182110.464345-1-dario.binacchi@amarulasolutions.com>
References: <20251115182110.464345-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <04a67a4a75af04980d44f3873829cb8b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763311802;
 bh=PP/2Qsy9mFu+avxMMtzjB1fhbQoStPlFTn315p23sOQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qONkGOEKhQ92ZJTNSMiWQUMt5ZfsZ1bxOo3bqvanS0MfnIdI7I0DtqCsf4A+Lkmkp
 TmCg2rq5HxV4rHhTRpDkkkYQ2NRh8XWkzBF4G4fFAfGRGKDxXGPxAcCmR8DEtzrjNn
 4S5erwAcCoa08H7RcYFaF9iV3g5G0FFDmZYQExF7AZG2dvAKYb9DfmiBhtb+M+X66N
 6YodcBKhFg7HXKoEv/9m+lxFgJIJ17vpRHMrTwT8mSn1KasES9lxLnjwhlwL9+LUpE
 5AVle/sYe+CWZG/tqJHSabpJ9Tg9SCZHL5L8t0rwmWYccKOy1Qbkmdd4s94Ya5XSOi
 CnBQ582f40nxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qONkGOEK
Subject: Re: [Buildroot] [PATCH 1/4] package/libnetconf2: bump to version to
 3.7.10
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

On 15/11/2025 19:21, Dario Binacchi wrote:
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Series applied to master, thanks.
For info, I added links to release notes.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
