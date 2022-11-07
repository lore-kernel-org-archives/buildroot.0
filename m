Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692D8C433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 07:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEA8660AC3;
	Mon,  7 Nov 2022 07:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEA8660AC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bd6aGhh9qF_R; Mon,  7 Nov 2022 07:52:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1444360A99;
	Mon,  7 Nov 2022 07:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1444360A99
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 71E701BF419
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 07:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 469B860A99
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 07:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 469B860A99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xNEDANmhCEyY for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 07:52:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F4BD605B7
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F4BD605B7
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 07:52:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 90DED40006;
 Mon,  7 Nov 2022 07:52:01 +0000 (UTC)
Date: Mon, 7 Nov 2022 08:52:00 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20221107085200.4b2eb2ed@windsurf>
In-Reply-To: <20221106150330.GY3918838@scaer>
References: <20221103224539.692322-1-thomas.petazzoni@bootlin.com>
 <20221103224539.692322-2-thomas.petazzoni@bootlin.com>
 <20221106150330.GY3918838@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667807522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BxBseEfR4mmxtWnVZblUdstQlWM9eSRynPJJK0oXtsw=;
 b=p7qWycHZCVN/HfW7WTAlnz34NgCCjwN1PWZgV9A+rdcNPA1p1ET3EiyOTDk/QEpEQ9YF/M
 OL/EGGlBgE8CIShuORL7+yaWZREcn8kYGtXFvgZrOJtC7VHJqmsQvnSieMZsahqMYrQgyc
 UmAGv/5EMPuaVK3xyf+HxVtsQq9mz5RSz9YhdpJlM4pfl81pyaiE1zPs44mc4OZDWr6ueX
 DO0bRavMiuDxbHZb5wTr5rfHX7N2Z4u4rxC7lGPjWLb50yj+DDirk4PpNGLeNSPGz2tMHq
 fYZRIvatjDtX8H7pCHGQk/A5nfXRk5QnSFPpxyZ4rynv24z+eb0l7QKoXJpfbA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=p7qWycHZ
Subject: Re: [Buildroot] [PATCH next 2/2] package/pkg-cargo: move CARGO_HOME
 into DL_DIR
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
Cc: Moritz Bitsch <moritz@h6t.eu>, James Hilliard <james.hilliard1@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, 6 Nov 2022 16:03:30 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> I am not a fan of dot-directories, because they get hidden, especially
> since BR2_DL_DIR can be set in the environment and point to a long-lived
> directory.
> 
> Instead, I would just call it 'cargo-home'. If that's OK, we can change
> when applying...

I don't feel strongly about it. I used .cargo because that's how the
default CARGO_HOME folder is named in one's $HOME directory. Also, it
makes sure there is no potential conflict with an hypothetical
cargo-home package. But overall, I agree that I also don't like it
being hidden. We could also name it br-cargo-home, so that it doesn't
really look like a package download directory.

But really, I don't feel strongly about it and $(DL_DIR)/cargo-home
works fine for me.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
