Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DC1E83837
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 20:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 916AD60E0B;
	Mon, 16 Feb 2026 20:53:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id inFj0GXSKo-1; Mon, 16 Feb 2026 20:53:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEB8460725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771275232;
	bh=aIYrjCgWvomoOcrSlr+Ulqy6qse+CTsQLf1KyyLFIzQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r8G8THk/5D9dOrdhre6UHSaRsh6oiYuB1RvDcBbHsVZfS6fIXtuzXi0mScVCyQ6tu
	 92dfq0MDgoNkqmqZ2htnI8pjmMonLrr6Qj8bufB81yQ9EDFh32mX2EnOwx1qQQtJrE
	 GGfwVhyNFDSOhfGLHewyRLOgDRNG6zp6eqCcLSycTqcJLNz2i9YQvF236TtUw5wnSC
	 6pfTVMwbShKUYhNZtwJ2UgchjJx2YZv8wPLDjhHK9wOkSzsXIrakcIHJISRdLmlgsz
	 6aRvU0vj6RUWBUAO3DDZdzjO99ypMcl1RIr4BL1qJl3QaNhDbjJCQ4Dyxp6Ux3n5QO
	 W5tOsCdjTme9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEB8460725;
	Mon, 16 Feb 2026 20:53:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0946535B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 20:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAE7283C76
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 20:53:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u1-pzW2aeBhN for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 20:53:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B162F83C72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B162F83C72
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B162F83C72
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 20:53:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D4A1C5FFB1;
 Mon, 16 Feb 2026 21:53:45 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 16 Feb 2026 21:53:45 +0100
MIME-Version: 1.0
Date: Mon, 16 Feb 2026 21:53:45 +0100
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <731645eba72ecb0cba41a28b5faa257c3db0c2bc.1771235650.git.yann.morin@orange.com>
References: <731645eba72ecb0cba41a28b5faa257c3db0c2bc.1771235650.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <e0b07fa7ca77dd97eba77ba619c978d7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771275227;
 bh=T6/P1YiNP7y/ITIG8fRWOiKa+nS2+UO0D7ia1dlWymM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jjN6EmypQU8SHgDpxH7bv9v7zTAHAsIpz9EOG+MdOKrepYEJ9uGh+3yY9cQ43ogMG
 NRk/Y3dJ9japad7EeC17yB41nn9fPQ6Ws2/AnW/fea0qzNIGKMNI6EVblRjnhpQjVW
 ojvOEimsx0TtRKutQmPxosxW7tdslDoL7JGEZo+baxnPTP4n+wVM0CpTE+paLdz194
 Y2A3fGaND/D6QjfShH+72hZn6+IczO08/Q5PybvdLGA9LCc07z6VF13IqsxM4NDIBI
 /572hAXZu+wdXo8dKdGR9PX2HH7HAP8vRW554J6SWytueMEJVpShYfInrGOiDFOn9m
 JKwHiiBJbJf6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jjN6Emyp
Subject: Re: [Buildroot] [PATCH] package/skopeo: bump to 1.22.0
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

On 16/02/2026 10:54, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Release notes:
> https://github.com/containers/skopeo/releases/tag/v1.22.0
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
