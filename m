Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB6D606A320
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 22:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MPFGMN7S;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WPBLBwyL
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 301FA40654;
	Sat, 21 Nov 2026 22:23:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bue8_eqNQXNS; Sat, 21 Nov 2026 22:23:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 17C22406B0
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795299797;
	b=RVr7zX45L3jlEaZKpeP0if/Q8Tf1x7amIExod8c6HtZs9bvAz3a4AE+IjsH3W5ovcGvk
	 wYStqflNJu58rLy1fCRPBCsXLwVxSN3JTJZoBWuP0ErZvCZV+BDv9xPjvpmTlvy2zslJb
	 LV0kw1w0rrVHTJrsZc5HOP5SrYHuq27lHIGa+tgKlVk+7cPbzJqtytAcqofxYuy0/5ygz
	 Km6X2Y4/IC9/ycyu1HqZRZQ8XOMVg4r4KyPuneNV3KasRftmrVktrFkDO+SWlqBi1UyiD
	 Xcg/Lqp5C4Cv+jt7mesnHv3r84WN7/rGKT550k+3dYRKjF1qeBpDVl4oyRZdRqzVoWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795299797;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=PMdvM+MhMx2knXYjyTcHqYfZiuoXHhn+5Cg8GxjFCGg=;
	b=TX82+3oN6J9NGF5+GYa99SQk6T74+IM/V/74olWMCLI0g8GsQxs+Ya2mxtOy3UlSmIl8
	 CKpeK1WBXhnV2PzGUle7LR/ojmPxKGIE+aBM0ZI8T50xc/GNjHFAOJpfp88EkuuvAqg5G
	 q1g35eU6TsDBoQ1gncbXeEviwqoZ713BQlEMJZYItiVCIWhYAT9ALOrwoedHqAElsm49D
	 G7VoKZgvtiGcBCYUA1t2CWBf/TYFWWP+YqYCd2Hj0S4uCNuZ/WDwo0PsueHlOUiLWAzPg
	 02liKNy3tPVHT8EF8HNsy4G4T3I760kyFQ0Jdp1f3n1Bv9WBMOfi1gi5FnowEAC9XEA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795299797;
	bh=PMdvM+MhMx2knXYjyTcHqYfZiuoXHhn+5Cg8GxjFCGg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MPFGMN7SGESKZ4HQHvpcjFbUeVdtvR4V9V7b6/b6SbRkIpxCZHJkOq1dHdhTvOJ7r
	 Gy1eoAoPeUwl3GATC939/2eauRiTdxB8AEapGLzY/zcLE1GMWzwO9N4wN9opEUo8JQ
	 GnekGrxEpXUR3EtsLf4dZEQ2FoxZjFKqc57YIq+CFdNBhbgn9bgjlLwyH1Y2+75TTq
	 sUTGNe0A2/WTgevmM0/1kDAOt9Vz6+VoXOUiYDL3UcnzK0jXv6j7q3MPzGqQmn8nex
	 1uPdM41E51oxHtUomEuMSkTijFeDv4u3UxkkT9MISMUUNb+B1yk1R475qUa+UD9C/U
	 YTyTDIllaZoYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17C22406B0;
	Sat, 21 Nov 2026 22:23:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F5F6310
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 22:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 612FF80E54
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 22:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aFdkbW2iFGwa for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 22:23:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5997780E52
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=WPBLBwyL
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5997780E52
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 22:23:13 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4bb68c197c7so24903845e9.1
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 14:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795299792; x=1795904592; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GvF4cHSxowrFGFdaInSDXQaJXEIYwAV+w3dNdRF9N7o=;
 b=WPBLBwyLH+BYWM/J//oHdg1ZZw6WGISOl9x6SzH6quRaekRZfly2rVl0EojghRWpk7
 ADDUpcsrZn0YJ3iaoVpfyOgYYpEP2WRf2flsnp6mI/NRXcUpk8jK54jgbPCGseEGDzym
 TJI7dvJTvdBqxfYs/lVRl41JThfnstj+bfx13mkClypXD0HROjV5tNSX+6kjHp3JteSz
 fpEqEKxNZNMh0gm9Jr2IjY+vKRVrI5LX7V9UjoyKhteyuvFHbIU1pkVZHweHqiTOJC2a
 cPXnhc8pdqPHvOSH97DEVelYPL0OZTwynNSiTi5XFZ8Lz+pHZXoxrFY1wzUIbytCvQ+I
 Aw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795299792; x=1795904592;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GvF4cHSxowrFGFdaInSDXQaJXEIYwAV+w3dNdRF9N7o=;
 b=AFuhye6oULlxN3JqyWX0Dvl3evgByW0WHLGLCi4Mip+eRbbjNDDnxNJmc3FLsOs1Y/
 PbdP8H2B5txKomnCdQmCqBg+5/MZoNzWeH4SB//aggW1lZZVwA+Sh4JDNik+ysCQNjna
 SlkMCgbn6P5h+i79GUQCeX6shVl0RCzfe2OI0KAtDHnGlRXbPEiwJ8Whvl4gOMY/YUCr
 n3EMAhGNAJWsc/sJh7mqpv5nWebC8GfRMgvrEsdceOu1+L+TSOQg7fLTyMICnVAhAyeN
 IgpxMZbxTGODSLv2p0pJQyvlPrecNONmA//QXGjNZdf47yaJcuKBKsxfmYyYtwMEhMfR
 vh2w==
