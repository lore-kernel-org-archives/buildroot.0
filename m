Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED96C606A31E
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 22:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QU7ijppb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wiXB7lXs
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A806C405AA;
	Tue, 24 Nov 2026 22:56:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NCXC0gtFVRLy; Tue, 24 Nov 2026 22:56:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 35C53405AD
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795560999;
	b=ZLgdzVqbBfwq7OCOK/IYHfLI5IQbd6heq0M/LozqPHpuTVx5VOkmsIGKPLEPNn83g2bC
	 K5POMetZI1WKoqOYBDedl9174Xcz7eNUK8jlAlR7PYyQWosVL4AE2B8zknxNdw0izJSMX
	 4ED2+CEDKYxJrLacsD5vHwm3+HtYvIOVLOpJGYQ6fDX4tuIxjRjP19l6zQZ5fb6NurrSz
	 9/+l1++9Sytk9bu8yiXxPpM0BjEFCA4vTMKfniwrkhZe9mJSlwDcRgJlb2sVo+mxGgrQM
	 lXWkqZMegW+CbkaTEdWY6Ar7A5npUHUg56DqSyS2AJmidTGV+fxWaZHREITabUwAI5A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795560999;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=zm5xwNT6+j2f3Ki25hmO+VOzIvblHte57vc5G+TUqxo=;
	b=o2W5qaK3e7vbw1Gqw5DTBI3Ir65RZ0aWrB7B7inEKhAH9MlNZFti/12fSQrxpfJsyBgh
	 buzY/Y33n6x5DoF1U77/7Md+7nqylfIY22JXii83c0iOczD1xhw1csLYcBt9c7EiIatLt
	 ded+IVGaPVIuD8I1cn+qLg68WBPmyLwxhGHissussk9lpxGj5cX98tmafpP+PJy+Fli4V
	 OiahYa9TGdmHmGw+/uiDB6WOgRYKgRTaKIlIRAceHCKOAYC+k4LdWvFFwJESnBULGHPkW
	 CpBX7WaXwCB79zEFNf7buwE1d1MWcBF6BqTTT+0/LZuP3OvPi5v38buT2EqwpVOvprQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795560999;
	bh=zm5xwNT6+j2f3Ki25hmO+VOzIvblHte57vc5G+TUqxo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QU7ijppbcvasZaaqjr1TPmT4oLvKuJ1vMIukVDjP0dfWAYmGU8EGTXuNrAc3QdKem
	 ftUDIqwZFFsxRchuu2aTConQsGIptSjI1ITrd0RdlRZySwLyUEYJX3FNiLZJbdsZ3u
	 MvkfiYmHa4nQmZtsENkERyLLRmp6Scxrj7ecY1jhlEmpdGctIrZCI1CUG/rCfQNloA
	 chzaxkS4X1TIrt8/c44NwBWNYIwvmW08rymGpfF+3fRG7SXQB0rpCMLA6DeW6wn1uI
	 KXQ8GdXaTXPxACa5UcNsF+UOplNlbCyCHLaph6DIC1x86VpXhMXB88O0E1DSkxbHHp
	 UwLfmIuXWGeWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35C53405AD;
	Tue, 24 Nov 2026 22:56:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3637C26D
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 22:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2867640180
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 22:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zK_jTpmywBNG for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 22:56:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org DD7FD40071
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=wiXB7lXs
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD7FD40071
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 22:56:35 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4bb9d8e8e90so22759875e9.3
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 14:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795560994; x=1796165794; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XUHgTTlluiuncacju70QwFsAjjapKAtxmPFiShsiYdk=;
 b=wiXB7lXsDKMVxxEweP5WPTcAeZxhg+70Qf5/Jy5pDQjtY526niBLrMXurBizryMaEm
 Acb4S+iB3c/ptvcyxlNpv6OgH/29+ZKWn2/4LbgoYFNYsquVb31X+y0Dlu7+FSQhZ9uH
 FVvUMzj1nywNlx7IXuh6xbva9l+kkYuHJUyuEF5Di38Fhmuo/qjSO2tGgtPlyd9H1R7f
 2ibL6KP94yLA5SwfUSdDa4MbWVf1a4D51OVOfEmvdvGifvWm1kA2xKJW2NruuHtHlIih
 y9XzuVTqb+71+W3Z4KoK71NPUktRBfL1Wjq0hzLAP3gksC+qbgJb5R7bvQG7dX0PG42M
 628w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795560994; x=1796165794;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XUHgTTlluiuncacju70QwFsAjjapKAtxmPFiShsiYdk=;
 b=dSqh8Ene+G3uAl+UZP6ZCoD0uEUuHTflfMK6xR3mywKQZv3QV6EcdcRGOSq6OUEZgz
 uHQ7CZoPqB9eJnamDfKaZwvw1dE+fQYsOkkiQrr3hjxMMsT80R2P+MB19zG2/ObKZt5a
 u8Kfj5AYlLZx6N+Rb3n0LB+IX93v0Q+qMu4/F80/mpYfeK1WzINk5itQd+QzhL37skTG
 74NT3xe5SbOHi8v/2zs59wHPWexMrVIbTsCKn2MMJvhQfOm7y6m0w9TBHUNlfw7JQjDn
 U7Z3AyBLqk96D7gwIMB3I0ZcsRikCRrG7l1TtE8wv64My41NpQHTBZWv3BfCgGmwYp/y
 hiog==
