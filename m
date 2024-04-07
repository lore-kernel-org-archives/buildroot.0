Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E98CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 15:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54CA240286;
	Sun,  7 Apr 2024 15:22:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 79Iz0vCjDPcf; Sun,  7 Apr 2024 15:22:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6AA840738
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6AA840738;
	Sun,  7 Apr 2024 15:22:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 559621BF489
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 429B6608F6
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yF_vkORIue-B for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 15:22:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 14F9A608DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14F9A608DE
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14F9A608DE
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 15:22:00 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-343e7c20686so1723344f8f.1
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 08:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712503318; x=1713108118;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ryPUYSU+GV9+4tY6PI4oPJ6t2PYh9n7MJGJ7gXkn4rU=;
 b=N5ldAYS/7McjvDRwhQ+O+TZbc1Swpf65B7ZO4nUadhQ0Ev4QZAOiVmKtiYY42z7ahg
 mYkttw3kUkIxQXwvk0Dbnbc8XqSXoZrk8T2dO2zdPOr3SpycHQTN5JLr3edwCYRCoHgN
 Jg+2tdYiNPDeI7CjNLRhN7UGoPLmCwJxXKaPSECeHv8z3ejIDvO8AlAx86Rvrvvi24Xn
 f3tBbkY331Oah2IcjiRQjxjUlo9Rs7YGdB0m233E5ENu08Q0Wg79fHNGK3D1S6sC9lT2
 fDyZUrRfpwNlKnm9aWt3iJUv9UW3dmzCW1BF7ONspsi+b4fKEGvvaEYSiObs2J/cEzp7
 qXFg==
X-Gm-Message-State: AOJu0YzOhXmB8UFsukvAb+zttg6XK17sJbtyLB1Hss+o7x2eGD92QS9s
 pgTb7lbmBYMQLhy2padzky0LpG5bKfV4DYS/sBOcbUbQYkU9Pb4uOxdEq8hK
X-Google-Smtp-Source: AGHT+IFe8bQkgoo3ZaI80D8K8UDn4FupQCDbYJAJk1EwWIDv84E5apib3s5oVwIZSt1VzPaMP45GlA==
X-Received: by 2002:adf:ed89:0:b0:341:d811:b573 with SMTP id
 c9-20020adfed89000000b00341d811b573mr4731639wro.23.1712503318050; 
 Sun, 07 Apr 2024 08:21:58 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 i17-20020a05600c355100b0041663c75ef1sm1604683wmq.32.2024.04.07.08.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 08:21:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 17:21:55 +0200
Message-ID: <20240407152155.1913254-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712503318; x=1713108118; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ryPUYSU+GV9+4tY6PI4oPJ6t2PYh9n7MJGJ7gXkn4rU=;
 b=cFmm+zKJlNQ2O0IFw//MIGjuTTaxvgZtD3MWBXbgLPjEr3J8XTcoEgxtkPZP5F3pdg
 6e4/zNDzZOR9YOlvBBOhOfmygPlnnNZ0pAJI92BDAae5hyJNcUCZKf/VgSj4qYUpFfH1
 UA8FisPWudyg3PUjq+JflS6ya2S6cfK/7srhofJpZOlEZW12kqXu5qBG0WYN7Ec/boHQ
 dUj8PvrmlDRJxbH/TJNS0zOT5EkodEocIoMikk9eqwdVa4P2+DPsN0pabQuqJyISEeqe
 jj03eNcLEJ7nA/Pb507NCmCrZNL7uhhniXbgCGJIhZvYnalmTmvR+ZZisHHgi8xmbPMF
 wYAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cFmm+zKJ
Subject: [Buildroot] [PATCH v2,
 1/1] package/cups: add libxcrypt optional dependency
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/buildroot/autobuild/run/instance-1/output-1/host/lib/gcc/arc-buildroot-linux-gnu/13.1.1/../../../../arc-buildroot-linux-gnu/bin/ld: auth.o: in function `cupsdAuthorize':
auth.c:(.text+0xdba): undefined reference to `crypt'

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/39b72d4e14895f901590d7e3404f69b4573d2cd2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Add missing '\'

 package/cups/Config.in | 1 +
 package/cups/cups.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/cups/Config.in b/package/cups/Config.in
index 51cf10b073..ad852c0998 100644
--- a/package/cups/Config.in
+++ b/package/cups/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_CUPS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# needs fork()
 	depends on BR2_USE_MMU
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  The Common Unix Printing System
 
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 91fad30b38..2ef480afe0 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -32,6 +32,7 @@ CUPS_CONFIG_SCRIPTS = cups-config
 CUPS_DEPENDENCIES = \
 	host-autoconf \
 	host-pkgconf \
+	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
 	$(if $(BR2_PACKAGE_ZLIB),zlib)
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
