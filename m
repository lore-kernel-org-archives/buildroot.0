Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD46BC7618E
	for <buildroot@archiver.kernel.org>; Sat, 22 Apr 2023 09:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EDD060E31;
	Sat, 22 Apr 2023 09:06:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EDD060E31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1LjA7rc9CIZQ; Sat, 22 Apr 2023 09:06:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C16F60D76;
	Sat, 22 Apr 2023 09:06:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C16F60D76
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E5F61C29B8
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 09:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20D1041C3F
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 09:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20D1041C3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 75dTEg7sOiUM for <buildroot@lists.busybox.net>;
 Sat, 22 Apr 2023 09:06:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9294841D61
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9294841D61
 for <buildroot@buildroot.org>; Sat, 22 Apr 2023 09:06:29 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.208]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N1Obh-1qHp4T17O7-012pOs; Sat, 22 Apr 2023 11:06:26 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sat, 22 Apr 2023 11:06:24 +0200
Message-Id: <20230422090625.25006-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230422090625.25006-1-ps.report@gmx.net>
References: <20230422090625.25006-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:+GRI6+lN4037xgDJb7HnMKFlXWWq18ceg8Z2gmyQYXpb3XM4xyO
 0KZmih1pcs6LdTTXkDckWxY1M6TokixLBn9vJLWyWq8c0iSr8085J80Qd9sWW1rRaJfLQvQ
 XZ3DaGiCWXntb3E9FLjrziDYG3om9uSVxGXjVMlU0FpfZ0AT64p1FOqpD2poACVW3niNjZs
 n3A/4/zLCFgOTRIw+Ib9g==
UI-OutboundReport: notjunk:1;M01:P0:Pz3C3NPL7Uw=;nUoV0PoZRgb4Pj/Ba7WH7izWW2H
 qDCqOq/3tgiNYGxBKFoPLBa0QGwEUt9pHCNMqrUkbMs+4kfkpZH/G2M65tisUeuXi10JFo3pJ
 Gko+cIMEFCjbDK9YcLrjtiuyoErxZRuFLskuk2UdskKkS6z9jPxjd83+Ix/ewN4kXHy6WB7+Z
 B6AceSBuxcn2tiNuHUqZgXT6aehwZ/uKQn5o1XcZ6Fr45fAA6MxRSshHGeRn30Fz0/bKDcgra
 hG1U7l7GfB38Wzuah3ae+EFBRyUBLOr0JpsHDvJV9PqZxGmeP+gDi9/FY0FeJ82Z/X0EWNV6X
 eiPxaCGvq0QFwVsTZaTPSdDNn0lrgaRrexQ8DKglSjlecLSidCPdW+g6gABLMI4K6CKNINHVD
 y7Ei/knw8jh19PzE0N5uwSNAcR8fLAfB+iC93RnsITWuDSrkb39E4l5ddkNpCEqvxkxN3nbL3
 o0m02/lERHACzNfuuw7vy40weYwdeh3pYUalB6m09vdvDlgF3vxrAoETbdLkml3qfn9ZqJxdf
 ZzjuesnBub8D7xMrD6T+DMKBikiG+uDqHYfaljIVubTWONILReCabMNOf4d3wRrQmVG13kxa9
 0SJ3cMd90EvxVS3hijtMpRuWgvGFXAIp4vearr9SdoM1ndfUykseNhr6VJbZAuPFzRzis542d
 94lpY1RxhRTCnTjAFUA2BJWfRYZTHczezTeiK2oIZJvGTsJYkogU+fWZfDfVtokzi2XSiuy53
 hOMxlEdyvI6aHKf0//wRdJ55/a0DkN09f7MgpeLLfUQ0u2/CccPKtqWxIYbbqD39eRfcvv9he
 doidRseoY5+3g3ujLgd+FvanrfP5w053GoThZ2XBuhQji7Fns7FgR+Jusvsx9saFoyQL7hNcC
 fs8ksWgrNquT4q1GzyFifLri/dis/KVbjx8emu2/ayWX+rnyI8YTh63DrQvyDV7eThVEGIM+V
 9zY/TCRUmrHnRXdukuBl7ZrOWj0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1682154386; i=ps.report@gmx.net;
 bh=5VrHiqu2rhGIXpRQYWeXvO0BXgiB/p5dE1BTUCWkU4E=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=koq92gbM1OJeZykt+6oAEeXipxsiFrD7t4DK5hqain9ktWsmkv4aJ5xfxWjyi8ejF
 92hQZ+OucC5XrQa9fUrR7FeeivkNYE0iTvVmAwFEtReGDd/LMItV5D+tCbzkfc6GOc
 CmHc7gGjU834Oc7G9k8joMAP7iwJYh2ugrz0wlLr3FmiDeR4MkgtHUIbK/vtkBL5S4
 VPp27bWiWF1vp4ZTRBxQ22Iiyq3C8uJPPL3UyIZHCfSywKJJTb5zx3zmQhrt0cRCFQ
 yW5UJO8dH9HuftGmDA8RuK8bx9hWZrk8cwM72vqM/qk5ki/rTusY0niadHs9XfdWKB
 ZjZmLBlLR/juQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=koq92gbM
