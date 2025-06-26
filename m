Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1B6C7EE30
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 22:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 678A780C37;
	Thu, 26 Jun 2025 22:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gJF2MzI-qbud; Thu, 26 Jun 2025 22:50:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6D1A819BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6D1A819BC;
	Thu, 26 Jun 2025 22:50:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6304911A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 22:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49C6F403E4
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 22:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUIdX3UpcDmT for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 22:50:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6BB9740345
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BB9740345
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BB9740345
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 22:50:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 45580B0054E;
 Fri, 27 Jun 2025 00:50:11 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Jun 2025 00:50:11 +0200
MIME-Version: 1.0
Date: Fri, 27 Jun 2025 00:50:11 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, Norbert Lange <nolange79@gmail.com>, Sen
 Hastings <sen@hastings.org>
In-Reply-To: <20250626093127.49387-1-buildroot@bubu1.eu>
References: <20250626093127.49387-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <4ecd8d2f33da1c03084c42fa373bd391@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750978214;
 bh=9/wxof3Ew5HuZG2TllWBU/6HtFiaC1LuphtjlYZ6c2A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tdi7wnqjyOQH7q4uxfjIxOqaKS+tEGvjtRewhFL/sjSktvakxWcjUNtd0/EQM5dfO
 BMwCfu8kgQGP9pvT0dUvedUiSPvAKJMsjEUQ8HaDzEQFzB/ba36AgRoCqB34aerztQ
 wzUIxotaJy++ueflwyc1FE7Hg/JRcwT3NRkINWPXj3aGcMF8wcr3VYojnXREk02uG9
 Zsmraxe1xjmTkBZ3jCMcNTwJ9NzVn4gYjIPf33zMo2KM1O/sKAF4Lbyeq/CNklZZS4
 vc0ZWZ+mVxlGNIPmYpbMpWDBeRSKSa9FVY8+VDBEL4V5WLCrkICP7aN4lhTy+hHfNl
 SWbpG2hprV3VQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tdi7wnqj
Subject: Re: [Buildroot] [PATCH] package/systemd: bump to 257.7
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

On 26/06/2025 11:31, Marcus Hoffmann via buildroot wrote:
> Changes:
> https://github.com/systemd/systemd/compare/v257.5...v257.7
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
