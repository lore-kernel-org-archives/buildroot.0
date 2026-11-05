Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE052606A32D
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 10:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NgBGgm12;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zoCuf7ji
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B1E980DA8;
	Thu,  5 Nov 2026 10:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ww4jjk7CTsM1; Thu,  5 Nov 2026 10:17:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 01DCF80D66
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793873836;
	b=epG8NcwFv2hGRxl1MJ57/7DzFnYYHq1jsuL7TjqG2dFIOHH4YMzIMbXlz3g/7xvfiDjV
	 b/kWoXESLI8F4uEHLz7qYcMNeZh6MjhHZAsk+gfagqc7QP7hi5LqYip+k+tfv9iHGigz6
	 z0427cLlwNTROw4VSOBiKwZJRfkCYdjqeARbXTHD0D6sW/mKukNEVjtCC4DekvUwcZBKY
	 1qL57OMS/uL2AYbulWnMFEXkPMUkgBiVbFz/E28NigVk4/ghBRqDSpux+jDZQUHpjvKcH
	 DWLxjpIW9K4e+OnFNWI5R1STTbU3wBP/xpjX/iHEqyn/zoAq/NELG8+6IO/j/ejVM9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793873836;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=xQfPOldY4J76r5BUJz9XZHdhFWSopnTtIt6RFOCAgSU=;
	b=YQmrKrJBFHj9S44g7Qwnt0Wjl5MOp3M/IhkCVaa9aM6fxEhkAPSTr9qkprbF0BD2UW4f
	 7iffYBXipWEXksmabnVezx9G2GMlwWuK3FiOy+3SGTqyiaCFz7EzsZvdUMsaSIcpF4dt+
	 GICGLMsBX4371O/3itjudXiyj59B/XaADdz0cfxD1VUEZDavrOmJi8hyJT5KExoYV3j66
	 Cg90CNyVdvj4TK8T6Iy+OApWKvzOo9pa9byoWS4q1hOBWXvYkg27gtFl6fP8ZVT06E0gw
	 xywLFVsos3rf9m1tkjFecoj2Pw7KdNQynkzlFaNyt2yA95zsIIpQPnya3oYjpq/722Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zoCuf7ji;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793873836;
	bh=xQfPOldY4J76r5BUJz9XZHdhFWSopnTtIt6RFOCAgSU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NgBGgm12Yr2qHmZoMEjVQ7wJxidSRnNhIj/UAOiv/N0aiAqFSZAc5jeg2do89NDHQ
	 yWf1tHNzOdNIW9B8rapT4PxTgg3M5IlqZ3iAGQnZSaXfgma7p1pIZjWDrV+G8qUXFB
	 10upO6/uXv6QLnouNvo4t/nNL+/bKRn+KVSuLSel3vi9D7ShM3w7Wa/4hDGiHQfbLA
	 oAaTgQ05oR7Po9xdj2r4KvI2v3shL3RFT0sV6DdOI8nvrLrem7N93wvvF9akk56IBP
	 MulP9FlPVj+d8sCsaGecUFTyRxdyMsiBFvayLtJA3eBuFXvqw2ldO2P2GMgOBwBf0Z
	 w4f9jgJC0JLoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01DCF80D66;
	Thu,  5 Nov 2026 10:17:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 230D81779
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 10:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0733081137
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 10:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7BK5wg04MzrB for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 10:17:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6849E81136
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=zoCuf7ji
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6849E81136
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 10:17:09 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-48b042c0728so442781f8f.1
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 02:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793873828; x=1794478628; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LBboDy3cfVItFi7SGiJE06r+BVWXzaFi2uRJNfLWM5w=;
 b=zoCuf7jiKd0C/f7VZha4S8rjnV2MUHvdTCNg2rtop/gWsLpChEJtbX9Q+9q5l+qwSB
 ws0nx6HGOZaSzwVngYu8uTh/y1T0Y6KgQ6m0kwtwh95MMeTzuVtv18g6dvMHsL0kK2HN
 8JrmMMna1MhRZmBdByTX8nEGuOQYA8oQ2Txp/D75K/bwO/whcGyY/iM86s8v69FOPEma
 iJMe2jgGBo32N6nUfy2ilS+0KHjUcaLsUhmYL2GJbPVAjyPcQJKvjsn4wpgd1sTFuN4g
 ZNghOS13GkwF9XtGx0HdNbmXQMDZu/iiE2qKrg/Iz/oWuBxrr0n7S4M7LgN0pMebyJ+r
 SpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793873828; x=1794478628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=LBboDy3cfVItFi7SGiJE06r+BVWXzaFi2uRJNfLWM5w=;
 b=hFMq2+c004PGuhVScxD1+rpb8sDRgPw5YqJNevPfR2HwCYXZtCWNptBivA8Uavk7yz
 s6XUacerSSeOGDIJHI8vCFjcM+wVLNui9yhAW8N0K+eOPQsukG/hLAQRIq6GQoSzo18f
 Qka6SamhpnE10B5C7AMKw1r3u5WdZJapK1WlA2NgaRlhK13zRjrhmZlcscfsANu+pgxc
 s+ofOZwgcrRh7rhqlncgWjS+WXHtfuzQwv+FT1QCnrlg70zKI3hxEZmT0e51gmTMIP7K
 bYy4DugKJr9kNKJm1kLwAUNmgwQpGTZssegy0PVe3nElcBC+vaVEzrPCpE7NVbFlWSCI
 IWNw==
