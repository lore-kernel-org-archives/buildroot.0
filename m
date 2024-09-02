Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C15CD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 18:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED32F4023F;
	Mon,  2 Sep 2024 18:00:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8nz9MLo2nw59; Mon,  2 Sep 2024 18:00:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 993ED40243
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 993ED40243;
	Mon,  2 Sep 2024 18:00:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 248C21BF275
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 18:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1189A4023F
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 18:00:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zY6Ovn0ASq7v for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 18:00:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f34; helo=mail-qv1-xf34.google.com;
 envelope-from=mr.bossman075@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D859640142
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D859640142
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D859640142
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 17:59:59 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-6bd6f2c9d52so22154386d6.3
 for <buildroot@buildroot.org>; Mon, 02 Sep 2024 10:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725299998; x=1725904798;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nGvlIocUnEc0ZRT4+3jTEOF6dJ60Bm63H8IR5fPiXzI=;
 b=WYhII0ICIrIMya+3guX5LB1oV7FrZcFTdr2rGcCvZb7ojHGsMho3tHcak4ySvIlgQ2
 kNkj5IHp/Xfq0wTooXlXENBxJNwc0z2O/BIIpatyDW1YkicclsYj2P5Wm+kyBPnWrM5n
 sfyz1Dr+HxKJpeQM9sm8Q/gAb0qbqGkJQdjICOE5QMqanqP4OmDIAWKkQK9ndmD8ctCF
 NgQsG6N364eYxuFVyxwWS8TUQYivpw27iGRFLNkUueSZHx6R7EB/MCAKGfYJvnouKQqy
 EB3XBMHSjwDmCmFim26k85rm/VdAACUNRFHePrknysnjsmrPvN0XPGYFk3TYBFyd+9Zt
 ysww==
X-Gm-Message-State: AOJu0Yx+Ov8qj+FT5jfU2Qn8RjAY35yK8Ha++jauYpd6bseptTKObhts
 N53DHFg9L+89RxRgZxUdz4RAJjW8ApGdxXmvf+liJFLW7QVQn7v5x5nBSQ==
X-Google-Smtp-Source: AGHT+IGz8AmABwgwkATkZr/aa19oR0Qo7EIQ+dunPuscOpLRGbNwF+4tGYYIK5PbMJjBw2Fz5nIhtw==
X-Received: by 2002:a05:6214:4489:b0:6c3:66f2:a645 with SMTP id
 6a1803df08f44-6c366f2a80amr48999266d6.35.1725299997898; 
 Mon, 02 Sep 2024 10:59:57 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net.
 [108.26.179.17]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c361eacd36sm17695046d6.137.2024.09.02.10.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 10:59:57 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Sep 2024 13:59:56 -0400
Message-ID: <20240902175956.2837858-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725299998; x=1725904798; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nGvlIocUnEc0ZRT4+3jTEOF6dJ60Bm63H8IR5fPiXzI=;
 b=I1yXfTUxfZt7OeZ3tmAypm4QDSW8v7Z30wC3hFd6XBqQzpkWi5DggFohz4PFL4Xd40
 h44riYSzeW52xThK6rQ73dAQkw+hVV4bP54v0bpceQ620tX3Un76/kozcx19NlZiZPYc
 QizV22W7cl848oyzIS68KwmhwMNssVYAjNxiL1ANpjrBeunnERkfi82C1eWrOuhRx8la
 a/JuDcyEH68EG8/HYTY4qfRoosvk3vvzQ8ocPx84GyFUjdRjjE3Lx4qCduJo9pYPL6QN
 MfK7ydOeCGFNtuQYzEj3rvYdzt0IRq4pDWHNBtoHMgattxzCLPrYjB+cc0fH3kreyjfO
 3AVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=I1yXfTUx
Subject: [Buildroot] [PATCH] package/uclibc: Fix build when RVA is disabled
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
Cc: Jesse Taube <Mr.Bossman075@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If the RVA option is disabled uclibc won't build with Shared libraries
enabled or Threads enabled. Add guards against this.

When the RVA option is disabled, the build fails with the
following errors:
With Threads enabled:

  LD libuClibc-1.0.48.so
riscv64-buildroot-linux-uclibc/bin/ld: libc/libc_so.a(err.os): in function `.L0 ':
err.c:(.text+0xa0): undefined reference to `__atomic_compare_exchange_4'
riscv64-buildroot-linux-uclibc/bin/ld: libc/libc_so.a(err.os): in function `.L6':
err.c:(.text+0x138): undefined reference to `__atomic_exchange_4'
riscv64-buildroot-linux-uclibc/bin/ld: libc/libc_so.a(__cxa_finalize.os): in function `.L3':
__cxa_finalize.c:(.text+0xac): undefined reference to `__atomic_compare_exchange_8'
riscv64-buildroot-linux-uclibc/bin/ld: libc/libc_so.a(fork.oS): in function `.L23':
fork.c:(.text+0x130): undefined reference to `__atomic_fetch_add_4'
riscv64-buildroot-linux-uclibc/bin/ld: libc/libc_so.a(sem_timedwait.oS): in function `.L5':
sem_timedwait.c:(.text+0xe0): undefined reference to `__atomic_fetch_add_8'

With Shared libraries enabled:

  LD libuClibc-1.0.48.so
riscv64-buildroot-linux-uclibc/bin/ld: libc/libc_so.a(__cxa_finalize.os): in function `.L3':
__cxa_finalize.c:(.text+0xa4): undefined reference to `__atomic_compare_exchange_8'

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 arch/Config.in           | 2 +-
 package/uclibc/Config.in | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index f39c33ef7f..d0052782be 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -431,7 +431,7 @@ choice
 config BR2_BINFMT_ELF
 	bool "ELF"
 	depends on BR2_USE_MMU
-	select BR2_BINFMT_SUPPORTS_SHARED
+	select BR2_BINFMT_SUPPORTS_SHARED if !BR2_riscv || BR2_RISCV_ISA_RVA
 	help
 	  ELF (Executable and Linkable Format) is a format for libraries
 	  and executables used across different architectures and
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 73ddd5ef58..f7edd417c6 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -78,13 +78,13 @@ choice
 
 config BR2_PTHREADS_NATIVE
 	bool "Native POSIX Threading (NPTL)"
-	depends on BR2_USE_MMU
+	depends on BR2_USE_MMU && (!BR2_riscv || BR2_RISCV_ISA_RVA)
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 config BR2_PTHREADS
 	bool "linuxthreads"
-	depends on !BR2_aarch64 && !BR2_aarch64_be
+	depends on !BR2_aarch64 && !BR2_aarch64_be && (!BR2_riscv || BR2_RISCV_ISA_RVA)
 	select BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PTHREADS_NONE
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
