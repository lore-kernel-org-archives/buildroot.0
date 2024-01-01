Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1351BC47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B694240A9B;
	Mon,  1 Jan 2024 21:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B694240A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SSTtcLkGdYAW; Mon,  1 Jan 2024 21:21:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00F2240960;
	Mon,  1 Jan 2024 21:21:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00F2240960
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A5251BF954
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4932660F34
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:07:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4932660F34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YMY2l8sJJqG7 for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:07:07 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 227D860F26
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:07:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 227D860F26
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3161920002;
 Mon,  1 Jan 2024 21:07:05 +0000 (UTC)
Date: Mon, 1 Jan 2024 22:07:04 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240101220704.13d124df@windsurf>
In-Reply-To: <20231230184210.1141412-1-fontaine.fabrice@gmail.com>
References: <20231230184210.1141412-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704143225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FJycZG3JUcMWplkhKHrYx95jmrChpkgpFSAcfFef3II=;
 b=JsAvQJiBl2XcwxWKbGj0yJzdm5qbAi85SWc6XrBX6Qe9IckevuyTD5TjV3wnUIMUqTboeQ
 UYNsIzmE1nnpWpF3q2+IpJ6FdBc5NLacXlVsGAxAqQbgDBIbM/XwrQ76v1rU/IHLupWu5m
 Wr0ekTya0K7x/Oh8VLqQ9AS/1/PWS6bcu3NW+dIiWKCPtGndNCvbB9frIZ3HM1eck7WBX5
 oRRn/vT6L2eX3p3AbN9o01QFOAaVSUuGAMC/5BDSKJJu7cqFnoQaXNE+yHWOsvmXgoWF65
 b2CnFi5iUDhlN6nI/Yd0VWg1IRoPAHReLCV8pfclw1EFcB7ngGBFfEcGflLDKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JsAvQJiB
Subject: Re: [Buildroot] [PATCH 1/1] package/libnl: bump to version 3.9.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Dec 2023 19:42:10 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/thom311/libnl/compare/libnl3_7_0...libnl3_9_0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libnl/libnl.hash | 4 ++--
>  package/libnl/libnl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
