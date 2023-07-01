Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81D6EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 14:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 477A460FAC;
	Sat,  1 Jul 2023 14:46:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 477A460FAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iQeKhgK9Nx0N; Sat,  1 Jul 2023 14:46:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E22A60FA1;
	Sat,  1 Jul 2023 14:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E22A60FA1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E7491BF868
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16C9641861
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16C9641861
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WN5U5m8B9Jjw for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 14:46:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1E27410A8
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1E27410A8
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 14:46:48 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::224])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 36398D094D
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 14:37:05 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F7DFE0002;
 Sat,  1 Jul 2023 14:36:59 +0000 (UTC)
Date: Sat, 1 Jul 2023 16:36:58 +0200
To: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Message-ID: <20230701163658.647b5f92@windsurf>
In-Reply-To: <20230626162057.562236-1-luca.ceresoli@bootlin.com>
References: <20230626162057.562236-1-luca.ceresoli@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688222220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u3Av85ACF/SXpdLSBWBbbfwIn33hAcUkE8/351e0kfo=;
 b=dInsdVLqcDJUhzpl2wdQoR8NM3YeTIoplDYyn7196JDNeXiXuufKPBO00c8xw6fACRlkGk
 KzTKBqNKfozMk6cKLoC92dBTSoDg7iflrl9oXZNIqJjKTHwISfbybmX3J3zfiGBkQZN5jA
 mxoy+PnfZO8UkMsszPACEoz/nPNwRwtL2e3PfxT13zV+VPbuxy8oMtHX5e23y72tJcn3cs
 +/k+/MoKZdr4FxpOgsdv8yBtXKot1ilpQkvbM0k5In56+BsS5kdqBIEU0SXytz2R6qL9jd
 fA6fATKHncGo9Poz7JTvgNei1eV0NyYaCGjbyfhK+l1BFLllA3GNLyNXl7Ka/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dInsdVLq
Subject: Re: [Buildroot] [PATCH] package/agentpp: fix build error due to
 type mismatch
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Luca,

On Mon, 26 Jun 2023 18:20:57 +0200
Luca Ceresoli via buildroot <buildroot@buildroot.org> wrote:

> +Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> +[Upstream status: sent to katz.agentpp.com@magenta.de and support@agentpp.com]

This now needs to be:

Upstream: blablabla

otherwise it causes "make check-package" to complain.

If fixed that up when applying. Thanks a lot for having provided this
build fix!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
