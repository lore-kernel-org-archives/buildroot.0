Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBEF606D804
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 14:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pjSp/jSS
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4FE560749;
	Sat,  7 Nov 2026 14:06:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8BXaS2JFBUXn; Sat,  7 Nov 2026 14:06:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0CAC560730
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794060389;
	b=bwyqrAK7mCoaDFER+vEMGQs3fAI4gSwZoDRWN5sBvrf7dF+SpAvomRFCffqNAHw/XmkI
	 Ee41tV+sCNa5Fr+NAW4OEeUtrqxuULP94a59+He6St3tFTjsqzT+vEJERGDJmvfUyeS/5
	 uJziezy9CWKSz56Dg0NAX73eCXZt+p5iMl3wGEt/UWBWG8V8j5fZCe6SUog59EvqmlBFU
	 jAE6jcAhXK761X/34jV4tWi7dT0D+gnTaf+3asPW8ACyjo0xeWghAMor9i/UZv/8KjJ1b
	 cMsnZ45AGOlsAkBmGRKRpJP/tpYjHkhnPji2JCUcU3FD3kwkf2U2muWdZwChB+Mrzow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794060389;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=g2ZHXVH4FfUiAsoeJXWTnw0VltzKCmjJX8oSpcpjw8w=;
	b=mfttvy4fdltm1oFfE8VT8qIljp5vGInWt8bklNXhdzbQkbsRvV7AF0Rs7HK1Cv1i+3Qq
	 5CRsDIuFSLHXiCHeCB5DxDDQIqWfaxj/pfu8wZagpOStuHK7R8TDv1mTtLu3+oh+FYwqm
	 46F4D7p1x7Ogczv2GDChliDFmjqPXEL6fEgcFY20NXuXcy/JSklsHqAjxvP4m8I2GgnfV
	 jZq4tMyE5e9uJoL9JW5QH5ZX3BR7PJ7mrmX+p7G3UqlRWZFYhNgzQ6DNYruRzYi/eFgBs
	 R1X1KGn0cqOEbZutANvjuzbIbcxoRbR9c692iFq+1hid7z7G3rie+oW2SAdHqTDTs0A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794060389;
	bh=g2ZHXVH4FfUiAsoeJXWTnw0VltzKCmjJX8oSpcpjw8w=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pjSp/jSSAd7aBfUL/yJy2qYhYHL0viDZP0OXZB+OUXHZVR8FPGTejp2aXQk3aqBiG
	 U5h3VYqfzg3gn9YDFe+Gif3/BmeUmiSMhbayKcC5HQjPyy4cB92rphhEQ3oTl+Cq7v
	 0LAlBn9wqFr+2J5gm4nNKq4NaZZUGdQm4tBgLpY3zv8q3m8U//lBlZAOqmqmXNbU3t
	 9KcpKDF5kItf+7rrDr3+9bj2mlrUztdKo9Lam6yRa0yoyT2+knCXYZozSlQXX6ytq0
	 ph/E6rVRjSA1PjmyckbqosfxYxRMKN/hDBtdL9mSvYbxX1/ur8SGcNK47TROV5Mdc4
	 tkH7rg7VN9RLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CAC560730;
	Sat,  7 Nov 2026 14:06:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A21ED34D
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 14:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 872BF812B4
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 14:06:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 13vCnL8sNmlv for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 14:06:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9B3EC812B1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B3EC812B1
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 14:06:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 6D7882003CA;
 Sat,  7 Nov 2026 15:06:19 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 07 Nov 2026 15:06:19 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 07 Nov 2026 15:06:19 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261106111604.1500074-2-angelo.compagnucci@gmail.com>
References: <20261105175058.3132718-1-angelo.compagnucci@gmail.com>
 <20261106111604.1500074-1-angelo.compagnucci@gmail.com>
 <20261106111604.1500074-2-angelo.compagnucci@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <23bd9f8e90ca12911336ca571708b3ea@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v4 2/3] website: add a showcase page
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Angelo,

Thanks for this patch. I have few suggestions, see below.

