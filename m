Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39090C6FD18
	for <buildroot@archiver.kernel.org>; Sat, 22 Apr 2023 09:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80CFC60C0C;
	Sat, 22 Apr 2023 09:06:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80CFC60C0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R5CHxVptMnZX; Sat, 22 Apr 2023 09:06:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEFE860C00;
	Sat, 22 Apr 2023 09:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEFE860C00
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 084B61C29B8
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 09:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D484A41D8B
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 09:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D484A41D8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YfbUlqVJrwuK for <buildroot@lists.busybox.net>;
 Sat, 22 Apr 2023 09:06:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FA1441C3F
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FA1441C3F
 for <buildroot@buildroot.org>; Sat, 22 Apr 2023 09:06:28 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.208]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MtfNl-1qAA5l0Hpn-00vARC; Sat, 22 Apr 2023 11:06:26 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sat, 22 Apr 2023 11:06:23 +0200
Message-Id: <20230422090625.25006-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:MZyFUU4mstVyKG0zUQJj4G5Gxq6lb8UK4QF5KvAKFbC3rxwjODJ
 erRa+NZwsyKuj/ST7cUGTgsjNGlb7POhpjycrjjpFurG51kEtj6w7xnZ1fpgLrpPrssd8Q8
 P66K8S4Wlqi0xL6BV4j46yp1GAVLf6UM9zsYfNszv1y2SSViwFLvl8TRbp0b5lnLdOVozoF
 fK/PhsZqfjYg80XJyYxzw==
UI-OutboundReport: notjunk:1;M01:P0:knGuL42NYvY=;NXkJ5757nb41xGGF9TCxfk1p0Tp
 ul05zFSt2Hld5AnQV0XddYKkrq5EzU4YxiSJaKmJPEBWh+RjIHnjrZ16NnPEKgikMNdtrKRNQ
 uPLQmxNzJ571SeW40Yu6O3Hy3jBDvjOmEqlUq1yHUmp8fqdjVwysfJrqCiicNxC6TG4i96vXg
 HOZVCII/9VPjVQ9AZRvfy1dyzwUhl4Qtu/adKj+Nl0QT4IGndRE8FZFMF724544nNb1zFG2TX
 2ATv8ty86SsG1yI6V4zuc8AMtE1xfoY4mm2d8z/ALpD8hKCGDY1Xtj10c9jZZPoe49NbQak3X
 dtK5ozGY9cxtipg8IAIukdK9W1yR+1XIvzq2A7tpN8EBQB8o4rAWAWou1TMfUOZGNcuus9cS+
 sz4wLIhMdp6/9yzPQRdfi7zURYtnY1rKkAp/8hQ2FM/N0dDplGXYi9jHAe7OfGeLLKdpqbFqE
 0g0iLbAorDx14/IgolUsuXsmpNKk0fTr3B4N7r8CKZyi9ntyhpPFmFoUnsrrsJsjrAQ/9zvsK
 CZxwGeXb0UcwPd25/ueN5EHQ5CxmgZy+YVbx0AUiR9MeXAytKKgzCl13/L2ENMAZhlRtp60yS
 aNKeoa1rpE2egm7W0y80Bzn/SSmfOL/56qLj+gw0WJmmZknNr4MLK8bwpuPtf/lRFPTfyoiDe
 vYiD7UIeLPFPHoBNLD/6JbM4fBDNlbUmE2voqKCMoBGOt+mb4hIkNcQMfYtUe9RTsGm9MEGNU
 DS3T284ka8gFJ2SNmmDcUhq/68Qn9Q6G17Z8SVEQvlfo5pWh9efqSyr0L9IoS3Lx/eC58n6hY
 Ps/j9iT8z9E9a4Q3BIAyWl0iAAcqyd3wOyRvBPWKqdoijQWm+4oA1z+JOYoEkj3PoDqtHq+jE
 LmI0HA13ybj2qE/iRPYhNqE+kZu0BO22PkjbDwhs8t9Detz/h8MAORCuzOOOCNSJ+HGcSGS+I
 UmZ4blXIJInymU6H5RCwtt4+qHc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1682154386; i=ps.report@gmx.net;
 bh=TJAM3NNscGhHlA6bYISsCV2TCnH0Tc7X4o1mAv7AQIo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=L9+nK3Rm8ksxFq+miwj4PBHEE1bTiWY+6YIehoyoQKdKdqOj7LKXOYM9UnroUfaW8
 tcsFg0fmmDMoAjT7KgBKnhS7vzMSEryxK/ib7kCmg3To8OD5ZXdEJlLxWpL0P8dwqf
 EZ3Tb1bH2lo42vPDzFzDmFLHIPE5Gy/qHfTriw38mxtVU9p4OZFSO1HTazBjuopXuO
 IHBoODAwikF4pJszK9ebcedRBWx+R18alKftbEyFypygQ87+Rmk4zcof+K6nxrZF8d
 lnpomWHzW0kwHW7PYRj8+mPScjSYM8NGDItlgFvA51umYYSybJm1MVd9cxJ1IM6YCD
 889Lo6FyZRhIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=L9+nK3Rm
Subject: [Buildroot] [PATCH v1 1/3] package/qemu: change project and
 download URL to https
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qemu/Config.in | 2 +-
 package/qemu/qemu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index a446c0cf68..235fdb9ce6 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -43,7 +43,7 @@ menuconfig BR2_PACKAGE_QEMU
 	  Linux. When using KVM, QEMU can virtualize x86, server and
 	  embedded PowerPC, and S390 guests.
 
-	  http://qemu.org/
+	  https://www.qemu.org/
 
 if BR2_PACKAGE_QEMU
 
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 3cbeffe213..3f51cb572b 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -8,7 +8,7 @@
 # needs to be updated.
 QEMU_VERSION = 7.2.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
-QEMU_SITE = http://download.qemu.org
+QEMU_SITE = https://download.qemu.org
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
 QEMU_LICENSE_FILES = COPYING COPYING.LIB
 # NOTE: there is no top-level license file for non-(L)GPL licenses;
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
