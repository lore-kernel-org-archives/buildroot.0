Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D214C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 20:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B406760AC9;
	Mon,  8 Aug 2022 20:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B406760AC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id czTsXrZGdR9P; Mon,  8 Aug 2022 20:43:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F525607F7;
	Mon,  8 Aug 2022 20:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F525607F7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 012171BF291
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0131606EC
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0131606EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XUJZYkgSRJsW for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 20:43:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C756660AB9
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C756660AB9
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 20:43:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 52349240006;
 Mon,  8 Aug 2022 20:43:02 +0000 (UTC)
Date: Mon, 8 Aug 2022 22:43:01 +0200
To: Emile Cormier <emile.cormier.jr@gmail.com>
Message-ID: <20220808224301.6429516e@windsurf>
In-Reply-To: <20220403221953.1158787-5-emile.cormier.jr@gmail.com>
References: <20220403221953.1158787-1-emile.cormier.jr@gmail.com>
 <20220403221953.1158787-5-emile.cormier.jr@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659991383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NJyOx3zRQ9l2UNSHhCxrSYfOW32M2eJDx4780M/XeK0=;
 b=THqiX9rK+iys7lwCn7rcUCqqp776q/5EnxVzdfOzHsi5LWASNuBKtD2plouxoMRHb0A2yD
 Scyi7VEx+JTGs0yfGLjkIw5uW9yZvk//IoGO0IcUWUzZyfbEm31fsqFAfjRBRdWZ38NBqO
 Ew2St84QVIpgHJPf7/PBzcBfG0E79cZwnmT43ZIRYuddp3nGYhi1VV1jX61PQNT89w5SHQ
 0Ciq67MrA2w5Omu6bjVgkxQmZeSWQQ1i59XrIsBq7bVMh8d0ll/yWkY7bEmoYQcXIx3V2D
 BfmySu6232FPh/1CqvGHTuk8jDYB7d5usfA8W19c9QJN48NeEA7WisWNso19hg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=THqiX9rK
Subject: Re: [Buildroot] [PATCH 5/6] package/python-autobahn: add missing
 subpackages
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Emile,

On Sun,  3 Apr 2022 19:19:52 -0300
Emile Cormier <emile.cormier.jr@gmail.com> wrote:

> +config BR2_PACKAGE_PYTHON_AUTOBAHN_ENCRYPTION
> +	bool "TLS and WAMP-cryptosign encryption/authentication support"
> +	select BR2_PACKAGE_PYTHON_PYNACL # runtime
> +	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
> +	select BR2_PACKAGE_PYTHON_PYQRCODE # runtime

Turned out this line was not correct! Crossbar indeed uses pyqrcode,
but autobahn uses qrcode, which is a different Python module.

So I packaged qrcode:

  https://git.buildroot.org/buildroot/commit/?id=37f05c2497a05c9d007ed03c224f4a4d18a21b21

And then fixed autobahn to use it:

  https://git.buildroot.org/buildroot/commit/?id=6826595759d1978633008479d305abb8a894d442

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
