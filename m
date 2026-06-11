Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CE9CD98CC
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 13:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F217640A34;
	Thu, 11 Jun 2026 13:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7SYYfCBIoDWd; Thu, 11 Jun 2026 13:04:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C30440A0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781183078;
	bh=vTtexh2NNE6AXlJptsHXkyGPasz2juLyPCdnlNoJlnY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=cU9HeJDvHtwmHJXgrnJSSPWHZlZT302NQ1cohEmQRN6DL7eSyYQur5Alw66JIY57H
	 Wyoy1X6yJq3skk9GX0dWi6URq9FI+S7Fdq6hlG63rguqJ1ZG4j2ZO5/uh4eVjrjo3Y
	 cJW0n0b/ExjI4vSl5Bim5cCdzUwPTLh1l/xIGD7FYpcQykt8ePn2MpJhgX0JP7SFhm
	 vlTXulnhcRi8h3uL4ON8dPcYumv46H560vNEyXsRXiZJ2PlZZr76EOqZxnMdsJdk1h
	 KI6Gi9KpadvFR4c/bUfiUA/Ph3tQNo3vl0lSSI73CEal7E24dNF5Z6C7SDQe49jhCp
	 Yjc5kpYIvpGAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C30440A0F;
	Thu, 11 Jun 2026 13:04:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F17C237
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 13:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F235F4019E
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 13:04:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id slm1BSOXtO5s for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 13:04:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=114.111.35.233;
 helo=cvsmtppost16.nm.naver.com; envelope-from=dungeonlords789@naver.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 83B714016F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83B714016F
Received: from cvsmtppost16.nm.naver.com (cvsmtppost16.nm.naver.com
 [114.111.35.233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83B714016F
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 13:04:35 +0000 (UTC)
X-Originating-IP: 125.132.232.68
Received: from cvsendbo005.nm ([10.112.18.54])
 by cvsmtppost16.nm.naver.com with ESMTP id Jycg6i+bRzW80yowglfbPA
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 13:04:32 -0000
X-Session-ID: EWGK9bYfQemRY-4kTAJm9w
X-Originating-IP: 125.132.232.68
X-Works-Send-Opt: LdYwjAJYjHmwKx2rKBmmaxumFqJYkEljxBmwjAg=
X-Works-Smtp-Source: XZY9Kxu/FqJZ+HmZFqMm+6E=
Received: from Linux ([125.132.232.68])
 by cvnsmtp003.nm.naver.com with ESMTP id EWGK9bYfQemRY-4kTAJm9w
 for <multiple recipients>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 11 Jun 2026 13:04:32 -0000
From: Cherniaev Andrei <dungeonlords789@naver.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 22:04:09 +0900
Message-ID: <20260611130409.2841176-1-dungeonlords789@naver.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=naver.com; s=s20171208; 
 t=1781183072; bh=FeAcustqiy/wXvwOMTk3tbGJBupxn9X5bFEbUqJjNV0=;
 h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
 X-Works-Security;
 b=C7Zj31BpRAKO+9vjSU2HA9zZ6saMs0OGAvqd5q+VHfBtX7fvYlfqJEklpdbiBMqAQ
 op0GqLrWWl4W67lPO2RKFYNO/ZE1JWFKT3fKV2pdC1eMaok4ZCpRe5PFgcBYOiAuLW
 zG5WVEzdzYe27EoECkj22/PJz7f9PT8tzdek5erEzHvOmjeWgvyGHD12AM/memys15
 jP+gqBGsg3WUjmCIIOxUPc9KukKl4wiJgMwvQec2biS/pLtPTX8SfI8LGCngKz4qDD
 ql6tmpElG2bO4wprANqnr6/TH85+EJnxDr/derGvOXeGSLO7x8NeScgvSeXjdSV2Td
 gZrUc2zPTrZuQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=naver.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256
 header.s=s20171208 header.b=C7Zj31Bp
Subject: [Buildroot] [PATCH 1/1] boot/edk2: fix description
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
Cc: kory.maincent@bootlin.com, vincent.stehle@arm.com, fancp2007@gmail.com,
 jiaxun.yang@flygoat.com, ju.o@free.fr, hi@senzilla.io, romain.naour@gmail.com,
 fiona.klute@gmx.de, dungeonlords789@naver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

1) usually user should not try to find OVMF.fd somewhere manually
2) board/qemu/x86_64-efi/readme.txt is trying to be duplicate of board/pc/readme.txt. We should not duplicate info

Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
---
 board/pc/readme.txt              | 10 +++++-----
 board/qemu/x86_64-efi/readme.txt | 17 +++--------------
 boot/edk2/Config.in              |  4 +++-
 3 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/board/pc/readme.txt b/board/pc/readme.txt
index 18b1e3dcf0..31ca5357e9 100644
--- a/board/pc/readme.txt
+++ b/board/pc/readme.txt
@@ -63,12 +63,12 @@ Run the emulation with:
 
 qemu-system-x86_64 \
 	-M pc \
-	-bios </path/to/OVMF_CODE.fd> \
+	-bios output/images/OVMF.fd \
 	-drive file=output/images/disk.img,if=virtio,format=raw \
 	-net nic,model=virtio \
 	-net user
 
-Note that </path/to/OVMF.fd> needs to point to a valid x86_64 UEFI
-firmware image for qemu. It may be provided by your distribution as a
-edk2 or OVMF package, in path such as
-/usr/share/edk2/ovmf/OVMF_CODE.fd .
+Note that OVMF.fd needs to be a valid x86_64 UEFI firmware image for qemu. The 
+easiest way is to generate it during the Buildroot build by set 
+BR2_TARGET_EDK2. Alternatively it may be provided by your distribution as a 
+edk2 or OVMF package, in path such as /usr/share/edk2/ovmf/OVMF_CODE.fd .
diff --git a/board/qemu/x86_64-efi/readme.txt b/board/qemu/x86_64-efi/readme.txt
index 7f69be065f..036239819a 100644
--- a/board/qemu/x86_64-efi/readme.txt
+++ b/board/qemu/x86_64-efi/readme.txt
@@ -12,17 +12,6 @@ Build
 Emulation
 =========
 
-Run the emulation with:
-
-    qemu-system-x86_64 \
-        -M pc \
-        -m 1024 \
-        -serial stdio \
-        -bios output/images/OVMF.fd \
-        -drive file=output/images/disk.img,format=raw \
-        -netdev user,id=net0 \
-        -device virtio-net-pci,netdev=net0 # qemu_x86_64_efi_defconfig
-
-Optionally add -smp N to emulate a SMP system with N CPUs.
-
-The login prompt will appear in the graphical window.
+    output/images/start-qemu.sh
+or
+    output/images/start-qemu.sh --serial-only --use-system-qemu
diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
index 2620c79076..7d170fde3b 100644
--- a/boot/edk2/Config.in
+++ b/boot/edk2/Config.in
@@ -14,7 +14,9 @@ config BR2_TARGET_EDK2
 	help
 	  EDK II is a modern, feature-rich, cross-platform firmware
 	  development environment for the UEFI and PI specifications.
-
+	  Select this to build EDK II (and OVMF) to be able to boot
+	  Buildroot in QEMU (UEFI mode).
+	  
 	  https://github.com/tianocore/tianocore.github.io/wiki/EDK-II
 
 if BR2_TARGET_EDK2
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
