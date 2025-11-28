Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC37D116F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 20:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4A8E60BED;
	Fri, 28 Nov 2025 20:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6CeHDDPLkjVe; Fri, 28 Nov 2025 20:23:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 225CF60ADA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 225CF60ADA;
	Fri, 28 Nov 2025 20:23:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 611D51A9
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52CAC80D16
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FbBz5Ns9Jk7A for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 20:23:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 52CF080BE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52CF080BE9
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52CF080BE9
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:23:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 84D3A780333;
 Fri, 28 Nov 2025 21:23:25 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Nov 2025 21:23:25 +0100
MIME-Version: 1.0
Date: Fri, 28 Nov 2025 21:23:25 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251124171531.3131732-1-buildroot@bubu1.eu>
References: <20251124171531.3131732-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <9d29040156a8fad9f3163bca671d3c38@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764361407;
 bh=65KBbmkrdZkvaUfWxxVYOY9yDwM/9klDEu/WQjz8zZs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vNqzhtCK1M9etef6Y9os79xt7J6zFYM8EIPQCZoQe4dVsA8aBAQRTCqw9YUi2evtY
 bjYUBjZMaoWjsYLr4JSEOZ730TLGvfq2H/IkDIq5JvzsF/TWpx3Ri3EBdDl6Zf0tDH
 23G+xoxLlSibPO+AXWEhqcbvzTU8VpRGIljkvrkhURQ3gtZJoK1BJm3Qhyq2dpF5uC
 FPyf5zKOwa2cbg3EjOfBaxbZbimLyYhNnCLi9Kr0WhFVTz85ojnoKUhc3zd5WanLv0
 sVby60xXWgcKTYrM8PMkiolJTDGeYmME6KyvFbFoB+CnbJfvEejaHbZtlGndhb04F3
 plM88aSzSCRrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vNqzhtCK
Subject: Re: [Buildroot] [PATCH] package/python-wrapt: bump to 2.0.1
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

On 24/11/2025 18:15, Marcus Hoffmann via buildroot wrote:
> Changelog: 
> https://wrapt.readthedocs.io/en/latest/changes.html#version-2-0-1
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
