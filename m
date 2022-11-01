Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B1DC4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E68DC41675;
	Tue,  1 Nov 2022 22:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E68DC41675
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BdoHtaI8laxF; Tue,  1 Nov 2022 22:23:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC6D641625;
	Tue,  1 Nov 2022 22:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC6D641625
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44D1A1BF3E8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DE3260E2F
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:22:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DE3260E2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id otdci2CM1TgN for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:22:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36D6C60E55
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36D6C60E55
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:22:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F1433240006;
 Tue,  1 Nov 2022 22:22:24 +0000 (UTC)
Date: Tue, 1 Nov 2022 23:22:24 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221101232224.4faa18a8@windsurf>
In-Reply-To: <20221101215745.58044-1-fontaine.fabrice@gmail.com>
References: <20221101215745.58044-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667341345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vNQPz4Da0VeS6ol1b4M/c4ArPZpBB6iHX5M9z9WdC38=;
 b=K3hQIQBdb28/AGswLfI6fuiVzCqotRiEEnbKT2guYwcMMAfbTmSUZEpHLf45NT7Tc0VdCF
 IZTNIPfhkRLfuzsTcv2Q3nz0J/JB21qkzwYPcxokOIw1iRpKOiUDKDDgwWZFYfVWuJYAex
 IPCIqmF6SBYabLIfs3tmHdfDtos+P1g68gwLkregVfRpdMVYE05g43xD1Qkju/iVMsGBRJ
 HBUKpiQaEjuvXX119ENWwfunOEAyMUpiDWUBhcFQU8rBnsoWiRbMKlk3MdMHw2hSLIyJs3
 qznpA0s7/w2siw+/S+c01bHzfc4V9ViZgaEP88XM4FIwLtM9bRawdqxjZDhJDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K3hQIQBd
Subject: Re: [Buildroot] [PATCH 1/1] package/xl2tp: bump to version 1.3.18
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

On Tue,  1 Nov 2022 22:57:45 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/xelerance/xl2tpd/releases/tag/v1.3.18
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/xl2tp/xl2tp.hash | 2 +-
>  package/xl2tp/xl2tp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
