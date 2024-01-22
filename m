Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCF0C46CD2
	for <buildroot@archiver.kernel.org>; Mon, 22 Jan 2024 21:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F5684040D;
	Mon, 22 Jan 2024 21:21:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F5684040D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3DgN3YjoE5OH; Mon, 22 Jan 2024 21:21:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AAFA41A28;
	Mon, 22 Jan 2024 21:21:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AAFA41A28
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 306401BF3A4
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 21:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07E4A4097C
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 21:21:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07E4A4097C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PJU_NQXvJxz0 for <buildroot@lists.busybox.net>;
 Mon, 22 Jan 2024 21:21:27 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CA7C4040D
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 21:21:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CA7C4040D
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-339208f5105so3168822f8f.1
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 13:21:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705958484; x=1706563284;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h4DAl+6d90jV4hNTDH54s6/obsVhCipIQPMgZ4Y+z+o=;
 b=EoC62edqFqDTsB42Awu1T/tf+VwaPlGKfHo2ZpCE/TZv/uoeAzKYaYy377xh0EDSD8
 6b4IskVSul1yp2PtzUHGtlDhc2ElP+Givi/+G+W656fvQVnERXy9Hq/gp5O1GEK813Aj
 UzR5igt7ND56cOPSjB0RlC84teM36KQmpAYp2ZzuqNYIymt6wj88SJrJNVuz2G1OeaMa
 4ALS26gnT1b7XpwPxNbSIIqSt42rak8tJGZhnLJSU5jrdTYKO2eSBVCzf6XunkvvoYJo
 8XWp6xXgknIoMZdH29gpWx00HKggk3dGGV0mSZYW6ksgZh+G79j9XIad1vU5guBeXEsW
 Fquw==
X-Gm-Message-State: AOJu0YwgGI+d7QGKl4olyc5+qvZecvC4xIKLCNgqvDBTUM5bFp04RP2p
 vlXO191URaFnaB6U9/AqIId8aLcvkXdkVrCmZx4ITfXd2tL2xLLTtlrBOjRN
X-Google-Smtp-Source: AGHT+IHLANvAgEqH31N2zfUXCTAb9cR5VJYrqdHLVFYzedeuBIxau+51kV78/vo95u2e3e14kROtmw==
X-Received: by 2002:a5d:508b:0:b0:337:c8ab:7823 with SMTP id
 a11-20020a5d508b000000b00337c8ab7823mr1691484wrt.100.1705958484405; 
 Mon, 22 Jan 2024 13:21:24 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 w14-20020a5d404e000000b00337d9a717bcsm10196557wrp.52.2024.01.22.13.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 13:21:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Jan 2024 22:21:21 +0100
Message-ID: <20240122212121.7805-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705958484; x=1706563284; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h4DAl+6d90jV4hNTDH54s6/obsVhCipIQPMgZ4Y+z+o=;
 b=fNWzG8WRNwvx7bY7ET0o+UyOyLl9safHi01q8S4Mcm7zqzk1FwsnAVmiGyZm0yf1aW
 GYc9m4gf80akndNd+Hgtz25dd5r4vmluxAuFfOaLfM0eb7FjfN1H/u88Wr6wS2S0g5ar
 QKF+4XJyQLuN33cJmyNOPbJw4cCdNtFglY6a6eLePAxHl+OO1x+3AlHhnSuLufURO3zu
 RubMmYmZZOrKcnBW5FYanlfmV7dUIhcYW5oveKAw1kE2wXs6zTMz7p4Q/vTvKIimrfnH
 qRgpkgB7y0Y2I5/gV9G19ooNlONTt9eLwGbs3y09qo3CFu7ajRCqgrBnVFRCMk66O9Ms
 9zqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fNWzG8WR
Subject: [Buildroot] [PATCH 1/1] package/rdma-core: fix mips4 build
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The 'sync' instruction for MIPS was defined in MIPS-II as taking no
operands. MIPS32 extended the define of 'sync' as taking an optional
unsigned 5 bit immediate.

