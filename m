Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FE9C433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 18:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17066408D0;
	Tue, 22 Feb 2022 18:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 62t9XBZ1c6z1; Tue, 22 Feb 2022 18:12:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56A274089B;
	Tue, 22 Feb 2022 18:12:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ADA781BF2E3
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 18:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97D5E81B10
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 18:12:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RLJWS5obgnYl for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 18:12:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3B8081992
 for <buildroot@busybox.net>; Tue, 22 Feb 2022 18:12:13 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id d17so141992wrc.9
 for <buildroot@busybox.net>; Tue, 22 Feb 2022 10:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oa0gTWhZwYrU6+35fqt16N9z+PesE9r062GUyWcSjvM=;
 b=RXO/c/Z8kBQBc+WHu2EXSL0+C1J1Rvcen5hfxA+6BLTFN1ccE1IbgjUYQsFNPK758m
 bDyr6zVCQBuky+QVyB+f3DSrPm1XaRJ+LJwJDIElpG08mmyMdD8pWyKzeukCnKHeup7U
 OyJJLNxHSEkEoZR0UtwqNwlEwY3BfeqkljtjhGh3a2IvwosNFyj+eFHQBK+svPcVUQFL
 /QNxvU9D5YlqEkObjkmodytkX3UePRXdIkXqVb0cGa+Xb874bzfCNyDPzjH5nXdb6YGv
 FkwItNSubdBKq6m1qi7G+qKmadf8I0QvgAxe4owQ+p1c6l1VvlfwWxSGDdXUe0ygWQ55
 Q4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oa0gTWhZwYrU6+35fqt16N9z+PesE9r062GUyWcSjvM=;
 b=Fv4a43x36M9HFcSNA2bICJbzdOxgg0ZJsvrCJSYDEvooYccMVTmPb2vz3+27OiaDJI
 bSfEMSPfetzKRIfdpRF6/vqk2Tzgk8bBLRG3wgEZGQBBH6Ra8pNLvqCh1wnH8AaMTPbV
 3loN/ncAwwpEW8CLZhTx8AWTsbnJGufcNJo5f3w0ODt32EA8Lz+fm2qrIj5PA1xJzgUK
 3oqg615K/SPn6fr/yK1c6ee1IWcqPhAAvGO4vThYiy5VTg/1K3coIN2MfcihFoFH1sJP
 kz6bH8NTHw6//D6vX5pv9fdqdTnqz+giiTiA5qhQaETsZLvD9RMQMG/HXXkL9O9rBljG
 3xGA==
X-Gm-Message-State: AOAM532T/J5i+7Yb4bnkJ8wJCB8pSx3RXqyFlsL19W5XzBqeBkEmR892
 uELJ/8DzuEPDH3NarBaS9eaYVsM+gUw=
X-Google-Smtp-Source: ABdhPJyN34tK79DjsB5F4Wkl7YyiDmUZO17Zp6ijkuSvbGqfYJfpVd+Ry4j4NpOdxrsvI7oYotdoxg==
X-Received: by 2002:a5d:6d8c:0:b0:1ea:7d52:c05c with SMTP id
 l12-20020a5d6d8c000000b001ea7d52c05cmr5203454wrs.663.1645553532023; 
 Tue, 22 Feb 2022 10:12:12 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id d14sm47589365wri.93.2022.02.22.10.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 10:12:11 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 21 Feb 2022 05:30:33 +0100
Message-Id: <20220221043034.2736010-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220221043034.2736010-1-francois.perrad@gadz.org>
References: <20220221043034.2736010-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] portable: new init system
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

see https://systemd.io/PORTABLE_SERVICES/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pkg-generic.mk | 2 ++
 system/Config.in       | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b3a7e1d60..e62e7aada 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -383,6 +383,8 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 	+$($(PKG)_INSTALL_TARGET_CMDS)
 	$(if $(BR2_INIT_SYSTEMD),\
 		$($(PKG)_INSTALL_INIT_SYSTEMD))
+	$(if $(BR2_INIT_PORTABLE),\
+		$($(PKG)_INSTALL_INIT_SYSTEMD))
 	$(if $(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),\
 		$($(PKG)_INSTALL_INIT_SYSV))
 	$(if $(BR2_INIT_OPENRC), \
diff --git a/system/Config.in b/system/Config.in
index a4ffbfa18..e71e57915 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -141,6 +141,15 @@ comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.10, host and targe
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_HOST_GCC_AT_LEAST_5
 
+config BR2_INIT_PORTABLE
+	bool "portable"
+	select BR2_ROOTFS_MERGED_USR
+	select BR2_PACKAGE_SKELETON_INIT_PORTABLE if BR2_ROOTFS_SKELETON_DEFAULT
+	help
+	  portable services with systemd
+	  
+	  https://systemd.io/PORTABLE_SERVICES/
+
 config BR2_INIT_NONE
 	bool "None"
 	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
