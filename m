Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41F0606C90A
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WcGGQk6G;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y+jdhgN3
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8523B6078E;
	Wed,  4 Nov 2026 21:32:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yToH5-etEHZy; Wed,  4 Nov 2026 21:32:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2A448607B4
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793827953;
	b=CUbi1twtNomSFzNf8kyHCwiD71GlQuAiDbqB5WzhcMqW/3hggEbMGRuDgpthQ69QymyE
	 M4Vp1xFKlUKIhsfkOtZkwwzEiY/6++3Qr57qUx4cWYObqW5bUEr77ijKNmVqX8fqO3a0M
	 kZPMq171GlmoHmr9Unfo9wS05DH1kCAbkjINTfxuZs6arZhl4vtcI2Qg42zNq1pIwQrAG
	 VogCA1pZvFf4nMcmTt38hlFVW2bMs3yNY+h1UAk5qNxw92MF3ZULeULHGiZn3tM/aDym3
	 eQ6Cvx4myOt8p1BhUAs+fsInfyHw0i3nl7nfv1wecdCkcfoVVuvPZONPYJcTMl33wqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793827953;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Wn/nna9LFAV+r91mr+JtscieUbPlGDp74fi4qr4O14M=;
	b=gvK1daSEpYYIyaj/Gp9wmJ5+8v5kvqGmSynUcSvvGvWslT5rdb172yJIzGm6wobvv7Za
	 wXsskA2Kg3PtsrjqsyjoA11PphaaGkNcGMPvv+OPvqpXWe7Pby1ipLCAZ55SZzYRMtipl
	 8fvZotKGWdbNWWVGFy7gQwQcIKypcPVSPAUPIlLoMdebJBHsJZvUkrXBSrZT5tXMcLa+T
	 At/wizCwpRG1mzsObsIijKdhL3jutcjeic5iu7XR0AwPqumHRusPP67lEMmVB9PKqtG7l
	 qfq31FroVC2rftMLw+DGE7GYaI6NGzlilrRafbAy6gBtURw8B3lmhfy+z3pwygbfLSQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793827953;
	bh=Wn/nna9LFAV+r91mr+JtscieUbPlGDp74fi4qr4O14M=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WcGGQk6Gyru8LfOTnEOAzCCXiGRejsF6PA2qy1sU2hO68dJFMTh4PwyduErm1ypj4
	 3WQVWD4CJ81oraJRFD3jlvKBkwMA1FU2g+FIzkII8whase4dyfqsJiqnKlbGIpfmGT
	 t3UUy/PCHx3qSlUFJZQ3za9IP7xJPukzcnODvoBgzKqhO3cbmNibOty0vqaOwLQbDZ
	 2SOwQfb/PlEEXkdJ4iNCSkl5s+z5l00eI0lgCTzXErYM10wgoXkvfhU+HqGmWAmWjj
	 xJqR4+iqaRbOeTieRzrey2QGgXimA3B6awY2oskRFFEg8ymRzVL5bRe0++u7b6hrYY
	 hYyqMyuFWEdug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A448607B4;
	Wed,  4 Nov 2026 21:32:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15E5A362
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0782F811FE
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0p03IfcFggOp for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:32:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8A3CB811F7
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Y+jdhgN3
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A3CB811F7
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:32:28 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a20bde60a0so10612765e9.3
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 13:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793827947; x=1794432747; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=cGhEwfbzU4W6WTMejdx55v7ETaRIzvnFY225oWDCWPs=;
 b=Y+jdhgN3+22LKHuvA5K8a3aW0HXWXx4+ztK5OAQ1NjzpJONyNjMR2zFNCEkFyIHFZi
 zJn3zTe4O0FMFlinwIgFNAYWMSpqn7JzwUpa9xnaIUO9AsnAuXutcgbI5LpPSGmvMagt
 4HwWrysHiGeIarnCNJKFUD4UqVsykWKRgMkCHA2Ad2vXHyQBybSRhZBmyzDeNqueYI4o
 4KBFi7eVyJw0XvwhRtMV3srRYqzMYfblYlhRtllgqF/tPUyIbpGQtMHrdnwdrFOsf1Wx
 Lp/S195gVNJnfW8L+ldYiD1ANsLk2YGTxam7FqjmeyoefGuT6H/TG2+LTA552FAKrL6M
 yOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793827947; x=1794432747;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cGhEwfbzU4W6WTMejdx55v7ETaRIzvnFY225oWDCWPs=;
 b=DV915qhlg1AObxm05+T7IHoTAxW5vIHNXQu2E9qwOxrdZjUajZ0r+RDl0xbP9itlsX
 cphuZ622gyff1NeCR6YVnAk73QaamK0V9/xurprpMa9kY1/wD6dPAl4L82+2mQZDO5LS
 aBducrXJE2437Pdvg9zxzCJnT0+/2VFffMVs4LnoXYMyyuJK9rihxz6DahG+GEMx6snr
 1W24VitPYIxghwO8jlSYJeGYVSkaPBhP6z9NuI9VB7asFi3JfhBa/xhBuuE4FOEoViYU
 Vv9jG/6KCnVGw30S2tqIMBItlmc2P+wmandMyU2xB3dNJNMwrLLumBywGs40M9vpyxAL
 IJlQ==
