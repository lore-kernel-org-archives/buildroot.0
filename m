Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB55EC433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 18:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40B5D60EC4;
	Tue, 22 Feb 2022 18:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nyArUyoaGtng; Tue, 22 Feb 2022 18:12:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 757A960C1F;
	Tue, 22 Feb 2022 18:12:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 558551BF2E3
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 18:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DAE581992
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 18:12:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aAQPy6szYOF7 for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 18:12:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 954EA81B0A
 for <buildroot@busybox.net>; Tue, 22 Feb 2022 18:12:14 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id f17so10142131wrh.7
 for <buildroot@busybox.net>; Tue, 22 Feb 2022 10:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9bBdNcolgmDDwHDFxuJrSAy8qO9oLV6YSeoYgJrc4vk=;
 b=dHXysN4y3zV6LhWPCFuXYDs50Svf9Y7dUcrh9nOumN7Z2/JvLKASF6i3zA7nk1DSG1
 sZSlVmw1xNurkXMUd/WDkvjM7UD5ut/kZmldFRiYsAUNaQu/xPDWWXoIE3NomUcIdvur
 WCXAYqoEwmblJLoKJSTkm+bh2V2qef+t8DF3lBG3XCw4EMocezp1RPPBVdJcOmz2qigQ
 QxDqYWFOypM7bOn892TjURQZQLgt1F9rPs4PZBpB31YgZtxfGpDubZoVmMtiuv1LlSH6
 1QMCQJYAS/mRbYeGAbY5qJtY9FwRM4yuUHgmx/ZZ02N99ybfsSj2d8vySIVuf5hjWF2e
 uWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9bBdNcolgmDDwHDFxuJrSAy8qO9oLV6YSeoYgJrc4vk=;
 b=ILRx4s98LVrzQNiJBlUtU4WtZX3lnVEQvLLCoVRr3AuUBZ1etK0BrWgujbG0Q5tPOQ
 ZALPfLKOFuPgldHU1y2byBvb7Nb22Pl4tRXvz4AdvnTxkBvuqCUqkDQEfDUQGrZRDMP7
 N6R5fcHQX1+MFRj8xrgnEs8jm7XeYj4Inz7pobhZEi9VGvPid8UjWx/jf5uoeusGTqVC
 CVE9cdV4/Ar1nQSD6HNpuOC+2qiVKZSGjaz9KoPIqDf0QkxEzpcDv8BFUYrGEh48uSpa
 nXbPd+mJzlQq0SnFaC3wPBVKXlvL14Ppln1aF3fhjKVjmX1sB8+16DCFPp69svVW2Gxx
 D6oA==
X-Gm-Message-State: AOAM533BtpjBFn04Jyru0AMW3MCjCd939xbiWFulJ1QVnhrbtTHWTccV
 aqdTPckGqo4G/+OiUz+qUthy3BMKbg8=
X-Google-Smtp-Source: ABdhPJyL6g3eJ4OV0nmQOQHokJmwWtHScRO1BWlc5J4Oqnrwd8tz9+47su3Z2Uw9m9eETc9LFEI7tQ==
X-Received: by 2002:a5d:444e:0:b0:1e3:2157:843f with SMTP id
 x14-20020a5d444e000000b001e32157843fmr21516782wrr.490.1645553532834; 
 Tue, 22 Feb 2022 10:12:12 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id d14sm47589365wri.93.2022.02.22.10.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 10:12:12 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 21 Feb 2022 05:30:34 +0100
Message-Id: <20220221043034.2736010-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220221043034.2736010-1-francois.perrad@gadz.org>
References: <20220221043034.2736010-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] portable: tweak some default values
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
 fs/squashfs/Config.in              | 1 +
 package/ifupdown-scripts/Config.in | 2 +-
 system/Config.in                   | 9 +++++----
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index 70d4a20cf..ad27470aa 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -1,5 +1,6 @@
 config BR2_TARGET_ROOTFS_SQUASHFS
 	bool "squashfs root filesystem"
+	default y if BR2_INIT_PORTABLE
 	help
 	  Build a squashfs root filesystem
 
diff --git a/package/ifupdown-scripts/Config.in b/package/ifupdown-scripts/Config.in
index 166094c51..1607fa696 100644
--- a/package/ifupdown-scripts/Config.in
+++ b/package/ifupdown-scripts/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_IFUPDOWN_SCRIPTS
 	bool "ifupdown scripts"
-	default y if BR2_ROOTFS_SKELETON_DEFAULT
+	default y if BR2_ROOTFS_SKELETON_DEFAULT && !BR2_PACKAGE_SKELETON_INIT_PORTABLE
 	depends on !BR2_PACKAGE_SYSTEMD_NETWORKD && !BR2_PACKAGE_NETIFRC
 	help
 	  Set of scripts used by ifupdown (either the standalone one,
diff --git a/system/Config.in b/system/Config.in
index e71e57915..3e90e94cd 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -238,7 +238,7 @@ if BR2_ROOTFS_SKELETON_DEFAULT
 
 config BR2_TARGET_ENABLE_ROOT_LOGIN
 	bool "Enable root login with password"
-	default y
+	default y if !BR2_INIT_PORTABLE
 	select BR2_PACKAGE_HOST_MKPASSWD if BR2_TARGET_GENERIC_ROOT_PASSWD != ""
 	help
 	  Allow root to log in with a password.
@@ -280,7 +280,8 @@ config BR2_TARGET_GENERIC_ROOT_PASSWD
 
 choice
 	bool "/bin/sh"
-	default BR2_SYSTEM_BIN_SH_DASH if !BR2_PACKAGE_BUSYBOX
+	default BR2_SYSTEM_BIN_SH_DASH if !BR2_PACKAGE_BUSYBOX && !BR2_INIT_PORTABLE
+	default BR2_SYSTEM_BIN_SH_NONE if BR2_INIT_PORTABLE
 	help
 	  Select which shell will provide /bin/sh.
 
@@ -330,7 +331,7 @@ config BR2_SYSTEM_BIN_SH
 
 menuconfig BR2_TARGET_GENERIC_GETTY
 	bool "Run a getty (login prompt) after boot"
-	default y
+	default y if !BR2_INIT_PORTABLE
 
 if BR2_TARGET_GENERIC_GETTY
 config BR2_TARGET_GENERIC_GETTY_PORT
@@ -388,7 +389,7 @@ endif
 
 config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 	bool "remount root filesystem read-write during boot"
-	default y
+	default y if !BR2_INIT_PORTABLE
 	help
 	  The root filesystem is typically mounted read-only at boot.
 	  By default, buildroot remounts it in read-write mode early
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
