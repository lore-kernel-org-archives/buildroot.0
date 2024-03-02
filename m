Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB98C54798
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 13:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E290E80F6B;
	Sat,  2 Mar 2024 13:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UAttQTCJOZxV; Sat,  2 Mar 2024 13:00:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0371480F97
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0371480F97;
	Sat,  2 Mar 2024 13:00:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 189E11BF28A
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 13:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05ACB40279
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 13:00:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KFt_OjAwnnJy for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 13:00:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 661C6400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 661C6400D7
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 661C6400D7
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 13:00:17 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-412cad778afso7446235e9.0
 for <buildroot@buildroot.org>; Sat, 02 Mar 2024 05:00:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709384415; x=1709989215;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qG7IkMqWrUP51iqHu6ZZF5Q/QxuwCFttsc5uCuINVx0=;
 b=GNFKS7YKU/1BjZzJofLBBhISY0rzxQntlEERJu0Y7KyeXm+42MFBzyZ3hxZx72RDJB
 L58OD3XXwKVbc3aso+5OrcBHKNR3SDIgNxQLGU8Z329uQNyz8+gz4nt/fKuMSo1zZQvl
 DNztlraZAiUDPrYdPaoaRx6NVF1qpySitMCz07tPCDJj/XQVqDD+fS38B5EbKHmxkeaj
 RoN3uAaVedc52ASVc5FVrt1OQo4UKMYFszvXCNoi0B/lpih0qNDaHorESnMdwyFiZiLE
 6z0jNzbHSsxI7YCKNQVSf2C/xJ9LSraywzDsuUYiNPrah39vkxFUT5O5X3K23ByChYG+
 Heug==
X-Gm-Message-State: AOJu0YwrafelEujl19lA0GYCW2WDQd5n3j0bFI96DFbf+Q2cGExV/Y+y
 IY94S4GQQxQ3rrat/PJRP+H7Eb9V600NyL4Neuyo8PJrzeFSuFszjUP+MZXp
X-Google-Smtp-Source: AGHT+IEDJtyqXMR3PsetaMgwyVRJ6eHT1/iFm6li1KdSTXQUTdOsdsK8sUw2F/vrM8vJ0ewe3e21yA==
X-Received: by 2002:a05:600c:458f:b0:412:bfa1:2139 with SMTP id
 r15-20020a05600c458f00b00412bfa12139mr3322507wmo.37.1709384414621; 
 Sat, 02 Mar 2024 05:00:14 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 hg14-20020a05600c538e00b0041228b2e179sm8504261wmb.39.2024.03.02.05.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Mar 2024 05:00:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Mar 2024 13:59:38 +0100
Message-ID: <20240302125938.790570-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709384415; x=1709989215; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qG7IkMqWrUP51iqHu6ZZF5Q/QxuwCFttsc5uCuINVx0=;
 b=Jrlec7KjwoeAOdti/eCmj9+XLvQSygAckkcAhRBeUZbdb9FOYS5Yv1hGgVVEkT4aeO
 8TybRHaIms3uICcAfWCAWUoZ2NVXZ/3UaGRVDr8NmhGJdwOUCBjFqJf9lLv9PirqZZrr
 Fc6drOo4KWvsR6hKJjWg9DUdBuUFjgkJuu7ctTcig/dmGFMtg+Ppv9Cq9NdRlB4mNnz2
 Zi+jP+z5iddVMev+6Ly8SQStgY1DltGlw30ec9a4A2xKiDK6+GTrdXEWw0aUr+k1DEp+
 hn7OR6B5mKUFTPSjCxhnu5HS9NK9MvxGWJ5BcMRkMy6Ir7LGXrIc8wzXZUivD7A5gxUA
 eEOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Jrlec7Kj
Subject: [Buildroot] [PATCH 1/1] package/strace: musl on aarch64 needs
 headers >= 5.0
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

strace needs headers >= 5.0 and
https://github.com/torvalds/linux/commit/9966a05c7b80f075f2bc7e48dbb108d3f2927234
to avoid the following build failure on musl and aarch64 due to headers
conflict raised at least since bump to version 6.0 in commit
544806bfd8052d05dee671c23c354e5f73f954f9:

In file included from /home/autobuild/autobuild/instance-7/output-1/host/aarch64_be-buildroot-linux-musl/sysroot/usr/include/signal.h:48,
                 from strace.c:17:
/home/autobuild/autobuild/instance-7/output-1/host/aarch64_be-buildroot-linux-musl/sysroot/usr/include/bits/signal.h:18:16: error: redefinition of 'struct sigcontext'
   18 | typedef struct sigcontext {
      |                ^~~~~~~~~~
In file included from /home/autobuild/autobuild/instance-7/output-1/host/aarch64_be-buildroot-linux-musl/sysroot/usr/include/asm/ptrace.h:26,
                 from /home/autobuild/autobuild/instance-7/output-1/host/aarch64_be-buildroot-linux-musl/sysroot/usr/include/linux/ptrace.h:107,
                 from ptrace.h:33,
                 from strace.c:16:
/home/autobuild/autobuild/instance-7/output-1/host/aarch64_be-buildroot-linux-musl/sysroot/usr/include/asm/sigcontext.h:28:8: note: originally defined here
   28 | struct sigcontext {
      |        ^~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/74a480aa76970b36dcd890d9bd7a9df1d49e8e16
 - http://autobuild.buildroot.org/results/79ee8ae5fb9712fd874b56e836eca1b997c50cd9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/strace/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/strace/Config.in b/package/strace/Config.in
index dc245c7297..cace7e129d 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -4,6 +4,10 @@ config BR2_PACKAGE_STRACE
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0 || !BR2_nios2
 	# needs at least kernel headers 5.0 on xtensa
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_xtensa
+	# needs at least kernel headers 5.0 on musl aarch64
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || \
+		!BR2_aarch64 || !BR2_aarch64_be || \
+		!BR2_TOOLCHAIN_USES_MUSL
 	depends on !BR2_RISCV_32
 	help
 	  A useful diagnostic, instructional, and debugging tool.
@@ -22,3 +26,8 @@ comment "strace needs a toolchain w/ headers >= 4.0 on nios2"
 comment "strace needs a toolchain w/ headers >= 5.0 on xtensa"
 	depends on BR2_xtensa
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+
+comment "strace needs a musl toolchain w/ headers >= 5.0 on aarch64"
+	depends on BR2_aarch64 || BR2_aarch64_be
+	depends on BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
