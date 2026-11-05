Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF33F606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 17:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=X3e3RuWe;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iy1Uv7si
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9CAA60697;
	Thu,  5 Nov 2026 17:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EyIrL-8A1F68; Thu,  5 Nov 2026 17:51:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0956A607F7
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793901073;
	b=ZpbKHDQYGosDNBaBCAjYqpXUQHqBGYNjPybpazdFOBmUNUTNpukvF7DZpBVvx/7RyyJU
	 sTd6noqKjx8BsMntwjOj5HAKKxjYOncSNlpQSBjiKyZZaOsklm9o6xC2HEcw33d3gHIPv
	 S9iGcpjkxd8i7BaTWJGSWedBl0ko4tL7eAZkNZfyeSitpQotmV4bFvZCkLFpWRSvAiDuF
	 8fDEIa4es+jBGwlh0YC5EESOC1cFJOe+lScPwMFG6Q1W30xvHrgWjmHJZVclayVONhqNk
	 c5e0nCrkxRvI8AR722Oji8nE2JpZzCk/OLNLk7av1Us4UunbQXhn+QNGL22RpV1b0qA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793901073;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=gM/lXBRVhcuOe5mwEsBDQxdrFfYOGcIuZs+74QnOQX4=;
	b=FxzDBoPJ5A2qdcnYuecgzUZKU3SueVcJfhDbZ3+pp8WdIyGizDyH9Mg5xXwSAMOiqzO1
	 R+zytXNmzlCyv1LtFzy4YQSCFzhJcI7MhvBLNs+aMtMzv6vg1kVhTDj0Kwk/5Y7qsXLqx
	 DwQoZrpmC8ey8i6KaJwFDPODyHpmGGODU3SHrKIX9NCDVjwIXRKWpI/F0PABwzNx4Bo1F
	 OYyfWuDCeo1+72Lcy0v089/GxCsiH8bVxRmzh0wfHK1XHaWlTJw47DEkUJJNFgHtlZAR8
	 ZU+xk22ZUpidEtimvRl19cwhxOgvArbaQ2xTUltRqVgl0tlLqNW8PRdGmeDkfclJ/wg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793901073;
	bh=gM/lXBRVhcuOe5mwEsBDQxdrFfYOGcIuZs+74QnOQX4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X3e3RuWehrR5XfyRf9X2JWryommXtV/wBFVrQLUeMcoOF5xqKmau1yo8ahlUsATKI
	 v1fw1F3f7w1jnYgCY/JfsHCw1r8q3UHmfS81ir7zbd+G4DMIrvng/HDfyzeoWw1yfX
	 KyDnDLmDWP8fCuljOGaTAe/kIb4zlQrzQrzL9/ggwWkE/peZmpTLBMzAVyeobYfObX
	 8sXPDQGbXT+ohMoa/PtYPF15fVu6HJcARboOk6aMmPXd1nAYGiWiXN1ftMZjalC8C9
	 CZ5fipUnyOet2Ai1oFKhxMd6Prq3agqcvxadI3u4Z446s0ogIb81qTXscrzXV3pa35
	 QEAe0CrQDVwRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0956A607F7;
	Thu,  5 Nov 2026 17:51:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0541931F
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 17:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB4C6403E3
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 17:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKgfLGAUIL-h for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 17:51:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3017B403AE
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Iy1Uv7si
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3017B403AE
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 17:51:03 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a20bde60a0so20329045e9.3
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 09:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793901062; x=1794505862; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FkIJaHI/x0ax0KA/SPOYfBABRpchn0Y0+fCInP//xyg=;
 b=Iy1Uv7si1ypXnHRqYxdMOYZ7tXLg/BaTdk/avPHiu8c+90AcfS9uBPHqM30i6YM9pg
 /6ay0K4meD5trPiSbutkKmpUPhaLVU7UK//wUC5/R7ZuZKKnr99nPIvOXg9+JFsBIYv1
 PvBkTUUTpUsYsjWc6jypxOWpamTXqoOETJrwVeD3/f1IPcspWH4MrxNsxNXLLxBtjs1r
 8V3PLkBWjPAtmjuhlvkvnE2R9YFGeT74GY/Tf4XgxKbx8xlKzeOpPH2jvo1UYjoBInjN
 ifiSIBhog1Hn4SWoekVmuWMqlysJ+3/O0ib9RnhdsE5LIgeBv6Fg6xNYIIziHGraZ1zw
 JU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793901062; x=1794505862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FkIJaHI/x0ax0KA/SPOYfBABRpchn0Y0+fCInP//xyg=;
 b=ddRKXqnMKvsJlPNounBuFv7DrtMkO1TVcWj05bh5POQ3hoK4NhpEfw0FiKW/z0fq62
 Xh+O3NnoT3yWIbxJ5jjXKK5rNJ21icXjzdytdK9ZtQrzMa8f7Cqx9/ogGDpMA8VSR2l8
 PPbxNDHjGtrMd9Ch30YDwSsHxs8i2bktHRBL7ZV7cf7jZJqdu1wNnQlgg2dl5xr4ShGd
 4G5mvIF79HGnKhoTaZQXx1sUPR7MThZry8cEP1797EoJuQKX5Ha/4gAlquAi/zGTYVLk
 3aqk2UYmbRtTuvxmTLBkDaxxau9QImMhw3n2xwoESVT9035W77uBb2u2gey8Xij1Ke9U
 PHmQ==