As a result, replace "sync 0" by "sync" to fix the following build
failure on mips4 raised since the addition of the package in commit
ea47e177f093d7378e8e8e1f50d6f4e3fce0a088 and
https://github.com/linux-rdma/rdma-core/commit/b7c428344ea96d446f6ffe31c620a238a7f25c9e:

/tmp/ccrBy9fV.s: Assembler messages:
/tmp/ccrBy9fV.s:994: Error: invalid operands `sync 0'

Fixes:
 - http://autobuild.buildroot.org/results/2ab22a3ec4287fc15ff6a90d8715b4897b32a933
 - http://autobuild.buildroot.org/results/2df58f9b98aacf00960932f53510b29199393461

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-util-udma_barrier.h-fix-mips4-build.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/rdma-core/0001-util-udma_barrier.h-fix-mips4-build.patch

diff --git a/package/rdma-core/0001-util-udma_barrier.h-fix-mips4-build.patch b/package/rdma-core/0001-util-udma_barrier.h-fix-mips4-build.patch
new file mode 100644
index 0000000000..6dfb476faa
--- /dev/null
+++ b/package/rdma-core/0001-util-udma_barrier.h-fix-mips4-build.patch
@@ -0,0 +1,56 @@
+From 1b1ca539f6e1f0b774e989f1022477686e4fc77f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 21 Jan 2024 18:55:34 +0100
+Subject: [PATCH] util/udma_barrier.h: fix mips4 build
+
+The 'sync' instruction for MIPS was defined in MIPS-II as taking no
+operands. MIPS32 extended the define of 'sync' as taking an optional
+unsigned 5 bit immediate.
+
+As a result, replace "sync 0" by "sync" to fix the following build
+failure on mips4 raised since version 43.0 and
+https://github.com/linux-rdma/rdma-core/commit/b7c428344ea96d446f6ffe31c620a238a7f25c9e:
+
+/tmp/ccrBy9fV.s: Assembler messages:
+/tmp/ccrBy9fV.s:994: Error: invalid operands `sync 0'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/2ab22a3ec4287fc15ff6a90d8715b4897b32a933
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/linux-rdma/rdma-core/commit/f3f0c06014c6de845032e6fe9f152674919b3ec6
+---
+ util/udma_barrier.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/util/udma_barrier.h b/util/udma_barrier.h
+index 0a1f8a45b..3793d2f18 100644
+--- a/util/udma_barrier.h
++++ b/util/udma_barrier.h
+@@ -101,7 +101,7 @@
+ #elif defined(__riscv)
+ #define udma_to_device_barrier() asm volatile("fence ow,ow" ::: "memory")
+ #elif defined(__mips__)
+-#define udma_to_device_barrier() asm volatile("sync 0" ::: "memory")
++#define udma_to_device_barrier() asm volatile("sync" ::: "memory")
+ #else
+ #error No architecture specific memory barrier defines found!
+ #endif
+@@ -139,7 +139,7 @@
+ #elif defined(__riscv)
+ #define udma_from_device_barrier() asm volatile("fence ir,ir" ::: "memory")
+ #elif defined(__mips__)
+-#define udma_from_device_barrier() asm volatile("sync 0" ::: "memory")
++#define udma_from_device_barrier() asm volatile("sync" ::: "memory")
+ #else
+ #error No architecture specific memory barrier defines found!
+ #endif
+@@ -212,7 +212,7 @@
+ #include "s390_mmio_insn.h"
+ #define mmio_flush_writes() s390_pciwb()
+ #elif defined(__mips__)
+-#define mmio_flush_writes() asm volatile("sync 0" ::: "memory")
++#define mmio_flush_writes() asm volatile("sync" ::: "memory")
+ #else
+ #error No architecture specific memory barrier defines found!
+ #endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
