Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470C1D5B14E
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 21:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10189605AD;
	Mon, 28 Oct 2024 21:00:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OVqN5ZF8hbr8; Mon, 28 Oct 2024 21:00:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 277336070A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 277336070A;
	Mon, 28 Oct 2024 21:00:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 667F8112A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5412B40015
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eyybHkvgN6bV for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 21:00:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0ADF7400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0ADF7400D6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0ADF7400D6
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:00:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4B161BF203;
 Mon, 28 Oct 2024 21:00:11 +0000 (UTC)
Date: Mon, 28 Oct 2024 22:00:10 +0100
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>, Eric Le Bihan
 <eric.le.bihan.dev@free.fr>, Asaf Kahlon <asafka7@gmail.com>, Fabrice
 Fontaine <fontaine.fabrice@gmail.com>, James Hilliard
 <james.hilliard1@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Message-ID: <20241028220010.23cbd668@windsurf>
In-Reply-To: <20241010135318.3064224-4-fiona.klute@gmx.de>
References: <20241010135318.3064224-1-fiona.klute@gmx.de>
 <20241010135318.3064224-4-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730149212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2eL4qF8Co+8T/hfI9Uz3sNuWOqtno9QzLS6zYWys4hE=;
 b=pCl/idXP2pPzNztEpUF8S/LMOxn7cDVnRVO17rJW941rCz7M+AOit5yqL3YuMSbtssudJy
 YG7V+kc9+oSNGMwIPJDy8pEgevY1GbVd2EOp3qbMo1po6bJltGWJRvmTcbJW6WMdKA8ie4
 vL6nY3YMtVaA5xYk3Y3jspaLUYHlcd7XHo30awYfKbGUgpAsVqtbu7eieVwaeDjNeO6bKS
 Uy8feaOObcgBCLVtBXYezrtNYo8p0g2eAC/TJXw6tLHN9IWmT+eNWQNJ2JvnspwSIl7Muf
 AHH3wem10F0PUaYOKRCCD++ExSNPjGwr3iX6HTWpdcvKz3PtxLytZFhCmdUYpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pCl/idXP
Subject: Re: [Buildroot] [PATCH v5 3/7] package/{gobject-introspection,
 libglib2}: bump to {1.82.0, 2.82.0}
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

On Thu, 10 Oct 2024 15:53:10 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> There are a lot of interconnected changes in these releases:
> 
> Since 2.79.0, the introspection (i11n) data for libglib2 was moved out
> of gobject-introspection (GOI) and into libglib2 itself, thus building
> libglib2 with i11n needs tools provided by GOI [0].

[...]

I finally had a look at this patch, and I have one concern with it: if
I'm not mistaken, host-libglib2 will now always build
host-gobject-introspection, even if we don't care at all about
introspection support.

Why is host-gobject-introspection an unconditional dependency of
HOST_LIBGLIB2_DEPENDENCIES ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