X-Gm-Message-State: APuU4Z93efA5PddBfNNYnunqDhYfwdhkNRuO5fetDPRLfAWzDfu+Cxbx
 Ac3FHlctedS5EZupNKD165DNvUAGb8+tfqXG5PIgfG39aw3D38owDNGjug9DSA==
X-Gm-Gg: AYBFou3yeCWj2DleecOIW+VIOzSdvO+RsOesSE4wH9OPRLwgIIvD90wIJDG3A1Dj3WC
 DT7Y5p8NMGQETqHJOMt9ak32Xg2D9yl+dcDPMigs6qIQa6e5v67qXFo+pP8e7L9hXvodCIIXyC8
 /47M1TKlKoFSo1HSM4/qUkdEIBUTRXPy8ZuHFgYiMCLM+BpxsCs8W98zD/ydJ38Uwxg2MgYjTa/
 wvNfCVsM/Fpw5efLPqXWC5CZetNbWMuaTdXDasEnbM7xinUVxyffA9XLzgfFCmKUZeNM0zUsuYV
 pjoVmn5R+4HiBE3Ai+0/MKNZfR/8cY2b5pwT+VYKKYUQ7l8ofmNhFvtoJFscZSMlyqYCrVbIUdg
 ESFgM0ogECqzPSyEJ2vqLGUzLJcMkMHxpxvP3W4XjVLrYZRhZtMETFRv3UZfbWPWO7UjAppCyCw
 t4/Nr9uP5mMVOt1NtaDYNvXOimSR/pkhTTXY5sXDqUjzmnjfr7w8xnlTCwKZ5V3bDRExJj0raGT
 Qmo+PzSzlNwUi7rkFo5wrrd3olJYVarL7dG6DixBGV7jdeP2oLHOLXBwC7SmV/aCM+pyDYzSuch
 XNSCHelA8a6O7jEIQ/q9ArP06AKx2k/kjzM5BK070kb2WvqCZ8T5mw==
X-Received: by 2002:a05:6000:161b:b0:48e:412:37f4 with SMTP id
 ffacd0b85a97d-48e6e2bc7e5mr29078657f8f.1.1793873827683; 
 Thu, 05 Nov 2026 02:17:07 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48feda207d8sm8631777f8f.52.2026.11.05.02.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 02:17:07 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu,  5 Nov 2026 11:17:03 +0100
Message-Id: <20261105101704.1627207-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105101704.1627207-1-angelo.compagnucci@gmail.com>
References: <20261105101704.1627207-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] website: add a showcase page
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a page listing products and projects whose operating system is
built with Buildroot, each one with a link to a public source:

- well known products: Tesla, Home Assistant OS, Google Fiber and
  GoPro;
- open source projects: Batocera, Recalbox, KNULLI, OpenIPC, Nerves,
  RaspberryMatic, OpenWrt, Kerberos.io KiOS and Open Voice OS;
