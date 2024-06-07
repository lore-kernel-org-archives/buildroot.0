Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E61C27C5F
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 17:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B78F24282B;
	Fri,  7 Jun 2024 17:06:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KNNZuO17qslg; Fri,  7 Jun 2024 17:06:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39EA842881
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39EA842881;
	Fri,  7 Jun 2024 17:06:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14E951BF479
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC79C42782
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8zFW7aWkV76r for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 17:06:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 33907427D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33907427D2
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33907427D2
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 17:06:12 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-35e573c0334so2078093f8f.1
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 10:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717779970; x=1718384770;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=a3/c0kPGljHWAWKZOugtNG79rMb4zJwSUr93HA3/FOs=;
 b=SXyqCsFOrvr91zs/9UeBEwD98tDNxQqt26QRDf1SquFqMXk5achbBNRVToh6Iihm1y
 YUe0fr69m5BtmHAmT02Lu+3DlAe0W0ivaxkzei0y8eBlJD9qpM6RtF/s3fiPgOxE7/1T
 bBPxzCqqV0RE9YJZz4UoJ0SzRSmvYxqR3nFCvrArbLJrYgP1oTdr3YC8eKGvT6jf45kI
 sz3ro+MeooBYjVLy1Bv0eMlsSwdNvm4ixCjfOo8v75PLCApfiy3Yonvruf/HvLDwgY6d
 /FXlVJsMSoHR3rS5tJUFNPTtCigX9KicVzYOfWaR1/k8WwLT73XtskeqPj1GoJrXLo1M
 tAIw==
X-Gm-Message-State: AOJu0YxpEMKgvwIFPFkUh/iLIJy8LMWDn3Ik5nLX7JwiArdkq2QBeBEj
 LqAbjcAe60HAJ7Z+AbczytfxsbkJgAwAgUQSCpvJw5Gun1fDUfeari4DuQ==
X-Google-Smtp-Source: AGHT+IF0kxVZr+OfZZUG0DFJoxQjbRnN1bPoMMDo5ObIlXvoyMPS5hgVpI9zqFROhAsQqiaLn01wew==
X-Received: by 2002:a5d:640a:0:b0:354:e22c:ea86 with SMTP id
 ffacd0b85a97d-35efea19068mr3081083f8f.9.1717779969971; 
 Fri, 07 Jun 2024 10:06:09 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e989c9sm4355379f8f.73.2024.06.07.10.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 10:06:09 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 19:05:58 +0200
Message-ID: <c69c41c0fbdd9495fef8c5bbfadd7069cd2ff48c.1717779951.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717779951.git.yann.morin.1998@free.fr>
References: <cover.1717779951.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717779970; x=1718384770; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a3/c0kPGljHWAWKZOugtNG79rMb4zJwSUr93HA3/FOs=;
 b=WEWdmJhdAKT7pANbSPmHPie4sYyrgSUc6dFbLu7IWweTFzwHCtHJRlDO7SOjygP6GT
 Mi9h4/HapdkHR63kpYjSUx6O0fQKoAw0G6GN2u2Ee28vX86DSUnhI/VNOExdni9wp8sk
 wDwF6N7gmULw8bb4xZQYhNazWQbDMQ1Otqbq743xBblCuXjMajuIHOz17ON5GwOSlvm/
 Ql19MgfUXFNWZLNPGYNYpH+T1WeGf69fhhUUJ1Ea8yGlDx721I4knuiahbqj7QmMMIsh
 CUTkXKjaBU6NoEZT74Qfz33UmjyGRoUvHrWAS6kv7qVqZTYQyAO4m4z0b4ysV+qlSAZ/
 APtQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WEWdmJhd
Subject: [Buildroot] [PATCH 17/20 v2] RFC: package/anvil: new package
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thie is an RFC, because it has only been build-tested to validate the
cargo-unlocked case; there has been no runtime test of anvil.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in       |  1 +
 package/anvil/Config.in | 20 ++++++++++++++++++++
 package/anvil/anvil.mk  | 30 ++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+)
 create mode 100644 package/anvil/Config.in
 create mode 100644 package/anvil/anvil.mk

diff --git a/package/Config.in b/package/Config.in
index bfbec1c21d..3f4fbf0543 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -313,6 +313,7 @@ endmenu
 menu "Graphic libraries and applications (graphic/text)"
 
 comment "Graphic applications"
+	source "package/anvil/Config.in"
 	source "package/cage/Config.in"
 	source "package/cog/Config.in"
 	source "package/dmenu-wayland/Config.in"
diff --git a/package/anvil/Config.in b/package/anvil/Config.in
new file mode 100644
index 0000000000..eb65a9fb53
--- /dev/null
+++ b/package/anvil/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_ANVIL
+	bool "anvil"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on !BR2_STATIC_LIBS  # wayland
+	depends on BR2_TOOLCHAIN_HAS_THREADS  # wayland
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_PACKAGE_MESA3D_GBM
+	select BR2_PACKAGE_HOST_RUSTC
+	select BR2_PACKAGE_LIBINPUT
+	select BR2_PACKAGE_LIBXKBCOMMON
+	select BR2_PACKAGE_PIXMAN
+	select BR2_PACKAGE_SEATD
+	select BR2_PACKAGE_WAYLAND
+
+comment "anvil needs udev /dev amangement, mesa3d w/ gbm, a toolchain w/ threads, shared libs"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_PACKAGE_HAS_UDEV \
+		|| !BR2_PACKAGE_MESA3D_GBM
diff --git a/package/anvil/anvil.mk b/package/anvil/anvil.mk
new file mode 100644
index 0000000000..7de9f3e06d
--- /dev/null
+++ b/package/anvil/anvil.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# anvil
+#
+################################################################################
+
+ANVIL_VERSION = fb44b240ea4a3aa39a6b92f5bede23301ab9a26e
+ANVIL_SITE = https://github.com/Smithay/smithay
+ANVIL_SITE_METHOD = git
+
+# Upstream refuses to lock their package:
+# https://github.com/Smithay/smithay/issues/496
+ANVIL_CARGO_LOCKED = NO
+
+ANVIL_SUBDIR = anvil
+
+ANVIL_DEPENDENCIES = \
+	libinput \
+	libxkbcommon \
+	mesa3d \
+	pixman \
+	seatd \
+	udev \
+	wayland
+
+ifeq ($(BR2_PACKAGE_XWAYLAND),y)
+ANVIL_DEPENDENCIES += xwayland
+endif
+
+$(eval $(cargo-package))
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
