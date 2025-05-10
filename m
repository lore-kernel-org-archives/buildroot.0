Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CC2C3ABC9
	for <buildroot@archiver.kernel.org>; Sat, 10 May 2025 21:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1624608F4;
	Sat, 10 May 2025 21:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FQxUimkJX_AX; Sat, 10 May 2025 21:20:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA3C6608F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA3C6608F7;
	Sat, 10 May 2025 21:20:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BECAE2
 for <buildroot@buildroot.org>; Sat, 10 May 2025 21:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CEB483168
 for <buildroot@buildroot.org>; Sat, 10 May 2025 21:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ZcAEon96hyC for <buildroot@buildroot.org>;
 Sat, 10 May 2025 21:20:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 50CCB83148
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50CCB83148
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50CCB83148
 for <buildroot@buildroot.org>; Sat, 10 May 2025 21:20:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 239B213F854;
 Sat, 10 May 2025 23:20:32 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 May 2025 23:20:32 +0200
MIME-Version: 1.0
Date: Sat, 10 May 2025 23:20:32 +0200
From: Julien Olivain <ju.o@free.fr>
To: Patrik Olsson <johan.patrik.olsson@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250510205029.456321-1-johan.patrik.olsson@gmail.com>
References: <20250510205029.456321-1-johan.patrik.olsson@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <d48331df91f95f4aa6303e3dc88bb5f8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746912033;
 bh=YxPKUXCOU5JN4H3icaqyqPf/B4GKaST/b6Z3QAxn/No=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UXoTvalm9tKwusD5zng/tlmdOFTiVP+JjYB2s//mxxy4fdT179RP2IMyAAqRn9Qwu
 pTw7L0pL6MZpfpX8zSGAPC8vXPRdMetbdi2O5tvW66coWZf1+Dc7MRp0ZDN9+DB4Bs
 QIGOH9LK1vwHc1GZ0yff0Ey76IhAv8M9UmnQZDKoOI2VrlLjJ2VQs2wjq9ROTIyREM
 NtEHoGq1/vFRJ363njcpa19U8GigFCNvf7NkXjKLrEWrr7U7XjNuljke5m1SKGY4Mn
 4Qnqt/zce2kBb6UQ+QAw1cKVywZYF3QXj9PYzG4UAS0KRi9nwMMxtPDtZzr7E21klO
 /liTs5x6kQaxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UXoTvalm
Subject: Re: [Buildroot] [PATCH 1/2] configs: rock4se: use Bootlin toolchain
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

On 10/05/2025 22:50, Patrik Olsson wrote:
> This moves the defconfig to the Bootlin glibc stable external toolchain
> as per[1].
> 
> [1]: 
> https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs
> 
> Signed-off-by: Patrik Olsson <johan.patrik.olsson@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