Subject: [Buildroot] [PATCH v1 2/3] package/qemu: bump version to 7.2.1
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

- remove 0003-target-sh4-Mask-restore-of-env-flags-from-tb-flags.patch
  (from upstream, see [1])

[1] https://gitlab.com/qemu-project/qemu/-/commit/e34f86a2f91c39d610d58baa6f4c9ed9a5a5d791

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...k-restore-of-env-flags-from-tb-flags.patch | 36 -------------------
 package/qemu/qemu.hash                        |  2 +-
 package/qemu/qemu.mk                          |  2 +-
 3 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 package/qemu/0003-target-sh4-Mask-restore-of-env-flags-from-tb-flags.patch

diff --git a/package/qemu/0003-target-sh4-Mask-restore-of-env-flags-from-tb-flags.patch b/package/qemu/0003-target-sh4-Mask-restore-of-env-flags-from-tb-flags.patch
deleted file mode 100644
index 8dc2dd8823..0000000000
--- a/package/qemu/0003-target-sh4-Mask-restore-of-env-flags-from-tb-flags.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From bc2331635ce18ff068d2bb1e493bc546e1f786e1 Mon Sep 17 00:00:00 2001
-From: Guenter Roeck <linux@roeck-us.net>
-Date: Mon, 12 Dec 2022 09:03:17 -0600
-Subject: [PATCH] target/sh4: Mask restore of env->flags from tb->flags
-
-The values in env->flags are a subset of tb->flags.
-Restore only the bits that belong.
-
-Cc: qemu-stable@nongnu.org
-Fixes: ab419fd8a035 ("target/sh4: Fix TB_FLAG_UNALIGN")
-Signed-off-by: Guenter Roeck <linux@roeck-us.net>
-Message-ID: <20221212011345.GA2235238@roeck-us.net>
-[rth: Reduce to only the the superh_cpu_synchronize_from_tb change]
-Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
-[yann.morin.1998@free.fr: backport from upstream]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- target/sh4/cpu.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
-index 951eb6b9c8..f0934b20fa 100644
---- a/target/sh4/cpu.c
-+++ b/target/sh4/cpu.c
-@@ -47,7 +47,7 @@ static void superh_cpu_synchronize_from_tb(CPUState *cs,
-     SuperHCPU *cpu = SUPERH_CPU(cs);
- 
-     cpu->env.pc = tb_pc(tb);
--    cpu->env.flags = tb->flags;
-+    cpu->env.flags = tb->flags & TB_FLAG_ENVFLAGS_MASK;
- }
- 
- static void superh_restore_state_to_opc(CPUState *cs,
--- 
-2.25.1
-
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index e671e1d184..93f7c98f1c 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  5b49ce2687744dad494ae90a898c52204a3406e84d072482a1e1be854eeb2157  qemu-7.2.0.tar.xz
+sha256  8c85699acf9d7a43a5fe29a64cdd56370b0c2d1ad074baf7098a824d17aad73b  qemu-7.2.1.tar.xz
 sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 3f51cb572b..12d52f61bf 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, check whether the list of supported targets
 # needs to be updated.
-QEMU_VERSION = 7.2.0
+QEMU_VERSION = 7.2.1
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