X-Gm-Message-State: APuU4Z+xqcf2dfYCg4Ilc6j7TmdfYCm3WJXBI1HVjWRulweq4G7Iz2iE
 vhMhPC9AdV1KWdn8TsVM3kj24ev6r/7p1l1uyB3y2yHPK85o52P96zEXBcZ0bw==
X-Gm-Gg: AYBFou04JXeQG3Cxf4pGo4G7C1kg2b8m9w0GpLkyxPh0e19B++2y/Y3kJDzoqukleX8
 vmaF6nnvQ6amAgq7KqHTY1PxaR9RqM1X9vSltLbOBPS8nsb5e3AEG8FkyC7IYNt3WIpVk2UjbOC
 lFcWksbHjz3AmIZP9TZRFVlXvbRhdb8eQWffqRBSH4NDmwC4K8t/OBQTol8AA6PMv6IF4yJnne2
 /m5JTxDAGXa2Mq9z/cq1GxoYWJkJ+fAiAcnWX1nhG0yyh2FVqnhqyphlhvfQqzj1j+CemY++pvx
 Ci9Hc970bctaHWEDb81Ro2EUTvP3mPDjTFl5Ium+56hRvsMe98Jfg8FMXfqHM9a2CbUcIXmiNpl
 qDOih8VT5wtyGVpBBS899KhW5I/2OKUTKMYT2gZme22WQSfbMp8OmBFCHLd+EgODYqPROrrv/0e
 gUXfeHtaBX1exSRt9p3PJ/IxLEipvuFyj4+Nex0dwlXR62QowCT/8SwIMFReeuna8ggRXL6uR/7
 t+m2JzfuNozkq4278zKK7a8pb0hTWsDG7F/Wm4Qx0yaogT8TxLJri5l/Ti895hL4hWH2Vb2IeVy
 7g3GAur6N6joIYlSTRMUdbgYn8Z/GISQtYzV+jbX7MfUVbzYcJx3ZA==
X-Received: by 2002:a05:600c:5397:b0:4a1:dfaf:f465 with SMTP id
 5b1f17b1804b1-4ac15584cd0mr379062105e9.4.1793827946669; 
 Wed, 04 Nov 2026 13:32:26 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b56f5e65c8sm12526835e9.12.2026.11.04.13.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 13:32:26 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed,  4 Nov 2026 22:32:24 +0100
Message-Id: <20261104213224.3655521-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] linux: bump CIP kernel to version 6.12.114-cip34
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move the CIP SLTS option from the 5.10 series to 6.12, the latest CIP
SLTS kernel.

CIP does not provide a separate real-time kernel for its 6.12 SLTS
series, as PREEMPT_RT is part of mainline Linux since 6.12: the CIP RT
releases stop at the 6.1 and 5.10 series. So remove the CIP RT option,
and point its users to the CIP kernel with CONFIG_PREEMPT_RT enabled.
The microblaze build fix only applied to the CIP RT kernel and goes
away with it.

