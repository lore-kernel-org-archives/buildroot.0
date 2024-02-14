Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96993C48BC3
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 20:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 595CE41C73;
	Wed, 14 Feb 2024 20:38:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZtxmKX8Q8xMH; Wed, 14 Feb 2024 20:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA3A241B83
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA3A241B83;
	Wed, 14 Feb 2024 20:38:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB4E31BF2F5
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 20:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C83B680DC5
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 20:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9I77az36eGVt for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 20:38:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.41;
 helo=mail-wm1-f41.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A1FF782357
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1FF782357
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1FF782357
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 20:38:51 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-411d715c401so1140185e9.1
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 12:38:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707943129; x=1708547929;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=huV82p72BF6hUkU8vh7FvU637s93mKz9R9dfaz+k7ks=;
 b=ZxyEO3uTM6Xg/Q211Wdoa6ecB93xbqKzTOG3GjMF9zyholxlm2dV7of3Nmz/dxGWCz
 LmmUTJi+YkRxCXIT42N11zg+X00+pfG562UC2WGGfjIWz8itVGKlwQ3oBC3rqlFwsV6l
 yKn253pEBEviXbrFd9U4LQtxzkxVRn9CAG+p9rsGieLRVLO9TUWvj91+ebJ2v+oaXsUe
 1nhOyc0vbjRw3s8hzjmzgN9/2sKbqp8A9mCnQwucmU7byV3bx1TlPoTAI0bfGHNcXqGf
 Zc8QScLfiq4vafTiJfvhkPaS3rxJrk/AgkxF2ITR0nZJS5rz/YskE5de78a8Jlg+2yjm
 XJrQ==
X-Gm-Message-State: AOJu0Ywyc5oRC4APhpGvMnuwbOyobAjEmbzn03ygyGdvVVg3lQAp0jFe
 h92IYZP4hkfwM7E1w/OSgxWLhLGyBCzWki3Bc/370dk4est2VDb/r6EFIgeV
X-Google-Smtp-Source: AGHT+IHTdsnbw4tkVDSKWtVPBS2BFEgzwuxgA8v6k347moQVQ3Gn2Ntihws9FJ5GNd/bm/xYsF82dA==
X-Received: by 2002:adf:f2cf:0:b0:33c:e2f2:f33 with SMTP id
 d15-20020adff2cf000000b0033ce2f20f33mr2519894wrp.20.1707943128597; 
 Wed, 14 Feb 2024 12:38:48 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV5/YWwYiaQaCG+cjkBNvT5ZVBHlLDK6i530bNsp6qFS4syuCaH3Kdj847Zmdv8ZUhRhuUNmUK9g0vPQ0Gqk6T5GB/ggoYDjr3Olqbb7+pvIDZBdfkOkBQH6KSfNW0N1O9Vl6XZ0mkNfBI5jgILZSSFzeKH3WFfy+dGcVoOW7Jxpv7+yMUtPXLWbhc0AAf4Ahh/OyQKGlm8
Received: from thomas-Precision-7670.barco.com
 ([2a02:a03f:eb68:2f00:f03a:52f2:4b05:fc4e])
 by smtp.gmail.com with ESMTPSA id
 j8-20020adfe508000000b0033aedaea1b2sm13324573wrm.30.2024.02.14.12.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 12:38:48 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Wed, 14 Feb 2024 21:38:45 +0100
Message-Id: <20240214203845.121720-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v2] package/weston: bump to 13.0.0
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
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Announce:
  https://lists.freedesktop.org/archives/wayland-devel/2023-November/043326.html

Drop -Dlauncher-libseat=true, as it has been dropped upstream [1].

Also drop the BR2_PACKAGE_SEATD_DAEMON, which was added in
commit 6d677931284d58ae0e8e001cfd990eafaee5cecc
  "package/weston: select the seatd daemon", and
commit 9d6f966f9ad012879bb472896eb35eeda5baa9ab
  "package/weston: don't select seatd daemon if we have logind",
as it is not strictly needed anymore.

In package/seatd/Config.in we have:
    select BR2_PACKAGE_SEATD_BUILTIN \
        if !BR2_PACKAGE_SYSTEMD_LOGIND && !BR2_PACKAGE_SEATD_DAEMON

Here we have:
    select BR2_PACKAGE_SEATD_DAEMON if !BR2_PACKAGE_SYSTEMD_LOGIND

This makes it impossible to select BR2_PACKAGE_SEATD_BUILTIN as the -only-
backend if not BR2_PACKAGE_SYSTEMD_LOGIND, so drop it altogether. This kind
of logic should be selected in the device defconfigs or by packages that
really need one specific backend.

[1]: https://gitlab.freedesktop.org/wayland/weston/-/commit/e3b6ed50f1c3c259c51274c78d08b58>

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v2: Combine and rework git message these two patches:
 - [v1] package/weston: bump to 13.0.0
   https://patchwork.ozlabs.org/project/buildroot/patch/20240214075445.1011185-1-thomas.devoogdt@barco.com/
 - [v1] package/weston: fix auto seatd daemon selection
   https://patchwork.ozlabs.org/project/buildroot/patch/20240214182931.116813-1-thomas@devoogdt.com/
---
 package/weston/Config.in   | 1 -
 package/weston/weston.hash | 6 +++---
 package/weston/weston.mk   | 3 +--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index db6a78ee8a..1b282fb362 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -19,7 +19,6 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_SEATD
-	select BR2_PACKAGE_SEATD_DAEMON if !BR2_PACKAGE_SYSTEMD_LOGIND
 	# Runtime dependency
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
 	select BR2_PACKAGE_WESTON_SHELL_DESKTOP if !BR2_PACKAGE_WESTON_HAS_SHELL
diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index 0ecbaa4168..ded5d35275 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2023-May/042725.html
-sha256  b18591eab278bc191720f6c09158040b795e7118af1d5ddca6acd9a8e2039535  weston-12.0.1.tar.xz
-sha512  3dcfa1a2a6b9a605d3ecd597bf7ac0f87b0fd1971845b6e5c44b5e34296943ac146dae6e1cfea9be14ad7a9a8b6d30dc765f9289ef80920d7c516ebba1ba4688  weston-12.0.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2023-November/043326.html
+sha256  52ff1d4aa2394a2e416c85a338b627ce97fa71d43eb762fd4aaf145d36fc795a  weston-13.0.0.tar.xz
+sha512  8c656cdf24ec9429c76c64ebd2d58351991f5990a6d4b5900ac913243ad8e2c9c0fb1a748f018d177fbfd7e0a8836d0434d97acec287a8f977d47335ae30eacc  weston-13.0.0.tar.xz
 sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index b07e798765..5ae9c22973 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 12.0.1
+WESTON_VERSION = 13.0.0
 WESTON_SITE = https://gitlab.freedesktop.org/wayland/weston/-/releases/$(WESTON_VERSION)/downloads
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
@@ -19,7 +19,6 @@ WESTON_CONF_OPTS = \
 	-Ddoc=false \
 	-Dremoting=false \
 	-Dbackend-vnc=false \
-	-Dlauncher-libseat=true \
 	-Dtools=calibrator,debug,info,terminal,touch-calibrator
 
 ifeq ($(BR2_PACKAGE_WESTON_SIMPLE_CLIENTS),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