X-Gm-Message-State: APuU4Z/L5/tTGP1jfabNFK0qMTDoKzr8DoJCLcN+4Ovo6qBxRTD7o3sR
 D8WovNjGRONFHkrKrUXPZjZa4V3a7iNnnljSWH7DHJ5+MScDF1hQnLpqW+ZXfg==
X-Gm-Gg: AZFdTZfgO3Pqnl4UDe4Qf4kizEl6z9K1moNBs+GKsuXGX79JUARiGmXgDDjkvzosGUa
 1gmf1bUcK32+EwqULGLXFIVDHxSqEmfTbYrIDKvGmwojxABXWKSOw+FDgDZtEI7X9MxESRzbOuT
 4lbVmmeNSZt+8X5Qe9MJTK6cWxYhX1uSz/P5/qbEeTSzO3Y/kShX6yTOx/eEvb00ySgqDxyrhgQ
 7idvhxV1HEGMdf9XRS82CnZ0KsNTrOeuvVlzrmtw6meDuDtr8Te+zHjK6e/3BwjMKcmusnPjILJ
 4+fECLszvqZ2cV5PhSNczBtLS9/BQWISRD1BxioHmM0GEkOZnhEAHBEDc7qWwXYBrQbh5V/5VzK
 UF065hB4vxF+rwDxI9A2kvKYlzuc2ygbPk1A2KBOiEAqhCsY02PlWZm3+3vCWV2JEBiB2tzKddw
 6bWdLuPC94DfCDxzg4ax4UuMGcH31MXLKZP/kzK5s4J8nFMMcUXCwfFSge3cBO6GGJHvEW20t22
 ff/5dZ8p6XUJ7g8FpevlYIJbrtRH9IHzyXsMYYICnAjI3GXNnOd8YdnLb28ZolXWwB5kmvNaMxX
 baEOtvD2ugG1m/4D9PFyYoicc4896deUh3qjvQDG9xWOZCd0Aavxz6bAiQ==
X-Received: by 2002:a05:600c:848d:b0:4bb:6687:5386 with SMTP id
 5b1f17b1804b1-4bb8880c7f1mr344740885e9.19.1795560993672; 
 Tue, 24 Nov 2026 14:56:33 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884911e3sm563512695e9.6.2026.11.24.14.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 14:56:33 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Andreas Ziegler <br025@umbiko.net>
Date: Tue, 24 Nov 2026 23:56:07 +0100
Message-ID: <20261124225613.4085109-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] boot/syslinux: Don't delete host syslinux
 installer
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

Build the installer properly with host toolchain so that it can be used to
install BIOS bootloader into the target image.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v2:
- clarified that the ability to build the installer for the host is patched
  in, doesn't come from upstream 6.04-pre2 update;
- rewrote the Makefile .patch to include CFLAGS, LDFLAGS and added commit
  message body
v1:
- https://lore.kernel.org/all/20260830181907.106154-2-alexander.sverdlin@gmail.com/

 ...uild-syslinux-installer-for-the-host.patch | 56 +++++++++++++++++++
 boot/syslinux/syslinux.mk                     |  8 ---
 2 files changed, 56 insertions(+), 8 deletions(-)
 create mode 100644 boot/syslinux/0002-mtools-Build-syslinux-installer-for-the-host.patch