Linux supports loongarch64 since 5.19, so the CIP option no longer
needs to exclude it.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 Config.in.legacy                              | 10 +++++
 ...-arch-microblaze-mm-init.c-fix-build.patch | 37 -------------------
 linux/5.10.254-cip72-rt32/linux.hash          |  1 -
 linux/{5.10.254-cip72 => 6.12.114-cip34}      |  0
 linux/Config.ext.in                           |  1 -
 linux/Config.in                               | 28 ++++----------
 linux/before-6.17/linux.hash                  |  3 +-
 linux/linux.mk                                |  2 +-
 package/linux-headers/5.10.254-cip72-rt32     |  1 -
 .../{5.10.254-cip72 => 6.12.114-cip34}        |  0
 package/linux-headers/linux-headers.mk        |  2 +-
 11 files changed, 20 insertions(+), 65 deletions(-)
 delete mode 100644 linux/5.10.254-cip72-rt32/0001-arch-microblaze-mm-init.c-fix-build.patch
 delete mode 120000 linux/5.10.254-cip72-rt32/linux.hash
 rename linux/{5.10.254-cip72 => 6.12.114-cip34} (100%)
 delete mode 120000 package/linux-headers/5.10.254-cip72-rt32
 rename package/linux-headers/{5.10.254-cip72 => 6.12.114-cip34} (100%)

diff --git a/Config.in.legacy b/Config.in.legacy
index a238369785..970b587a94 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,16 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	bool "Latest CIP RT SLTS version has been removed"
+	select BR2_LEGACY
+	help
+	  The CIP RT SLTS kernel option has been removed. CIP does not
+	  provide a separate real-time kernel for its 6.12 SLTS series,
+	  as PREEMPT_RT is part of mainline Linux since 6.12. Use the
+	  latest CIP SLTS version and enable CONFIG_PREEMPT_RT in the
+	  kernel configuration instead.
+
 config BR2_PACKAGE_HTPDATE
 	bool "htpdate has been removed"
 	select BR2_LEGACY
diff --git a/linux/5.10.254-cip72-rt32/0001-arch-microblaze-mm-init.c-fix-build.patch b/linux/5.10.254-cip72-rt32/0001-arch-microblaze-mm-init.c-fix-build.patch
deleted file mode 100644
index d1124f4cda..0000000000
--- a/linux/5.10.254-cip72-rt32/0001-arch-microblaze-mm-init.c-fix-build.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 1fc03e1fdc8bb606d1c95e9fa557a9e5f6df17ec Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 25 Feb 2023 17:26:56 +0100
-Subject: [PATCH] arch/microblaze/mm/init.c: fix build
-
-Fix the following build failure on microblaze raised since
-https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git/commit/arch/microblaze/mm/init.c?h=v5.10.168-cip27-rt11&id=32ac92b5a39e2ef91308929bf5ed0804094b4183:
-
-arch/microblaze/mm/init.c:71:2: error: #endif without #if
-   71 | #endif /* CONFIG_HIGHMEM */
-      |  ^~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/27291870cf7539d26e45c45f34322d24a6dbca33
-
-Upstream: sent to Sebastian Andrzej Siewior <bigeasy@linutronix.de>
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- arch/microblaze/mm/init.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
-index 1f4b5b34e600..a444778e59de 100644
---- a/arch/microblaze/mm/init.c
-+++ b/arch/microblaze/mm/init.c
-@@ -49,6 +49,7 @@ unsigned long lowmem_size;
- EXPORT_SYMBOL(min_low_pfn);
- EXPORT_SYMBOL(max_low_pfn);
- 
-+#ifdef CONFIG_HIGHMEM
- static void __init highmem_init(void)
- {
- 	pr_debug("%x\n", (u32)PKMAP_BASE);
--- 
-2.39.1
-
diff --git a/linux/5.10.254-cip72-rt32/linux.hash b/linux/5.10.254-cip72-rt32/linux.hash
deleted file mode 120000
index cde5626c0a..0000000000
--- a/linux/5.10.254-cip72-rt32/linux.hash
+++ /dev/null
@@ -1 +0,0 @@
-../before-6.17/linux.hash
\ No newline at end of file
diff --git a/linux/5.10.254-cip72 b/linux/6.12.114-cip34
similarity index 100%
rename from linux/5.10.254-cip72
rename to linux/6.12.114-cip34
diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 3b72d3cf60..f598326121 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -50,7 +50,6 @@ config BR2_LINUX_KERNEL_EXT_RTAI
 	bool "RTAI Real-time patch"
 	depends on !BR2_LINUX_KERNEL_LATEST_VERSION
 	depends on !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	depends on !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	select BR2_PACKAGE_RTAI
 	help
 	  RTAI Kernel part.
diff --git a/linux/Config.in b/linux/Config.in
index ebd4287e48..4991eb7cba 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -74,10 +74,8 @@ config BR2_LINUX_KERNEL_LATEST_5_10
 	select BR2_LINUX_KERNEL_LATEST_SERIES
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (5.10.254-cip72)"
-	# Support was introduced in Linux 5.19
-	depends on !BR2_loongarch64
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest CIP SLTS version (6.12.114-cip34)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12 if BR2_KERNEL_HEADERS_AS_KERNEL
 	select BR2_LINUX_KERNEL_LATEST_SERIES
 	help
 	  CIP launched in the spring of 2016 to address the needs of
@@ -91,23 +89,12 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  implementation of software building blocks that meet
 	  these requirements.
 
-	  The CIP community plans to maintain 5.10 for security and
+	  The CIP community plans to maintain 6.12 for security and
 	  bug fixes for more than 10 years.
 
-	  https://www.cip-project.org
-
-config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (5.10.254-cip72-rt32)"
-	# Support was introduced in Linux 5.19
-	depends on !BR2_loongarch64
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
-	select BR2_LINUX_KERNEL_LATEST_SERIES
-	help
-	  Same as the CIP version, but this is the PREEMPT_RT realtime
-	  variant.
-
-	  The CIP community plans to maintain 5.10 for security and
-	  bug fixes for more than 10 years.
+	  CIP does not provide a separate real-time kernel for 6.12:
+	  PREEMPT_RT is part of mainline Linux since 6.12, enable
+	  CONFIG_PREEMPT_RT in the kernel configuration to use it.
 
 	  https://www.cip-project.org
 
@@ -189,8 +176,7 @@ config BR2_LINUX_KERNEL_VERSION
 	default "6.1.191" if BR2_LINUX_KERNEL_LATEST_6_1
 	default "5.15.224" if BR2_LINUX_KERNEL_LATEST_5_15
 	default "5.10.273" if BR2_LINUX_KERNEL_LATEST_5_10
-	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "6.12.114-cip34" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index eb8307fe8f..1dfc00d6df 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -6,8 +6,7 @@ sha256  02f15b77d213e15607923832ef9382e2414ea90df6c007f15a910e139645c35d  linux-
 sha256  2757f8ad099cf77499ebab0896b5d31a467b74d5bb18c32b62da059d33b30711  linux-5.15.224.tar.xz
 sha256  02ec2bcda2f6227fa69fd7a4e8cc04e6e948c9120932880663c6215b4632979d  linux-5.10.273.tar.xz
 # Locally computed
-sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
-sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
+sha256  c4c21ee6722dd5d6a199099e5e68e2f0ef002c34e6e23ac0aa7ce92ba7710a8d  linux-cip-6.12.114-cip34.tar.gz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/linux/linux.mk b/linux/linux.mk
index 75294cff18..49325a3a07 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -29,7 +29,7 @@ LINUX_SITE_METHOD = hg
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_SVN),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_SITE_METHOD = svn
-else ifeq ($(BR2_LINUX_KERNEL_LATEST_CIP_VERSION)$(BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION),y)
+else ifeq ($(BR2_LINUX_KERNEL_LATEST_CIP_VERSION),y)
 LINUX_SOURCE = linux-cip-$(LINUX_VERSION).tar.gz
 LINUX_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git/snapshot
 else ifneq ($(findstring -rc,$(LINUX_VERSION)),)
