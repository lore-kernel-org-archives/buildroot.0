Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F72C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 09:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF226612E6;
	Fri, 16 May 2025 09:33:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u8aIXeEVZwGL; Fri, 16 May 2025 09:33:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57BA361286
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57BA361286;
	Fri, 16 May 2025 09:33:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 09393185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 09:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE9846125C
 for <buildroot@buildroot.org>; Fri, 16 May 2025 09:33:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T41UWrQP8lQ1 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 09:33:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 364C86124D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 364C86124D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 364C86124D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 09:33:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D98AB60132;
 Fri, 16 May 2025 11:32:56 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 16 May 2025 11:32:56 +0200
MIME-Version: 1.0
Date: Fri, 16 May 2025 11:32:56 +0200
From: Julien Olivain <ju.o@free.fr>
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, thomas.perale@mind.be
In-Reply-To: <20250515102716.2989377-1-titouan.christophe@mind.be>
References: <20250515102716.2989377-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <bf6eca59c6d3c6aa16a552da78a24439@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747387979;
 bh=ATgQDqPmF0834yHb6Ra1GwzHbX97NCzhQN9HkOkfI8o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eA8fRDyTQ2o9DDwNFxT44M+ZVrne9umwcKDHHg56ZTV+CsW/uUdOB2mXeP9EO016O
 Ljry2KgULo/Z0QJkxJ979x6Ljc3SMaUiv4hYTqcuXGwAuGDMpIxb2rh/pY2vnKciE+
 v1zVEiAhOpHYt04ptv/1IrTit1u8RctcE2fpjD5eYL/KOFrJdxMSPLtT0+3/YTEJaS
 Xlgo9amR3bBBr3E/WFOz0VPMc019ln8wkvlihDIJCICGJ0Ccf4SS3Y9zpd/XqxQXCk
 19k6Ry9x90ci3WCUM5nvxUczTxS4TOEvI8mIOSLj+wJ7n0iXEUGkMEuDanDJWkuBNY
 mbNGlSvswS32Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=eA8fRDyT
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/openssh: apply
 security patch for CVE-2025-32728 (sshd)
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

Hi Titouan,

On 15/05/2025 12:27, Titouan Christophe via buildroot wrote:
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
> There is already a pending patch to bump OpenSSH to 10.0 on Buildroot 
> master,
> but this probably won't happen in Buildroot LTS; hence this patch

Even if you marked this security patch "for 2025.02.x", I applied it
on master.

The reason is that we try to have most of the LTS branch patches
cherry-picked from master.  For that reason, we apply backported
security patches on master, then we bump.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
