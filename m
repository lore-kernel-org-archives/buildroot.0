Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67761C282C5
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 23:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F91E60B11;
	Fri, 28 Feb 2025 23:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZvVX4TFJdc51; Fri, 28 Feb 2025 23:27:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52A5270373
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52A5270373;
	Fri, 28 Feb 2025 23:27:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F9461CB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 404A440513
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:27:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJx4e-oCWSqC for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 23:27:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 64433404B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64433404B6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64433404B6
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:27:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 23CAF13F861;
 Sat,  1 Mar 2025 00:27:41 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Mar 2025 00:27:41 +0100
MIME-Version: 1.0
Date: Sat, 01 Mar 2025 00:27:41 +0100
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250205203354.95410-1-giulio.benetti@benettiengineering.com>
References: <20250205203354.95410-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <fc0a23cc3de4b70ac7081f6aaae36a2a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740785263;
 bh=t0QEkWOouOQLfOj6fiE4WT75Equ4Xbx6lS18SoF5RAI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k958P/iwRrmPJw0n42fDGH+B+0wxT7RQ2Sx6Sc0mS569KIQdUKApI+VDWH8PwPunU
 oFlt3CklsgLPPXjeOZaRMdfcwwwtQr8ndCnN3smwp8FL6JuFRHvtHqFSLjSInrJVQR
 gcJzaMS2sEjvISpQ3viGW7Ttl6EJA1cdkmAdCL73qPR+iosQzcgztYhfLzRIdm15LN
 JFO9otC842pqWZeKH38bT0JLTA+GbBT499n+Mj7o04UBxo2DJdIveQQo9/Yuci4+Eo
 tiiInoXpoe/P5Ewz1d8M6uE8cnbBg5g7ldMd8XARJdO4fq+pZ35wM54QPilO2vagaY
 UiQcc5X1xCocA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=k958P/iw
Subject: Re: [Buildroot] [PATCH] package/rtl8192eu: bump to 2025-02-03
 version
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

On 05/02/2025 21:33, Giulio Benetti wrote:
> This version allows to build with Linux 6.14.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.

I also fixed a check-package error.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
