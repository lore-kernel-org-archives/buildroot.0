Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43A0C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 08:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DA5461253;
	Fri, 16 May 2025 08:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2pAHuBWC-H2H; Fri, 16 May 2025 08:42:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A53161033
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A53161033;
	Fri, 16 May 2025 08:42:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE092185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 08:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF7744095F
 for <buildroot@buildroot.org>; Fri, 16 May 2025 08:42:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A50S4uKS3bea for <buildroot@buildroot.org>;
 Fri, 16 May 2025 08:42:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 966A740926
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 966A740926
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 966A740926
 for <buildroot@buildroot.org>; Fri, 16 May 2025 08:42:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3D1F4315A;
 Fri, 16 May 2025 08:42:15 +0000 (UTC)
Date: Fri, 16 May 2025 10:42:13 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250516104213.0ed78643@booty>
In-Reply-To: <20250409064711.3024937-1-neal.frager@amd.com>
References: <20250409064711.3024937-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvfedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepnhgvrghlrdhfrhgrghgvrhesrghmugdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprghrnhhouhhtsehmihhnugdrsggvpdhrtghpt
 hhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopehmihgthhgrlhdrshhimhgvkhesrghmugdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsrhgrnhguohhnrdhmrghivghrsegtohhllhhinhhsrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747384936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bS1t6STIP/Aj8X0xXoYW4zCj9iIx/bnA8mtpSCH18A4=;
 b=XlXCWR1zJkq0guJauDVpTTuA8/oJRaOLPyK5wrfc0qeSWi+yt/43sBD5F3KEdXRecW5qqp
 O716v6RjRgocbhp0HyuiKXvdaAeJ9BYLbYQS+wdvqicu6m9aeHcI+2JIGWZFwv2bTLy1OX
 /rowsFUjW5meR497+VZ5NzJHdUhecIq+LFb4WzqKWyYVfU2APa3yYz/ATszXs9YzRsNCRH
 jMrAriDy3b6vjM2cZH7W2UBOxXqZGv/ElUTlZQyebRsTqyC9Vsp/BzKavYhIaqj5hwKXW9
 q7+cq/KRX4CcMxP4PcgCvTvhzpoaWYo6VFPHQSG0XlNxCKG1bvLStQvmOvS4kA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XlXCWR1z
Subject: Re: [Buildroot] [PATCH v5 1/3] boot/xilinx-embeddedsw: rename
 toolchain vendor to buildroot
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, arnout@mind.be, brandon.maier@collins.com,
 ju.o@free.fr, thomas.petazzoni@bootlin.com, buildroot@buildroot.org,
 romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Wed, 9 Apr 2025 07:47:09 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch renames the bare-metal toolchain vendor used by the
> xilinx-embeddedsw package from Xilinx to Buildroot to be consistent with all
> other toolchains built by Buildroot.
> 
> To build the Microblaze applications available with the xilinx-embeddedsw
> package, the following config is now needed:
> 
> BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
> 
> This change keeps backwards compatibility for users already using the
> following architecture tuple:
> 
> BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
> 
> Either vendor name is now valid, but the documentation will describe using
> the Buildroot vendor name.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - xilinx-embeddedsw is now backwards compatible with either vendor name
> V2->V3:
> - split patch into series
> V3->V4:
> - rebase patch
> V4->V5:
> - add deprecation warning for microblazeel-xilinx-elf tuple
> ---
>  boot/xilinx-embeddedsw/Config.in            |  3 ++-
>  boot/xilinx-embeddedsw/xilinx-embeddedsw.mk | 30 ++++++++++++++-------
>  2 files changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
> index a27253d594..31b12baaf2 100644
> --- a/boot/xilinx-embeddedsw/Config.in
> +++ b/boot/xilinx-embeddedsw/Config.in
> @@ -1,4 +1,5 @@
> -comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
> +comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-buildroot-elf"
> +	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-buildroot-elf"
>  	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"
>  
>  menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
> diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
> index 7d4fcf8b8f..6e37dc48bd 100644
> --- a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
> +++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
> @@ -12,6 +12,18 @@ XILINX_EMBEDDEDSW_INSTALL_TARGET = NO
>  XILINX_EMBEDDEDSW_INSTALL_IMAGES = YES
>  XILINX_EMBEDDEDSW_DEPENDENCIES = toolchain-bare-metal-buildroot
>  
> +ifneq ("$(wildcard $(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc)","")
> +$(warning BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf" \
> +	will soon be deprecated!)
> +$(warning Please migrate to new bare-metal toolchain config below)

A warning is not very visible, so it won't be very effective. You
should really use the same logic that Config.in.legacy uses: error out,
and clearly state how to migrate, practically. E.g. (untested):

$(error microblazeel-xilinx-elf in BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH is not supported anymore!)
$(error Replace microblazeel-xilinx-elf with microblazeel-buildroot-elf in BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH)

Moreover, an existing and working defconfig with
microblazeel-xilinx-elf hard fails later on with this patch:

  >>> xilinx-embeddedsw xilinx_v2024.2 Building
  ...
  make[4]: <...>/output/host/bin/microblazeel-buildroot-elf-gcc: No such file or directory

Steps to reproduce, from a clean Buildroot git clone:

  git checkout a4249a20243bb620d095a36e78d3722aa29f8da7 # current master
  # Apply patch 1 (not 2 and 3)
  make zynqmp_kria_kv260_defconfig
  make xilinx-embeddedsw

The patch looks good otherwise.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
