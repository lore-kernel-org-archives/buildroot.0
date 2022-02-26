Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD91C433F5
	for <buildroot@archiver.kernel.org>; Sat, 26 Feb 2022 15:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A7CF40320;
	Sat, 26 Feb 2022 15:52:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oGeQSo0-UcsF; Sat, 26 Feb 2022 15:52:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F25EC4015A;
	Sat, 26 Feb 2022 15:52:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 161BC1BF284
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 15:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F313B60810
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 15:52:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g-SaxC0MpZAF for <buildroot@lists.busybox.net>;
 Sat, 26 Feb 2022 15:52:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28DB1606E7
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 15:52:53 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id v21so8836066wrv.5
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 07:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TYcfN4MBbZqC9I0Ri4D76yvF1De2Ys2nY1cf1IC3fmc=;
 b=apH0T6keSUEGnPr+2PXio3fVdaVnCyTO/T7EPdRDjOX/JC2Pj/amoo41cG79yiXGDO
 5bYXGaB04N/ENoZKHBNaYROHAdhdIeGj5WdzKZ8ub7DPbAn3s1Y3gGZHIQoBaYsNJZd9
 oyh4eGuBbwMjHRAMdVZJH49t57OzT0OA9LuOdCexJ1FzvRiX5ooPQhulry9jU+3YPzK1
 ZxrJx5BHkN9eDsI9PhzXVL4uYd3Kbj5Fa1azM3JuRneHHLyiHMK3d+ATfm8BvOnNoxFR
 +Bxwpx/wz1fMGvW9Yt/nOmK7giWX3w+GVQ8thwSv5dzCs0imlCzfEyhJWWVzSX2wAwgf
 RdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TYcfN4MBbZqC9I0Ri4D76yvF1De2Ys2nY1cf1IC3fmc=;
 b=yC9Vj+EJLunqeW56578OpKb0vVH1vd/7EOSnHR4WCoL1Tjx8omkRIu9yBFDpsrNit5
 rGa8WjJfM1gJpDDU2QpZcF3zCU2jYdlM6uS2zwjGOEZmrTBTwTq3+D+Qad6JCqxOPUNX
 Tu1p9eWPGozb4eFFGrIoymZHAgK3JmVnO8R9dE9AJOpIP59HmTn87xinXBt+OYw9svGK
 WGX+QpzriGQzShpVE7pAbtDhWkr8xOGqbOPNzCnkbCFE5kOSdyIM4IGrMSm0zGsrOUeW
 ADSPpuNOo6qonIi4rdc8r7WS4sAwoX/iZEPDlLyalhC4rHn8m4omrK93lpeHTj1UYyOD
 TQOw==
X-Gm-Message-State: AOAM532Cxnl/j4jdPpLlCVQxwH68i+qjxxoIckyTqakVAD5JQDcp7Iuk
 BoaIUjWz5zE8O7P49iADm4WP09atfwM=
X-Google-Smtp-Source: ABdhPJx4Z3mM44f9yBgn2rGm8oMOdRST0CMjGgosk6Km7JiHg8CPeLNlGeoasuT28Ct5iqpARK2rOw==
X-Received: by 2002:a5d:6b8a:0:b0:1ef:87f3:c590 with SMTP id
 n10-20020a5d6b8a000000b001ef87f3c590mr2163104wrx.302.1645890771085; 
 Sat, 26 Feb 2022 07:52:51 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a05600c3b0d00b0037c00e01771sm9635788wms.34.2022.02.26.07.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 07:52:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Feb 2022 16:52:33 +0100
Message-Id: <20220226155233.2605318-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/frr: fix elf_py TLS section handling
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
Cc: Vadim Kochan <vadim4j@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised on mipsel, or1k, powerpc raised
since bump to version 8.1 in commit
ca2753fd47d47e5ad0eec16ea62f7b7f096331b6:

struct.error: unpack requires a buffer of 20 bytes

Fixes:
 - http://autobuild.buildroot.org/results/74f39c6f14e3f60babdcabceb5e42656f69cdaa7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-lib-fix-elf_py-TLS-section-handling.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/frr/0002-lib-fix-elf_py-TLS-section-handling.patch

diff --git a/package/frr/0002-lib-fix-elf_py-TLS-section-handling.patch b/package/frr/0002-lib-fix-elf_py-TLS-section-handling.patch
new file mode 100644
index 0000000000..d491cb1a7d
--- /dev/null
+++ b/package/frr/0002-lib-fix-elf_py-TLS-section-handling.patch
@@ -0,0 +1,31 @@
+From 3942ee1f7bc754dd0dd9ae79f89d0f2635be334f Mon Sep 17 00:00:00 2001
+From: David Lamparter <equinox@opensourcerouting.org>
+Date: Wed, 10 Nov 2021 15:30:07 +0100
+Subject: [PATCH] lib: fix elf_py TLS section handling
+
+... need to ignore TLS sections, their address is effectively
+meaningless but can overlap other sections we actually need to access.
+
+Signed-off-by: David Lamparter <equinox@opensourcerouting.org>
+
+[Retrieved from:
+https://github.com/FRRouting/frr/commit/3942ee1f7bc754dd0dd9ae79f89d0f2635be334f]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/elf_py.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/elf_py.c b/lib/elf_py.c
+index 1c306893ad8..f230add6957 100644
+--- a/lib/elf_py.c
++++ b/lib/elf_py.c
+@@ -636,6 +636,9 @@ static Elf_Scn *elf_find_addr(struct elffile *ef, uint64_t addr, size_t *idx)
+ 		Elf_Scn *scn = elf_getscn(ef->elf, i);
+ 		GElf_Shdr _shdr, *shdr = gelf_getshdr(scn, &_shdr);
+ 
++		/* virtual address is kinda meaningless for TLS sections */
++		if (shdr->sh_flags & SHF_TLS)
++			continue;
+ 		if (addr < shdr->sh_addr ||
+ 		    addr >= shdr->sh_addr + shdr->sh_size)
+ 			continue;
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
