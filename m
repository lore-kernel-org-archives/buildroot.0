Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EEEC46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 22:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5062583EE4;
	Sat,  6 Jan 2024 22:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5062583EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pEI64r_LlkB1; Sat,  6 Jan 2024 22:05:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A576283E0F;
	Sat,  6 Jan 2024 22:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A576283E0F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 213201BF391
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 22:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE7CB60B74
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 22:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE7CB60B74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KjzZ1jhzAfG4 for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 22:05:38 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9883260B0F
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 22:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9883260B0F
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40d89446895so3697625e9.0
 for <buildroot@buildroot.org>; Sat, 06 Jan 2024 14:05:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704578735; x=1705183535;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K/SPxIYR3ej9l7XxyX4Bt2tXVY7nO59eiL1bEH519KE=;
 b=sIAwlbJ5jA+ld5xiEz119NltNnboWtz8WxCU9GZYjGNWh/7ejJ2ZYejJXb4yyJPbYN
 4BnwkUlCKt77Kpo0sbqv/YFn7s1A9yfRrfqyOjx7ZuZ8LjqA3F0zPRlXrqhj0NRWKnQc
 l93dW9vfCE90MPQlqUW3zBXxRcWJrL93ZD+8s413WdIT6Y6XW6MHFCWgosd92jilBuJg
 ASFGsqecNTYFT/yktnOuE7e7wSN6kRYfRbBYXtvYUDs+bCOc0kMlTcWimyRfD01QlRm7
 mCot7mTY5f1yNKUyzw5G1VRv/KheOb4U+RhqkGO6W3KdvPx/NEGnhMaB9fxVOTrGL3TX
 80Nw==
X-Gm-Message-State: AOJu0YyotzZy4jBq+DHWbm+C2ivDDep8EKAfr0DZG4yaumLpBplzS7jB
 dGRP00NtLYxoCzcbJDvE8RZrjvmMjxA=
X-Google-Smtp-Source: AGHT+IFXlDjPjx9qQxWKKjy0JfYSLkLwGWDbl4O/kLE48tiAGfIOrag/PA+3knQEo4Vk/DiOiph6gg==
X-Received: by 2002:a05:600c:2907:b0:40d:81bd:9d12 with SMTP id
 i7-20020a05600c290700b0040d81bd9d12mr676284wmd.147.1704578734501; 
 Sat, 06 Jan 2024 14:05:34 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b0040c11fbe581sm5783692wmq.27.2024.01.06.14.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 14:05:34 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jan 2024 23:05:31 +0100
Message-ID: <20240106220531.3285689-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704578735; x=1705183535; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K/SPxIYR3ej9l7XxyX4Bt2tXVY7nO59eiL1bEH519KE=;
 b=WsD6QazeGqrxKi7T9MUgAhAXXr8zqrECTLQ41UXmcbhNc4DJ2vXzDWDItUwn3Gi4MJ
 EVkaV++Ktp7jLHyBMfAw4kUQ296H/uMQlJE7Cp4oubTFvQtu6bHfUvCOLfMmFXeclkUB
 FTk+ZMTjazlx1ksC4DcYgm5FNNBtRtJl1QjLvJis89ayiblwHv7jT45bCgAIzIc1dQ+M
 O5aQZ2IBT1NzJ53OEyKgbh6yIJDvClNbu/0vLvQ8UEQNfWYjUdbUKxSnJkagRqvjX7pt
 +CEZHJFESWr0HjDrIuXEk0R6XSaWW/gjvxeJDJhVDuNiiA2cN/A6w3MCeFUDRS8a8w+5
 CYFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WsD6Qaze
Subject: [Buildroot] [PATCH 1/1] package/libutempter: fix dependencies
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 02c818bc5c7a6967a212f12e4caa8ccdfa0b452b forgot to add
dependencies resulting in the following static build failure:

/home/autobuild/autobuild/instance-5/output-1/host/bin/arm-buildroot-linux-uclibcgnueabi-gcc -Wl,-z,relro -Wl,-stats  -static  -shared \
	-Wl,-soname,libutempter.so.0,--version-script=libutempter.map,-z,defs \
	-lc iface.os -o libutempter.so
/home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/12.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/autobuild/autobuild/instance-5/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/lib/libc.a(__uClibc_main.os): in function `__uClibc_fini':
__uClibc_main.c:(.text+0x190): undefined reference to `__fini_array_start'

Fixes:
 - http://autobuild.buildroot.org/results/781ab393455f0e6823b850f474f6fe38b27d8efa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libutempter/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libutempter/Config.in b/package/libutempter/Config.in
index a06a240418..5b79c1e44d 100644
--- a/package/libutempter/Config.in
+++ b/package/libutempter/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBUTEMPTER
 	bool "libutempter"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
+	depends on !BR2_STATIC_LIBS
 	help
 	  The libutempter library provides interface for terminal
 	  emulators such as screen and xterm to record user
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
