Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA005C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 19:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1BFF60AA9;
	Fri, 16 May 2025 19:29:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id veO_fcBpIdlg; Fri, 16 May 2025 19:28:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C380B60DFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C380B60DFE;
	Fri, 16 May 2025 19:28:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B636622CD
 for <buildroot@buildroot.org>; Fri, 16 May 2025 19:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BF2840454
 for <buildroot@buildroot.org>; Fri, 16 May 2025 19:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6DBher-6adho for <buildroot@buildroot.org>;
 Fri, 16 May 2025 19:28:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 97E6D400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97E6D400AB
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97E6D400AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 19:28:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E72162003C1;
 Fri, 16 May 2025 21:28:52 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 16 May 2025 21:28:52 +0200
MIME-Version: 1.0
Date: Fri, 16 May 2025 21:28:52 +0200
From: Julien Olivain <ju.o@free.fr>
To: Juan Pablo Montero Castro <juanpablo.monterocastro@nxp.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250516151613.3222736-1-juanpablo.monterocastro@nxp.com>
References: <20250516151613.3222736-1-juanpablo.monterocastro@nxp.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <e744fc71f10e08bee4355acd312802cb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747423734;
 bh=9LCfRWPYXPR7HjTQQZd+OhpDrwIrIZQd2t2Yrfv14iY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ls/XMm3jBwz660i2W9ho6pnE6HNT1dYol1urGbxZs+5ioso05r6RugoADC+Vu7QU2
 nfD9GPtfxdDxDjKW0XGV52pmc9ziMwTTWH1TDhDCDh1IQZBWcwTMHhwynPlUdgeXnF
 YoWH3MXSS8TzeW2jLrEYP5znVvehEKwz0DQVIQ2ZNEkTqM/Oeiwt/7plBwB/O7mrJ6
 khxiKu5uq+v77Rj1R14XtLkvXLSGvLX5pI1VtxuQRq8AVULDpiOP0eHFBAPUbyIaDK
 10QuQC63B4PcfiuLFUQE8u+wJ+h83xI7MLCZnVaotK4yIV0Tqu0OHb85RRUI8MR1rM
 xREnaHeP7cZwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ls/XMm3j
Subject: Re: [Buildroot] [PATCH 1/1] configs/freescale_imx91evk: new
 defconfig
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

Hi Juan Pablo,

On 16/05/2025 17:16, Juan Pablo Montero Castro wrote:
> From: Juan Pablo MONTERO CASTRO <juanpablo.monterocastro@nxp.com>
> 
> This commit adds support for the i.MX 91 EVK board
> 
> Tested on board revision SCH-91080 REV A1
> 
> Signed-off-by: Juan Pablo MONTERO CASTRO 
> <juanpablo.monterocastro@nxp.com>

After fixing few "make chech-package" errors and spliting the commit in 
3
smaller ones for clarity, I applied on master.

See:
https://gitlab.com/buildroot.org/buildroot/-/commit/0645c83cd6a6d2caf1fdc62cbed81023fb509a2a
https://gitlab.com/buildroot.org/buildroot/-/commit/1ce2484a8b11e51e0ecaa23c9ee9e6f1c7702b10
https://gitlab.com/buildroot.org/buildroot/-/commit/4e954bf4bf2bdf9b4d7309c512dce3de38a674e4

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
