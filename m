Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EF6C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 18:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AC8161405;
	Fri, 12 Jul 2024 18:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TAg7AqPu3wDj; Fri, 12 Jul 2024 18:33:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDE14613F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDE14613F5;
	Fri, 12 Jul 2024 18:33:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 94FDF1BF4D5
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 18:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80EF24171C
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 18:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ha_PRuvzpXBr for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 18:33:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1FBB7403C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FBB7403C2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1FBB7403C2
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 18:33:28 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 64A79B0057C;
 Fri, 12 Jul 2024 20:33:24 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 20:33:18 +0200
Message-ID: <20240712183318.243890-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1720809205;
 bh=tlxP4UUZeblcBp8lrMhbWRoQDquwktA9W4yIO4yGHo4=;
 h=From:To:Cc:Subject:Date:From;
 b=gAEN0OapSdWLbEbG2lFAT6FSuwZASMWGBZ4CiIxVa5Is4MtVo2+3g9/DDWnKRYJOe
 BUAjG+RYXvabUDQzdb3wPkoMWYtxm7GqZpRUE+EDfDmjo+hsCcZm4ACLNUHaCkChmQ
 bvAfkVIMnFAZV8XVNb+ECPEtEbAHf/9FmCAEQpETIBcp6a4inswxpLW/XhlK/spldA
 RWvVHmj/J5KP1hqqrnRpv6A71OKBcTVQ8+jmkU3DhKj0BP+eWs3U49/wrs6LnplEHE
 3WP4n4EjEexCTo9on6X/X30Kynp+yfogM/f4Pz5BxlP3o532VY91LyzJ5SMAohGCG+
 6yDRwL7lhGsZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gAEN0Oap
Subject: [Buildroot] [PATCH 1/1] board/spike/riscv64/readme.txt: remove
 obsolete comment
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

At the time the spike_riscv64_defconfig was introduced in commit [1], it
was not possible to have a console input using Spike and OpenSBI for
RISC-V 32 bits. This limitation no longer applies, as upstream
components now implements support for this.

Buildroot commit [2] updated riscv-isa-sim (Spike), which now includes a
NS16550 uart emulation. This can be used by RV32 Linux Kernel. Finally,
a spike_riscv32_defconfig was added in [3].

This commit removes the comment about this limitation, since it no
longer applies.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/24d07fdc1404901fb1872ac55f875fe1d555cbb3
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/853b7661bf5ddca5d4b81964ef1a19a133beac85
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/a83ab3f4c8621dec58dc78a8dcb48e519377ac3d

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/spike/riscv64/readme.txt | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/board/spike/riscv64/readme.txt b/board/spike/riscv64/readme.txt
index 5ad7df46df..34db625aad 100644
--- a/board/spike/riscv64/readme.txt
+++ b/board/spike/riscv64/readme.txt
@@ -20,11 +20,6 @@ The boot is made with the standard RISC-V OpenSBI boot loader. In
 order to keep the simulation simple, the rootfs is passed as an initrd
 ramfs.
 
-Note: at the time of this writing, Spike v1.1.0 and OpenSBI v1.0 does
-not support console input emulation for 32bit RISC-V systems. A 32bit
-Linux system can boot and reach the login, but it's not possible to
-login. See [4].
-
 
 [1].
 https://github.com/riscv-software-src/riscv-isa-sim/tree/v1.1.0#simulating-a-new-instruction
@@ -34,6 +29,3 @@ https://github.com/riscv-software-src/riscv-isa-sim/tree/v1.1.0#debugging-with-g
 
 [3].
 https://github.com/riscv/riscv-openocd
-
-[4].
-https://github.com/riscv-software-src/opensbi/blob/v1.0/lib/utils/sys/htif.c#L127
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
