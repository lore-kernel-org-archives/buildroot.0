Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12379EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 21:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9699160C2E;
	Tue, 18 Jul 2023 21:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9699160C2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9tnmhdY1x-xJ; Tue, 18 Jul 2023 21:05:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7EED60C19;
	Tue, 18 Jul 2023 21:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7EED60C19
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D5DC1BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83D3B81F74
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83D3B81F74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4TvVsIgwjeoa for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 21:05:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59DE781F4A
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59DE781F4A
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 21:05:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D033440002;
 Tue, 18 Jul 2023 21:05:36 +0000 (UTC)
Date: Tue, 18 Jul 2023 23:05:34 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230718230534.2b66a4d5@windsurf>
In-Reply-To: <20230717213359.106368-1-romain.naour@gmail.com>
References: <20230717213359.106368-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689714337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LmJ7KyjeVhy/c7edZy3dMpIGBkFL2Q59miWWTu9Udls=;
 b=X6eO6mNCS5G1EhhOSRKpRjfHzN9OntGD97wJCehYrZyG6rk+OBglWpUpyZvzETzL4Hv7N+
 /MQyE8JCR7mc8gTsz+3eMJ8UT0sjvCZyRLuiTkhFQjbVHSXko/h3AMCPE5zJBNI+kT9JCV
 sLQ4EaGhTDaJYUpxhGjiY2Abqvuwa4KEFeYwj2dbG7O+gLIMndBDXYySCdIjswM+E80Ees
 WCQkA+1QTHBlXHIaQRqp4oRuAsdIoIUVYxxyc9arTUuVHEnoLUtEsI58VSOJ6RskURJewH
 XveL5KRMyqqolEdzug3yZ4uy3/cbIw/WK/8C2pmT9+OEymKj+1NS47qrD3Ac/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X6eO6mNC
Subject: Re: [Buildroot] [PATCH 1/3] support/run-tests: add a mode to only
 download emulator builtin binaries
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

On Mon, 17 Jul 2023 23:33:57 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Currently, emulator builtin binaries are downloaded after the rootfs
> build by each tests running the emulator (Qemu) on armv5 or armv7.
> 
> Due to download quota on the server hosting theses binaries [1]
> some GitLab jobs are failing due to "Connection reset by peer" [2]:
> 
>   ConnectionResetError: [Errno 104] Connection reset by peer
> 
> In a follow up commit, we'll add the possibility to download only once
> all emulator builtin binaries to pass them as build artifacts.
> 
> As such, we will need to make sure that run-tests only download theses
> binaries, and that it does not run the testsuite.
> 
> Add such a mode, with a new option, --prepare-only.
> 
> [1] http://autobuild.buildroot.net/artefacts
> [2] https://gitlab.com/buildroot.org/buildroot/-/jobs/4409032417
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  support/testing/run-tests | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Thanks, series applied. I'm not an expert in Gitlab CI sorcery, so I
trust you that it is the right way of doing things :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
