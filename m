Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7405A606A32E
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 11:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JtyFCVAq;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AaPl6cAz
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C63540566;
	Fri,  6 Nov 2026 11:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CBIVRwTygyZD; Fri,  6 Nov 2026 11:16:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 603E24095F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793963774;
	b=ZG33YeFMqu3Kqe9HKUyjU9Dk/UJlOFo96TNHzyJxcrYRpxuM1TmtaRumGprGAKE8lQ9d
	 zq6fBuu3FZgZkXcEGWrvCax6ofVV6hhXNAJs30qrRUKXxOorqfCs+EZC1KTaluV9/pOFL
	 F0i9BXhUZi2sgq+N67Syn72HRhhX3igDAlVdWO7tR9XqTrWU0hUQTeP+HDno1GAx0wZU4
	 y0M7MxCoMGO+sFJ97G+lOfaGR7m25wBe5aPgPYwTQ8sgd5ryYdlj//T5uF13+ltMO9rDu
	 CdE/YaNXUO+9wsYBtEbWMGFSHNTsiVB477GpfeBbVKRgdydniqBNxoyOoTc733zjpTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793963774;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=JaPkJtGeY4WxyUqxHJ51NkudOmj5KmonEY/Zw17Z31c=;
	b=EcER3YWtcLbCnHbFzC0vQB4d/OzTLDFYVlgonr1X6/c51OcrYkjN2zFKd2Sj8KfjfkWB
	 v44Ce/tosuMBEuDooFpXOGbxNTub/HGdW4KxRD/UXmP78i757txd2tBRQrbB4D7orsCTA
	 U5nlQ350xdiipNZQqkR2itT6PYWeEBkJSexw8QkVGff7Qebwx6PKaYzw8/PWxmtprmdDm
	 fsH5/LqUZqP90DBHQkgBftq3d/usA5egPN72DPOe/mYBrDeDYFcZdDyZ/4naoEbQWNZs6
	 omSWDO2U/9zCCoLLe8H+DpUWiE4iFBO1AIUfLfcjkC9r4W8s+guO2uBfzXIrUBlHO6Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793963774;
	bh=JaPkJtGeY4WxyUqxHJ51NkudOmj5KmonEY/Zw17Z31c=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JtyFCVAqtkiZLlaGZQIhFsHIVtp9R/6wzTONtaVu5qRAbo338uAj+xWphH/t9CgUQ
	 fnyBRHURTD3X0Rcdw0+l2EhIc4PyqQS9hGPi6l8IaOAeYOzSXusc3makAoiWXBD01V
	 tC2ul5H8Bquly4MBoDRYtRT2WKLEUaGdku+qZRT3eA8c76gdJI+PTO3hDCxCob6tdT
	 gczm58XQD1GZ214EvuNhgzqMYVjo+42mbT5CapCvaiZSrRxDmOV9r/M73CyHgWRd10
	 OaUzuuvgSwxY7tMUPlvuZqJQQ4aywoTpn11HXchOvchWTHzv+1KMgPLzRUKj+rAxw6
	 PWTW57nZZ9OUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 603E24095F;
	Fri,  6 Nov 2026 11:16:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9862D2AC
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 11:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D737403A9
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 11:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nDJeyPWA0Ihu for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 11:16:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8CFE3400FF
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::430"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=AaPl6cAz
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8CFE3400FF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 11:16:10 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-491aaed7565so292854f8f.2
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 03:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793963768; x=1794568568; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PixNvJeMP/E84UBO2iALgODUS//AeETx1fnjz+MIPpU=;
 b=AaPl6cAznaPLV0EH1ZbscsJ0HVxatVe3z+NjmvpouPBCbEwIoEkPoxxqX6zhmDadGF
 T5EWolcFE7a6tI3jTzqn9QgRu7MSYnN4Yd5DRgSVHtXS8wbXna4z+PSLAQ/1kXLcds01
 4NxUlViJN5klim5TuQXhvbxcx2iP8Az5tXj98OKy0PxpxSNvKbQxJ55YfTaTflid7WeD
 Ytk1VcPXj2WjbpyLx+RqGAY+X7FG9Jzpo0ATUyUhOvhBQ3vJ+j8evnB6VJINvr6R1lah
 pVlAiE3iMili9rSw6AuzX9BMl70U1KeNaS2QaPKtqVUA4/rL6LpP0piJUrOlyVUpDh5o
 1oGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793963768; x=1794568568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=PixNvJeMP/E84UBO2iALgODUS//AeETx1fnjz+MIPpU=;
 b=pffucWYOz0LXSjP0VD1O3flcU4MGkCijCdrgy3GOOlpEhh4bEYVKaVrPTYfM7DkxDp
 /qQQ0aVbZclxy3C3rRWxS2kfFMs7sg3/7hUtFQrE/qQj81P0R6bHHPIxqFZPnSUDKvB8
 hJG3NCMmY/Di+NLDjMyIP8RWQiZkSXKzkOXA7IQuKnt/s0v6rz6V1TesYJu10eY8YgTg
 ynA5bQMdyrONwgrVeBm+mjYixT/yXo9Xg98vyiueKMkK32Kr3OdRacLqlXCoOEJgOkUE
 8+2pViEGEsh5FIw+ylBWjvuFEN1j7pP4RMCkWyeCis0hKN9jUMKBqTAvOLgNoNS0Zkmo
 cm8g==
