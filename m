Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBB2CA0EE4
	for <buildroot@archiver.kernel.org>; Fri, 15 Aug 2025 21:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F3E080A80;
	Fri, 15 Aug 2025 21:54:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WTGzVCw4WXo9; Fri, 15 Aug 2025 21:54:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 681C6809B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 681C6809B0;
	Fri, 15 Aug 2025 21:54:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 14CFB223
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 21:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06B9580995
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 21:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cEJlQh0aWQlS for <buildroot@buildroot.org>;
 Fri, 15 Aug 2025 21:54:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.160;
 helo=smtpdh19-su.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 434C18098D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 434C18098D
Received: from smtpdh19-su.aruba.it (smtpdh19-su.aruba.it [62.149.155.160])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 434C18098D
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 21:54:26 +0000 (UTC)
Received: from localhost.localdomain ([95.168.120.45])
 by Aruba SMTP with ESMTPSA
 id n2NTu6qa4voVFn2NUuRwkW; Fri, 15 Aug 2025 23:54:24 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 15 Aug 2025 23:54:22 +0200
Message-ID: <20250815215422.437351-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfI+4QOI5Ol65GGavRYDYzCbg5guEojuLIVMyonRNqDAQRMB1zByRqwCJkvNguf31OiCqv278FpAc5PK4ThgKh9NKf8+pzYk4ELDCGBHCfzHgW+RREZRH
 iLTsl6QVQA0cIY7eQVhz/TqI9U/jbir4P6SiaQ5+tbZhoE0yLP50cQUUbbptPqG1aBcFZc25Fku3s9V9pB9IrGgZzDuyWVs25hTfMiOGb1vlVBtc2bJ/Iy7S
 xUPC700Sg7y4IdWWql+zSX56yYOu8Xw3PbwnFrjcmKVkNsgeGp8xT6Vw8sLGApm7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1755294864; bh=04YSGUL1FUu9dmgaHvtoUBZ62iNTWIOwxSs9HyKFbGM=;
 h=From:To:Subject:Date:MIME-Version;
 b=Rn4P+pwQOyaEj6/uJrKVnNyw8zajPRSV7VM23+Zaz66Cnv/1+/nGM0zJNREBHvQRC
 cRSEIfqfVHV6z5Cqwb34JbZr++Yu1RVYvFdW/aROxEBrYi2m3ZSkgTVUSfd72PWYdf
 T9R0zUKXYCvOOq6Jotb4ZzPXU9Y/29NCBzWgoJA6iEteHfPsnbXm5brvuYapz08mMi
 RMr8H2CYaD4KUjVrCzna2gb15nKA+cjWnfijMIYbu8zklOGOWdXr3ch/kgDE6t9DMf
 FxIX+GOy1ZNrjSDiwC4Iw8yXvlVBFfmiqtLHooy0Advx2O5i5kxhRub82xbWzlgPiR
 EaMLFkLfuFW8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Rn4P+pwQ
Subject: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: fix build with
 Linux 6.16
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

Add local patch pending upstream to fix build failure with Linux 6.16.

Fixes:
https://autobuild.buildroot.org/results/7a5b5f3e8d34e3e8ca155ffe168768275256c17e/
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0002-fix-build-for-kernel-6.16.patch      | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/rtl8812au-aircrack-ng/0002-fix-build-for-kernel-6.16.patch

diff --git a/package/rtl8812au-aircrack-ng/0002-fix-build-for-kernel-6.16.patch b/package/rtl8812au-aircrack-ng/0002-fix-build-for-kernel-6.16.patch
new file mode 100644
index 0000000000..46f67f14ac
--- /dev/null
+++ b/package/rtl8812au-aircrack-ng/0002-fix-build-for-kernel-6.16.patch
@@ -0,0 +1,34 @@
+From de764c6b43fef79bdea8783232a89d2e8ff0e059 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Fri, 15 Aug 2025 23:48:33 +0200
+Subject: [PATCH] fix build for kernel 6.16
+
+With commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=41cb08555c4164996d67c78b3bf1c658075b75f1
+from_timer() has been renamed to timer_container_of() so let's rename
+according to linux version >= 6.16
+
+Upstream: https://github.com/aircrack-ng/rtl8812au/pull/1236
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ include/osdep_service_linux.h | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/include/osdep_service_linux.h b/include/osdep_service_linux.h
+index 4c276f6..9f9a317 100644
+--- a/include/osdep_service_linux.h
++++ b/include/osdep_service_linux.h
+@@ -355,7 +355,9 @@ static inline void timer_hdl(struct timer_list *in_timer)
+ static inline void timer_hdl(unsigned long cntx)
+ #endif
+ {
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 14, 0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 16, 0))
++	_timer *ptimer = timer_container_of(ptimer, in_timer, timer);
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 14, 0))
+ 	_timer *ptimer = from_timer(ptimer, in_timer, timer);
+ #else
+ 	_timer *ptimer = (_timer *)cntx;
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
