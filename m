Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C91DC83038
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 19:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDC856088E;
	Wed,  2 Jul 2025 19:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZcPudR0j3wlk; Wed,  2 Jul 2025 19:09:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EB51612C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EB51612C5;
	Wed,  2 Jul 2025 19:09:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CB98196
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 19:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F26E641554
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 19:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tC087gh8s-BG for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 19:09:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1C20441551
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C20441551
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C20441551
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 19:09:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 36BDDB0054E;
 Wed,  2 Jul 2025 21:09:21 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 02 Jul 2025 21:09:21 +0200
MIME-Version: 1.0
Date: Wed, 02 Jul 2025 21:09:21 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250702100710.2191088-1-peter@korsgaard.com>
References: <20250702100710.2191088-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <c15c01af8225d4fc95be7eb3ed75434c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751483362;
 bh=0m3T6AdaQQnqhpnuKQAXGE7nY6HDtO2WcGeTrhW849Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=md6L7s+uBNcLRU+m35o4PtDMq5bSB58C3PRAC3/PJQmJpQolODp5XF3yfdk46qhDn
 GwuTF4KRGzgSUhoRq4t2/+34zf5pIwQOAP2c/Pj+Q+h4hkQ4X8KenjVjUjQ53tSzbf
 sHyBExNtStr5QHYYAwi2DTb3GlH+It3M7twy5oOt2bRA9zgGAP5z7NWK6Ymv3H7WA5
 fs55n89eQMP8EcL6Hgi7D1vTxoslYTEDhAzW25yIbgyf5G0vaBr1T3gpex6vms7xp0
 EsHondSI4dWEOuTM/kiYLOff1lDpR1gYQkWt7iy5cVLFcMG31izJ1Z+mJy3k7QnIjj
 Yb5tC+WZFwfQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=md6L7s+u
Subject: Re: [Buildroot] [PATCH] package/jose: add CPE identifier
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

On 02/07/2025 12:07, Peter Korsgaard wrote:
> cpe:2.3:a:latchset:jose:14:*:*:*:*:*:*:* is a valid CPE ID.
> 
> See:
> https://nvd.nist.gov/products/cpe/detail/7E6A7E16-E8B0-47BA-B7C7-0D4102933031
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