X-Gm-Message-State: APuU4Z8Q3xoH2SS2xvbmJlWEmIj4bCgx7HK3IY5XBIhg7LFU4+oUTtn/
 r9WI97PWE3Jg+Pj2HsDyxObEr5WTtHupSvtgYVCwb7BxG/IT0tky5KY97y8UCQ==
X-Gm-Gg: AYBFou30TnuacCqRaqXM7dArWFSp/VATrgAHecf5VX92Pj48bn6N6vZMTGo62c3mkhW
 7EbWvVSKhzDxq1FjLdcCtJdQdmaLD1v5frTLdOC3KyZLmkilaYRL2DTCEREAaLiKIqX66XrON0g
 frUiG8ZV/gkfEvn7s9RCJ9C15Eo86Bnyk7QL/+87Ds/q5E2J0LTD3VvcpdN7iDHVx1j38XX7qC7
 /tC10DM6up4CfgGSZdQR4L3mgU+WU1QB6jeZ+u8F2i73AozZDojaPkqOd4uxLBDchaH0b5WoneB
 xnITXE7oYwD+u7JoEtzJDQ69xtRYeF1YhQ0WtJRpfi8pCtzSPipd3h+uYzSk6P8oxWBcXbtK45l
 BU2Tzp6l3Mun0/MURc6JxxqMuO9A0zoeSOcmAGm8BEy2Sj9W5wkj7Q+7mvrACa4xNDUSV0p+nDR
 t2hUoXV17TKe0efkveCEDQqoTQpdslpG/wvCYEmidu1bkyhciRvvw90e5cujSsxxGf/xgz8tsBU
 nG41hjQjgo0BCOIGAmHbZGBWGQst0LdBdoevyqa96I+Q7Q+tjVge44Rs58Ui0BFVUGYl5ZqncMH
 ijLjT2e4J/T+ppEjiW+clA4IpIotbBOODgkATOWyaLHwVspblx2bVmQ=
X-Received: by 2002:a05:6000:4a03:b0:48e:412:3829 with SMTP id
 ffacd0b85a97d-492764aede3mr4654787f8f.15.1793963767541; 
 Fri, 06 Nov 2026 03:16:07 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d7232832sm3080195f8f.25.2026.11.06.03.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 03:16:07 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:16:03 +0100
Message-Id: <20261106111604.1500074-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106111604.1500074-1-angelo.compagnucci@gmail.com>
References: <20261105175058.3132718-1-angelo.compagnucci@gmail.com>
 <20261106111604.1500074-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 2/3] website: add a showcase page
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

