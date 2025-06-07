Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42AB6C61CE8
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 18:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13EE560D66;
	Sat,  7 Jun 2025 18:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vflEoQ93Q_xo; Sat,  7 Jun 2025 18:21:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 325F160DE2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 325F160DE2;
	Sat,  7 Jun 2025 18:21:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C9E11F2
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EB1540638
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAwRwc5UpuoZ for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 18:21:06 +0000 (UTC)
X-Greylist: delayed 506 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 07 Jun 2025 18:21:05 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D945240622
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D945240622
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=202.12.124.151;
 helo=fout-b8-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
Received: from fout-b8-smtp.messagingengine.com
 (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D945240622
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:05 +0000 (UTC)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfout.stl.internal (Postfix) with ESMTP id 4F75611400CE;
 Sat,  7 Jun 2025 14:12:38 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Sat, 07 Jun 2025 14:12:38 -0400
X-ME-Sender: <xms:FYFEaB2b1XHHUg_X_DalreHUpvGNwFWWo13z9psuRynpPi1rfkgTmw>
 <xme:FYFEaIE1Ac7fa02UGv5_iCq-Mmh6hLRt7OYfbUOtAlblcM8KV21FNIVcURhxgxSZk
 EuAHkM0u94TKkoilhU>
X-ME-Received: <xmr:FYFEaB4G4vQIZ_xWRHxvy-Jz3c6nq9EacBVHPpnMSZLPsD0eLkkVIH_PD7vGpA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeikeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecu
 hfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgoh
 grthdrtghomheqnecuggftrfgrthhtvghrnhepudffffffhfeuheevhffgleevkeeugeet
 feegieeijeehfeekheekveduveeigeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtgho
 mhdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjh
 hirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehhihesshgv
 nhiiihhllhgrrdhiohdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessg
 hoohhtlhhinhdrtghomhdprhgtphhtthhopehgihhulhhiohdrsggvnhgvthhtihessggv
 nhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprhhomhgrihhnrd
 hnrghouhhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghu
 ihhlughrohhothdrohhrgh
X-ME-Proxy: <xmx:FYFEaO36RkISF0FEv0fa2pXDk_y9UGUp86FXxffD5bUmFnPOLjbP6A>
 <xmx:FYFEaEGJaRKwn8Ke5KCWK6DBJep4WDQdipQjnjKtAKsoY6L4WfE2Zw>
 <xmx:FYFEaP9yEg8Ro1AfHj4ccIg5nh6xVQsLXGZdCSIXW6SHl_-0_fKKkA>
 <xmx:FYFEaBmi3ZV918nlMydqC0eyO2Mw5XnWHZzsKcI8-sxnOAoSHgmFDg>
 <xmx:FoFEaJHacRmbeVlxgBFCzHZMegwc_sOtgyHd67NkEtWT-r-_9WwV_3Ph>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Jun 2025 14:12:36 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 07 Jun 2025 19:12:34 +0100
Message-Id: <20250607-loongarch-v2-0-90bc4fda9080@flygoat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABKBRGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDMwNz3Zz8/Lz0xKLkDF2LxKRUCwsjUwsjEyMloPqCotS0zAqwWdGxtbU
 AEgvZelsAAAA=
X-Change-ID: 20250607-loongarch-8abe88258242
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Dick Olsson <hi@senzilla.io>, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:message-id:mime-version:reply-to
 :subject:subject:to:to; s=fm2; t=1749319958; x=1749406358; bh=iI
 qtki2xHXG7iYgwmGaWDtpyhMHT1NSus3nZEZb+7n4=; b=FOiWLYwXQoCiQvESDI
 z/nW/LVgH7jZSX/YRb9Nz2ciGvsLVHXSc0MoxrLtrQXrlBund7YzoUPZfJYqEDFS
 rEv50Awpm3Of85nmeB+9ad0kR3TnXhfOkj3YFm0VXhmrlReGhrBPCdgy1lmxV6Ul
 iLY1la1fz9Oco+PCnpQ1+pYHDMVE9MtyNLdNzvvbdDA/ySNT1dGK/1YQ8F81Lpzj
 X9rQokultP2hJD1BDSz1ULnuAGRrcoyNX+uSsv/0rN9YqB58QSHlzqzb0Oq/yviH
 Mss6M5eG5gzbhHQFHHKsu6emxGjzpaiHu0PLL2SDUhlIWV6fkVPMjwAXHYnvWGvb
 UaAg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1749319958; x=1749406358; bh=iIqtki2xHXG7iYgwmGaWDtpyhMHT
 1NSus3nZEZb+7n4=; b=nw9xCtHc3wcUA4k8J+P9K0zwYBo75oJ1gRZ1ohTVtSpW
 L12jQ8wsy7htGjC9ATuNtLsbEkXpguUtIZJ0GCcivq61qdtJBqzNeXqhBDhB/Pku
 l1uUTjd0kWzxf0VhirwKWmfzjCAEJmP6wsxNCMC1QhIcINBvTcZqYGDVIU77BriA
 gSWL9B9WBSJ0HLOCqi5cVIE1SB6GfqGOxhdUvv/kUPKyd/f4W7hAT/qKqAMcRl1R
 n2cvFA76Rx38xuAf7wuU7S5R6xnH7K2yhAlfsQKDvVaIDhhtToXo57ObbNM1N/zv
 /m2PIjK2pwwPGyv2y/cuCUyGLM9aJl2vck1DvbIucA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=FOiWLYwX; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=nw9xCtHc
Subject: [Buildroot] [PATCH v2 0/9] LoongArch64 initial support
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
Jiaxun Yang (9):
      package/gcc: Introduce BR2_GCC_TARGET_SIMD option
      arch: Introduce LoongArch64
      package/glibc: Enable LoongArch64 support
      package/musl: Enable LoongArch64 support
      linux: Introduce {vmlinux, vmlinuz}.efi kernel binary format
      boot/grub2: Introduce loongarch64-efi target
      board/loongarch64-efi: Introduce the new board
      boot/edk2: Add LoongArch64 OVMF support
      board/qemu: Add loongarch64-virt-efi variant

 DEVELOPERS                                         |   7 ++
 arch/Config.in                                     |  19 +++
 arch/Config.in.loongarch                           | 129 +++++++++++++++++++++
 arch/arch.mk                                       |   1 +
 board/loongarch64-efi/genimage-efi.cfg             |  33 ++++++
 board/loongarch64-efi/grub.cfg                     |   6 +
 .../patches/linux-headers/linux-headers.hash       |   1 +
 board/loongarch64-efi/patches/linux/linux.hash     |   2 +
 board/loongarch64-efi/post-image.sh                |   5 +
 board/loongarch64-efi/readme.txt                   |  34 ++++++
 board/qemu/loongarch64-virt-efi/genimage.cfg       |  33 ++++++
 board/qemu/loongarch64-virt-efi/grub.cfg           |   6 +
 board/qemu/loongarch64-virt-efi/post-image.sh      |   5 +
 board/qemu/loongarch64-virt-efi/readme.txt         |  31 +++++
 boot/edk2/Config.in                                |  14 ++-
 boot/edk2/edk2.mk                                  |   6 +
 boot/grub2/Config.in                               |  10 ++
 boot/grub2/grub2.mk                                |   9 ++
 configs/loongarch64_efi_defconfig                  |  22 ++++
 configs/qemu_loongarch64_virt_efi_defconfig        |  23 ++++
 linux/Config.in                                    |   8 ++
 linux/linux.mk                                     |   4 +
 package/gcc/gcc.mk                                 |   4 +
 package/glibc/Config.in                            |   2 +
 package/musl/Config.in                             |   1 +
 toolchain/toolchain-buildroot/Config.in            |   4 +
 .../toolchain-external/pkg-toolchain-external.mk   |   4 +
 toolchain/toolchain-wrapper.c                      |   3 +
 28 files changed, 425 insertions(+), 1 deletion(-)
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