X-Gm-Message-State: APuU4Z9YNLHO3N9h5KVr/27IxyaCMnS6AQp74/vInm1qc3eD0/nKu9LR
 dkHTke1Qn6mJY2E6h5Kl1lo76FpaFWN15SFRjd3S7I1tXAdb5uQrPOIcBaq+rzWG
X-Gm-Gg: AZFdTZcwNbVv6sGQwb43la44EQ8fGe9plPE9BcHQTAnvIjxqArFqX5TRulYL7HaS9rs
 XyCgjyRW1svfU8q+Q8u9K9bGpgPf5v6CiBTpUA9SOvbWxkj0MT78gOJURXHV6SVkOgc1WUckxz4
 or20oaZpbFPMBlm8eB3MuIyYICRwwIQ72BEikIHe5t2QK6GfD4rbEqi5Bu+Wd+yPQnQMfwRNXz7
 DFbGIUSemuX+LwkNprwJnx2xc2lX7TJBNp4iDhwRN8wO139AgEXB0Sd5ZF1i/DABVa5IUl2HSZK
 JmrB5Rkhso6FAG3Y8xbSrMHU7vXbPrX/p0BW7iCWcQ07bxBdUq/ABSUL/wvX7bKgobtx34GC7FA
 iRrtHXgBABaXPLAtZIAE/5guSYADy1GXRxPhrZD/rR44/F6KnJS6eqmPR+sxzJzaixsOFJOHGhF
 7Grfyc8cnVHc7CXT9btiKT4iBcZsj9Vtio3InIBDN3Fqh0Th8uWnf7DNa6Dide5w+hyixTbYKfN
 El4yCGRFPBcAN14/jacswKBPF0HTOvk28pr4vtkFdis8FSmo+eWq22HiwB+dMXIJG+xDZFL46iR
 1iwJFegqgwpF8zr4jky35vVuF88ncDHcvS912ujCYSqNQji/1og=
X-Received: by 2002:a05:600d:8449:b0:4bb:8e95:8ce1 with SMTP id
 5b1f17b1804b1-4bb8e958ce4mr82046065e9.23.1795299791978; 
 Sat, 21 Nov 2026 14:23:11 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884b8429sm325310145e9.14.2026.11.21.14.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 14:23:11 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Laurent Badel <laurentbadel@eaton.com>
Date: Sat, 21 Nov 2026 23:23:09 +0100
Message-ID: <20261121222310.213127-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20240206125833.10103-1-laurentbadel@eaton.com>
References: <20240206125833.10103-1-laurentbadel@eaton.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/2] boot/mxs-bootlets: fix build with recent
 toolchains
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The 10.12.01 bootlets no longer build with a current toolchain:

- GCC >= 14 makes implicit function declarations an error:

    src/hw_power_fiq.c:90:9: error: implicit declaration of function 'hw_icoll_SoftTrigger'

  Build in C89 mode, where they are allowed.

