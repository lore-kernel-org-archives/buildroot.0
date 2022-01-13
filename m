Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0940FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 18:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99F116FC4E;
	Thu, 13 Jan 2022 18:08:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z8Mqfv0emng6; Thu, 13 Jan 2022 18:08:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D896860D9C;
	Thu, 13 Jan 2022 18:08:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2DC741BF4D8
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 18:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C9BE84BBA
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 18:08:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n0fsyvMyC0AF for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 18:08:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33A3883F51
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 18:08:11 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 ay4-20020a05600c1e0400b0034a81a94607so3297563wmb.1
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 10:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cJEtC7w+ireuJuhCGvU1G8vLfkNcVOs33FtsB8ItVDk=;
 b=oyoagGseL987HEbIgwhOnSA/CORnLTKwgW23gz/FSreovLqt+t2bGciY7ANIiQCES5
 eYtPRzG2EEsGvq75JrFTEAKSeIRFAFUxV8mci+mFXazgC7YT1ekqqvVlVa07uQQbxlvE
 89Q1K3FB6vy4idUvqnp9JR56JbjaYenlUDVAQX4tGldHv5wp4zhT3Ns49wC1fIUMaVPZ
 2FnCpLu1ZRuudYXrMqdOrifrNLnV/ZfVItNX3kYYNjFZKvBzDtReKQd0oaVmdzmjEd2A
 2/b2i/YV2QH3iHwStLzg3YcgBO6hEuAZ5XXrPwWyjvVrclXwkFv9qhRmd/e2+XK2eFPs
 BCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cJEtC7w+ireuJuhCGvU1G8vLfkNcVOs33FtsB8ItVDk=;
 b=cXd+/BXlBZ8Bxe3MkDl20+RhNuCrS0zPZ7NORp8q8oTptr5PlMdipukt9jMbVvuvc/
 IlO3rTbWg2eqTeYSdpimsyQAy1frMuTmQ66jmSv99lmV286LQvfuIKxS8qfVmdiWob37
 Wf2OTSlooE9SZ/cnw4JtV5Nyaeppr2AsmsUfK32/P63aLg3/mLCbNr9pYtlIdHsC7gl+
 q6Dxze7MpbE/onXh//yUDvAXYjBf1cXtc6SThM8AQWpf9g/QYgsrISdhHj+YiHR7w34N
 LCLDziSrd7tkJ8yjaMQ1TKxkmikcaPcNmoNbDKn2XcrMEfQWRzt56jxXs0ZBWdyV5vb+
 oWKw==
X-Gm-Message-State: AOAM530L60hqLAUlYNzR9TCPRvjf+8bYSVDzZKDdcG1ECZKDvU8MLUCN
 ILn6elB/zG1ESVaIdIaP5/Zs4f8SVnI=
X-Google-Smtp-Source: ABdhPJz6M6QlqmY1yKZBVa4LPFEiqN7Mfp/ixPidENryiEqgUbSRrPuS5J56YwU9JA/0coF1Z6dz5g==
X-Received: by 2002:a1c:7415:: with SMTP id p21mr5077772wmc.114.1642097289155; 
 Thu, 13 Jan 2022 10:08:09 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id k23sm2964316wmr.36.2022.01.13.10.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 10:08:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 19:05:18 +0100
Message-Id: <20220113180518.232197-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/btrfs-progs: fix build with kernel
 < 5.11
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with kernel < 5.11 raised since commit
f363bc2958812539cf248f6cf44fe519445adf7a:

/tmp/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/9.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: kernel-shared/volumes.o: in function `create_chunk':
volumes.c:(.text+0x17f8): undefined reference to `__ALIGN_KERNEL'

Fixes:
 - http://autobuild.buildroot.org/results/b630dbd078656a974c6ac9645b2e87279ef2adc0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ocal-definition-for-alignment-macros.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/btrfs-progs/0003-btrfs-progs-kerncompat-add-local-definition-for-alignment-macros.patch

diff --git a/package/btrfs-progs/0003-btrfs-progs-kerncompat-add-local-definition-for-alignment-macros.patch b/package/btrfs-progs/0003-btrfs-progs-kerncompat-add-local-definition-for-alignment-macros.patch
new file mode 100644
index 0000000000..86c63edc30
--- /dev/null
+++ b/package/btrfs-progs/0003-btrfs-progs-kerncompat-add-local-definition-for-alignment-macros.patch
@@ -0,0 +1,46 @@
+From b0cfe12c4d4b8b4ef335cdf4ddefcbdcd1b70d58 Mon Sep 17 00:00:00 2001
+From: David Sterba <dsterba@suse.com>
+Date: Thu, 13 Jan 2022 14:47:08 +0100
+Subject: [PATCH] btrfs-progs: kerncompat: add local definition for alignment
+ macros
+
+There's still problem left with compilation on musl and kernel < 5.11,
+because __ALIGN_KERNEL is not defined anymore:
+
+../bin/ld: kernel-shared/volumes.o: in function `create_chunk':
+volumes.c:(.text+0x17f8): undefined reference to `__ALIGN_KERNEL'
+
+Due to the entangled includes and unconditional definition of
+__ALIGN_KERNEL, we can't use #ifdef in kerncompat.h to define it
+eventually (as kerncompat.h is the first include). Instead add local
+definitions of the macros and rename them to avoid name clashes.
+
+Pull-request: #433
+Signed-off-by: David Sterba <dsterba@suse.com>
+[Retrieved from:
+https://github.com/kdave/btrfs-progs/commit/b0cfe12c4d4b8b4ef335cdf4ddefcbdcd1b70d58]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ kerncompat.h | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/kerncompat.h b/kerncompat.h
+index 6ca1526e2..f0a6e196e 100644
+--- a/kerncompat.h
++++ b/kerncompat.h
+@@ -359,7 +359,14 @@ do {					\
+ 
+ /* Alignment check */
+ #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) == 0)
+-#define ALIGN(x, a)		__ALIGN_KERNEL((x), (a))
++
++/*
++ * Alignment, copied and renamed from /usr/include/linux/const.h to work around
++ * issues caused by moving the definition in 5.12
++ */
++#define __ALIGN_KERNEL__(x, a)		__ALIGN_KERNEL_MASK__(x, (typeof(x))(a) - 1)
++#define __ALIGN_KERNEL_MASK__(x, mask)	(((x) + (mask)) & ~(mask))
++#define ALIGN(x, a)		__ALIGN_KERNEL__((x), (a))
+ 
+ static inline int is_power_of_2(unsigned long n)
+ {
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