- well known products: Tesla, Home Assistant OS, Sipeed NanoKVM and
  Analog Devices ADALM-PLUTO;
- testimonials from Arm, Home Assistant OS, EVS and Texas Instruments,
  quoted from the Buildroot at 25 talk at ELC Europe 2026;
- open source projects: Batocera.linux, Recalbox, OpenIPC, Thingino,
  minikube, Nerves, SeedSigner OS, SkiffOS and Tomato64;
- vendor SDKs: Texas Instruments, Microchip, STMicroelectronics,
  Analog Devices, Canaan Kendryte K230, StarFive JH7110 and Espressif
  ESP32-S31.

The page ends by inviting users to tell about their products on the
mailing list.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v3 -> v4:
  - add a "What users say" section, quoting verbatim the testimonials
    collected for the Buildroot at 25 talk at ELC Europe 2026 (Arm, Home
    Assistant OS, EVS and Texas Instruments), with a link to the
    published slides; the EVS one is shortened to fit the layout;
  - projects: drop MiSTer FPGA, whose Linux image repository is barely
    known, and add Tomato64, which also gave a testimonial for the talk.

Changes v2 -> v3:
  - reorganize the page to prioritize active projects, each one
    checked against its public repository, documentation or
    image [Thomas]:
    - tagline: "From cars and smart homes to cameras and retro
      consoles";
    - well known: keep Tesla even if it is old, because its Buildroot
      tree is still public and verifiable on GitHub; describe it as the
      tree building the infotainment and Autopilot images;
    - well known: mention the br2-external tree of Home Assistant OS
      and link its GitHub repository; replace Google Fiber and GoPro
      with Sipeed NanoKVM and Analog Devices ADALM-PLUTO;
    - projects: drop KNULLI, RaspberryMatic, OpenWrt (not Buildroot
      based anymore), Kerberos.io KiOS (archived) and Open Voice OS
      (barely active); add MiSTer FPGA, Thingino, minikube,
      SeedSigner OS and SkiffOS; reword Recalbox;
    - vendor SDKs: drop Rockchip (only a Web Archive copy of its guide
      is left); update the Texas Instruments link to SDK 12.01 and the
      Microchip link to the linux4microchip repository, with PolarFire
      SoC; list the STM32MP1 and STM32MP2 for ST; add Analog Devices,
      Canaan Kendryte K230, StarFive JH7110 and Espressif ESP32-S31.

Changes v1 -> v2:
- link the Rockchip Linux SDK to an official Rockchip document, the
  RK3399 Linux Buildroot development guide, instead of the Khadas
  documentation. The link points to the Web Archive copy, since
  opensource.rock-chips.com is not reachable anymore.

 docs/website/showcase.html | 340 +++++++++++++++++++++++++++++++++++++
 1 file changed, 340 insertions(+)
 create mode 100644 docs/website/showcase.html