- vendor SDKs: Rockchip, Texas Instruments, Microchip and
  STMicroelectronics.

The page ends by inviting users to tell about their products on the
mailing list.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/website/showcase.html | 236 +++++++++++++++++++++++++++++++++++++
 1 file changed, 236 insertions(+)
 create mode 100644 docs/website/showcase.html

diff --git a/docs/website/showcase.html b/docs/website/showcase.html
new file mode 100644
index 0000000000..770c491dfa
--- /dev/null
+++ b/docs/website/showcase.html
@@ -0,0 +1,236 @@
+<!--#include file="header.html" -->
+
+<div class="bg-primary py-5">
+<div class="container">
+<div class="row justify-content-center">
+<div class="col-xxl-10 text-center">
+	<h1 class="display-4 fw-bold text-white">Powered by Buildroot</h1>
+	<p class="fs-4 fw-light text-white-50 mb-0">From cars to cameras and retro consoles:
+		products and projects whose operating system is built with Buildroot.</p>
+</div>
+</div>
+</div><!-- /container -->
+</div>
+
+<div class="container">
+<div class="row justify-content-center">
+<div class="col-xxl-10">
+
+	<!-- Well known -->
+	<div class="card my-5">
+	<div class="card-header text-bg-primary rounded-top fs-5">
+		<span class="bi bi-trophy-fill"></span>&nbsp; Well known</div>
+	<div class="card-body p-4">
+		<div class="row row-cols-1 row-cols-md-2 g-4">
+
+		<div class="col">
+		<div class="card h-100 border-0 shadow-sm">
+		<div class="card-body p-4">
+			<span class="bi bi-car-front-fill display-4 text-primary"></span>
+			<h2 class="mt-3 mb-1 fw-light">Tesla</h2>
+			<p class="text-body-secondary mb-3">Automotive &middot; Autopilot computer</p>
+			<p class="fs-5">Tesla publishes its Buildroot tree on GitHub, with custom
+				packages and a dm-verity checking init.</p>
+		</div>
+		<div class="card-footer bg-transparent border-0 px-4 pb-4">
+			<a href="https://github.com/teslamotors/buildroot">
+				<span class="bi bi-github"></span> teslamotors/buildroot on GitHub</a>
+		</div>
+		</div>
+		</div>
+
+		<div class="col">
+		<div class="card h-100 border-0 shadow-sm">
+		<div class="card-body p-4">
+			<span class="bi bi-house-gear-fill display-4 text-primary"></span>
+			<h2 class="mt-3 mb-1 fw-light">Home Assistant OS</h2>
+			<p class="text-body-secondary mb-3">Smart home &middot; Raspberry Pi, ODROID, x86-64</p>
+			<p class="fs-5">The official operating system of Home Assistant, the
+				most popular open source home automation platform, is built
+				with Buildroot.</p>
+		</div>
+		<div class="card-footer bg-transparent border-0 px-4 pb-4">
+			<a href="https://developers.home-assistant.io/docs/operating-system">
+				<span class="bi bi-book-fill"></span> Developer documentation</a>
+		</div>
+		</div>
+		</div>
+
+		<div class="col">
+		<div class="card h-100 border-0 shadow-sm">
+		<div class="card-body p-4">
+			<span class="bi bi-router-fill display-4 text-primary"></span>
+			<h2 class="mt-3 mb-1 fw-light">Google Fiber</h2>
+			<p class="text-body-secondary mb-3">Networking &middot; Customer premises equipment</p>
+			<p class="fs-5">Google's Buildroot fork carries a defconfig for every
+				Fiber device: network boxes, TV boxes, fiber jacks and
+				storage boxes. Tesla later reused its parallel build
+				tooling.</p>
+		</div>
+		<div class="card-footer bg-transparent border-0 px-4 pb-4">
+			<a href="https://opensource.googleblog.com/2014/03/progress-in-person-2014-buildroot.html">
+				<span class="bi bi-google"></span> Google Open Source Blog, 2014</a>
+			&middot;
+			<a href="https://github.com/DentonGentry/gfiber-buildroot">
+				<span class="bi bi-github"></span> gfiber-buildroot</a>
+		</div>
+		</div>
+		</div>
+
+		<div class="col">
+		<div class="card h-100 border-0 shadow-sm">
+		<div class="card-body p-4">
+			<span class="bi bi-camera-video-fill display-4 text-primary"></span>
+			<h2 class="mt-3 mb-1 fw-light">GoPro</h2>
+			<p class="text-body-secondary mb-3">Consumer electronics &middot; Action cameras</p>
+			<p class="fs-5">The HERO5 Black action camera ships Buildroot, as listed
+				in GoPro's own open source software notice.</p>
+		</div>
+		<div class="card-footer bg-transparent border-0 px-4 pb-4">
+			<a href="https://gopro.com/content/dam/help/hero5-black/HERO5-GoPro%20Open%20Source%20Software%20Notice.pdf">
+				<span class="bi bi-file-earmark-pdf-fill"></span> HERO5 open source notice</a>
+		</div>
+		</div>
+		</div>
+
+		</div><!-- /row -->
+	</div>
+	</div>
+
+	<!-- Famous projects -->
+	<div class="card my-5">
+	<div class="card-header text-bg-primary rounded-top fs-5">
+		<span class="bi bi-people-fill"></span>&nbsp; Famous projects</div>
+	<div class="card-body p-4">
+		<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-3">
+
+		<div class="col"><div class="card h-100"><div class="card-body">
+			<h4 class="mb-1"><span class="bi bi-controller text-primary"></span>
+				<a href="https://batocera.org">Batocera.linux</a></h4>
+			<p class="small text-body-secondary mb-2">Retro gaming</p>
+			<p class="mb-0">Plug-and-play retro gaming OS for PCs, single board
+				computers and handhelds.</p>
+		</div></div></div>
+
+		<div class="col"><div class="card h-100"><div class="card-body">
+			<h4 class="mb-1"><span class="bi bi-joystick text-primary"></span>
+				<a href="https://www.recalbox.com">Recalbox</a></h4>
+			<p class="small text-body-secondary mb-2">Retro gaming</p>
+			<p class="mb-0">The original Buildroot retro gaming distribution
+				Batocera was forked from.</p>
+		</div></div></div>
+
+		<div class="col"><div class="card h-100"><div class="card-body">
+			<h4 class="mb-1"><span class="bi bi-phone-landscape-fill text-primary"></span>
+				<a href="https://github.com/knulli-cfw/distribution">KNULLI</a></h4>
+			<p class="small text-body-secondary mb-2">Handheld custom firmware</p>
+			<p class="mb-0">Batocera fork for Anbernic, TrimUI and other
+				handheld consoles.</p>
+		</div></div></div>
+
+		<div class="col"><div class="card h-100"><div class="card-body">
+			<h4 class="mb-1"><span class="bi bi-camera-fill text-primary"></span>
+				<a href="https://openipc.org">OpenIPC</a></h4>
+			<p class="small text-body-secondary mb-2">IP cameras</p>
+			<p class="mb-0">Open firmware for IP cameras on HiSilicon, Ingenic,
+				SigmaStar, Novatek, Ambarella and more.</p>
+		</div></div></div>
+
+		<div class="col"><div class="card h-100"><div class="card-body">
+			<h4 class="mb-1"><span class="bi bi-droplet-fill text-primary"></span>
+				<a href="https://nerves-project.org">Nerves</a></h4>
+			<p class="small text-body-secondary mb-2">Elixir embedded framework</p>
+			<p class="mb-0">Elixir and Erlang firmware on top of a Buildroot
+				base system, <code>nerves_system_br</code>.</p>
+		</div></div></div>
+
+		<div class="col"><div class="card h-100"><div class="card-body">
+			<h4 class="mb-1"><span class="bi bi-lightbulb-fill text-primary"></span>
+				<a href="https://raspberrymatic.de">RaspberryMatic</a></h4>
+			<p class="small text-body-secondary mb-2">Smart home</p>
+			<p class="mb-0">Community OS for HomeMatic and homematicIP central
+				units.</p>
+		</div></div></div>
+
+		<div class="col"><div class="card h-100"><div class="card-body">
+			<h4 class="mb-1"><span class="bi bi-wifi text-primary"></span>
+				<a href="https://openwrt.org">OpenWrt</a></h4>
+			<p class="small text-body-secondary mb-2">Routers</p>
+			<p class="mb-0">Started as a Buildroot fork before growing its own
+				build system.</p>
+		</div></div></div>
+
+		<div class="col"><div class="card h-100"><div class="card-body">
+			<h4 class="mb-1"><span class="bi bi-camera-reels-fill text-primary"></span>
+				<a href="https://github.com/kerberos-io/kios">Kerberos.io KiOS</a></h4>
+			<p class="small text-body-secondary mb-2">Video surveillance</p>
+			<p class="mb-0">Runs the Kerberos open source video surveillance
+				out of the box.</p>
+		</div></div></div>
+
+		<div class="col"><div class="card h-100"><div class="card-body">
+			<h4 class="mb-1"><span class="bi bi-mic-fill text-primary"></span>
+				<a href="https://github.com/OpenVoiceOS/ovos-buildroot">Open Voice OS</a></h4>
+			<p class="small text-body-secondary mb-2">Voice assistant</p>
+			<p class="mb-0">Buildroot edition of the OVOS voice assistant for
+				small headless and touchscreen devices.</p>
+		</div></div></div>
+
+		</div><!-- /row -->
+	</div>
+	</div>
+
+	<!-- Vendor SDKs -->
+	<div class="card my-5">
+	<div class="card-header text-bg-primary rounded-top fs-5">
+		<span class="bi bi-cpu-fill"></span>&nbsp; Vendor SDKs</div>
+	<div class="card-body p-4">
+		<p class="text-body-secondary">Silicon and board vendors ship Buildroot in
+			their SDKs, so countless devices run it without saying so.</p>
+		<div class="list-group list-group-flush">
+			<a class="list-group-item list-group-item-action d-flex gap-3 py-3"
+			   href="https://docs.khadas.com/products/sbc/common/development/edges-rockchip-linux-sdk">
+				<span class="bi bi-motherboard-fill fs-3 text-primary"></span>
+				<span><b>Rockchip Linux SDK</b><br>
+				<span class="text-body-secondary">Buildroot is the default root filesystem
+					of the official SDK, used by most Rockchip based boards.</span></span>
+			</a>
+			<a class="list-group-item list-group-item-action d-flex gap-3 py-3"
+			   href="https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/12_00_00_07_04_Buildroot/exports/docs/buildroot/Overview.html">
+				<span class="bi bi-motherboard-fill fs-3 text-primary"></span>
+				<span><b>Texas Instruments Processor SDK</b><br>
+				<span class="text-body-secondary">Official Buildroot flavour for AM62x and
+					AM62Lx, with the TI external tree.</span></span>
+			</a>
+			<a class="list-group-item list-group-item-action d-flex gap-3 py-3"
+			   href="https://github.com/linux4sam/buildroot-external-microchip">
+				<span class="bi bi-motherboard-fill fs-3 text-primary"></span>
+				<span><b>Microchip</b><br>
+				<span class="text-body-secondary">Buildroot external tree for the SAMA5, SAMA7
+					and SAM9 SoCs.</span></span>
+			</a>
+			<a class="list-group-item list-group-item-action d-flex gap-3 py-3"
+			   href="https://github.com/bootlin/buildroot-external-st">
+				<span class="bi bi-motherboard-fill fs-3 text-primary"></span>
+				<span><b>STMicroelectronics</b><br>
+				<span class="text-body-secondary">Buildroot external tree for the STM32MP
+					boards, maintained by Bootlin.</span></span>
+			</a>
+		</div>
+	</div>
+	</div>
+
+	<div class="row my-5 text-center">
+	<div class="col-lg-8 offset-lg-2">
+		<h1 class="fw-light">Your product here?</h1>
+		<h3 class="text-body-secondary">Tell us about it on the
+			<a href="support.html">mailing list</a>.</h3>
+	</div>
+	</div>
+	<hr>
+
+</div>
+</div>
+</div><!-- /container -->
+
+<!--#include file="footer.html" -->
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