On 06/11/2026 12:16, Angelo Compagnucci wrote:
> Add a page listing products and projects whose operating system is
> built with Buildroot, each one with a link to a public source:
> 
> - well known products: Tesla, Home Assistant OS, Sipeed NanoKVM and
>   Analog Devices ADALM-PLUTO;
> - testimonials from Arm, Home Assistant OS, EVS and Texas Instruments,
>   quoted from the Buildroot at 25 talk at ELC Europe 2026;
> - open source projects: Batocera.linux, Recalbox, OpenIPC, Thingino,
>   minikube, Nerves, SeedSigner OS, SkiffOS and Tomato64;
> - vendor SDKs: Texas Instruments, Microchip, STMicroelectronics,
>   Analog Devices, Canaan Kendryte K230, StarFive JH7110 and Espressif
>   ESP32-S31.
> 
> The page ends by inviting users to tell about their products on the
> mailing list.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
> Changes v3 -> v4:
>   - add a "What users say" section, quoting verbatim the testimonials
>     collected for the Buildroot at 25 talk at ELC Europe 2026 (Arm, 
> Home
>     Assistant OS, EVS and Texas Instruments), with a link to the
>     published slides; the EVS one is shortened to fit the layout;
>   - projects: drop MiSTer FPGA, whose Linux image repository is barely
>     known, and add Tomato64, which also gave a testimonial for the 
> talk.
> 
> Changes v2 -> v3:
>   - reorganize the page to prioritize active projects, each one
>     checked against its public repository, documentation or
>     image [Thomas]:
>     - tagline: "From cars and smart homes to cameras and retro
>       consoles";
>     - well known: keep Tesla even if it is old, because its Buildroot
>       tree is still public and verifiable on GitHub; describe it as the
>       tree building the infotainment and Autopilot images;
>     - well known: mention the br2-external tree of Home Assistant OS
>       and link its GitHub repository; replace Google Fiber and GoPro
>       with Sipeed NanoKVM and Analog Devices ADALM-PLUTO;
>     - projects: drop KNULLI, RaspberryMatic, OpenWrt (not Buildroot
>       based anymore), Kerberos.io KiOS (archived) and Open Voice OS
>       (barely active); add MiSTer FPGA, Thingino, minikube,
>       SeedSigner OS and SkiffOS; reword Recalbox;
>     - vendor SDKs: drop Rockchip (only a Web Archive copy of its guide
>       is left); update the Texas Instruments link to SDK 12.01 and the
>       Microchip link to the linux4microchip repository, with PolarFire
>       SoC; list the STM32MP1 and STM32MP2 for ST; add Analog Devices,
>       Canaan Kendryte K230, StarFive JH7110 and Espressif ESP32-S31.
> 
> Changes v1 -> v2:
> - link the Rockchip Linux SDK to an official Rockchip document, the
>   RK3399 Linux Buildroot development guide, instead of the Khadas
>   documentation. The link points to the Web Archive copy, since
>   opensource.rock-chips.com is not reachable anymore.
> 
>  docs/website/showcase.html | 340 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 340 insertions(+)
>  create mode 100644 docs/website/showcase.html
> 
> diff --git a/docs/website/showcase.html b/docs/website/showcase.html
> new file mode 100644
> index 0000000000..a1b8d827af
> --- /dev/null
> +++ b/docs/website/showcase.html
> @@ -0,0 +1,340 @@
> +<!--#include file="header.html" -->
> +
> +<div class="bg-primary py-5">
> +<div class="container">
> +<div class="row justify-content-center">
> +<div class="col-xxl-10 text-center">
> +	<h1 class="display-4 fw-bold text-white">Powered by Buildroot</h1>
> +	<p class="fs-4 fw-light text-white-50 mb-0">From cars and smart homes 
> to cameras

Here, the "text-white-50" makes this line hardly readable
for me. Would it be possible to change it just to "text-white"
in order to have to a bit more contrast?

> +		and retro consoles: products and projects whose operating system is 
> built with
> +		Buildroot.</p>
> +</div>
> +</div>
> +</div><!-- /container -->
> +</div>

[...]

> +
> +	<!-- Famous projects -->

In the popular project list, we could also mention the Godot
game engine, which uses Buildroot as its build system.
https://github.com/godotengine/buildroot
Also mentioned in:
https://docs.godotengine.org/en/stable/about/list_of_features.html


