Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C367C369D5
	for <buildroot@archiver.kernel.org>; Mon, 28 Apr 2025 19:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10B51812CB;
	Mon, 28 Apr 2025 19:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2yrx0ciH3-WX; Mon, 28 Apr 2025 19:48:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F3EF812C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F3EF812C3;
	Mon, 28 Apr 2025 19:48:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE2E313D
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 19:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94A7A812CB
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 19:48:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eDyzpwh6PNDN for <buildroot@buildroot.org>;
 Mon, 28 Apr 2025 19:48:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3EEDC812C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EEDC812C3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3EEDC812C3
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 19:48:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id B97C313F861;
 Mon, 28 Apr 2025 21:48:33 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 28 Apr 2025 21:48:33 +0200
MIME-Version: 1.0
Date: Mon, 28 Apr 2025 21:48:33 +0200
From: Julien Olivain <ju.o@free.fr>
To: Titouan Christophe <titouanchristophe@gmail.com>
Cc: buildroot@buildroot.org, Titouan Christophe <titouan.christophe@mind.be>
In-Reply-To: <20250428132909.878530-1-titouanchristophe@gmail.com>
References: <20250428132909.878530-1-titouanchristophe@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <659eb58b732f6ef90286f949a97bc9b6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745869716;
 bh=k0Bl3vgmNB1MH5mnkiMFvJb2jeFEDMclp1cc1zydgJs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X5QibTOXM5lgMiHwvke/jJtk7bJHY1tbNvg/VQMtAe50JSIwjndLkrALP/0L4vQin
 KIP5uYj4WLveJf1WM78Ketcf/lyUOuw4gRusZb6hoD/+Edy3LcisxDNCsPQwGqgb8K
 akXEzqRFOIL2PFbZe5AcALPIyLVocIoZGhNs6uMDTtJWnNx1ia8BedWsIrcCllv5Hk
 rPM7O/bTNAZViTdq8Z0GJi/UOm1xg5u+quiggfcfIRsYbM85Sll2m6WReLGOhaJvKm
 FFqkBEE0oFrhXYSZnqmbjRsnlVgGo61hfERetz/BvGFzYysUK6Qq21gpDqtWP7Qjzv
 QfxxIstKsogBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=X5QibTOX
Subject: Re: [Buildroot] [PATCH 1/1] package/waf: bump to v2.1.5
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

On 28/04/2025 15:29, Titouan Christophe wrote:
> From: Titouan Christophe <titouan.christophe@mind.be>
> 
> Tested with `./utils/test-pkg -p ntpsec` (ntpsec is a waf-package)
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>

Applied to master, thanks.

For info, I added a link to the change log.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