diff --git a/docs/website/showcase.html b/docs/website/showcase.html
new file mode 100644
index 0000000000..a1b8d827af
--- /dev/null
+++ b/docs/website/showcase.html
@@ -0,0 +1,340 @@
+<!--#include file="header.html" -->
+
+<div class="bg-primary py-5">
+<div class="container">
+<div class="row justify-content-center">
+<div class="col-xxl-10 text-center">
+	<h1 class="display-4 fw-bold text-white">Powered by Buildroot</h1>
+	<p class="fs-4 fw-light text-white-50 mb-0">From cars and smart homes to cameras
+		and retro consoles: products and projects whose operating system is built with
+		Buildroot.</p>
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
+			<p class="text-body-secondary mb-3">Automotive &middot; Infotainment and Autopilot</p>
+			<p class="fs-5">Tesla publishes the Buildroot tree that builds the system
+				images of its infotainment and Autopilot computers, with
+				custom packages and a dm-verity initramfs.</p>
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
+				with Buildroot and a br2-external tree.</p>
+		</div>
+		<div class="card-footer bg-transparent border-0 px-4 pb-4">
+			<a href="https://developers.home-assistant.io/docs/operating-system">
+				<span class="bi bi-book-fill"></span> Developer documentation</a>
+			&middot;
+			<a href="https://github.com/home-assistant/operating-system">
+				<span class="bi bi-github"></span> home-assistant/operating-system</a>
+		</div>
+		</div>
+		</div>
+
+		<div class="col">
+		<div class="card h-100 border-0 shadow-sm">
+		<div class="card-body p-4">
+			<span class="bi bi-display display-4 text-primary"></span>
+			<h2 class="mt-3 mb-1 fw-light">Sipeed NanoKVM</h2>
+			<p class="text-body-secondary mb-3">Remote management &middot; RISC-V IP-KVM</p>
+			<p class="fs-5">The low-cost IP-KVM is built with the LicheeRV Nano
+				SDK, a Buildroot based SDK for the Sophgo SG2002.</p>
+		</div>
+		<div class="card-footer bg-transparent border-0 px-4 pb-4">
+			<a href="https://github.com/sipeed/NanoKVM">
+				<span class="bi bi-github"></span> sipeed/NanoKVM</a>
+			&middot;
+			<a href="https://github.com/sipeed/LicheeRV-Nano-Build">
+				<span class="bi bi-github"></span> LicheeRV Nano SDK</a>
+		</div>
+		</div>
+		</div>
+
+		<div class="col">
+		<div class="card h-100 border-0 shadow-sm">
+		<div class="card-body p-4">
+			<span class="bi bi-broadcast display-4 text-primary"></span>
+			<h2 class="mt-3 mb-1 fw-light">Analog Devices ADALM-PLUTO</h2>
+			<p class="text-body-secondary mb-3">Software defined radio &middot; Lab instruments</p>
+			<p class="fs-5">The firmware of the PlutoSDR radio and of the ADALM2000
+				lab instrument is built with Analog Devices' Buildroot.</p>
+		</div>
+		<div class="card-footer bg-transparent border-0 px-4 pb-4">
+			<a href="https://github.com/analogdevicesinc/plutosdr-fw">
+				<span class="bi bi-github"></span> analogdevicesinc/plutosdr-fw</a>
+		</div>
+		</div>
+		</div>
+
+		</div><!-- /row -->
+	</div>
+	</div>
+
+	<!-- Testimonials -->
+	<div class="card my-5">
+	<div class="card-header text-bg-primary rounded-top fs-5">
+		<span class="bi bi-chat-quote-fill"></span>&nbsp; What users say</div>
+	<div class="card-body p-4">
+		<p class="text-body-secondary">Collected for the
+			<a href="https://hosted-files.sched.co/osselceu2026/33/buildroot-25y-v2.pdf">Buildroot at 25</a> talk at the Embedded Linux
+			Conference Europe 2026.</p>
+		<div class="row row-cols-1 row-cols-lg-2 g-4">
+
+		<div class="col">
+		<figure class="card h-100 border-0 shadow-sm mb-0">
+		<div class="card-body p-4">
+			<blockquote class="blockquote fs-6 fst-italic mb-0">
+				<p>&ldquo;Open source has long been central to software development on Arm. For
+					25 years, Buildroot has offered developers a straightforward way to
+					build Linux systems, supporting the Arm architecture from its earliest
+					days to today's platforms. Its longevity demonstrates how an
+					engineering-led open source project can evolve across generations
+					while continuing to solve practical problems for developers.&rdquo;</p>
+			</blockquote>
+		</div>
+		<figcaption class="card-footer bg-transparent border-0 px-4 pb-4 text-body-secondary">
+			&mdash; Mark Hambleton, SVP, Software, <b>Arm</b></figcaption>
+		</figure>
+		</div>
+
+		<div class="col">
+		<figure class="card h-100 border-0 shadow-sm mb-0">
+		<div class="card-body p-4">
+			<blockquote class="blockquote fs-6 fst-italic mb-0">
+				<p>&ldquo;We&rsquo;ve been using Buildroot for Home Assistant OS since 2018, and
+					we really value how simple and approachable it is: it uses familiar
+					Makefiles, which makes it easy to work with, while keeping up with new
+					releases remains very manageable. We also appreciate how
+					straightforward and fast the upstream patch process is. Buildroot now
+					provides the foundation for Home Assistant&rsquo;s open smart home
+					platform across roughly 2 million deployments.&rdquo;</p>
+			</blockquote>
+		</div>
+		<figcaption class="card-footer bg-transparent border-0 px-4 pb-4 text-body-secondary">
+			&mdash; <b>Home Assistant OS</b>, Open Home Foundation</figcaption>
+		</figure>
+		</div>
+
+		<div class="col">
+		<figure class="card h-100 border-0 shadow-sm mb-0">
+		<div class="card-body p-4">
+			<blockquote class="blockquote fs-6 fst-italic mb-0">
+				<p>&ldquo;Buildroot gives us the flexibility we need to develop
+					Linux-based systems for a wide range of EVS products. The build system
+					is powerful yet easy to work with, allowing us to tailor each system
+					to the specific requirements of its target application. &hellip; The
+					Buildroot LTS initiative is also a key element for us, particularly in
+					the context of the EU Cyber Resilience Act.&rdquo;</p>
+			</blockquote>
+		</div>
+		<figcaption class="card-footer bg-transparent border-0 px-4 pb-4 text-body-secondary">
+			&mdash; <b>EVS</b></figcaption>
+		</figure>
+		</div>
+
+		<div class="col">
+		<figure class="card h-100 border-0 shadow-sm mb-0">
+		<div class="card-body p-4">
+			<blockquote class="blockquote fs-6 fst-italic mb-0">
+				<p>&ldquo;&hellip; Within that portfolio, Buildroot has emerged as the
+					distribution of choice for the broadest segment of our general-purpose
+					customer base&mdash;the engineers who need a working, maintainable
+					embedded Linux system without taking on the full operational burden of
+					a larger framework. This is not a niche use case. It describes the
+					majority of embedded product development.&rdquo;</p>
+			</blockquote>
+		</div>
+		<figcaption class="card-footer bg-transparent border-0 px-4 pb-4 text-body-secondary">
+			&mdash; <b>Texas Instruments</b></figcaption>
+		</figure>
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
+			<p class="mb-0">Retro gaming distribution for single board
+				computers and PCs.</p>
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
+			<h4 class="mb-1"><span class="bi bi-camera-video-fill text-primary"></span>
+				<a href="https://github.com/themactep/thingino-firmware">Thingino</a></h4>
+			<p class="small text-body-secondary mb-2">IP cameras</p>
+			<p class="mb-0">Open firmware for cameras based on Ingenic SoCs.</p>
+		</div></div></div>
+
+		<div class="col"><div class="card h-100"><div class="card-body">
+			<h4 class="mb-1"><span class="bi bi-boxes text-primary"></span>
+				<a href="https://github.com/kubernetes/minikube/tree/master/deploy/iso/minikube-iso">minikube</a></h4>
+			<p class="small text-body-secondary mb-2">Kubernetes development</p>
+			<p class="mb-0">Virtual machine image for local Kubernetes clusters,
+				with its own br2-external tree.</p>
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
+			<h4 class="mb-1"><span class="bi bi-shield-lock-fill text-primary"></span>
+				<a href="https://github.com/SeedSigner/seedsigner-os">SeedSigner OS</a></h4>
+			<p class="small text-body-secondary mb-2">Bitcoin signing device</p>
+			<p class="mb-0">Minimal OS of the air-gapped SeedSigner hardware wallet.</p>
+		</div></div></div>
+
+		<div class="col"><div class="card h-100"><div class="card-body">
+			<h4 class="mb-1"><span class="bi bi-layers-fill text-primary"></span>
+				<a href="https://github.com/skiffos/SkiffOS">SkiffOS</a></h4>
+			<p class="small text-body-secondary mb-2">Configuration layers</p>
+			<p class="mb-0">Layered Buildroot configurations for more than 50
+				targets, from the Raspberry Pi to the PinePhone.</p>
+		</div></div></div>
+
+		<div class="col"><div class="card h-100"><div class="card-body">
+			<h4 class="mb-1"><span class="bi bi-router-fill text-primary"></span>
+				<a href="https://github.com/tomato64/tomato64">Tomato64</a></h4>
+			<p class="small text-body-secondary mb-2">Router firmware</p>
+			<p class="mb-0">Port of the Tomato router firmware to x86_64 and
+				arm64, on a br2-external tree.</p>
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
+			   href="https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/12_01_00_05_03_Buildroot/exports/docs/buildroot/Overview.html">
+				<span class="bi bi-motherboard-fill fs-3 text-primary"></span>
+				<span><b>Texas Instruments Processor SDK</b><br>
+				<span class="text-body-secondary">Official Buildroot flavour for AM62x and
+					AM62Lx, with the TI external tree.</span></span>
+			</a>
+			<a class="list-group-item list-group-item-action d-flex gap-3 py-3"
+			   href="https://github.com/linux4microchip/buildroot-external-microchip">
+				<span class="bi bi-motherboard-fill fs-3 text-primary"></span>
+				<span><b>Microchip</b><br>
+				<span class="text-body-secondary">Buildroot external tree for the SAMA5, SAMA7, SAM9
+					and PolarFire SoC families.</span></span>
+			</a>
+			<a class="list-group-item list-group-item-action d-flex gap-3 py-3"
+			   href="https://github.com/bootlin/buildroot-external-st">
+				<span class="bi bi-motherboard-fill fs-3 text-primary"></span>
+				<span><b>STMicroelectronics</b><br>
+				<span class="text-body-secondary">Buildroot external tree for the STM32MP1 and STM32MP2
+					boards, maintained by Bootlin.</span></span>
+			</a>
+			<a class="list-group-item list-group-item-action d-flex gap-3 py-3"
+			   href="https://github.com/analogdevicesinc/br2-external">
+				<span class="bi bi-motherboard-fill fs-3 text-primary"></span>
+				<span><b>Analog Devices</b><br>
+				<span class="text-body-secondary">Buildroot external tree for the ADSP-SC5xx processors and
+					the ADI boards based on AMD Xilinx SoCs.</span></span>
+			</a>
+			<a class="list-group-item list-group-item-action d-flex gap-3 py-3"
+			   href="https://github.com/kendryte/k230_linux_sdk">
+				<span class="bi bi-motherboard-fill fs-3 text-primary"></span>
+				<span><b>Canaan Kendryte K230</b><br>
+				<span class="text-body-secondary">Buildroot based Linux SDK for the K230 RISC-V AI SoC.</span></span>
+			</a>
+			<a class="list-group-item list-group-item-action d-flex gap-3 py-3"
+			   href="https://github.com/starfive-tech/VisionFive2">
+				<span class="bi bi-motherboard-fill fs-3 text-primary"></span>
+				<span><b>StarFive JH7110</b><br>
+				<span class="text-body-secondary">VisionFive 2 SDK, with Buildroot for the root
+					filesystem.</span></span>
+			</a>
+			<a class="list-group-item list-group-item-action d-flex gap-3 py-3"
+			   href="https://github.com/espressif/esp-buildroot-external">
+				<span class="bi bi-motherboard-fill fs-3 text-primary"></span>
+				<span><b>Espressif ESP32-S31</b><br>
+				<span class="text-body-secondary">Buildroot external tree for Linux on the ESP32-S31,
+					as a developer preview.</span></span>
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