- The default stack protector breaks the link, as the bootlets have
  no runtime for it:

    power_prep.c:(.text+0x89c): undefined reference to `__stack_chk_fail'

  Build with -fno-stack-protector.

- The ARM assembler rejects the "#alloc" section flag in
  linux_prep/core/cmdlines.S. Add a patch to use "a" instead.

Pass the compiler flags in CC on the make command line. The bootlets
Makefiles set CC to $(CROSS_COMPILE)gcc and some of them reset CFLAGS,
so a command line CC is the one way to reach all of them.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v2 -> v3:
  - new patch: without it, the 10.12.01 bootlets don't build with
    GCC >= 14, so patch 2/2 can't be tested

 ...rep-use-the-GNU-section-flags-syntax.patch | 33 +++++++++++++++++++
 boot/mxs-bootlets/mxs-bootlets.mk             | 16 +++++----
 2 files changed, 43 insertions(+), 6 deletions(-)
 create mode 100644 boot/mxs-bootlets/0001-linux_prep-use-the-GNU-section-flags-syntax.patch

diff --git a/boot/mxs-bootlets/0001-linux_prep-use-the-GNU-section-flags-syntax.patch b/boot/mxs-bootlets/0001-linux_prep-use-the-GNU-section-flags-syntax.patch
new file mode 100644
index 0000000000..c375601e6a
--- /dev/null
+++ b/boot/mxs-bootlets/0001-linux_prep-use-the-GNU-section-flags-syntax.patch
@@ -0,0 +1,33 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+Date: Sat, 21 Nov 2026 23:10:57 +0100
+Subject: [PATCH] linux_prep: use the GNU section flags syntax
+
+The ARM assembler of current binutils rejects the "#alloc" section flag:
+
+  core/cmdlines.S:17: Error: junk at end of line, first unrecognized character is `#'
+
+Use the "a" flag string instead, which means the same.
+
+Upstream: dead
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+---
+ linux_prep/core/cmdlines.S | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/linux_prep/core/cmdlines.S b/linux_prep/core/cmdlines.S
+index a760fbf..f36960d 100644
+--- a/linux_prep/core/cmdlines.S
++++ b/linux_prep/core/cmdlines.S
+@@ -14,7 +14,7 @@
+ #define CMDLINES_FILE "output-target/command_lines_stripped.txt"
+ #endif
+ 
+-	.section .cmdlines, #alloc
++	.section .cmdlines, "a"
+ 	.globl	cmdlines_start
+ cmdlines_start:
+ 	.incbin	CMDLINES_FILE
+-- 
+2.53.0
+
diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
index adc22767f7..eb396da723 100644
--- a/boot/mxs-bootlets/mxs-bootlets.mk
+++ b/boot/mxs-bootlets/mxs-bootlets.mk
@@ -38,6 +38,13 @@ endif
 MXS_BOOTLETS_DEPENDENCIES = host-elftosb
 MXS_BOOTLETS_LICENSE = GPL-2.0+
 
+# The bootlets need C89 to build with GCC >= 14, and have no stack
+# protector runtime.
+MXS_BOOTLETS_MAKE_OPTS = \
+	BOARD=$(MXS_BOOTLETS_BOARD) \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
+	CC="$(TARGET_CC) -std=gnu89 -fno-stack-protector"
+
 ifeq ($(BR2_TARGET_MXS_BOOTLETS_BAREBOX),y)
 MXS_BOOTLETS_DEPENDENCIES += barebox
 MXS_BOOTLETS_BOOTDESC = barebox$(MXS_BOOTLETS_IVT_SUFFIX).bd
@@ -62,8 +69,7 @@ endif
 
 ifeq ($(BR2_TARGET_MXS_BOOTLETS_LINUX),y)
 define MXS_BOOTLETS_BUILD_LINUX_PREP
-	BOARD=$(MXS_BOOTLETS_BOARD) CROSS_COMPILE="$(TARGET_CROSS)" \
-		$(MAKE1) -C $(@D) linux_prep
+	$(MAKE1) $(MXS_BOOTLETS_MAKE_OPTS) -C $(@D) linux_prep
 endef
 define MXS_BOOTLETS_SED_LINUX
 	sed -i 's,[^ *]linux_prep.*;,\tlinux_prep="$(@D)/linux_prep/output-target/linux_prep";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
@@ -84,10 +90,8 @@ endef
 MXS_BOOTLETS_POST_EXTRACT_HOOKS += MXS_BOOTLETS_INSTALL_BAREBOX_BOOTDESC
 
 define MXS_BOOTLETS_BUILD_CMDS
-	BOARD=$(MXS_BOOTLETS_BOARD) CROSS_COMPILE="$(TARGET_CROSS)" \
-		$(MAKE1) -C $(@D) power_prep
-	BOARD=$(MXS_BOOTLETS_BOARD) CROSS_COMPILE="$(TARGET_CROSS)" \
-		$(MAKE1) -C $(@D) boot_prep
+	$(MAKE1) $(MXS_BOOTLETS_MAKE_OPTS) -C $(@D) power_prep
+	$(MAKE1) $(MXS_BOOTLETS_MAKE_OPTS) -C $(@D) boot_prep
 	$(MXS_BOOTLETS_BUILD_LINUX_PREP)
 	sed -i 's,[^ *]power_prep.*;,\tpower_prep="$(@D)/power_prep/power_prep";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
 	sed -i 's,[^ *]sdram_prep.*;,\tsdram_prep="$(@D)/boot_prep/boot_prep";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