> +	<div class="card my-5">
> +	<div class="card-header text-bg-primary rounded-top fs-5">
> +		<span class="bi bi-people-fill"></span>&nbsp; Famous projects</div>
> +	<div class="card-body p-4">
> +		<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-3">
> +
> +		<div class="col"><div class="card h-100"><div class="card-body">
> +			<h4 class="mb-1"><span class="bi bi-controller 
> text-primary"></span>
> +				<a href="https://batocera.org">Batocera.linux</a></h4>
> +			<p class="small text-body-secondary mb-2">Retro gaming</p>
> +			<p class="mb-0">Plug-and-play retro gaming OS for PCs, single board
> +				computers and handhelds.</p>
> +		</div></div></div>
> +
> +		<div class="col"><div class="card h-100"><div class="card-body">
> +			<h4 class="mb-1"><span class="bi bi-joystick text-primary"></span>
> +				<a href="https://www.recalbox.com">Recalbox</a></h4>
> +			<p class="small text-body-secondary mb-2">Retro gaming</p>
> +			<p class="mb-0">Retro gaming distribution for single board
> +				computers and PCs.</p>
> +		</div></div></div>
> +
> +		<div class="col"><div class="card h-100"><div class="card-body">
> +			<h4 class="mb-1"><span class="bi bi-camera-fill 
> text-primary"></span>
> +				<a href="https://openipc.org">OpenIPC</a></h4>
> +			<p class="small text-body-secondary mb-2">IP cameras</p>
> +			<p class="mb-0">Open firmware for IP cameras on HiSilicon, Ingenic,
> +				SigmaStar, Novatek, Ambarella and more.</p>
> +		</div></div></div>
> +
> +		<div class="col"><div class="card h-100"><div class="card-body">
> +			<h4 class="mb-1"><span class="bi bi-camera-video-fill 
> text-primary"></span>
> +				<a 
> href="https://github.com/themactep/thingino-firmware">Thingino</a></h4>
> +			<p class="small text-body-secondary mb-2">IP cameras</p>
> +			<p class="mb-0">Open firmware for cameras based on Ingenic 
> SoCs.</p>
> +		</div></div></div>
> +
> +		<div class="col"><div class="card h-100"><div class="card-body">
> +			<h4 class="mb-1"><span class="bi bi-boxes text-primary"></span>
> +				<a 
> href="https://github.com/kubernetes/minikube/tree/master/deploy/iso/minikube-iso">minikube</a></h4>
> +			<p class="small text-body-secondary mb-2">Kubernetes 
> development</p>
> +			<p class="mb-0">Virtual machine image for local Kubernetes 
> clusters,
> +				with its own br2-external tree.</p>
> +		</div></div></div>
> +
> +		<div class="col"><div class="card h-100"><div class="card-body">
> +			<h4 class="mb-1"><span class="bi bi-droplet-fill 
> text-primary"></span>
> +				<a href="https://nerves-project.org">Nerves</a></h4>
> +			<p class="small text-body-secondary mb-2">Elixir embedded 
> framework</p>
> +			<p class="mb-0">Elixir and Erlang firmware on top of a Buildroot
> +				base system, <code>nerves_system_br</code>.</p>
> +		</div></div></div>
> +
> +		<div class="col"><div class="card h-100"><div class="card-body">
> +			<h4 class="mb-1"><span class="bi bi-shield-lock-fill 
> text-primary"></span>
> +				<a href="https://github.com/SeedSigner/seedsigner-os">SeedSigner 
> OS</a></h4>
> +			<p class="small text-body-secondary mb-2">Bitcoin signing 
> device</p>
> +			<p class="mb-0">Minimal OS of the air-gapped SeedSigner hardware 
> wallet.</p>
> +		</div></div></div>
> +
> +		<div class="col"><div class="card h-100"><div class="card-body">
> +			<h4 class="mb-1"><span class="bi bi-layers-fill 
> text-primary"></span>
> +				<a href="https://github.com/skiffos/SkiffOS">SkiffOS</a></h4>
> +			<p class="small text-body-secondary mb-2">Configuration layers</p>
> +			<p class="mb-0">Layered Buildroot configurations for more than 50
> +				targets, from the Raspberry Pi to the PinePhone.</p>
> +		</div></div></div>
> +
> +		<div class="col"><div class="card h-100"><div class="card-body">
> +			<h4 class="mb-1"><span class="bi bi-router-fill 
> text-primary"></span>
> +				<a href="https://github.com/tomato64/tomato64">Tomato64</a></h4>
> +			<p class="small text-body-secondary mb-2">Router firmware</p>
> +			<p class="mb-0">Port of the Tomato router firmware to x86_64 and
> +				arm64, on a br2-external tree.</p>
> +		</div></div></div>
> +
> +		</div><!-- /row -->
> +	</div>
> +	</div>
> +
> +	<!-- Vendor SDKs -->