X-Gm-Message-State: APuU4Z9LZ8VbwZhpA2DQyh94PFErUaY89qe9FYq+tXuTNTPpMe3v09g7
 V2u6+fy20hjgvaO+Dr9Q03el1r9Gx4CjhgKzb1sPz805WHjKUy/S5GM6XLWk+Q==
X-Gm-Gg: AYBFou07U7GW4uWbW8eaEE3GRyY6IJzGyoeU5onK/Ps8qarDhMWSdsAq+l5x1u6B4Iz
 0cX9jZoM/iMvvt7zU+Q1jLSHK7UaKkU8eKK2Cy/xKsrdcI1wOc44mt9/RfKQ7ZZXWQsvBcZIF+6
 OMcUiZexBiHqJBzcB+PUEBapPD2fizCoosEuS5Nna55Fdp30v0MiskdGCqRNQIs0ah1ZjaBWRTV
 FHCJqBE+AbdFn5j8FaIz7t7k0GJHbwms8RIOlo5f6V4+igI6DOs8u61B60vHgh2T3mjKaqoxgvm
 TJOdoYLV1A7wAqut4HE/hfwHD2j4BzFlebFJ+FM8gz6TrMExu/3V2QI4LpoSgxDShRwZuveCD+G
 ihmU/c4tEiSp+poSCexYXlRy4ZgTXr40hoguqvGEwJza9E4oSPDW84UuVFnHaYnSecO2nYpzTF1
 spx+JjCGqxkl2Ie6kIYp8kBASoFDa0mFLnX6JTt6h8pqTyFFpHz2B8ZWOdMiGFzMe0zR/77Tw1H
 5i7SQoQ5jpR6Z4mds1GrY3A/RpPIsgNMXviOgb6z7N4iL/cDEybedbTwKPuV/Y3rUFCSZ9tx7N0
 7cbiwx/BC1rBKVDDhdST7o/qtR1XEU9s21DEHIZSAvjKmylL0HKN3vwiWfA9r6NKi7qbM8IyVrE
 =
X-Received: by 2002:a05:600c:198c:b0:4a1:fc98:1cb1 with SMTP id
 5b1f17b1804b1-4ac15584c05mr453172995e9.2.1793901061579; 
 Thu, 05 Nov 2026 09:51:01 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b4134ff2a3sm124325235e9.2.2026.11.05.09.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 09:51:00 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu,  5 Nov 2026 18:50:57 +0100
Message-Id: <20261105175058.3132718-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105175058.3132718-1-angelo.compagnucci@gmail.com>
References: <20261105102458.1795886-1-angelo.compagnucci@gmail.com>
 <20261105175058.3132718-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/3] website: add a showcase page
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a page listing products and projects whose operating system is
built with Buildroot, each one with a link to a public source:

- well known products: Tesla, Home Assistant OS, Sipeed NanoKVM and
  Analog Devices ADALM-PLUTO;
- open source projects: Batocera.linux, Recalbox, MiSTer FPGA,
  OpenIPC, Thingino, minikube, Nerves, SeedSigner OS and SkiffOS;
- vendor SDKs: Texas Instruments, Microchip, STMicroelectronics,
  Analog Devices, Canaan Kendryte K230, StarFive JH7110 and Espressif
  ESP32-S31.

The page ends by inviting users to tell about their products on the
mailing list.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
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

 docs/website/showcase.html | 257 +++++++++++++++++++++++++++++++++++++
 1 file changed, 257 insertions(+)
 create mode 100644 docs/website/showcase.html

diff --git a/docs/website/showcase.html b/docs/website/showcase.html
new file mode 100644
index 0000000000..1efeca5c39
--- /dev/null
+++ b/docs/website/showcase.html
@@ -0,0 +1,257 @@
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
+			<h4 class="mb-1"><span class="bi bi-dpad-fill text-primary"></span>
+				<a href="https://github.com/MiSTer-devel/Linux_Image_Creator_MiSTer">MiSTer FPGA</a></h4>
+			<p class="small text-body-secondary mb-2">FPGA retro gaming</p>
+			<p class="mb-0">Linux system running next to the FPGA cores of the
+				MiSTer platform.</p>
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
