Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66609C02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 17:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00F9B60665;
	Sun, 16 Feb 2025 17:32:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0GaSlJOshorh; Sun, 16 Feb 2025 17:32:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 233D060656
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 233D060656;
	Sun, 16 Feb 2025 17:32:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A413E72
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 888E5409FE
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:32:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ign1qPo0mrC8 for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 17:32:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2ED2E40901
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ED2E40901
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2ED2E40901
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:32:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 08AED13F89A;
 Sun, 16 Feb 2025 18:32:45 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Feb 2025 18:32:45 +0100
MIME-Version: 1.0
Date: Sun, 16 Feb 2025 18:32:45 +0100
From: Julien Olivain <ju.o@free.fr>
To: Gilles Talis <gilles.talis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250216153441.2706067-5-gilles.talis@gmail.com>
References: <20250216153441.2706067-1-gilles.talis@gmail.com>
 <20250216153441.2706067-5-gilles.talis@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <c3bacd6dc0128342304f85cb92b6068f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739727167;
 bh=Fl0JdmIn+nkcFVzAccDjW88cjCBNBaLBdwzfFfPt2yk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h0Bn654/iTa+NcJ7cb4Eff3IXJuO7ZBw1UB/CxJADcvvclCQM5UuDIb8agyjfSkKE
 h20d7Hcsfm0pX9C7XC2zwWety9T7nwQZXmSaltyACRoTloMoK6JXqSVhmqfDHFShz9
 J2Rvx1YbME76G39fNOlBfuDh7fDLGqLkoA4zuZtOluxfx0p+zy5XSzJ4g3tlkZEwRC
 UBhRhY+tchwmCV1/jIGKa9wEhwKjKJbA5FgKtgqQ9w4qhQQpg9QQvE7yspjbTFuxl4
 btO7eCzryoJxpFvsUOzwyvI+Hh7tl4CtPT859lMsjBn/8idVDfl+JSPylDKAU0BFYJ
 Fx/4c7xgsXQug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=h0Bn654/
Subject: Re: [Buildroot] [PATCH] package/tesseract-ocr: bump to version 5.5.0
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

On 16/02/2025 16:34, Gilles Talis wrote:
> Change log:
> https://github.com/tesseract-ocr/tesseract/blob/main/ChangeLog
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
