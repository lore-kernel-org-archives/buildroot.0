Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D238C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 07:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AB5D60E9A;
	Mon,  6 Jun 2022 07:52:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1rNW1WsJ1j8X; Mon,  6 Jun 2022 07:52:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B87E60BF0;
	Mon,  6 Jun 2022 07:52:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5494B1BF30C
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 07:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51F7684123
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 07:52:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iThn6uYEV_-R for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 07:52:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3493E84078
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 07:52:01 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id s68so12281582pgs.10
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 00:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/nTqfE3p2EIs0R1TV/MyiPEdBD7GkYlX+qsOcY1et10=;
 b=nMBhnqXAjjRK2SNjUWh3b92KlC6xpVFH7ykT86+7890LTnd3eJM+lj7Yd213DeFA8v
 M6qCbXHdTm+EkuAbj1kih5lPVuKJ4MZ+T16UJ4Ri+80++YZbMvTF95kgLcLeIGv8SJrz
 a6ENqQ9bgueU3VjZ8BHuLaA3Gs4TRmwthFEE63qC7IUzMwKMV4vT3FMvbTvLy6qSCLpi
 saEsjKzdt50H348NyN7//AZ2zbcOflfVyFlx7mI0gRY2BWcdvKxiwQShztlwfXHS3iNI
 aEqDh0d7Cbin/iKRWKs7jmBrhMyvDJTBFJR47OmQA5t5M3c71qRsgtquImqphNnwI78p
 k7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=/nTqfE3p2EIs0R1TV/MyiPEdBD7GkYlX+qsOcY1et10=;
 b=redp3al+n1pzyDiryBMaeHCc/XKhdkJUpm8d/V9FI2u2wCQCBv65j3HShs554SaL8E
 EImcLwn2qBHS+lYzFKr7kt2hkbRcl10/c8UwMuiEIeyltcNaPRX5aoNoSFiVqvkx5mIC
 0ihPRuWl7ZgAG4f9oXkN5XA8UiNefRpZXtgPLx0Md3O286MUyfSybvZys3azYUy4iB5S
 CqcuF+PrTZjF0fcFtZgjkJ6oZmvOL7JcITaWUfLqPohRsickmoD40TKge2xwnA64EBjo
 drM98GOYUtEiLBVF/IT8cYkQlHQxCiJRA7ILh4dFG1QsIF0TPxrqpi5aHynp5iC1lJ/Q
 cnCA==
X-Gm-Message-State: AOAM5338n/IogNy2GN5/icQzerbSvfbduW6ZdhE684nb9rmG4FBBMNtt
 sWfWD3OeNx/mkHkHZxLSIOoSBp+eHMw=
X-Google-Smtp-Source: ABdhPJwuq5OVCgMKoH7ymAjrOqPazNqxasG+uWXgGdSD4gX4FSJ4rP83S4Zvv3HsupSOqM7Flb917w==
X-Received: by 2002:a63:114:0:b0:3fd:431a:dd77 with SMTP id
 20-20020a630114000000b003fd431add77mr11848768pgb.619.1654501919795; 
 Mon, 06 Jun 2022 00:51:59 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a62a503000000b0050dc7628184sm10298495pfm.94.2022.06.06.00.51.57
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 00:51:59 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org
Date: Mon,  6 Jun 2022 17:21:49 +0930
Message-Id: <20220606075149.1548504-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/diffutils: Fix build on ppc32 with musl
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

 sigsegv.c: In function 'sigsegv_handler':
 sigsegv.c:225:75: error: 'mcontext_t' has no member named 'uc_regs';
 did you mean 'gregs'?

  ((ucontext_t *) ucp)->uc_mcontext.uc_regs->gregs[1]

Musl defines pt_regs differently to glibc. Backport a patch from
upstream gnulib (the source for this file in findutils).

Fixes:

 http://autobuild.buildroot.net/results/1b40146436eb2b3500d0d8faef96b3374f8e5cda/

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 ...ort-for-Linux-PowerPC-32-bit-with-mu.patch | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 package/diffutils/0005-sigsegv-Add-support-for-Linux-PowerPC-32-bit-with-mu.patch

diff --git a/package/diffutils/0005-sigsegv-Add-support-for-Linux-PowerPC-32-bit-with-mu.patch b/package/diffutils/0005-sigsegv-Add-support-for-Linux-PowerPC-32-bit-with-mu.patch
new file mode 100644
index 000000000000..16e0941f6c2a
--- /dev/null
+++ b/package/diffutils/0005-sigsegv-Add-support-for-Linux-PowerPC-32-bit-with-mu.patch
@@ -0,0 +1,58 @@
+From 6f2f006185cdeeda997d19d651379bfc6887e394 Mon Sep 17 00:00:00 2001
+From: Joel Stanley <joel@jms.id.au>
+Date: Mon, 6 Jun 2022 17:14:12 +0930
+Subject: [PATCH] sigsegv: Add support for Linux/PowerPC (32-bit) with musl
+ libc. Reported by Khem Raj <raj.khem@gmail.com> in
+ <https://lists.gnu.org/archive/html/m4-patches/2022-03/msg00000.html>.
+
+* src/sigsegv.c (SIGSEGV_FAULT_STACKPOINTER): In the Linux/PowerPC
+32-bit case, handle musl libc differently.
+* modules/sigsegv (Files): Add m4/musl.m4.
+(configure.ac): Invoke gl_MUSL_LIBC.
+
+Backported from http://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=2d830e4a792fcd9f614ed08a7f18584b8b21d23b
+Signed-off-by: Joel Stanley <joel@jms.id.au>
+---
+ lib/sigsegv.c | 25 +++++++++++++++++++++----
+ 1 file changed, 21 insertions(+), 4 deletions(-)
+
+diff --git a/lib/sigsegv.c b/lib/sigsegv.c
+index da70ffa5fda1..da64d7d0b617 100644
+--- a/lib/sigsegv.c
++++ b/lib/sigsegv.c
+@@ -227,11 +227,28 @@ int libsigsegv_version = LIBSIGSEGV_VERSION;
+ #  if defined __powerpc64__ || defined __powerpc64_elfv2__ /* 64-bit */
+ #   define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.gp_regs[1]
+ #  else /* 32-bit */
+-/* both should be equivalent */
+-#   if 0
+-#    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.regs->gpr[1]
++#   if MUSL_LIBC
++/* musl libc has a different structure of ucontext_t in
++   musl/arch/powerpc/bits/signal.h.  */
++/* The glibc comments say:
++     "Different versions of the kernel have stored the registers on signal
++      delivery at different offsets from the ucontext struct.  Programs should
++      thus use the uc_mcontext.uc_regs pointer to find where the registers are
++      actually stored."  */
++#    if 0
++#     define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.gregs[1]
++#    else
++#     define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_regs->gregs[1]
++#    endif
+ #   else
+-#    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.uc_regs->gregs[1]
++/* Assume the structure of ucontext_t in
++   glibc/sysdeps/unix/sysv/linux/powerpc/sys/ucontext.h.  */
++/* Because of the union, both definitions should be equivalent.  */
++#    if 0
++#     define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.regs->gpr[1]
++#    else
++#     define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.uc_regs->gregs[1]
++#    endif
+ #   endif
+ #  endif
+ 
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
