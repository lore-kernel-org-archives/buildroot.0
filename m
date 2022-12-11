Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20F3C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 21:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A89A81413;
	Sun, 11 Dec 2022 21:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A89A81413
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R78vlghHJrzk; Sun, 11 Dec 2022 21:23:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C986813E8;
	Sun, 11 Dec 2022 21:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C986813E8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C16091BF309
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 21:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D2674047B
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 21:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D2674047B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VENHQptjsmLA for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 21:23:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BC2C40463
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BC2C40463
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 21:23:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 50ED0240002;
 Sun, 11 Dec 2022 21:23:29 +0000 (UTC)
Date: Sun, 11 Dec 2022 22:23:28 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221211222328.461a637a@windsurf>
In-Reply-To: <20221211204455.278996-1-bernd.kuhls@t-online.de>
References: <20221211204455.278996-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670793809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JlUB+oB6kURIEDe/W8w0la6RCk/TvKkMvX8fGLK9e5g=;
 b=Wou7kdKksUPQ5n7Kg+lZWdsr93rk7E4SpiWcWASBMQmVgu9XGO0T5usjG5EQdiZ7Nz0sNR
 b97yi88pyYaUhIE1XRDRnLDJDQbYuuRiXpfuS3SGkTWFhNNV2W4x81DtF96sN6LC3tJyQY
 gGsVf1Rse8nb8/V9I7ITTONeTUEAW7VImLGVL2g1BPpccG57zTti1ZVFnjZ5WTNPGwOp6c
 Xe3+O8rb1Lqa/5XiDv0Hc3PErsGUjBOpMv0d+SHBqAuhH2nmV29uPrtKr6E/XbxaWmEa8L
 0T8whgpWLbSxinALmLvRLahH1iIIJlJvaSxQsvD9xYl0j2wnO76uhaBiaKPvhA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Wou7kdKk
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-mediadriver: fix build
 without X11
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 11 Dec 2022 21:44:55 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/52c/52c8f5352b16ced4e85286950f95e1b57c564fa5/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-dont-include-va-dricommon-h.patch    | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/intel-mediadriver/0001-dont-include-va-dricommon-h.patch

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
