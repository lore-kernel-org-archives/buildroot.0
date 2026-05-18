Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D750ECD4F3C
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 01:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63BA185933;
	Mon, 18 May 2026 01:56:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eow0dRCkxL_G; Mon, 18 May 2026 01:56:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 558DC8593C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779069391;
	bh=ndg/+37xS1D5u6d0Byh7ZA6DcY3xQLqLvpXQQGrXSdA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=hijSwA2bvLK3fwbvNslwszK8YZvwuKA4cH8stEb+KrziMH3IfS5vl6I6UVZZBIwRa
	 sLoauQWDP/tr1aVY4ITyWERsA9gdw80gJVz141CqU+pTia4Hrca9ckiSbGSUEfS8gJ
	 vyoORqnw6So/qftkEaEK7bG285pxeDQlKbH4iokzIcO/pvepqDV4KTdSSW6TmhKZNe
	 LVmNg5oSwo/y2sfVQGj5usgXdefkgQXV8GVjljIbZZG2irGa8vqBJVfI3d/NRDCCKG
	 Q5oB6xQbRvZXnH7Jd+rlKRDgQBGHYoffWOBcELlGa/JaWpSfAf4N6bI3cR2s3iPlAa
	 1MUT9mg+SKqVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 558DC8593C;
	Mon, 18 May 2026 01:56:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DD6C282
 for <buildroot@buildroot.org>; Mon, 18 May 2026 01:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F99C6F907
 for <buildroot@buildroot.org>; Mon, 18 May 2026 01:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dVX8mNSNZO9Q for <buildroot@buildroot.org>;
 Mon, 18 May 2026 01:56:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=114.111.35.27;
 helo=cvsmtppost05.nm.naver.com; envelope-from=dungeonlords789@naver.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 380086F906
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 380086F906
Received: from cvsmtppost05.nm.naver.com (cvsmtppost05.nm.naver.com
 [114.111.35.27])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 380086F906
 for <buildroot@buildroot.org>; Mon, 18 May 2026 01:56:28 +0000 (UTC)
X-Originating-IP: 125.132.232.68
Received: from mvsendbo29.nm ([10.179.34.218])
 by cvsmtppost05.nm.naver.com with ESMTP id bCK9Fi+PRVu9g2TlSXwrbg
 for <buildroot@buildroot.org>; Mon, 18 May 2026 01:56:26 -0000
X-Session-ID: vjStC932RHmBpLnrYe15fg
X-Originating-IP: 125.132.232.68
X-Works-Send-Opt: LdYwjAJYjHmwKx2rKBmmaxumFqJYkEljxBmwjAg=
X-Works-Smtp-Source: srKqKAvXFqJZ+Hm9aAvr+6E=
Received: from Linux ([125.132.232.68])
 by cvnsmtp005.nm.naver.com with ESMTP id vjStC932RHmBpLnrYe15fg
 for <multiple recipients>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 18 May 2026 01:56:25 -0000
From: Andrei Cherniaev <dungeonlords789@naver.com>
To: buildroot@buildroot.org
Date: Mon, 18 May 2026 10:56:11 +0900
Message-ID: <20260518015612.2280292-1-dungeonlords789@naver.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=naver.com; s=s20171208; 
 t=1779069386; bh=EPh70gT0gKAHIX+0uLTMCoyDSYR4RLPGgNbRti/SHZc=;
 h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
 X-Works-Security;
 b=HESvT9LUuvm710rfA+pfkizuXY+GqzmGwezBnHphFwOFkVmtllDWejNE7mvK9OVkG
 Lhcu9SFJLpfGJpW2uG+wbDZ8cr1ZXmnjIVhHSA9J6JL45W+0o8+K8Deru3QKveUFEV
 DqDc+5yiKQG5MYig1cnPufQP66deth1tw5z6mQ8g04iCtAjeVTp/APg6KSreC4C9PO
 8yyodsXtS45TUlaNTMbvILuWFaUWyAO9YjfusNUnM6N+plGu1gdcksYmnnqS+RComy
 hSpDWjoSpQhEj+UHshrC+wePgiel3prcokhllbLowygwLdmDmkb85Ze2KRMxa8dkRh
 Ui1Tv5wNTaqbA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=naver.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256
 header.s=s20171208 header.b=HESvT9LU
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
 fiona.klute@gmx.de, Andrei Cherniaev <dungeonlords789@naver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

1) usually user should not try to find OVMF.fd somewhere manually
2) board/qemu/x86_64-efi/readme.txt is trying to be duplicate of board/pc/readme.txt. We should not duplicate info

Signed-off-by: Andrei Cherniaev <dungeonlords789@naver.com>
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
