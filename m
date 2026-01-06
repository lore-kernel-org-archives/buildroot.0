Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684B8CEFD10
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 21:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91D4360C07;
	Tue,  6 Jan 2026 21:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ar4yfW5Mrm6l; Tue,  6 Jan 2026 21:07:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9536F60BEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767733633;
	bh=Hb3mhL7ttbf6PHFpwz/Y2l2mtEyMoLnr8XFacEs17fg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PWojy2+dUnORTEHJAz525OlRiUOdoPJDgVoT9ZVfe5MX59TMjxIIPaHF56ex5NhtE
	 t4lbxwMMR6h6++ZBnukVPbV7yM0GVctOZj1vwIMX4Z1CO78ZFHGerjU45SOzGjHaNw
	 1b9m2YXXBIm+AbtVelHgPssagD1k10m06gefewypJ4lCOmbpQFM5bnpZRHSridw9lO
	 vFM99SAQKZDap7z43o1JSa1jsreTCYgG4RhKhDQ/0ZQmxfv/NGQevavLObSIrti2D4
	 ZRsh/duUM5LoGHjvUr/Jumqya5/zqx0WL3qscUBBXS3GKm7GwF3DimGw+aOoj4pTW9
	 L6DvnVjOpbd6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9536F60BEA;
	Tue,  6 Jan 2026 21:07:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BC272A3
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41A1860BEA
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JwalsN4zE-nH for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 21:07:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5BD5060BDF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BD5060BDF
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5BD5060BDF
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:07:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A82204E41FB2
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:07:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7E7CB60739;
 Tue,  6 Jan 2026 21:07:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EEABD103C85F8; Tue,  6 Jan 2026 22:07:05 +0100 (CET)
Date: Tue, 6 Jan 2026 22:07:04 +0100
To: Fabio Estevam <festevam@gmail.com>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
Message-ID: <20260106220704.3283de69@windsurf>
In-Reply-To: <20251227212244.3098285-1-festevam@gmail.com>
References: <20251227212244.3098285-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767733628; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=3mi/Osmbmh8Lv7OCU/ezn57KzfLawIvNadUmUH6v5U4=;
 b=xboxAmTIbJTNySca1XmQLfNV+sZlbGkPEVHUrbHor6JBEYDKDIjonVIhdYdX59t0Ue8EZC
 EIgwQWnT9AJ3lANoAhBtAMhNu3PZOefdFA1nPNi5Yoc8NwFljmBELza1Q5xOUj3JL+A3mE
 x623gY0wVF/rEtCU6ROYigp4f4gO5CwGpEJ7JJDC3uktK8PGgE7ZgYdKc6w8fDuG9ETr08
 YKvby/nVCG80q9mvqStMbp+TBcOK/RR/MzvSMA0WbnM+h/bP/863ng2gWwTGgj2eM8RWKX
 +kZCfUjtCDSOr+buiKWLvgJ8jh3RJzsjovoq6V/XgN70aSYB/gOZLyJbKlm9hA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=xboxAmTI
Subject: Re: [Buildroot] [PATCH] package/crucible: disable cgo to fix 32-bit
 build failures
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

Hello Fabio,

Thanks for the patch. Adding Christian to the loop. Christian, could
you comment on the below patch and help us understand whether this is
the right fix?

Fabio, one comment/request below.

On Sat, 27 Dec 2025 18:22:44 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> The Buildroot autobuilder fails when building crucible on 32-bit
> architectures (notably i386) due to unresolved _cgo_* symbols during
> linking.
> 
> Crucible does not require cgo, and building it with CGO_ENABLED=0
> avoids toolchain and linker issues while producing a fully functional
> binary.
> 
> Disable cgo explicitly to ensure reliable builds across all supported
> architectures.
> 
> Fixes:
> 
> https://autobuild.buildroot.org/results/0b59fb382f7a1d9c3644da71e7bd53b6a19418ce/build-end.log
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

In commit logs, we like to have some details on what initially
introduced the problem, so that we can understand whether the patch is
a fix that should be backported to our LTS release. Ideally a pointer
to the Buildroot commit introducing the problem. If not, at least some
indication that the problem exists since <some time> (to be specified,
with an old autobuilder failure). In our case, we're mostly interested
in understanding whether that fix should be backported to Buildroot
2025.02.x. So if the problem already existed prior to February 2025, we
will want to backport it.

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
