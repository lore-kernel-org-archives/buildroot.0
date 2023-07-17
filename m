Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150DAEB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 07:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FA254090A;
	Mon, 17 Jul 2023 07:54:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FA254090A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FgbTeIK9n51v; Mon, 17 Jul 2023 07:54:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B2DB408D8;
	Mon, 17 Jul 2023 07:54:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B2DB408D8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 497811BF2C9
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 07:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1974060BBB
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 07:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1974060BBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gR7XS__1yuc7 for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 07:54:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5F2C60B38
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5F2C60B38
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 07:54:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A89240006;
 Mon, 17 Jul 2023 07:54:31 +0000 (UTC)
Date: Mon, 17 Jul 2023 09:54:30 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230717095430.7ab724a4@booty>
In-Reply-To: <20230710220154.1244535c@windsurf>
References: <20230620172305.4176-1-ckhardin@gmail.com>
 <20230626131714.4bef3bde@booty> <20230710220154.1244535c@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689580472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ZmBEr9Ef8rPcy+1BxQdxPUDLhAlV6VMEOZC+CWP4OE=;
 b=gDt7noUSvN750rJHyvCr7iPR671zOjxDvkWfdKLAhVrNjz9uxSfW3jE53lrG4gI2NAQNKn
 0u76lfDTiI8A3gVVnfy+QxLH7dEFzd68GkdJOWIovPMNmF8G4gS9yj6t5dlBW+mkBEfJDA
 BSNW2SjIZ82UnQBtQuMCxEwN5rhV6qDMAT5fELtH7kpL6ZkLA3KOUF4lcMXIlWj67CFa8e
 5dmoNelQzJY+vPFlCeKCNoO1iIJ/ubTkNWydCGb/Vi2RyqXZXLBfPxmEFQbIXWz+kmkH8p
 puMaRTx+h+4QAqmSVEEV/LmdXMgOPAUOrcXy+jeu2n7ntTTvC2xApnSUUMw+pQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gDt7noUS
Subject: Re: [Buildroot] [PATCH 1/1] package/unzip: configure with
 LARGE_FILE_SUPPORT by default
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Charles Hardin <ckhardin@gmail.com>,
 Luca Ceresoli via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas, Charles,

On Mon, 10 Jul 2023 22:01:54 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Luca,
> 
> On Mon, 26 Jun 2023 13:17:14 +0200
> Luca Ceresoli via buildroot <buildroot@buildroot.org> wrote:
> 
> > > +# unzip already defines _LARGEFILE_SOURCE and _LARGEFILE64_SOURCE when
> > > +# necessary, redefining it on the command line causes some warnings.    
> > 
> > "causes some warnings" -> "causes extraction errors"?  
> 
> Actually no, the comment was correct. What causes the extraction error
> is the large of -DLARGE_FILE_SUPPORT (which is a unzip specific thing).
> 
> The thing is that when -DLARGE_FILE_SUPPORT is passed, the unzip build
> system defines on its own _LARGEFILE_SOURCE and _LARGEFILE64_SOURCE,
> which causes a redefinition warning by gcc. So undefining
> _LARGEFILE_SOURCE and _LARGEFILE64_SOURCE does not solve the extraction
> error: it only avoids the redefinition warning from gcc.

Indeed! Thanks for clarifying.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
