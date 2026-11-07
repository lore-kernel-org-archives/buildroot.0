Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1E2606A33A
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 15:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ittPHtuj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Scyny7Tm
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAA2B809F5;
	Sat,  7 Nov 2026 15:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X97Q9k5tjh1I; Sat,  7 Nov 2026 15:26:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 00EA580F83
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794065189;
	b=bRNW5lFuA1c+qYsj0V76OJJqfA54tWWkVWj3e7GKXpnWD8m3M5he6Up/xKTFx2hvVebb
	 QAeDRE4qs1t6xLrRXDdFMT9dGq23J4bHGK5H7jhURkPmvF3fDCCdWeq6g6e9OWkSLIDB4
	 zBS6uTYcfnyBAUZZYeSKzvkd9ewd1GKoubQwR7JBUXtwZApf2NTsVyxLYtFAp4a+yjqRA
	 HBJYeTDDo2HPn6Cg8hXKvxpxTmXpdlSemoB9ld3AlupCA4tkR+ydqYD98v6PVHUzYFmlN
	 K3ZeKIOgyM+oTU211nu4sB5NexkpNjFuR1CSClUTpzaFzm9k7UhlIh1YtqoEYQbRgKQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794065189;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=x41pynoPUHYOxfz3w3MdAJAGfPE4DFxturpYzxsq4dE=;
	b=Sivd/qfQ/sKs8HKOQjv5t9ceT9J1yrpt8Fbie5OUZOJM9AUVjG1tdCbcHjrnjHU44f2E
	 qY+NHpSl8bB3mnYD0pSWbWt+O8Iru5WCg4avNF6lvFwlJP+OSDc5nfSar0EzB6ymLGtUF
	 8XE34xFX8KINIIGHyW4LtCB+ltnm8sNKybNWORz2WmRJnH50udOvDD2a/4yGGWsW1O1LA
	 /cy+ui58Dze5SVPWmuUjrdCOBZMpb+JcWW5gEnQBNFsskmFZKBycxAhyZggSBO3F3F2Yb
	 VJpXwqhuQ0dGmpoHs7HYfyMrDPxsvy2eziPOnKpcmnICZkuBXsih1t93CxiIVLicbhw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794065189;
	bh=x41pynoPUHYOxfz3w3MdAJAGfPE4DFxturpYzxsq4dE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ittPHtujzc6wgebdqyNaP85A7gt/YqrY41QEoY5lpA7q1N4fxxzt6x9Tb8nyXTSL8
	 oTC0e3KAKLHZIO3toscSBNP2VRqhpSGUF6OSwXHaARBcNbEF8DH3P1dIpl7xNT++L1
	 +CTon0q+o+O1OLL1nwMYQtS7k5wyFIEhg9hUV8EswAWz3zL2zoJ2uLCdeutHsJXyAE
	 3tdyfgqii9QfM9dHa+MfOUzbMLvfARBJhltLTpez0SW9RdUUnGeF5uNqvNkX8EMpvk
	 OmtvpXJMcoK4aYDNFe4qtDMBXug4twh/f6Nrz7ckbvLXYId/Zd97QvCu3ldEJjp8SH
	 xqvAJkBwPhzZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00EA580F83;
	Sat,  7 Nov 2026 15:26:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ADFD7211
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 15:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F7816065A
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 15:26:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZeo3ZA6Cf1i for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 15:26:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8213160658
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=Scyny7Tm
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8213160658
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 15:26:25 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a2167bd087so14317545e9.3
 for <buildroot@buildroot.org>; Sat, 07 Nov 2026 07:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794065183; x=1794669983; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=43DTOFNmx+xzfDxRtzljRak1cvHcCr1KV6cFmhzu8fg=;
 b=Scyny7Tm23fO8sMLBUegUCTLteQOERlRUgzOfBmjQBQ+y6rhncfCJpr3zvfCJI8bu4
 whxDzKo4JsnoGKj3regyqIKo86CMHOedzZ/E3vGAtYN/Bs6xHbAMqllh6owl4961m29g
 +nGmd3nJg07rPhHXOOf4MajZyBHvoMbozg5IfljOMzfooCjZTqgCBpo7dfqP46rBzrtS
 XZEVSOtSc1B885Fne02RUcjJtYTapMtlIx88eefPUSXsDO0dehXkQd9nl89dFu/mm0X3
 SlsM9Tp10uXxca6mWph5jfYuFijdyMvUDgqmxNU9vYx1tWmVaxApisKqNtcQsX+vknEa
 1k5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794065183; x=1794669983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=43DTOFNmx+xzfDxRtzljRak1cvHcCr1KV6cFmhzu8fg=;
 b=ilTEJNbuVJKzmxEXCdxob/9Ke/sMGtWqR8gBFNkVmXq1ACrB4tvjUHR7mmCW8Lqmga
 apkMfIRnSRI7aaxuR31mvRFTzXOWFP2Sn/++JpOk0GBlzaCOGU6EKpzPcfkgBMH5MuIU
 KZqI5Yu8+vT5QT3et5Y8MHKoyaJ6r192HdzyN0e50dPc4IFE+w7N9stmEeJHqJUuy7kg
 7AmSLxBBH0NpgJps2ZvnATS0xMa1Ili+E3EPzfYeMfELUfJTGzIYoj92TCP41Eb4Cig1
 1IhOBFRb0aLEkGc+yHs42nDfNpdiOEaPBXqOR83SV42Bhuut7NsflWDeiiOGSIkc5ki9
 hxXA==
X-Gm-Message-State: APuU4Z+m2neUPthAbb+2NE0B1GyvH7flr/Xp3KCvGEZ8j/QYD2NXsdnL
 Ajf9beGFgeidho69c92fWw/Zy0lrrMC2OUpfzewBKVCacUfuGZv99fViDJRKlw==