In the vendor SDKs, we could mention the AMD / Xilinx SoC support:
https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/2804187327/Buildroot
While the page says it is not an official support, Neal Frager
from AMD is doing a great job maintaining the defconfigs for
those boards.

> +	<div class="card my-5">
> +	<div class="card-header text-bg-primary rounded-top fs-5">
> +		<span class="bi bi-cpu-fill"></span>&nbsp; Vendor SDKs</div>
> +	<div class="card-body p-4">
> +		<p class="text-body-secondary">Silicon and board vendors ship 
> Buildroot in
> +			their SDKs, so countless devices run it without saying so.</p>
> +		<div class="list-group list-group-flush">
> +			<a class="list-group-item list-group-item-action d-flex gap-3 py-3"
> +			   
> href="https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/12_01_00_05_03_Buildroot/exports/docs/buildroot/Overview.html">
> +				<span class="bi bi-motherboard-fill fs-3 text-primary"></span>
> +				<span><b>Texas Instruments Processor SDK</b><br>
> +				<span class="text-body-secondary">Official Buildroot flavour for 
> AM62x and
> +					AM62Lx, with the TI external tree.</span></span>
> +			</a>
> +			<a class="list-group-item list-group-item-action d-flex gap-3 py-3"
> +			   
> href="https://github.com/linux4microchip/buildroot-external-microchip">
> +				<span class="bi bi-motherboard-fill fs-3 text-primary"></span>
> +				<span><b>Microchip</b><br>
> +				<span class="text-body-secondary">Buildroot external tree for the 
> SAMA5, SAMA7, SAM9
> +					and PolarFire SoC families.</span></span>
> +			</a>
> +			<a class="list-group-item list-group-item-action d-flex gap-3 py-3"
> +			   href="https://github.com/bootlin/buildroot-external-st">
> +				<span class="bi bi-motherboard-fill fs-3 text-primary"></span>
> +				<span><b>STMicroelectronics</b><br>
> +				<span class="text-body-secondary">Buildroot external tree for the 
> STM32MP1 and STM32MP2
> +					boards, maintained by Bootlin.</span></span>
> +			</a>
> +			<a class="list-group-item list-group-item-action d-flex gap-3 py-3"
> +			   href="https://github.com/analogdevicesinc/br2-external">
> +				<span class="bi bi-motherboard-fill fs-3 text-primary"></span>
> +				<span><b>Analog Devices</b><br>
> +				<span class="text-body-secondary">Buildroot external tree for the 
> ADSP-SC5xx processors and
> +					the ADI boards based on AMD Xilinx SoCs.</span></span>
> +			</a>
> +			<a class="list-group-item list-group-item-action d-flex gap-3 py-3"
> +			   href="https://github.com/kendryte/k230_linux_sdk">
> +				<span class="bi bi-motherboard-fill fs-3 text-primary"></span>
> +				<span><b>Canaan Kendryte K230</b><br>
> +				<span class="text-body-secondary">Buildroot based Linux SDK for 
> the K230 RISC-V AI SoC.</span></span>
> +			</a>
> +			<a class="list-group-item list-group-item-action d-flex gap-3 py-3"
> +			   href="https://github.com/starfive-tech/VisionFive2">
> +				<span class="bi bi-motherboard-fill fs-3 text-primary"></span>
> +				<span><b>StarFive JH7110</b><br>
> +				<span class="text-body-secondary">VisionFive 2 SDK, with Buildroot 
> for the root
> +					filesystem.</span></span>
> +			</a>
> +			<a class="list-group-item list-group-item-action d-flex gap-3 py-3"
> +			   href="https://github.com/espressif/esp-buildroot-external">
> +				<span class="bi bi-motherboard-fill fs-3 text-primary"></span>
> +				<span><b>Espressif ESP32-S31</b><br>
> +				<span class="text-body-secondary">Buildroot external tree for 
> Linux on the ESP32-S31,
> +					as a developer preview.</span></span>
> +			</a>
> +		</div>
> +	</div>
> +	</div>
> +
> +	<div class="row my-5 text-center">
> +	<div class="col-lg-8 offset-lg-2">
> +		<h1 class="fw-light">Your product here?</h1>
> +		<h3 class="text-body-secondary">Tell us about it on the
> +			<a href="support.html">mailing list</a>.</h3>
> +	</div>
> +	</div>
> +	<hr>
> +
> +</div>
> +</div>
> +</div><!-- /container -->
> +
> +<!--#include file="footer.html" -->
> --
> 2.34.1

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