diff --git a/package/linux-headers/5.10.254-cip72-rt32 b/package/linux-headers/5.10.254-cip72-rt32
deleted file mode 120000
index 6bdea03c2e..0000000000
--- a/package/linux-headers/5.10.254-cip72-rt32
+++ /dev/null
@@ -1 +0,0 @@
-../../linux/before-6.17
\ No newline at end of file
diff --git a/package/linux-headers/5.10.254-cip72 b/package/linux-headers/6.12.114-cip34
similarity index 100%
rename from package/linux-headers/5.10.254-cip72
rename to package/linux-headers/6.12.114-cip34
diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index ed37410ea6..4e697a96ac 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -17,7 +17,7 @@ LINUX_HEADERS_CUSTOM_SVN = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_SVN))
 LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 LINUX_HEADERS_CUSTOM_TARBALL_LOCATION = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
 LINUX_HEADERS_REPO_URL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
-LINUX_HEADERS_CIP = $(BR2_LINUX_KERNEL_LATEST_CIP_VERSION)$(BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION)
+LINUX_HEADERS_CIP = $(BR2_LINUX_KERNEL_LATEST_CIP_VERSION)
 ifneq ($(LINUX_HEADERS_OVERRIDE_SRCDIR),)
 $(error LINUX_HEADERS_OVERRIDE_SRCDIR must not be set when BR2_KERNEL_HEADERS_AS_KERNEL=y)
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
