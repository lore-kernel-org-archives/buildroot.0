Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB26606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 10:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kcSWUwND;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rJfYxxnF
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF6AE810F0;
	Thu,  5 Nov 2026 10:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PkSL9CeDXyak; Thu,  5 Nov 2026 10:25:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 63A1981083
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793874310;
	b=M8BsaB0P/NFiUCAa1idqKntaXm/vJ5Rn3RiAXt/waUDzttaHlBS23DrAOeaV+USjHNQ+
	 nSC4FgIvzFFbps7b2utY+ttt1+3fK850kOaGQYmqvYwLraA9yUH5XDNaPj+RAmteZ6atW
	 Acr4hZcTvl/NeuR6EoZ6rdO4D5/xDZem47G7BxoFLwZ6ICIWlsPJZ42STbu107Sh0OlUM
	 TG6RSuMcL3m00RrN9PEL35L16+Y+5QlOMtQuGBRHZQlQWIx/MHTHQNMYX60vk8LxK/XiJ
	 kz5m313vN86Xq312LvTQim0214I2PEVrPkHTpMFUUbEklHp/Lc+MVs14nbHXF4Rlw8g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793874310;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=qei7r2X5/2kNyFm2PULSRUHOKKRHLcwH8WxPrm0lKHw=;
	b=I1r55W543n7N9ufiIJZIOdNEXd8cEbcEGsbkktvDzh4AhFwM/TUlsGmXMaTRb1/b/7X/
	 JXQ587jGXmHpirSvbmBOyN3t3E6D8YXBZtXMfI7s7Nn+r6pNhlBGARZadixD5RggvDrY6
	 E/hw/mkwHLShXI3XFtnx+u7rhAixrP4DcqOuoqXxYhZI516/+6u//FxIG5C7vZ+9UXYU7
	 bRvyO6vhc1XknFxiyoM4UaXhDtVPYYdnhGEB3wOAADnbbdjbwPu4mj9Bdw/0azQU899YL
	 3HGjVqFRsBEpdJtY4z/WvOsqdIDuLid3BVLPGU4NAUYMu62OUysE4J3KD3FTvE3JTfg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793874310;
	bh=qei7r2X5/2kNyFm2PULSRUHOKKRHLcwH8WxPrm0lKHw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kcSWUwNDyYnrsJlCGNQW6I/ysXVehuo8ELg9hujzsVcfzbllNAoGlDpkciS9TEGZP
	 jFvsj2SPPKcgJGZr6UKEliN7zy7Encw9MLJL2hc/wGmOn4i6AlJWd1+ZrdpwP5PB2B
	 HLsX86VS5+MWAPGaTUSEBAW5rc3le3npJh4hukiEBNK8I90bSbzeL1X3/HxDgGaH7O
	 U2SzE3UpeHGcw81fkon78bRIr/RQJxnOh9xyJO9WdwPCMj9t47elnjAYUvfThf9YC1
	 97YpHPqzoa6Vo9RTPmkbeFnjg+9t3JgdAdpmkkD4QH1WdBHys475eMIPFTfKh/t+84
	 KqGOgIgbNkrFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63A1981083;
	Thu,  5 Nov 2026 10:25:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D3AEC1779
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 10:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5502400F9
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 10:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AU8XjXa95hwx for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 10:25:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 72206400F3
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=rJfYxxnF
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72206400F3
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 10:25:03 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a2069b9710so15581425e9.2
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 02:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793874302; x=1794479102; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Pv/SW+TuUJvqk3geHqEUMzVcU+kobOPKVofrOftfPRY=;
 b=rJfYxxnFbYx7y8q6HwD5Rfh7tip2L52zylXjgl4X9Coe9LoiZdl2Hp3tiUWWmc1XTd
 PRzGVtAzsG+pzORsw9MV/P+mxH081bQ0L9a7ZNmEocgyGYsaHywN8RsLOLxqU2G0bTpa
 hfi9KgJ2LqGrI9dGmnsfX4cMaWs2ew8q7Uu+xgvwMp2IBesjB3O7jSfkBPdn6CjJjuXa
 6IBScOE9G7yND6t5tF+PAIlGKVOFsH0wSCoWIxxU5tl2cWv9wvvx2eJcUJKpRUQexTqA
 zTzWyHOWMIgr/tfl5tWyE5sUa4bSIWcyn/H5MYZe9ihmWIjjspHqpx8S151m9w16nnds
 z5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793874302; x=1794479102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Pv/SW+TuUJvqk3geHqEUMzVcU+kobOPKVofrOftfPRY=;
 b=Z2HMgpQkVm/KJ3V9QVrRFrCn+DH+OrAgbQ/to8/B55skgJcLYVcFnGO4dDddvMPnbg
 MT9Ca5cv7knj0lPNNorAIjv2wCXpsZMUXZj0NzO9UmwxqYolQUx+3KVxIJW4EGWYaEBY
 UHxCwUFB/ls5Rei0OFYFvEPcg8hjaRi1w3El25W1J5CicUUKfTa1rANRD0FSJ+0dcXq+
 FUKJog5Eh/d6zkLCXJT83qg/Ch4rdDA/oqmICfDVcu5VEYqsAchFhtxquWgBIBseE80x
 qsvxrsKu+4rnB0EPVp22YcAow2uOoXhesLQDC594B9E062jZKuty3yHuL2m2I3BN1Igv
 WHAQ==
