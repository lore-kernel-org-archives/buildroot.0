Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A05CC7115A
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 18:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3077B60B34;
	Wed, 18 Jun 2025 18:26:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2NGnkENokoNL; Wed, 18 Jun 2025 18:26:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4831160B01
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4831160B01;
	Wed, 18 Jun 2025 18:26:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D5540151
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2DEC404A0
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AG1j6TSZr9lI for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 18:26:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.157;
 helo=fhigh-a6-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ED3C3404C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED3C3404C9
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED3C3404C9
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:26:09 +0000 (UTC)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 1D40C11401B1;
 Wed, 18 Jun 2025 14:20:44 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Wed, 18 Jun 2025 14:20:44 -0400
X-ME-Sender: <xms:egNTaGJd9L7K4NIM2S-sor2RAfC980y06DEpC2Z3UgrStUt9pEd1zg>
 <xme:egNTaOLqPzScThPM9JKBgioLlbx3cWs-4FwvO_gESBITOO1ZFV1IPOSNeUm28fgnC
 5GbnZ6yY5EHBaQFgxE>
X-ME-Received: <xmr:egNTaGtm9ifWP2d2vyWav4LzPCUxqHJX8n1r1npKhgAz1qStDh2qcjB2Z6P6T6PrrveECqaS9GLNTWy_3A9wr6OecigeFM0CfGM-DCsDdg21RRohPUY7mQ6j0Y88FOqNUmpbXLpb6O_WXRM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeffeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecu
 hfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgoh
 grthdrtghomheqnecuggftrfgrthhtvghrnhepgfevffejteegjeeflefgkeetleekhfeu
 gfegvdeuueejkeejteekkedvfffffedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgr
 gihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphhtthhopeekpdhmoh
 guvgepshhmthhpohhuthdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihes
 sghoohhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurh
 hoohhtrdhorhhgpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehgmhgrihhlrdgt
 ohhmpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepghhiuhhlih
 hordgsvghnvghtthhisegsvghnvghtthhivghnghhinhgvvghrihhnghdrtghomhdprhgt
 phhtthhopehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhrtghpthhtoh
 ephhhisehsvghniihilhhlrgdrihhopdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhr
 sehsmhhilhgvrdhfrh
X-ME-Proxy: <xmx:ewNTaLYpdd2BgPlsQ6gq2iQAd4_IsF0_W8d8lR6_maz9xvXFfE8Txg>
 <xmx:ewNTaNYKaBLmlsipvy5w4bVUDPh12zZM2GsAgxaNbAiVazuk4MMyWA>
 <xmx:ewNTaHB9N2J5KXgdSWXD2p9yvmHMcvZY74N5Hcu3294SNBuW7Z0ywQ>
 <xmx:ewNTaDaaMOK21z38-tAP1dzn97DMcx7O7DqAGb1eV9Wbzbh__TUeLQ>
 <xmx:fANTaPIW0wSjSBiwuFnHkkM-h9QIwOm4usXM5AgpK8dszcxWN8Gl8NZ5>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 14:20:41 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 18 Jun 2025 19:20:25 +0100
Message-Id: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGkDU2gC/23Myw6CMBCF4Vchs7ZmMoIWV76HYVFKbwkypiWNh
 PTdraxd/icn3w7JxGAS3JsdoskhBV5qXE4NaK8WZ0SYagMhdXjFm5iZF6ei9kKq0UhJnaSWoP7
 f0djwOaznUNuHtHLcDjrTb/2nZBIoehx1ayfVo8SHnTfHaj1rfsFQSvkCfSDCg6QAAAA=
X-Change-ID: 20250607-loongarch-8abe88258242
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Dick Olsson <hi@senzilla.io>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Romain Naour <romain.naour@smile.fr>, Julien Olivain <ju.o@free.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3846;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=c0MzKWS0jDTJGHbZF4NpXbKijrKgYlLFKWRUcfJ7KtI=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhoxg5kJOs7v3nu1hDfvBudvI+fO0nJB+mY6KpFmMb4MiN
 d/vYdnQUcrCIMbBICumyBIioNS3ofHigusPsv7AzGFlAhnCwMUpABMpC2Rk+DI3PVD30RmPutQD
 b26XX3r73VBCVfat1oGul3yxd7jsihn+qbatuXTrpvKr8z/Tyk0fMt1abB/EuXFdYfCNGYK9IfI
 XmAA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:message-id:mime-version:reply-to
 :subject:subject:to:to; s=fm2; t=1750270844; x=1750357244; bh=Kb
 wKJPsx/1GQC/h7lnftQeqWsO+UzbV1SJMGfyGPt5Q=; b=zVp2zRmccGyseU4he1
 5QSNQpkOeWGACGoZfHUX4kisYRW8z6rHFwyVi3KXLpEVhMizz2E8iNvRPdXwQjT6
 Gn2IEOEdZUg39pVR1XDVKA+Vru/ZJ4tm8OOziCofsoZQvinomLdCjAypTbFiULQ2
 wsCumt/IqSNB6++1jWENhVllLbpq+T+kmjsKjZ44kp4EJR4O2Ld7sHphMxD30fv5
 P1pU73rywZOT19ngvJxnQ5Ci8dom7WREx8NlvPpVzHyo3sfkonFTmRCxqvyop/ag
 SMKx05heGgpgiFkm7rq0NeU/dhyTu2e5jqvF7jEV4Q+mVc9lv5PuigDpcHn8inMZ
 tE/A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1750270844; x=1750357244; bh=KbwKJPsx/1GQC/h7lnftQeqWsO+U
 zbV1SJMGfyGPt5Q=; b=YTbkKwWmTtfBzl0gBikwnngPR+6cMfjZmFFvZg/oQyYQ
 sW4QleZq0FMgE1GlLg5mfwLVdOhdbm7rmLhQ3AIa0FMBCZdFxUWK9LB4pMjIIYj3
 +DEDh/HuwylLM5CHWi7TpuDhmUyBTSgkXO8HBGaOADu3iVQz66EMhjp1t8HMAydg
 uL3sjQq+XWs6oPNWF4i7Utht53RQRzQV8GoVfInz//tZ2Qc5KzQDpD72WdXSvo2c
 EWvspcN6KmXqT+UpzWUJ8C/UtEgIln4vJQUGYRi4/mug0nfvxwfeUhTWFxWvEBj0
 +j3JvK2p1SNhJmQf2jDDDms7W1D9WYQfYGFiq8LFYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=zVp2zRmc; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=YTbkKwWm
