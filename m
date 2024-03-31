Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB84CD1288
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 08:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62FF54016D;
	Sun, 31 Mar 2024 08:49:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D6W0ArypG50D; Sun, 31 Mar 2024 08:49:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A1D9401C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A1D9401C9;
	Sun, 31 Mar 2024 08:49:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29CDE1BF576
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 08:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2436A40236
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 08:49:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5kQT7PNQ6vCj for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 08:49:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 76E0E400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76E0E400AB
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76E0E400AB
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 08:49:30 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-341b9f6fb2eso2308315f8f.2
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 01:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711874967; x=1712479767;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZPrADgowo2aG+mXp07WCTcOo3Z+PE5RmD6cbGzyXA2o=;
 b=UXFDucy6Pxue65ES4OGLJvIFB3cpvXTBqddr+OT72VrcA4ntThrmdJ1OXDIrS3mOZQ
 w7AE+OVafnvc1rcI60lfhBb0PzmwU6zc0h0hs9/9YmndSKqUzmA0TCedQgCVXa65VGV5
 O0ssRInpwNj52ETvyA/hWvUP8xpdV5G2gThfyYNxWGlMAIGH0E1UxIkJtn2qqpj6ZR6q
 FnORyKveTnxEJMAo33LstAhwo5tOglLJHJqQkq+uGm+kOBhrVVEOczI+wMHC6c0DyXNX
 bNUlYTj47GBsX9AA6GI9MZwySm+2XRvj7nDBQfswP5fQK2+Y3yAZMy5eKy+l8+yAHrWI
 UhxQ==
X-Gm-Message-State: AOJu0YzQOg64kx57yPZFAfO7bOUcMEbV9V3rhXptq1OEiKIjb16qkRDQ
 RNsyyCCbSL85RepiZDNI8OLMxp92WT1AO8l4z3swsrFHXdm64k1JA/+G+hMt
X-Google-Smtp-Source: AGHT+IH1bt2EDHtcST5tfNwRWYKhylbMF5YitDORY8i5jwvBY7431C/RvmZqwsyIBovmszA7MFEAMg==
X-Received: by 2002:a5d:420a:0:b0:341:cfba:e045 with SMTP id
 n10-20020a5d420a000000b00341cfbae045mr4884337wrq.49.1711874967216; 
 Sun, 31 Mar 2024 01:49:27 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 cp32-20020a056000402000b00341c88ab493sm8501435wrb.10.2024.03.31.01.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 01:49:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 31 Mar 2024 10:49:24 +0200
Message-ID: <20240331084924.6075-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711874967; x=1712479767; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZPrADgowo2aG+mXp07WCTcOo3Z+PE5RmD6cbGzyXA2o=;
 b=BqabPlnB8IvIA0dYww2xhWZKPrvb6riUDcFp/vapbTUz6ZCtgQcqNvndy3+XZlJ+fn
 hbwhRDMGH+DeTqWxglx0/QZd8GKFirZl1CSomw68ru6vWXjgolxW7vPpQn/xeVxdx8cZ
 pvWgu9FZnzL1YzM9KzqKCAemiYIzZset26e1LZxjq/A2KPBx2U+TFZGi7dW0YkpncKZz
 fQlomrYP/A40iPa6gVaxiWzNEHjjhRb4FHiWx0YLHy7R3VKHpiTHZDL+KWqqIE9/zIQm
 dIVhFPFb1jF8543KNh37Cya32spAH7azvGnD+uqEZb247zDQj7nclv2+UkOzIpsocD1D
 DmoA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BqabPlnB
Subject: [Buildroot] [PATCH v2,1/1] package/dav1d: fix riscv32 build
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following riscv32 build failure raised since bump to version
1.4.1 in commit d8c440936d51b7f76472b43002780f5490b7a3bf and
https://github.com/videolan/dav1d/commit/43ee02a99cce1f221bdb574c9ee484180d71013f:

/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv32-buildroot-linux-gnu/13.2.0/../../../../riscv32-buildroot-linux-gnu/bin/ld: src/libdav1d_bitdepth_8.a.p/itx_tmpl.c.o: in function `.L0 ':
itx_tmpl.c:(.text.unlikely+0x76c): undefined reference to `dav1d_inv_txfm_add_dct_dct_4x4_8bpc_rvv'

Fixes: d8c440936d51b7f76472b43002780f5490b7a3bf
 - http://autobuild.buildroot.org/results/28192c494c7a2f88cc90205b6a08afd11782df40

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Bernd Kuhls):
 - Fix condition

 package/dav1d/dav1d.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index 74c68d1660..18cb81868a 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -24,6 +24,11 @@ ifeq ($(BR2_ARM_CPU_ARMV4)$(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV7M),y)
 DAV1D_CONF_OPTS += -Denable_asm=false
 endif
 
+# riscv assembly requires riscv64
+ifeq ($(BR2_riscv):$(BR2_RISCV_64),y:)
+DAV1D_CONF_OPTS += -Denable_asm=false
+endif
+
 # Uses __atomic_fetch_add_4
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 DAV1D_LDFLAGS += $(TARGET_LDFLAGS) -latomic
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
