Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0069FC3062F
	for <buildroot@archiver.kernel.org>; Thu, 17 Aug 2023 14:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6539140272;
	Thu, 17 Aug 2023 14:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6539140272
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AK-rGvlEY5Pr; Thu, 17 Aug 2023 14:48:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96987418D6;
	Thu, 17 Aug 2023 14:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96987418D6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 81AFA1BF3BC
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 14:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DA984019D
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 14:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DA984019D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3FKvfbyrADKX for <buildroot@lists.busybox.net>;
 Thu, 17 Aug 2023 14:48:24 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 458FA40219
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 14:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 458FA40219
Received: by helium.openadk.org (Postfix, from userid 1000)
 id E9D69352BDB7; Thu, 17 Aug 2023 16:48:19 +0200 (CEST)
Date: Thu, 17 Aug 2023 16:48:19 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZN4zM862Ivoe10FG@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1692283700; bh=hJt8ZpDmT60wCLM2brdq2iid5af2pUrCbZsnWJFwjyI=;
 h=Date:From:To:Subject:From;
 b=Q6oICc6mzG1D4OYR1QJxvgh46jHeCD/+lthR2z8/Y6zW9K2T5TTVp0N3V/tRilLzy
 ZLrdHucdGU6UHGdF/Q+tGC7jmd9ba7tHbl6L4DNdqsiUhoSVz8QwPk5nwU8U9f2feX
 g3MeE/65hPNI5yHopA0F5RBck7Undeeitx6oQf9h6AgF+BlS8fQC4EdTWIz4dTBABc
 pcDmpuIhbvYFxfPM317zQ5BldrUJUz6uH19tjvwBf9Si7WCVvg3TmJbpc+h07pKS/5
 j+vUZZMtT/nYTQb4paQYbgu+T4M7WmBR6r7fF7COwsD302MaUrkNyChKrL2w7eoSW9
 7JY5v2g4iWAow==
Subject: [Buildroot] [PATCHv2 1/2] package/uclibc: add hwcap header for arm
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is used by package tcf-agent when getauxval is used.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1 -> v2:
  - no change
---
 .../0003-arm-add-hwcap-header-file.patch      | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 package/uclibc/0003-arm-add-hwcap-header-file.patch

diff --git a/package/uclibc/0003-arm-add-hwcap-header-file.patch b/package/uclibc/0003-arm-add-hwcap-header-file.patch
new file mode 100644
index 0000000000..9a74d79c8e
--- /dev/null
+++ b/package/uclibc/0003-arm-add-hwcap-header-file.patch
@@ -0,0 +1,71 @@
+From 3d781a52bae133907ba61bfbe987604f8cb00373 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Sat, 12 Aug 2023 19:48:40 +0200
+Subject: [PATCH] arm: add hwcap header file
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=3d781a52bae133907ba61bfbe987604f8cb00373
+---
+ libc/sysdeps/linux/arm/bits/hwcap.h | 50 +++++++++++++++++++++++++++++
+ 1 file changed, 50 insertions(+)
+ create mode 100644 libc/sysdeps/linux/arm/bits/hwcap.h
+
+diff --git a/libc/sysdeps/linux/arm/bits/hwcap.h b/libc/sysdeps/linux/arm/bits/hwcap.h
+new file mode 100644
+index 000000000..0a741b469
+--- /dev/null
++++ b/libc/sysdeps/linux/arm/bits/hwcap.h
+@@ -0,0 +1,50 @@
++/* Defines for bits in AT_HWCAP.  ARM Linux version.
++   Copyright (C) 2012-2023 Free Software Foundation, Inc.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#if !defined (_SYS_AUXV_H) && !defined (_LINUX_ARM_SYSDEP_H)
++# error "Never include <bits/hwcap.h> directly; use <sys/auxv.h> instead."
++#endif
++
++/* The following must match the kernel's <asm/hwcap.h>.  */
++#define HWCAP_ARM_SWP		1
++#define HWCAP_ARM_HALF		2
++#define HWCAP_ARM_THUMB		4
++#define HWCAP_ARM_26BIT		8
++#define HWCAP_ARM_FAST_MULT	16
++#define HWCAP_ARM_FPA		32
++#define HWCAP_ARM_VFP		64
++#define HWCAP_ARM_EDSP		128
++#define HWCAP_ARM_JAVA		256
++#define HWCAP_ARM_IWMMXT	512
++#define HWCAP_ARM_CRUNCH	1024
++#define HWCAP_ARM_THUMBEE	2048
++#define HWCAP_ARM_NEON		4096
++#define HWCAP_ARM_VFPv3		8192
++#define HWCAP_ARM_VFPv3D16	16384
++#define HWCAP_ARM_TLS		32768
++#define HWCAP_ARM_VFPv4		65536
++#define HWCAP_ARM_IDIVA		131072
++#define HWCAP_ARM_IDIVT		262144
++#define HWCAP_ARM_VFPD32	524288
++#define HWCAP_ARM_LPAE		1048576
++#define HWCAP_ARM_EVTSTRM	2097152
++#define HWCAP_FPHP		4194304
++#define HWCAP_ASIMDHP		8388608
++#define HWCAP_ASIMDDP		16777216
++#define HWCAP_ASIMDFHM		33554432
++#define HWCAP_ASIMDBF16		67108864
++#define HWCAP_I8MM		134217728
+-- 
+2.30.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