Subject: [Buildroot] [PATCH v3 00/11] LoongArch64 initial support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

This series enabled LoongArch64 support to buildroot.

It added LoongArch bits to toolchain and kernel & grub packages
and then introduced new loongarch64-efi board as a generic target.

This target is boot tested on Loongson 3A5000 desktop system.

I'll follow up later to enable various packages with architecture
dependencies.

Please review.
Thanks!

---
Sorry for taking so long to get back, I was trapped by EDK2 build
when I was making initial reversion and eventually lost track.

v2 Addressed most comments in v1.

To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Dick Olsson <hi@senzilla.io>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

---
Changes in v3:
- Address comments in various individial patches
- Enable test-package
- Link to v2: https://lore.kernel.org/r/20250607-loongarch-v2-0-90bc4fda9080@flygoat.com

---
Jiaxun Yang (11):
      package/gcc: Introduce BR2_GCC_TARGET_SIMD option
      arch: Introduce LoongArch64
      package/glibc: Enable LoongArch64 support
      package/musl: Enable LoongArch64 support
      linux: Introduce {vmlinux, vmlinuz}.efi kernel binary format
      boot/grub2: Introduce loongarch64-efi target
      configs/loongarch64_efi: new defconfig
      boot/edk2: Add LoongArch64 OVMF support
      package/qemu: enable loongarch64 as target package
      configs/qemu_loongarch64_virt_efi: new defconfig
      support/config-fragments: Add LoongArch64 toolchain support

 DEVELOPERS                                         |   7 ++
 arch/Config.in                                     |  20 ++++
 arch/Config.in.loongarch                           | 128 +++++++++++++++++++++
 arch/arch.mk                                       |   1 +
 board/loongarch64-efi/genimage-efi.cfg             |  30 +++++
 board/loongarch64-efi/grub.cfg                     |   6 +
 .../patches/linux-headers/linux-headers.hash       |   1 +
 board/loongarch64-efi/patches/linux/linux.hash     |   2 +
 board/loongarch64-efi/post-image.sh                |   5 +
 board/loongarch64-efi/readme.txt                   |  38 ++++++
 board/qemu/loongarch64-virt-efi/genimage.cfg       |  30 +++++
 board/qemu/loongarch64-virt-efi/grub.cfg           |   6 +
 board/qemu/loongarch64-virt-efi/post-image.sh      |   5 +
 board/qemu/loongarch64-virt-efi/readme.txt         |  31 +++++
 boot/edk2/Config.in                                |  14 ++-
 boot/edk2/edk2.mk                                  |   6 +
 boot/grub2/Config.in                               |  10 ++
 boot/grub2/grub2.mk                                |   9 ++
 configs/loongarch64_efi_defconfig                  |  22 ++++
 configs/qemu_loongarch64_virt_efi_defconfig        |  25 ++++
 linux/Config.in                                    |   8 ++
 linux/linux.mk                                     |   4 +
 package/gcc/gcc.mk                                 |   4 +
 package/glibc/Config.in                            |   2 +
 package/musl/Config.in                             |   1 +
 package/qemu/Config.in.host                        |   1 +
 .../autobuild/br-loongarch64-full-internal.config  |   3 +
 .../autobuild/br-loongarch64-internal-glibc.config |   3 +
 .../autobuild/toolchain-configs.csv                |   2 +
 toolchain/toolchain-buildroot/Config.in            |   4 +
 .../toolchain-external/pkg-toolchain-external.mk   |   4 +
 toolchain/toolchain-wrapper.c                      |   3 +
 32 files changed, 434 insertions(+), 1 deletion(-)
---
base-commit: 5080f0af166d2fff26f0c661b0cc7da0b3eaddd8
change-id: 20250607-loongarch-8abe88258242

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
