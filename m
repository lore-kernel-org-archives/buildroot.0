Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D749C369A2
	for <buildroot@archiver.kernel.org>; Tue,  8 Apr 2025 17:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B11D60585;
	Tue,  8 Apr 2025 17:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FaH96Js70U0Y; Tue,  8 Apr 2025 17:35:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85B47605AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85B47605AD;
	Tue,  8 Apr 2025 17:35:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87B2BD6
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 17:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 739D0820C6
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 17:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dlAcOR50Raqo for <buildroot@buildroot.org>;
 Tue,  8 Apr 2025 17:35:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CC071820C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC071820C4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC071820C4
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 17:35:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id B96966013C;
 Tue,  8 Apr 2025 19:35:51 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 08 Apr 2025 19:35:51 +0200
MIME-Version: 1.0
Date: Tue, 08 Apr 2025 19:35:51 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>, Petr
 Vorel <petr.vorel@gmail.com>
In-Reply-To: <20250407191908.260835-2-giulio.benetti@benettiengineering.com>
References: <20250407191908.260835-1-giulio.benetti@benettiengineering.com>
 <20250407191908.260835-2-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <edcc6aebfa3d02572076ff14170c712b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744133755;
 bh=ao6LLxp27r5OXTm3CRb6zfwh+ltyq0rwt60zxLF2lDI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DtGRo65ndrW/448OOATBfYllVwxo9v2WLL/1t/RsWv0qpONN7lFj6S8dNsH1uCDrQ
 BFeTNmvqbsBJ4whKJNjbtksDcciyPsGLmNiGtankv43KY9gFpQHhg0P/NEw/Rq7tyV
 hqYrfvcoH/SanAa4nkPSwuMdrJ0YG2KWlUFiOQFyw1p1OKzs/76Ss4rIlzG4cbErSP
 ypH1D94xnVNYGxs/v2cBM7WSBN0xE1otZG0VJ933CyH/tHXZBs/E19hggvCsowt8Do
 Kb71pzOzgWNidOYDaCEvwc7hYEoftjEGtWJk1kZUa7VomarV70vuWRGKFfj152mvoe
 9pAW8Fslgz4fg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DtGRo65n
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.8.3
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

On 07/04/2025 21:19, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

I added a link to the release announce email in the commit log.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
