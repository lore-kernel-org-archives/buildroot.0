Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F64AEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 09:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FFF76068F;
	Mon, 10 Jul 2023 09:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FFF76068F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ef-ziRC78zBi; Mon, 10 Jul 2023 09:42:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 067E860E61;
	Mon, 10 Jul 2023 09:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 067E860E61
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 757881BF3C9
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 09:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F3C240578
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 09:42:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F3C240578
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KtV_q11swUfT for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 09:42:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3627C4053E
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3627C4053E
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 09:42:08 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3144bf65ce9so4337071f8f.3
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 02:42:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688982126; x=1691574126;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QYGL6fkGu1nKYBHGMxASJlnEX+NVxNIXcjn+vPNn4XM=;
 b=WC1tCHuo3vkKAKG2db/NmvViJAz2wAEAKY5lIgJugq+oZOUBLWxb/uy7AfdI2CvkX7
 mGd7C0T2Fd8EcqasvO5+HKvooWZwqAvdguc3tBZpyIcXLuhuoGpcMZjrauRVuvTQEFsS
 KqqhKVScVTt6D+6ycXTbZky0dSuFBawCgxXdtvg1RHHdwEmXWDUID41LH+syM2sAd9Ga
 CF6vnigrdj3d0+cglTDf1hD9Ry6PmdHv358p0nAOcBlxvcv072Og492s3HjDhBr39CcH
 YnnVpmX6MJw9pziMuf57k5XPWCOfoFnGpC6x68nL9eIf3+EqRVMFTtIIM6wmRNTlPUXe
 qJbw==
X-Gm-Message-State: ABy/qLb/A6C6hGfGvalbibuS289VTKx+kgUGX9wYPaQkmyaW7Z9QN97+
 WYEX/F4FKCyHrXr4zyIhrr4wUJXi9m4=
X-Google-Smtp-Source: APBJJlHQm95bc9awSECbMyl86BM6Ot+A1uNfUlusNhY0v7PAuc+Ih/hBszjwKVg91OdYOvlTXD+DUA==
X-Received: by 2002:a5d:608b:0:b0:314:183f:7ac0 with SMTP id
 w11-20020a5d608b000000b00314183f7ac0mr11003734wrt.43.1688982125697; 
 Mon, 10 Jul 2023 02:42:05 -0700 (PDT)
Received: from hthiery.kontron.local
 ([2a02:810b:5a40:2a43:7200:ad55:a3ad:7bab])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a5d5588000000b0030fa3567541sm11161556wrv.48.2023.07.10.02.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 02:42:05 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 11:41:49 +0200
Message-Id: <20230710094148.308395-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688982126; x=1691574126;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QYGL6fkGu1nKYBHGMxASJlnEX+NVxNIXcjn+vPNn4XM=;
 b=eQs9ZHTbIEfQthWPcZDls+bJk5zt3qnfkHFjaEw0j6sSUGd6Sr3KIqhdsHVwh6TNLE
 xpRYChz/jXRFk2s+AH4bjIYjkDTb+AT8PyL+Dp+Ud4iKayYAfLadhlmb/lFmkbSa1c15
 rJcBJn36jLcETqpOTE/AgA0kHftIpuWVC31btEKxAWypmbrNEIcS9DdCchIbjWgpcC1O
 8Ng7nIc5RIQ+gq+eTL6eBdM3f0ttddfIBhyI2PX8CauQbwPKdMWQkbNjCBM3Dr6ZG0XR
 53vAToP6IiSYdzgTfk5z/IXA3wAztiRAhBjt3Gljy8ww0O7lfR63V6DLIFPr7z2Q1Ij+
 HQ9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=eQs9ZHTb
Subject: [Buildroot] [PATCH v2] boot/arm-trusted-firmware: fix build issue
 with binutils 2.39+
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The new version of binutils introduces a new warning when linking. The
new warninng is enabled by default. To fix the issue this warning is
disabled by adding the patches to the arm-trusted-firmware package
v{2.2..2.8}. This is a backport of an upstream commit [1]

Since there are too many defconfigs that use the arm-trusted-firmware
package, it is not practical to create a global-patch-dir for all of them.
Therefore the patches are only in the package directory.

[1] https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996186
https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996189

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

---
v2: change the commit message to state why we add the patch to the
    package directory
