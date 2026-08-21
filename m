Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A4FC5DF94
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 16:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E278860A7F;
	Fri, 21 Aug 2026 16:15:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TG3LAHy_8UoZ; Fri, 21 Aug 2026 16:15:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787328935;
	bh=CfD/P2OWhpHpZEP6yqk5OLIatH/FV1erQBGze8/bITg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e7ciXsiFPQyOp2OjjL8hfZLSUD/YI4Raf7CxGBOxZ7asyEpHwk3peMo3/UaCVBsRE
	 tlG9zZPJ49LQkSQ9rTOOs0Icf3INR7yNNr3Fw88Gegme7vR81NKoTgPmOmTBO62MgF
	 Pa/Axnbgyxm/A5jnuOz6HqsR8/Atn02x7DCSdOzK3gSTQBnVnh3ibNCTCKXwZxSKW4
	 LdG+1NPshRcaS3XV/EXxkLBePRUBb5vU/xaYBuFJmnU940MbrQrDY3IhEi8ateq85G
	 4C2N7c+ZzSQP1gBVf3elN+/ENdiny6xGuSHdG3XVg00m0C2IyXDLOKtBiRUiUePcJl
	 pL2iJTf5zkG3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0FE160661;
	Fri, 21 Aug 2026 16:15:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C287B336
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 16:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8EC48116A
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 16:15:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZ2D2pIZht2E for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 16:15:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A97B80ECE
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 16:15:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E34B7780503;
 Fri, 21 Aug 2026 18:15:27 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 21 Aug 2026 18:15:27 +0200
MIME-Version: 1.0
Date: Fri, 21 Aug 2026 18:15:27 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260820204057.3728864-1-bernd@kuhls.net>
References: <20260820204057.3728864-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.18
Message-ID: <1ad3deba7daa5e0fcf4a2950411622f0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.12.x,
 6.6.x, 6.1.x, 5.15.x, 5.10.x, 7.1.x, 6.18.x series
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

On 20/08/2026 22:40, Bernd Kuhls wrote:
> Update the latest kernel releases to:
>  - 7.1.8 -> 7.1.9
>  - 6.18.44 -> 6.18.45
>  - 6.12.103 -> 6.12.104
>  - 6.6.151 -> 6.6.152
>  - 6.1.182 -> 6.1.183
>  - 5.15.215 -> 5.15.216
>  - 5.10.264 -> 5.10.265
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
