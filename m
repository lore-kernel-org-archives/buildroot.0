Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF15BCD128A
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9C77605CA;
	Wed, 10 Apr 2024 21:17:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 38ygaqhR6yKX; Wed, 10 Apr 2024 21:17:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE58960BFF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE58960BFF;
	Wed, 10 Apr 2024 21:17:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 107A41BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F115A60BFF
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Z-Ern5He0Xe for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:17:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DBB4E605CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBB4E605CA
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBB4E605CA
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:17:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDFA1E0004;
 Wed, 10 Apr 2024 21:17:12 +0000 (UTC)
Date: Wed, 10 Apr 2024 23:17:11 +0200
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Message-ID: <20240410231711.084c9d7e@windsurf>
In-Reply-To: <f85e872c-8d99-4dcf-997e-95d3a382b463@yoseli.org>
References: <20240410171211.1633127-1-jeanmichel.hautbois@yoseli.org>
 <20240410171211.1633127-2-jeanmichel.hautbois@yoseli.org>
 <20240410215656.1756a37e@windsurf>
 <f85e872c-8d99-4dcf-997e-95d3a382b463@yoseli.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712783833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v/k2JX+vkCAeZBLN4K6kPaqpOq7rBz0vdgmfE+DFLPY=;
 b=n43BwOTxs+f91OLO1exWn9MPD5/jm4ttskXUgm1caa7b33iJsNcXDlRspQGTdQnRmG0n7j
 z/bQAMNi45CxRecDVPveFGGA7CN0qxE8uAlxZZOmeqr/N4U+s9JwoQnkv0RV/rUswi0Twj
 dlhySZIIaEvkkoY6WaeTVYuZA9i8663TOfe39JLgzUFdjBdI+advcQE3bE/xTvRqzbs/6b
 HCuEOdFmdAGjwY4c2eSPZ/ZLQ0Tett8sWs0hRB5jUQ/uCIFTFiTDtStG5FRf0dQr7Yrc5R
 0QvAasAElQ16jhzJ+LnZWLtP2SjWdOWle4OAmImUIIGsbvrh56hPqwebHeC+Ew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=n43BwOTx
Subject: Re: [Buildroot] [PATCH v2 1/3] arch: add support for mcf5441x
 Colfdire
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 10 Apr 2024 23:08:14 +0200
Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org> wrote:

> > What happens when you don't specify -march? Do you know which of isaa,
> > isaaplus, isab and isac the MCF5441x corresponds to?  
> 
> I did not check what happens, but based on the following file it is isac:
> https://github.com/gcc-mirror/gcc/blob/master/gcc/config/m68k/m68k-devices.def#L168

And if you specify -mcpu instead, does it work? What doesn't work if
you omit -march?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