---
 ...-add-support-for-new-binutils-versio.patch | 58 +++++++++++++++++
 ...dd-support-for-new-binutils-versions.patch | 62 +++++++++++++++++++
 ...dd-support-for-new-binutils-versions.patch | 62 +++++++++++++++++++
 ...dd-support-for-new-binutils-versions.patch | 62 +++++++++++++++++++
 ...dd-support-for-new-binutils-versions.patch | 62 +++++++++++++++++++
 ...dd-support-for-new-binutils-versions.patch | 62 +++++++++++++++++++
 ...dd-support-for-new-binutils-versions.patch | 62 +++++++++++++++++++
 7 files changed, 430 insertions(+)
 create mode 100644 boot/arm-trusted-firmware/v2.2/0001-PATCH-feat-build-add-support-for-new-binutils-versio.patch
 create mode 100644 boot/arm-trusted-firmware/v2.3/0001-feat-build-add-support-for-new-binutils-versions.patch
 create mode 100644 boot/arm-trusted-firmware/v2.4/0001-feat-build-add-support-for-new-binutils-versions.patch
 create mode 100644 boot/arm-trusted-firmware/v2.5/0001-feat-build-add-support-for-new-binutils-versions.patch
 create mode 100644 boot/arm-trusted-firmware/v2.6/0001-feat-build-add-support-for-new-binutils-versions.patch
 create mode 100644 boot/arm-trusted-firmware/v2.7/0001-feat-build-add-support-for-new-binutils-versions.patch
 create mode 100644 boot/arm-trusted-firmware/v2.8/0001-feat-build-add-support-for-new-binutils-versions.patch

