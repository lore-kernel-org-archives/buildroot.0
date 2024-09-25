Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCE7CF58E5
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 13:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 279C642661;
	Wed, 25 Sep 2024 13:35:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PrDJTPnmFa3o; Wed, 25 Sep 2024 13:35:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F403C42665
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F403C42665;
	Wed, 25 Sep 2024 13:35:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D6221BF38D
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 13:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A25F84902
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 13:35:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OwUcJ76_SnCW for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 13:35:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 07465848FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07465848FE
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07465848FE
 for <buildroot@busybox.net>; Wed, 25 Sep 2024 13:35:44 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-374ba74e9b6so5568655f8f.0
 for <buildroot@busybox.net>; Wed, 25 Sep 2024 06:35:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727271343; x=1727876143;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kiSltnXqPIaeGDnu4r2oIaYVNcvnZGQJBU7OTq3incA=;
 b=ry3xahJ2dua3xzdUrbnxy+H+Ev06LsdJClw236UsbGoXQaTLtuJssR5FFdzIHgX7NY
 hlDjjaCYKXwc/rhtunV0C40Ponn9Ha9UmLLLykn0k8MFnmZhCNEcsiaUsYz0HJCbDroC
 1aqS7mZQ+/1GaOBKQ2QBXm72/xilCeE7cP+s0C58kFfz5JOmuoqGOGRw13VA30iZzMzY
 gR2h3lhXcNMJ2B3cQjQDHFIWetlcFIaK1LWQvF7o2LoaLpPUlkaXaUBu0coWWQ7JD4PQ
 alKvXOX579OaxFHJ8wb/Vhi1R+Aa6dR1NupFiGJ4y75Nih17A4iff6NzWV5QiyHB7gqQ
 1LjQ==
X-Gm-Message-State: AOJu0YxaycOwDnQamuIX2QV9LJad/QEujK2WZEu2c82jw6jBOXNRt1aT
 AKJT1hB9qYXyN3SYGs2N2aT+SpvF/bYMViFvvDNsGi1ILceqrFoW8Hns0COsT+JtUj5HNmlHVrv
 3VA==
X-Google-Smtp-Source: AGHT+IGp2A7Jcy+UHXLFESS6oJz0EZ+Q6W3XXArKZg1uDClhwcYaehC4NFE3dzpphfkvXmngyT834g==
X-Received: by 2002:a5d:434e:0:b0:374:c7f8:3d50 with SMTP id
 ffacd0b85a97d-37cc24cb831mr2415828f8f.58.1727271342860; 
 Wed, 25 Sep 2024 06:35:42 -0700 (PDT)
Received: from vm-2404.. (55.6.65.37.rev.sfr.net. [37.65.6.55])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cbc31f77esm4075769f8f.108.2024.09.25.06.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 06:35:42 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 25 Sep 2024 15:35:39 +0200
Message-ID: <20240925133539.3899781-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1727271343; x=1727876143; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kiSltnXqPIaeGDnu4r2oIaYVNcvnZGQJBU7OTq3incA=;
 b=jAcJrIOskJbBRZnCBpA6zlc4nLGYuqRStHp0ddQg7jh8ja+2khJIILGGoImYevwcH6
 XeZf9FB8Y/M0dLeXkRjBNCHX+pBl2J8/NH0NMnCINkPp9oWUxB8fbDUQ2xQ/x3hURTq4
 9RwrKaD4pLqT2AxiuiyjavAzELavqFxpBwwxazjQyCvQWz2rvG4UGQmB2q4HPzHvzpOY
 AXMQhVCBTEMmCiFdkceUpx5V7aamLtK/0CMR6jLGDI65S4E/c72gZ3kb/D3yMQmyE9iq
 YZlM2wx+fKFwdeuaU1/LnIcPZ2mb4Hd2PK4dMUVhu0Z4/c1O+CocP1Ob87OyjWdpHVz+
 aYmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=jAcJrIOs
Subject: [Buildroot] [PATCH] package/gawk: bump to version 5.3.1
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/gawk/Config.in | 2 +-
 package/gawk/gawk.hash | 4 ++--
 package/gawk/gawk.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gawk/Config.in b/package/gawk/Config.in
index e9cf4c5ff..86eba0b7b 100644
--- a/package/gawk/Config.in
+++ b/package/gawk/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_GAWK
 	  rather than procedural. Allows for simple data-reformatting
 	  jobs with just a few lines of code.
 
-	  http://www.gnu.org/software/gawk/
+	  https://www.gnu.org/software/gawk/
 
 comment "gawk needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
diff --git a/package/gawk/gawk.hash b/package/gawk/gawk.hash
index 3ff0a9003..b029ab330 100644
--- a/package/gawk/gawk.hash
+++ b/package/gawk/gawk.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/gawk/gawk-5.3.0.tar.xz.sig
+# https://ftp.gnu.org/gnu/gawk/gawk-5.3.1.tar.xz.sig
 # Primary key fingerprint: D196 7C63 7887 1317 7D86  1ED7 DF59 7815 937E C0D2
-sha256  ca9c16d3d11d0ff8c69d79dc0b47267e1329a69b39b799895604ed447d3ca90b  gawk-5.3.0.tar.xz
+sha256  694db764812a6236423d4ff40ceb7b6c4c441301b72ad502bb5c27e00cd56f78  gawk-5.3.1.tar.xz
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index ff1b9920a..fbb620be7 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GAWK_VERSION = 5.3.0
+GAWK_VERSION = 5.3.1
 GAWK_SOURCE = gawk-$(GAWK_VERSION).tar.xz
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