diff --git a/boot/syslinux/0002-mtools-Build-syslinux-installer-for-the-host.patch b/boot/syslinux/0002-mtools-Build-syslinux-installer-for-the-host.patch
new file mode 100644
index 0000000000..a998189d37
--- /dev/null
+++ b/boot/syslinux/0002-mtools-Build-syslinux-installer-for-the-host.patch
@@ -0,0 +1,56 @@
+From 928c7a479b7201bfc51de18567914ce20629bfcb Mon Sep 17 00:00:00 2001
+From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
+Date: Tue, 24 Nov 2026 23:34:32 +0100
+Subject: [PATCH] mtools: Build syslinux installer for the host
+
+Use CC_FOR_BUILD, CFLAGS_FOR_BUILD, LDFLAGS_FOR_BUILD in a similar way
+to utils/Makefile to be able to build mtools/syslinux installer as a host
+tool.
+
+Upstream: N/A, dead
+Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
+---
+ mtools/Makefile | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/mtools/Makefile b/mtools/Makefile
+index 632b185b..36d434e5 100755
+--- a/mtools/Makefile
++++ b/mtools/Makefile
+@@ -1,9 +1,10 @@
+ include $(MAKEDIR)/syslinux.mk
+ 
++CC_FOR_BUILD ?= $(CC)
+ OPTFLAGS = -g -Os
+ INCLUDES = -I$(SRC) -I$(objdir) -I$(SRC)/../libfat -I$(SRC)/../libinstaller
+-CFLAGS	 = $(GCCWARN) -D_FILE_OFFSET_BITS=64 $(OPTFLAGS) $(INCLUDES)
+-LDFLAGS	 = 
++CFLAGS	 = $(CFLAGS_FOR_BUILD) $(GCCWARN) -D_FILE_OFFSET_BITS=64 $(OPTFLAGS) $(INCLUDES)
++LDFLAGS	 = $(LDFLAGS_FOR_BUILD)
+ 
+ SRCS     = syslinux.c \
+ 	   ../libinstaller/fs.c \
+@@ -35,16 +36,16 @@ spotless: clean
+ installer: syslinux
+ 
+ syslinux: $(OBJS)
+-	$(CC) $(LDFLAGS) -o $@ $^
++	$(CC_FOR_BUILD) $(LDFLAGS) -o $@ $^
+ 
+ strip:
+ 	$(STRIP) syslinux
+ 
+ %.o: %.c
+-	$(CC) $(UMAKEDEPS) $(CFLAGS) -c -o $@ $<
++	$(CC_FOR_BUILD) $(UMAKEDEPS) $(CFLAGS) -c -o $@ $<
+ %.i: %.c
+-	$(CC) $(UMAKEDEPS) $(CFLAGS) -E -o $@ $<
++	$(CC_FOR_BUILD) $(UMAKEDEPS) $(CFLAGS) -E -o $@ $<
+ %.s: %.c
+-	$(CC) $(UMAKEDEPS) $(CFLAGS) -S -o $@ $<
++	$(CC_FOR_BUILD) $(UMAKEDEPS) $(CFLAGS) -S -o $@ $<
+ 
+ -include .*.d
+-- 
+2.56.0
+
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 27ea1c367a..a5e25d35c6 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -98,14 +98,6 @@ define SYSLINUX_INSTALL_TARGET_CMDS
 		-C $(@D) $(SYSLINUX_TARGET) install
 endef
 
-# That 'syslinux' binary is an installer actually built for the target.
-# However, buildroot makes no usage of it, so better delete it than have it
-# installed at the wrong place
-define SYSLINUX_POST_INSTALL_CLEANUP
-	rm -rf $(HOST_DIR)/bin/syslinux
-endef
-SYSLINUX_POST_INSTALL_TARGET_HOOKS += SYSLINUX_POST_INSTALL_CLEANUP
-
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_ISOLINUX) += bios/core/isolinux.bin
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_PXELINUX) += bios/core/pxelinux.bin
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_LPXELINUX) += bios/core/lpxelinux.bin
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