diff --git a/boot/arm-trusted-firmware/v2.2/0001-PATCH-feat-build-add-support-for-new-binutils-versio.patch b/boot/arm-trusted-firmware/v2.2/0001-PATCH-feat-build-add-support-for-new-binutils-versio.patch
new file mode 100644
index 0000000000..2375de0eef
--- /dev/null
+++ b/boot/arm-trusted-firmware/v2.2/0001-PATCH-feat-build-add-support-for-new-binutils-versio.patch
@@ -0,0 +1,58 @@
+From 5e1beb793c06352e87c46eca1144ff1fe8555103 Mon Sep 17 00:00:00 2001
+From: Heiko Thiery <heiko.thiery@gmail.com>
+Date: Mon, 10 Jul 2023 10:43:03 +0200
+Subject: [PATCH] [PATCH] feat(build): add support for new binutils versions
+
+Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
+of a new warning when linking the bl*.elf in the form:
+
+  ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
+  ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
+  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
+  ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
+
+These new warnings are enbaled by default to secure elf binaries:
+ - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
+ - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
+
+Fix it in a similar way to what the Linux kernel does, see:
+https://lore.kernel.org/all/20220810222442.2296651-1-ndesaulniers@google.com/
+
+Following the reasoning there, we set "-z noexecstack" for all linkers
+(although LLVM's LLD defaults to it) and optional add
+--no-warn-rwx-segments since this a ld.bfd related.
+
+Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
+Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
+Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
+
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ Makefile | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 721246d51..5893cf422 100644
+--- a/Makefile
++++ b/Makefile
+@@ -297,11 +297,16 @@ endif
+ 
+ GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
+ 
++TF_LDFLAGS              +=      -z noexecstack
++
+ ifneq ($(findstring armlink,$(notdir $(LD))),)
+ TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
+ TF_LDFLAGS		+=	--remove --info=unused,unusedsymbols
+ else
+-TF_LDFLAGS		+=	--fatal-warnings -O1
++# With ld.bfd version 2.39 and newer new warnings are added. Skip those since we
++# are not loaded by a elf loader.
++TF_LDFLAGS              +=      $(call ld_option, --no-warn-rwx-segments)
++TF_LDFLAGS              +=      -O1
+ TF_LDFLAGS		+=	--gc-sections
+ endif
+ TF_LDFLAGS		+=	$(TF_LDFLAGS_$(ARCH))
+-- 
+2.30.2
+
diff --git a/boot/arm-trusted-firmware/v2.3/0001-feat-build-add-support-for-new-binutils-versions.patch b/boot/arm-trusted-firmware/v2.3/0001-feat-build-add-support-for-new-binutils-versions.patch
new file mode 100644
index 0000000000..9b5a9dba97
--- /dev/null
+++ b/boot/arm-trusted-firmware/v2.3/0001-feat-build-add-support-for-new-binutils-versions.patch
@@ -0,0 +1,62 @@
+From 0f75b03c008eacb9818af3a56dc088e72a623d17 Mon Sep 17 00:00:00 2001
+From: Marco Felsch <m.felsch@pengutronix.de>
+Date: Wed, 9 Nov 2022 12:59:09 +0100
+Subject: [PATCH] feat(build): add support for new binutils versions
+
+Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
+of a new warning when linking the bl*.elf in the form:
+
+  ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
+  ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
+  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
+  ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
+
+These new warnings are enbaled by default to secure elf binaries:
+ - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
+ - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
+
+Fix it in a similar way to what the Linux kernel does, see:
+https://lore.kernel.org/all/20220810222442.2296651-1-ndesaulniers@google.com/
+
+Following the reasoning there, we set "-z noexecstack" for all linkers
+(although LLVM's LLD defaults to it) and optional add
+--no-warn-rwx-segments since this a ld.bfd related.
+
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+[Retrieved and rebased from
+https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c]
+Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
+Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
+Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
+---
+ Makefile | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 1ddb7b844..470956b19 100644
+--- a/Makefile
++++ b/Makefile
+@@ -416,6 +416,8 @@ endif
+ 
+ GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
+ 
++TF_LDFLAGS		+=	-z noexecstack
++
+ # LD = armlink
+ ifneq ($(findstring armlink,$(notdir $(LD))),)
+ TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
+@@ -442,7 +444,10 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
+ 
+ # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
+ else
+-TF_LDFLAGS		+=	--fatal-warnings -O1
++# With ld.bfd version 2.39 and newer new warnings are added. Skip those since we
++# are not loaded by a elf loader.
++TF_LDFLAGS		+=	$(call ld_option, --no-warn-rwx-segments)
++TF_LDFLAGS		+=	-O1
+ TF_LDFLAGS		+=	--gc-sections
+ # ld.lld doesn't recognize the errata flags,
+ # therefore don't add those in that case
+-- 
+2.30.2
+
diff --git a/boot/arm-trusted-firmware/v2.4/0001-feat-build-add-support-for-new-binutils-versions.patch b/boot/arm-trusted-firmware/v2.4/0001-feat-build-add-support-for-new-binutils-versions.patch
new file mode 100644
index 0000000000..9b5a9dba97
--- /dev/null
+++ b/boot/arm-trusted-firmware/v2.4/0001-feat-build-add-support-for-new-binutils-versions.patch
@@ -0,0 +1,62 @@
+From 0f75b03c008eacb9818af3a56dc088e72a623d17 Mon Sep 17 00:00:00 2001
+From: Marco Felsch <m.felsch@pengutronix.de>
+Date: Wed, 9 Nov 2022 12:59:09 +0100
+Subject: [PATCH] feat(build): add support for new binutils versions
+
+Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
+of a new warning when linking the bl*.elf in the form:
+
+  ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
+  ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
+  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
+  ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
+
+These new warnings are enbaled by default to secure elf binaries:
+ - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
+ - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
+
+Fix it in a similar way to what the Linux kernel does, see:
+https://lore.kernel.org/all/20220810222442.2296651-1-ndesaulniers@google.com/
+
+Following the reasoning there, we set "-z noexecstack" for all linkers
+(although LLVM's LLD defaults to it) and optional add
+--no-warn-rwx-segments since this a ld.bfd related.
+
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+[Retrieved and rebased from
+https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c]
+Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
+Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
+Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
+---
+ Makefile | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 1ddb7b844..470956b19 100644
+--- a/Makefile
++++ b/Makefile
+@@ -416,6 +416,8 @@ endif
+ 
+ GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
+ 
++TF_LDFLAGS		+=	-z noexecstack
++
+ # LD = armlink
+ ifneq ($(findstring armlink,$(notdir $(LD))),)
+ TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
+@@ -442,7 +444,10 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
+ 
+ # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
+ else
+-TF_LDFLAGS		+=	--fatal-warnings -O1
++# With ld.bfd version 2.39 and newer new warnings are added. Skip those since we
++# are not loaded by a elf loader.
++TF_LDFLAGS		+=	$(call ld_option, --no-warn-rwx-segments)
++TF_LDFLAGS		+=	-O1
+ TF_LDFLAGS		+=	--gc-sections
+ # ld.lld doesn't recognize the errata flags,
+ # therefore don't add those in that case
+-- 
+2.30.2
+
diff --git a/boot/arm-trusted-firmware/v2.5/0001-feat-build-add-support-for-new-binutils-versions.patch b/boot/arm-trusted-firmware/v2.5/0001-feat-build-add-support-for-new-binutils-versions.patch
new file mode 100644
index 0000000000..9b5a9dba97
--- /dev/null
+++ b/boot/arm-trusted-firmware/v2.5/0001-feat-build-add-support-for-new-binutils-versions.patch
@@ -0,0 +1,62 @@
+From 0f75b03c008eacb9818af3a56dc088e72a623d17 Mon Sep 17 00:00:00 2001
+From: Marco Felsch <m.felsch@pengutronix.de>
+Date: Wed, 9 Nov 2022 12:59:09 +0100
+Subject: [PATCH] feat(build): add support for new binutils versions
+
+Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
+of a new warning when linking the bl*.elf in the form:
+
+  ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
+  ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
+  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
+  ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
+
+These new warnings are enbaled by default to secure elf binaries:
+ - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
+ - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
+
+Fix it in a similar way to what the Linux kernel does, see:
+https://lore.kernel.org/all/20220810222442.2296651-1-ndesaulniers@google.com/
+
+Following the reasoning there, we set "-z noexecstack" for all linkers
+(although LLVM's LLD defaults to it) and optional add
+--no-warn-rwx-segments since this a ld.bfd related.
+
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+[Retrieved and rebased from
+https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c]
+Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
+Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
+Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
+---
+ Makefile | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 1ddb7b844..470956b19 100644
+--- a/Makefile
++++ b/Makefile
+@@ -416,6 +416,8 @@ endif
+ 
+ GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
+ 
++TF_LDFLAGS		+=	-z noexecstack
++
+ # LD = armlink
+ ifneq ($(findstring armlink,$(notdir $(LD))),)
+ TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
+@@ -442,7 +444,10 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
+ 
+ # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
+ else
+-TF_LDFLAGS		+=	--fatal-warnings -O1
++# With ld.bfd version 2.39 and newer new warnings are added. Skip those since we
++# are not loaded by a elf loader.
++TF_LDFLAGS		+=	$(call ld_option, --no-warn-rwx-segments)
++TF_LDFLAGS		+=	-O1
+ TF_LDFLAGS		+=	--gc-sections
+ # ld.lld doesn't recognize the errata flags,
+ # therefore don't add those in that case
+-- 
+2.30.2
+
diff --git a/boot/arm-trusted-firmware/v2.6/0001-feat-build-add-support-for-new-binutils-versions.patch b/boot/arm-trusted-firmware/v2.6/0001-feat-build-add-support-for-new-binutils-versions.patch
new file mode 100644
index 0000000000..9b5a9dba97
--- /dev/null
+++ b/boot/arm-trusted-firmware/v2.6/0001-feat-build-add-support-for-new-binutils-versions.patch
@@ -0,0 +1,62 @@
+From 0f75b03c008eacb9818af3a56dc088e72a623d17 Mon Sep 17 00:00:00 2001
+From: Marco Felsch <m.felsch@pengutronix.de>
+Date: Wed, 9 Nov 2022 12:59:09 +0100
+Subject: [PATCH] feat(build): add support for new binutils versions
+
+Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
+of a new warning when linking the bl*.elf in the form:
+
+  ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
+  ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
+  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
+  ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
+
+These new warnings are enbaled by default to secure elf binaries:
+ - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
+ - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
+
+Fix it in a similar way to what the Linux kernel does, see:
+https://lore.kernel.org/all/20220810222442.2296651-1-ndesaulniers@google.com/
+
+Following the reasoning there, we set "-z noexecstack" for all linkers
+(although LLVM's LLD defaults to it) and optional add
+--no-warn-rwx-segments since this a ld.bfd related.
+
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+[Retrieved and rebased from
+https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c]
+Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
+Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
+Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
+---
+ Makefile | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 1ddb7b844..470956b19 100644
+--- a/Makefile
++++ b/Makefile
+@@ -416,6 +416,8 @@ endif
+ 
+ GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
+ 
++TF_LDFLAGS		+=	-z noexecstack
++
+ # LD = armlink
+ ifneq ($(findstring armlink,$(notdir $(LD))),)
+ TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
+@@ -442,7 +444,10 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
+ 
+ # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
+ else
+-TF_LDFLAGS		+=	--fatal-warnings -O1
++# With ld.bfd version 2.39 and newer new warnings are added. Skip those since we
++# are not loaded by a elf loader.
++TF_LDFLAGS		+=	$(call ld_option, --no-warn-rwx-segments)
++TF_LDFLAGS		+=	-O1
+ TF_LDFLAGS		+=	--gc-sections
+ # ld.lld doesn't recognize the errata flags,
+ # therefore don't add those in that case
+-- 
+2.30.2
+
diff --git a/boot/arm-trusted-firmware/v2.7/0001-feat-build-add-support-for-new-binutils-versions.patch b/boot/arm-trusted-firmware/v2.7/0001-feat-build-add-support-for-new-binutils-versions.patch
new file mode 100644
index 0000000000..9b5a9dba97
--- /dev/null
+++ b/boot/arm-trusted-firmware/v2.7/0001-feat-build-add-support-for-new-binutils-versions.patch
@@ -0,0 +1,62 @@
+From 0f75b03c008eacb9818af3a56dc088e72a623d17 Mon Sep 17 00:00:00 2001
+From: Marco Felsch <m.felsch@pengutronix.de>
+Date: Wed, 9 Nov 2022 12:59:09 +0100
+Subject: [PATCH] feat(build): add support for new binutils versions
+
+Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
+of a new warning when linking the bl*.elf in the form:
+
+  ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
+  ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
+  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
+  ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
+
+These new warnings are enbaled by default to secure elf binaries:
+ - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
+ - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
+
+Fix it in a similar way to what the Linux kernel does, see:
+https://lore.kernel.org/all/20220810222442.2296651-1-ndesaulniers@google.com/
+
+Following the reasoning there, we set "-z noexecstack" for all linkers
+(although LLVM's LLD defaults to it) and optional add
+--no-warn-rwx-segments since this a ld.bfd related.
+
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+[Retrieved and rebased from
+https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c]
+Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
+Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
+Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
+---
+ Makefile | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 1ddb7b844..470956b19 100644
+--- a/Makefile
++++ b/Makefile
+@@ -416,6 +416,8 @@ endif
+ 
+ GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
+ 
++TF_LDFLAGS		+=	-z noexecstack
++
+ # LD = armlink
+ ifneq ($(findstring armlink,$(notdir $(LD))),)
+ TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
+@@ -442,7 +444,10 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
+ 
+ # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
+ else
+-TF_LDFLAGS		+=	--fatal-warnings -O1
++# With ld.bfd version 2.39 and newer new warnings are added. Skip those since we
++# are not loaded by a elf loader.
++TF_LDFLAGS		+=	$(call ld_option, --no-warn-rwx-segments)
++TF_LDFLAGS		+=	-O1
+ TF_LDFLAGS		+=	--gc-sections
+ # ld.lld doesn't recognize the errata flags,
+ # therefore don't add those in that case
+-- 
+2.30.2
+
diff --git a/boot/arm-trusted-firmware/v2.8/0001-feat-build-add-support-for-new-binutils-versions.patch b/boot/arm-trusted-firmware/v2.8/0001-feat-build-add-support-for-new-binutils-versions.patch
new file mode 100644
index 0000000000..9b5a9dba97
--- /dev/null
+++ b/boot/arm-trusted-firmware/v2.8/0001-feat-build-add-support-for-new-binutils-versions.patch
@@ -0,0 +1,62 @@
+From 0f75b03c008eacb9818af3a56dc088e72a623d17 Mon Sep 17 00:00:00 2001
+From: Marco Felsch <m.felsch@pengutronix.de>
+Date: Wed, 9 Nov 2022 12:59:09 +0100
+Subject: [PATCH] feat(build): add support for new binutils versions
+
+Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
+of a new warning when linking the bl*.elf in the form:
+
+  ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
+  ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
+  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
+  ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
+
+These new warnings are enbaled by default to secure elf binaries:
+ - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
+ - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
+
+Fix it in a similar way to what the Linux kernel does, see:
+https://lore.kernel.org/all/20220810222442.2296651-1-ndesaulniers@google.com/
+
+Following the reasoning there, we set "-z noexecstack" for all linkers
+(although LLVM's LLD defaults to it) and optional add
+--no-warn-rwx-segments since this a ld.bfd related.
+
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+[Retrieved and rebased from
+https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c]
+Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
+Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
+Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
+---
+ Makefile | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 1ddb7b844..470956b19 100644
+--- a/Makefile
++++ b/Makefile
+@@ -416,6 +416,8 @@ endif
+ 
+ GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
+ 
++TF_LDFLAGS		+=	-z noexecstack
++
+ # LD = armlink
+ ifneq ($(findstring armlink,$(notdir $(LD))),)
+ TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
+@@ -442,7 +444,10 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
+ 
+ # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
+ else
+-TF_LDFLAGS		+=	--fatal-warnings -O1
++# With ld.bfd version 2.39 and newer new warnings are added. Skip those since we
++# are not loaded by a elf loader.
++TF_LDFLAGS		+=	$(call ld_option, --no-warn-rwx-segments)
++TF_LDFLAGS		+=	-O1
+ TF_LDFLAGS		+=	--gc-sections
+ # ld.lld doesn't recognize the errata flags,
+ # therefore don't add those in that case
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
