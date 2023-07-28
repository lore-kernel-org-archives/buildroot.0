Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14687EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 20:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2222421F0;
	Fri, 28 Jul 2023 20:20:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2222421F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id idhX_TKI0PB4; Fri, 28 Jul 2023 20:20:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7F64421E7;
	Fri, 28 Jul 2023 20:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7F64421E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AFDD71BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C55A8455B
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C55A8455B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gDQiS34dYOvb for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 20:20:35 +0000 (UTC)
X-Greylist: delayed 80350 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 28 Jul 2023 20:20:35 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ED8F84527
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7ED8F84527
 for <buildroot@busybox.net>; Fri, 28 Jul 2023 20:20:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BF3BE0006;
 Fri, 28 Jul 2023 20:20:33 +0000 (UTC)
Date: Fri, 28 Jul 2023 22:20:32 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230728222032.51fa7139@windsurf>
In-Reply-To: <20230724180023.884565-1-francois.perrad@gadz.org>
References: <20230724180023.884565-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690575633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GKklvaX1GPGyjp+481XnsnM0pXnPGatdFFY+JcMt9Xg=;
 b=igk1GamhhedJe7Mbg2roozABtrDy2fiNrdMHY1B5E3grSGxIRP0uvkymyz0piAhU4KtFCB
 lZ74Bm5nSgeVwqKZ78dgTG/ms+e/crttMQLTn8xBiiMtr45qkZNbFeHb6wg2scuABBgi5x
 WRzH5xghBndSBYxh0BS3LU0boae2BiMQWtGO8n6tB9AyMKTw12wU/GK3gtreN48gwG8zcY
 NnDs4KVPUKpssadtLsd6rEM1RTJ1umBartRpyLhpEPji/ykibvASJVz50w5hHHChVLUZfD
 emb8VMfUaoSzjCOiRpJrYgcjpHRspQMHnbF1FcVYct3cp+POl6yqXNxLxEwpww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=igk1Gamh
Subject: Re: [Buildroot] [PATCH] package/fakeroot: bump to version 1.32.1
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 24 Jul 2023 20:00:23 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/fakeroot/fakeroot.hash | 4 ++--
>  package/fakeroot/fakeroot.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
