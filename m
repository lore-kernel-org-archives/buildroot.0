Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9935EC54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 14:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3375040852;
	Sun,  1 Jun 2025 14:49:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUETbZUNlKFY; Sun,  1 Jun 2025 14:49:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7407740854
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7407740854;
	Sun,  1 Jun 2025 14:49:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B5E9D127
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 14:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C51C60B2B
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 14:49:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yo0NuAKCUVpJ for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 14:49:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9D7C860B0D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D7C860B0D
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D7C860B0D
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 14:49:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 0BB6D780507;
 Sun,  1 Jun 2025 16:49:23 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 01 Jun 2025 16:49:23 +0200
MIME-Version: 1.0
Date: Sun, 01 Jun 2025 16:49:23 +0200
From: Julien Olivain <ju.o@free.fr>
To: Stephan Henningsen <stephan@asklandd.dk>
Cc: buildroot@buildroot.org, Stephan Henningsen
 <stephan+buildroot@asklandd.dk>, Fiona Klute <fiona.klute@gmx.de>
In-Reply-To: <20250531212436.2788813-1-stephan@asklandd.dk>
References: <20250531212436.2788813-1-stephan@asklandd.dk>
User-Agent: Webmail Free/1.6.10
Message-ID: <20e8a05082caff87415c094276b9f378@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748789367;
 bh=I2q3+XS063LuZHln14h9N/roI3zuFKu9bCWlLXHG70Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d/sH7Yygv07gqrAw6cJmqRRf6Oge5X/Hrni1Z8n/cbeCwu/aeITp8u7a0SaPQ6rN1
 GqvGPP8n/YMpYSAg4HofSMnCfmw9Hu35O+029IKjqudBULXvkHNeEh/VROO7swJymN
 VdrM8uHrnlW233XSC88esBQiJIGUoTyN2SULfpzumbsZlOBMUOAA5wVSTF+3XmcRAh
 ec34cMJv654Lzqa+ZsaYUI9sphotmVJ/CMBwirWPr/O7ZO0Sqa7TbBrR/GOjlZ2A5X
 DaZicxAisCJSwEW2tgdUBz6Z1dKruN79eIUj5CAaNgQC3qUDn2H1qgnhtt2npdWOpH
 G74vuTDdshBPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=d/sH7Yyg
Subject: Re: [Buildroot] [PATCH 1/2] package/busybox: fix path for crond
 binary in S50crond during stop
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

On 31/05/2025 23:24, Stephan Henningsen wrote:
> From: Stephan Henningsen <stephan+buildroot@asklandd.dk>
> 
> Signed-off-by: Stephan Henningsen <stephan+buildroot@asklandd.dk>
> Signed-off-by: Stephan Henningsen <stephan@asklandd.dk>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