X-Gm-Gg: AYBFou04CD/zdA1ADa3eKvVK2OwpmCOnG5U2E+ks7IVBediTujyTOnYyhEe4oHjjKIl
 9VJ/XG08ZMhKmlH23HJ/NQq+D6I54brkpBWxz81R7MO2/YL7pbxa+xr5NwkH4JPeCxHSHEfEudt
 lR3IErkw1xAlrSxElpRfPPHHJmwJVu9s0K4McLMNom4VPCpVQBvLOZrkqK9P2RAlqX/BkeaGAtB
 qYrVNQfFqDuSiBnIAqwO+YIWzuGovGvWlqUX5M8up7krSMiO/JLuBwYCmzjJoErVpErwp6ME8he
 5yjHzJFzyPWBoHxj+/eOokDc/AtKc4gkmwdVqibksYC0dQ1OxvSUP+A3JIKLAdgDSow4x/bVurP
 18tdcPei/zBDZm7P8SUJTTpK2+mI4ThiBKzF0Jl7yMBJXDTHE3JZxsvTaIcCtMPWtWzbVoNG6He
 flEywJPnpmF2stTAIYFbZzJrz8JWAAemuAmfRFv8R2yPZwvv5V4Wg7urYIdNXUqNoWckzmW5y53
 bL59dIqZnAGVx1jEicIh5sjYR5YmBExbQgg0VwD836nRLio2mAQHOmpG2J+o2WUCxB9psRiLcg8
 jVASSGR5IzDr0IIZ7KCoxkmO73IlTwNJMs338FsXAqOfvKh05ZjK
X-Received: by 2002:a05:600c:a31b:b0:4b7:6942:39be with SMTP id
 5b1f17b1804b1-4b769423c01mr73852635e9.24.1794065183011; 
 Sat, 07 Nov 2026 07:26:23 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7e2e9ad7esm78715795e9.1.2026.11.07.07.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2026 07:26:22 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat,  7 Nov 2026 16:26:17 +0100
Message-ID: <20261107152618.39702-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107152618.39702-1-angelo.compagnucci@gmail.com>
References: <20261106111604.1500074-1-angelo.compagnucci@gmail.com>
 <20261107152618.39702-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 2/3] website: add a showcase page
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

- well known products: Tesla, Home Assistant OS, Godot Engine and
  Analog Devices ADALM-PLUTO;
- testimonials from Arm, Home Assistant OS, EVS and Texas Instruments,
  quoted from the Buildroot at 25 talk at ELC Europe 2026;
- open source projects: Batocera.linux, Recalbox, OpenIPC, Thingino,
  minikube, Nerves, SkiffOS, Tomato64 and Sipeed NanoKVM;
- vendor SDKs: Texas Instruments, Microchip, STMicroelectronics,
  Analog Devices, AMD (Xilinx), Canaan Kendryte K230, StarFive JH7110
  and Espressif ESP32-S31.

The page ends by inviting users to tell about their products on the
mailing list.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v4 -> v5:
  - well known: add Godot Engine, whose official Linux binaries are
    built with toolchains from its Buildroot soft-fork [Julien], in
    place of Sipeed NanoKVM, moved to the projects;
  - projects: drop SeedSigner OS, the least active one, to keep
    nine boxes;
  - vendor SDKs: add AMD (Xilinx), with the Buildroot page of the
    Xilinx wiki; the support is not official, but the Zynq, ZynqMP
    and Versal defconfigs are maintained by Neal Frager from AMD
    [Julien].

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

 docs/website/showcase.html | 349 +++++++++++++++++++++++++++++++++++++
 1 file changed, 349 insertions(+)
 create mode 100644 docs/website/showcase.html

diff --git a/docs/website/showcase.html b/docs/website/showcase.html
new file mode 100644
index 0000000000..1ed4fd0be8
--- /dev/null
+++ b/docs/website/showcase.html
@@ -0,0 +1,349 @@
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
+			<span class="bi bi-joystick display-4 text-primary"></span>
+			<h2 class="mt-3 mb-1 fw-light">Godot Engine</h2>
+			<p class="text-body-secondary mb-3">Game engine &middot; Linux releases</p>
+			<p class="fs-5">The official Linux binaries of the open source game
+				engine are built with toolchains from its Buildroot soft-fork,
+				to run across common Linux distributions.</p>
+		</div>
+		<div class="card-footer bg-transparent border-0 px-4 pb-4">
+			<a href="https://docs.godotengine.org/en/stable/about/list_of_features.html">
+				<span class="bi bi-book-fill"></span> List of features</a>
+			&middot;
+			<a href="https://github.com/godotengine/buildroot">
+				<span class="bi bi-github"></span> godotengine/buildroot</a>
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
+		<div class="col"><div class="card h-100"><div class="card-body">
+			<h4 class="mb-1"><span class="bi bi-display text-primary"></span>
+				<a href="https://github.com/sipeed/NanoKVM">Sipeed NanoKVM</a></h4>
+			<p class="small text-body-secondary mb-2">Remote management</p>
+			<p class="mb-0">Low-cost RISC-V IP-KVM, built with the Buildroot based
+				LicheeRV Nano SDK for the Sophgo SG2002.</p>
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
+			   href="https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/2804187327/Buildroot">
+				<span class="bi bi-motherboard-fill fs-3 text-primary"></span>
+				<span><b>AMD (Xilinx)</b><br>
+				<span class="text-body-secondary">Community support for the Zynq, Zynq UltraScale+ MPSoC,
+					Kria and Versal SoCs, with Buildroot defconfigs maintained by AMD.</span></span>
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
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
