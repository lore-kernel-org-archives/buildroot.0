Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCDBC5AD49
	for <buildroot@archiver.kernel.org>; Sun,  8 Jun 2025 13:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4559A401C6;
	Sun,  8 Jun 2025 13:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q2cJaoNY3GxY; Sun,  8 Jun 2025 13:50:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D2D04074A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D2D04074A;
	Sun,  8 Jun 2025 13:50:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F366A1F2
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 13:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5BA24074A
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 13:50:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LMZNXC_vqTAV for <buildroot@buildroot.org>;
 Sun,  8 Jun 2025 13:50:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1E659401C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E659401C6
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E659401C6
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 13:50:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 1010419F59C;
 Sun,  8 Jun 2025 15:50:37 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 08 Jun 2025 15:50:37 +0200
MIME-Version: 1.0
Date: Sun, 08 Jun 2025 15:50:37 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250606204152.13551-1-kadambini.nema@gmail.com>
References: <20250606204152.13551-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <da0e42b6d8b08ae995b19b9d5313aa24@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749390639;
 bh=T8CInNtDal6QE4aU9yOdjEH25AKVVGQ88xFMl30E7v4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YbfDvPBClFJZQa/wFqijI9ZckEUhiSxJu4YFC034CztIwsBqUmolrgTaEyLhR/uyZ
 e1+mLiMctcFgjHToNXl+7/ES5rXyWfyAN0EupWQydW2tab0LEnDn+rNE1c14NU9Be2
 LA3RUxLjNgonD80nz2o02k16ee+YERNy7lxa0ZNbX+jXnLrqI5Uu84nJt4/VpRsvPq
 D655Apt0ICwL1T7EzBCGcujMKk0VDXkJy7ibUPV3EiVl5RFQYbPQZB6m/YtYneh7Yc
 OPtVjHM0D35I+Sd/rmrsXRfxVDdIYNNjyvPda02tCI4q9/qR8f8vCckI+kjCNlGBsJ
 F4iaPBOBQsSxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YbfDvPBC
Subject: Re: [Buildroot] [PATCH 1/1] package/diffutils: bump version to 3.12
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

On 06/06/2025 22:41, Kadambini Nema wrote:
> Release notes:
> Version 3.12 - 
> https://lists.gnu.org/archive/html/info-gnu/2025-04/msg00005.html
> Version 3.11 - 
> https://lists.gnu.org/archive/html/info-gnu/2025-02/msg00003.html
> 
> Fix the following error seen during cross-compilation error by assuming 
> that
> strcasecmp function is always available.
> - "configure: error: cannot run test program while cross compiling"
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
