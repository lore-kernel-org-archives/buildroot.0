Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80FEC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 10:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 901EB846C7;
	Sat,  8 Jun 2024 10:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 36W9t_OMkgjR; Sat,  8 Jun 2024 10:25:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20DC6824E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20DC6824E3;
	Sat,  8 Jun 2024 10:25:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B51E51BF41F
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 10:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1ADA401EB
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 10:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R3XiAxEro9ym for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 10:25:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.45;
 helo=mail-wm1-f45.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6BAE540169
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BAE540169
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BAE540169
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 10:25:37 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-42178999284so7256095e9.0
 for <buildroot@buildroot.org>; Sat, 08 Jun 2024 03:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717842335; x=1718447135;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T12tjArwNcCdHdWbL/uDrVdH2Hy3mM/vcTfMRQYNqeE=;
 b=fF6Y9VwG3fL5Zc+CPNFYdF6OAJxomq/OBpz2QlaI4nKlyCSpbP0z68LGcKTqlCst+v
 HgnlSy5eP64nFdnnzJpXDx38FGAhv3F7TSlqXZz6aI/GDSQdLyjO7rTRYqimtaJnt57B
 0iUmSmKdH5qrcrsPlV1FiqT61szPz+RIrdK/sEaC4IG0j5y1JIh3xjzl2Z9CBcwBAdgT
 /TX3NPCP85mSBac6BL+zHt+bqZfc79vJHs7pK9viES3LGgc+LqlZf82Zxm6QL8m3hijI
 1ea22FJ+bvAhmx7vf+QtcgYgaJQKQ5V3adxnnmOxJkRixGRdcVjwXkm91id9XBK9uB+o
 eRNg==
X-Gm-Message-State: AOJu0Yxef/mUBHCtmOWuJh5ZiZ67sd8BOymIZBysrcWPtHMA1LKRHl7U
 boakTNojR8UH+UsZfaD0fzIBNUs6jiUCJqKsvcrvfmGHNIXeyxLe7CYF/A==
X-Google-Smtp-Source: AGHT+IEnZ1ccjmYstiNROTJvaW9VPkouco2t9xPrx97Q1cWPKStS/88EXdhGVNNc3EB4U2h+U+RVRQ==
X-Received: by 2002:a05:6000:1006:b0:35f:1a8a:a2e2 with SMTP id
 ffacd0b85a97d-35f1a8ab0famr376420f8f.59.1717842334985; 
 Sat, 08 Jun 2024 03:25:34 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:3a9a:8c80:dbb9:3d10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5d66cf6sm5981739f8f.49.2024.06.08.03.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jun 2024 03:25:34 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jun 2024 12:25:26 +0200
Message-Id: <20240608102527.2467188-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240608102527.2467188-1-thomas@devoogdt.com>
References: <20240608102527.2467188-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 2/3] package/weston: bump to 13.0.3
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Announce:
  https://lists.freedesktop.org/archives/wayland-devel/2024-June/043655.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/weston/weston.hash | 6 +++---
 package/weston/weston.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index 5fa0c9d2be..62322ac639 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2024-April/043575.html
-sha256  ea1566ab4f5ffce7e9fd4f7a1fca5b30caae4d50023bf459213994094e02b29a  weston-13.0.1.tar.xz
-sha512  4a0fd0b1aec823219421d701030bc534576be64b71ede70c7d33f131e9e64c0e0dc209e62f75cecb9368df7604c1d5b2321932eccc818b529d246ec2e3114122  weston-13.0.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2024-June/043655.html
+sha256  27f68d96e3b97d98daadef13a202356524924fa381418fa6716b9136ef099093  weston-13.0.3.tar.xz
+sha512  60e655b57cf418902ec6e4371883354165241d9a99a712aabe2165e11ac190dec22836fd885f5178def5416dc5f00e70042b022c96a8e0aa74827bbd4563f9cb  weston-13.0.3.tar.xz
 sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index b708d03743..bd5a0550b1 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 13.0.1
+WESTON_VERSION = 13.0.3
 WESTON_SITE = https://gitlab.freedesktop.org/wayland/weston/-/releases/$(WESTON_VERSION)/downloads
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