X-Gm-Message-State: APuU4Z9ogy1h9rKqS0PMtAzPUd2RL5G1n1YBu3RQjdus+XRiNSLZByE2
 Yt3T3JuFcs9bzkK3FdpXmvILI+cxvgQltoMOAUvshube/QO2jPtrgbDYap7vyA==
X-Gm-Gg: AYBFou0qBeg7XJxQcyPXbfp0+bOLhiOvg4I4r8j98Wb/CMVMduzNRloBN7pAGw3R+v2
 8mBLxb25Y2wBu/Z8uiuMkVR1MTcUynP4i1B1XcgdkYJx4VZaiZ4FtoKVekp6+I45TREzCfNm3tf
 JkLHj1ClFhFqrBKdbwE5FY4hULkUYs3DxlPszvZD58XJ9Ch/1mrq4cRAGVnfw0fVTlLcDnMt0DO
 kdC1nG5wWDGRjEB3wm1SQWmo7bSjGGNgOHbJzhat22ZUIjT0B8X8UBxrPQ9vxWXZhUqq4MPBeCJ
 U2Jm6FuFnQsTOBoMWVKQQHwMs+WEEsVXEvKa8vcine7XR2SQfcBlZERIubImt1ch0CZJog+bmI4
 PQEznPEqQnxUo/vLZRijYZjiCu14lVfIq+p0eQhWMh34+yitvFD9ySxX+7h7RcxrVqALwFN3F0Z
 CdBnnzB8+7d15Wht9CXl5v1b2q+2jACv0zCKyLS58p0taHaI1U0hAY20J2toozQuRdLlUd5u1XB
 pb7OlfMaCxIa536tAki1Oo1aoFhOm7rAKvszZX8JaSEtoRGdAVI+z3JhRUXt5D370z+S6u2qgtt
 2ZXRwFzCAFnxGJXP7RTpjkA7xAXyaynyV9/57ECeEBe8Ime6pZj5kw==
X-Received: by 2002:a05:600c:6095:b0:4a3:7344:13b5 with SMTP id
 5b1f17b1804b1-4ac182dcb98mr367035205e9.16.1793874301640; 
 Thu, 05 Nov 2026 02:25:01 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b4104d600fsm115558385e9.0.2026.11.05.02.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 02:25:01 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu,  5 Nov 2026 11:24:57 +0100
Message-Id: <20261105102458.1795886-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105102458.1795886-1-angelo.compagnucci@gmail.com>
References: <20261105102458.1795886-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/3] website: add a showcase page
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
Changes v1 -> v2:
- link the Rockchip Linux SDK to an official Rockchip document, the
  RK3399 Linux Buildroot development guide, instead of the Khadas
  documentation. The link points to the Web Archive copy, since
  opensource.rock-chips.com is not reachable anymore.

 docs/website/showcase.html | 236 +++++++++++++++++++++++++++++++++++++
 1 file changed, 236 insertions(+)
 create mode 100644 docs/website/showcase.html

diff --git a/docs/website/showcase.html b/docs/website/showcase.html
new file mode 100644
index 0000000000..75d779c3e1
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
+			   href="https://web.archive.org/web/20250523233139/http://opensource.rock-chips.com/images/9/92/RK3399_Linux_Buildroot_V1.2_Development_Guide170619.pdf">
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
