Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D62E95A8E
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 08:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B6C2820D1;
	Mon,  9 Oct 2023 08:06:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B6C2820D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZbGmKFBvdipU; Mon,  9 Oct 2023 08:06:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AD6C82150;
	Mon,  9 Oct 2023 08:06:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AD6C82150
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D70921BF355
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 08:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B00DA60FC1
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 08:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B00DA60FC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Pj4CZkmteWX for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 08:06:30 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 562CA60C09
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 08:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 562CA60C09
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32003aae100so3153617f8f.0
 for <buildroot@buildroot.org>; Mon, 09 Oct 2023 01:06:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696838788; x=1697443588;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=264nlRKXKcKFI1nVahdQxbhOFIkX9WdClCjkeAcoMW0=;
 b=sesC663TujcdSkUDTmG3BbVOiLVl2SQR24u4CxbVl6ANSpDQqjxH8Fjd0F4/v0kljH
 c8oK90dE4fppx1RKKqG40XaQ+Zd2E6JbTiQ4VCT0M1SPBn8pTUQ9vmSlkNzpyq42d+8V
 iyKYsdfPO0c+XRaHsjSmKsFwAhlIpQ36UBEajhJYgMDCI+3yKknvqU/PrzQqDXCW91g7
 mgzSzAq95RoSp8xBmvJ5xs0hLNU64HnXuEWq2VAWO9VFNN+kv/QlOzC2LRcmN8j7Cba/
 WrOzGyqXI67qiCiwoIdYuZUu/R32NKQJzUw9wiLC1Q1ovVDth2J+Slwbns8vdGNeToLZ
 j5cw==
X-Gm-Message-State: AOJu0YxA3R6UcDH6fAEW2l47VtAyCrVqBG2RlH8OhOO00X0H5L35/+x0
 kEws7zRlCxi+BEd6P7UBJJh4mTWbw2Oi02SgBsbNFTzr
X-Google-Smtp-Source: AGHT+IEFocwH4rSQZLdLxVZn/+8SabuAvGXxuij4dKhdaJKFJULtVuW5B6CvdQEC7Qhzu8jx7eRAag==
X-Received: by 2002:a5d:55c7:0:b0:321:6339:f523 with SMTP id
 i7-20020a5d55c7000000b003216339f523mr9710724wrw.22.1696838788065; 
 Mon, 09 Oct 2023 01:06:28 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a5d4b0f000000b00325aca09ad1sm8902521wrq.24.2023.10.09.01.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 01:06:27 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  9 Oct 2023 10:06:12 +0200
Message-ID: <20231009080612.23347-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009080612.23347-1-adam.duskett@amarulasolutions.com>
References: <20231009080612.23347-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696838788; x=1697443588;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=264nlRKXKcKFI1nVahdQxbhOFIkX9WdClCjkeAcoMW0=;
 b=qT5nUJb5WsZa8DMRZ7pGxm8Bfs2VEUTrSguThmoUoR9PnmdeJVLcxElalO1nRhcsDT
 43krwF4kOAaQ8NUG7/RjacHgkLpqs2hW9BOH0+dAIY21adPePTBnTOB4C1apRGurzQOp
 cCaU9/dsD5Fh4X+2bd8ED0fk4SPdKRr6KLPsw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=qT5nUJb5
Subject: [Buildroot] [PATCH v3 2/2] package/refpolicy/Config.in: depend on
 merged usr when selecting upstream
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Refpolicy contexts expect a merged /usr file system. In fact, there
are no references to /bin, /sbin, /lib, or /lib64 at all. However, if a user
wants to go through the trouble of creating a policy that works with a
non-merged system, they should be free to do so. As such, only select
BR2_ROOTFS_MERGED_USR if using BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v2 -> v3: Depends on, do not select BR2_ROOTFS_MERGED_USR [Yann]

 ...ount-dbus-interface-must-be-optional.patch | 33 -------------------
 package/refpolicy/Config.in                   |  4 +++
 2 files changed, 4 insertions(+), 33 deletions(-)
 delete mode 100644 package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch

diff --git a/package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch b/package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch
deleted file mode 100644
index adec7d98d0..0000000000
--- a/package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 6c6be65ccf0891391681d4662cc11f508c0f4aeb Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Mon, 24 Apr 2023 14:24:49 -0700
-Subject: [PATCH] mount: dbus interface must be optional
-
-If DBus isn't built, the build process fails due to mount.te always using a
-dbus interface even if the dbus module. Fix this by setting the dbus interface
-as optional.
-
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
-Upstream: https://github.com/SELinuxProject/refpolicy/commit/207b09a656c2c3ac5c286d3f7eef085325e35408
----
- policy/modules/system/mount.te | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/policy/modules/system/mount.te b/policy/modules/system/mount.te
-index d028723..af84af0 100644
---- a/policy/modules/system/mount.te
-+++ b/policy/modules/system/mount.te
-@@ -145,7 +145,9 @@ selinux_getattr_fs(mount_t)
- 
- userdom_use_all_users_fds(mount_t)
- 
--dbus_dontaudit_write_system_bus_runtime_named_sockets(mount_t)
-+optional_policy(`
-+	dbus_dontaudit_write_system_bus_runtime_named_sockets(mount_t)
-+')
- 
- ifdef(`distro_redhat',`
- 	optional_policy(`
--- 
-2.40.0
-
diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 0e72b895df..d2fe391d8d 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -36,9 +36,13 @@ choice
 
 config BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION
 	bool "Upstream version"
+	depends on BR2_ROOTFS_MERGED_USR
 	help
 	  Use the refpolicy as provided by Buildroot.
 
+comment "Upstream refpolicy requires a merged /usr filesystem"
+	depends on !BR2_ROOTFS_MERGED_USR
+
 config BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
 	bool "Custom git repository"
 	help
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
