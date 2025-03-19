Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C14C35FFA
	for <buildroot@archiver.kernel.org>; Wed, 19 Mar 2025 20:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE83760ED4;
	Wed, 19 Mar 2025 20:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jBcFp9QHfb9E; Wed, 19 Mar 2025 20:23:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0400C60F22
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0400C60F22;
	Wed, 19 Mar 2025 20:23:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 35D141A7
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 20:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A0818194A
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 20:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id slOzMBO_7BLJ for <buildroot@buildroot.org>;
 Wed, 19 Mar 2025 20:23:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 652F4818DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 652F4818DC
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 652F4818DC
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 20:23:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 441322003CA;
 Wed, 19 Mar 2025 21:23:21 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 19 Mar 2025 21:23:21 +0100
MIME-Version: 1.0
Date: Wed, 19 Mar 2025 21:23:21 +0100
From: Julien Olivain <ju.o@free.fr>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Neal Frager <neal.frager@amd.com>, Alistair
 Francis <alistair@alistair23.me>, Anand Gadiyar <gadiyar@ti.com>, Bryan
 Brattlof <bb@ti.com>, Dick Olsson <hi@senzilla.io>, Etienne Carriere
 <etienne.carriere@foss.st.com>, Lee Jones <lee.jones@linaro.org>, Sergey
 Matyukevich <geomatsi@gmail.com>, Simon Dawson <spdawson@gmail.com>, Xuanhao
 Shi <X15000177@gmail.com>
In-Reply-To: <20250317-bootloaders-menuconfig-v1-1-8f893d3bcf5f@bootlin.com>
References: <20250317-bootloaders-menuconfig-v1-0-8f893d3bcf5f@bootlin.com>
 <20250317-bootloaders-menuconfig-v1-1-8f893d3bcf5f@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <efd13cebbddc6cd81e2fe18d6f218026@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742415814;
 bh=ry4dangY1SsIepjGhdjnTDEfTzN2zj5mH7+o0b63CrE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XTUx5bV++xRI3r8MjUKZ4LoEhmc8DfgcqmKClNgGaDz9Ts2j3T20Ddes3Y1/KKZBq
 sXAUVeO3FNyrBQhPSIsLlFjd5Gf5WEDRuVXTXjSGqezQhK/IZC5BoIef034N6OLMCm
 1dXCcqPeBl9DGYJZ6g+nZFW21knJRQ6++tyJSfm4JIgQPAWT+V3enmoEbyLJHUtVP7
 n1VuIDsuuytMmUaTFQAX478ad25H0pp8R7hHeIZS29grRWKCuQY2+92FrvwRtLDNE4
 +x8isi2GghRsj6fqrQjt2r6KBKsor68WsGh0hz0Lbvwgh7LmhO6EYti8Toem4Rf1oi
 3XcBcjPkFbP+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XTUx5bV+
Subject: Re: [Buildroot] [PATCH 1/2] boot/xilinx-embeddedsw: fix menuconfig
 visualization
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 17/03/2025 18:40, Luca Ceresoli via buildroot wrote:
> Due to how menuconfig works, a 'comment' entry following a 'config' 
> entry
> prevents correct indentation of items depending on the 'config'
> entry. xilinx-embeddedsw currently shows as:
> 
>   [*] xilinx-embeddedsw
>       *** xilinx-embeddedsw needs a bare metal toolchain for tuple 
> microblazeel-xilinx-elf ***
>   (xilinx_v2024.2) xilinx-embeddedsw version (NEW)
>   [ ] versal plm (NEW)
>   [ ] versal psmfw (NEW)
>   [ ] zynqmp pmufw (NEW)
>   [ ] xilinx-prebuilt
> 
> So the 'versal *' and 'zynqmp pmufw' items are not indented even though
> they should be.
> 
> Do like most other Config.in files which have the 'comment' before the
> 'config' entry, makeing it render as expected:
> 
>       *** xilinx-embeddedsw needs a bare metal toolchain for tuple 
> microblazeel-xilinx-elf ***
>   [*] xilinx-embeddedsw
>   (xilinx_v2024.2) xilinx-embeddedsw version (NEW)
>   [ ]   versal plm (NEW)
>   [ ]   versal psmfw (NEW)
>   [ ]   zynqmp pmufw (NEW)
>   [ ] xilinx-prebuilt
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
