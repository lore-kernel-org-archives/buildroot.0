Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426DBC28B28
	for <buildroot@archiver.kernel.org>; Mon, 10 Mar 2025 01:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04A4960596;
	Mon, 10 Mar 2025 01:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d1UfyFGt-CjA; Mon, 10 Mar 2025 01:47:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0872960687
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0872960687;
	Mon, 10 Mar 2025 01:47:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D8881C1
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 01:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62AF7400D1
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 01:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id on_TA7D_Kavc for <buildroot@buildroot.org>;
 Mon, 10 Mar 2025 01:47:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=114.111.35.166;
 helo=cvsmtppost31.nm.naver.com; envelope-from=dungeonlords789@naver.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8F14B400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F14B400BA
Received: from cvsmtppost31.nm.naver.com (cvsmtppost31.nm.naver.com
 [114.111.35.166])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F14B400BA
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 01:47:20 +0000 (UTC)
X-Originating-IP: 125.132.232.68
Received: from cvsendbo009.nm ([10.112.18.55])
 by cvsmtppost31.nm.naver.com with ESMTP id 6CYYT7S+RJiUICb3gHJS4Q
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 01:47:19 -0000
X-Session-ID: tSPpSNdmTi2rj7An1HQ9og
X-Originating-IP: 125.132.232.68
X-Works-Send-Opt: x/YZjAJYjHmlKxu/FoJYKxgXKBwkx0eFjAJYKg==
X-Works-Smtp-Source: 99YqFxudFqJZ+Hm/Kq2/+6E=
Received: from Linux.. ([125.132.232.68])
 by cvnsmtp007.nm.naver.com with ESMTP id tSPpSNdmTi2rj7An1HQ9og
 for <multiple recipients>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 10 Mar 2025 01:47:18 -0000
From: Cherniaev Andrei <dungeonlords789@naver.com>
To: buildroot@buildroot.org
Cc: Cherniaev Andrei <dungeonlords789@naver.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Mar 2025 10:47:14 +0900
Message-ID: <20250310014715.2815990-1-dungeonlords789@naver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=naver.com; s=s20171208; 
 t=1741571239; bh=QowmGAwYtGNrY70GgM1wbW6Wrlo3wDeBhaY+lSpzReE=;
 h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
 X-Works-Security;
 b=K86mkmpt8Dbnzg3K3hrT6Di07s30xdpLAtkKiOb+EWMVFhAYT1ZoDx9+IN0+3x5S1
 6gcOM0ErpTzx63fpPWhj38o6z8GYfMn9naYfiPPqGJv2nSlJmAw3xFSlLJP8EhPArf
 L6rvzfhh3/MLY8Uq16Rr7XXccPO/QtKiU/GDB1FQz9k/sa2t+YqCEVJUQbDsDFsa97
 J0eqxPp6V9ubMarll5v3jA8ORI9y7lNc/DJLfsRunE4vf5VAED5HBy6tJ+/4Sm1pm9
 7pARmRNXojAkffe+5Nfhq5Tzfko4/GouW8/CcERKA7QHYX39oM6Ux8Ifivh+ZobkOw
 zBdpFu/7lGo0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=naver.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256
 header.s=s20171208 header.b=K86mkmpt
Subject: [Buildroot] [PATCH] boot/grub2/readme.txt: typo
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

---
 boot/grub2/readme.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/grub2/readme.txt b/boot/grub2/readme.txt
index 90866e83a9..d0999ec390 100644
--- a/boot/grub2/readme.txt
+++ b/boot/grub2/readme.txt
@@ -51,7 +51,7 @@ grub-bios-setup does but it works anyway.
 To test your BIOS image in Qemu
 -------------------------------
 
-qemu-system-{i386,x86-64} -hda disk.img
+qemu-system-{i386,x86_64} -hda disk.img
 
 Notes on using Grub2 for x86/x86_64 EFI-based platforms
 =======================================================
@@ -93,7 +93,7 @@ To test your i386/x86-64 EFI image in Qemu
 
    [0] https://github.com/retrage/edk2-nightly
 
-2. qemu-system-{i386,x86-64} -bios <path-to-OVMF.fd> -hda disk.img
+2. qemu-system-{i386,x86_64} -bios <path-to-OVMF.fd> -hda disk.img
 
 Notes on using Grub2 for ARM u-boot-based platforms
 ===================================================
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
