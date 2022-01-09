Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26614C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 11:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBF94404F1;
	Sun,  9 Jan 2022 11:25:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k7frTM_dXN6b; Sun,  9 Jan 2022 11:25:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8C3340497;
	Sun,  9 Jan 2022 11:25:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C4A11BF370
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46FCB40497
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:25:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9cffOJGG9dKA for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 11:25:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2EFFB4047C
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 11:25:01 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id q8so21109812wra.12
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 03:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GcW4wuBrTyTjnQBc6FqNdHSYF6tFxnwo6JN5i8uUYMo=;
 b=EeIctEa7NTwVsu+o4v/DbXnT449Ch/XuR6DVSdFoVYyKFP4TAJ5eQJBK1uiMiac5gp
 TzBVgHkPd7nfff1u/mN6aw3XOCcgNp6BCkx/szTlADaJIgxwVj0bJVnJuf5aY2/5ajBE
 1/h9q41ShdKvvS9kUaX/Pmp5fv9gJgxuGRifZCQtkieCznTHFx6bVx3BUykwvVr4flEC
 ROMyi8vL762YzgyvcmpNitpDkLt0fSJCUidrWuLd98uGoQE1Z13qCUykm6Q4biYH/lSt
 S9lZjbQ5zKYKva5I45LpN2CjGthc5SoUkSiWeA5cJETmuISkFsg1Revc/3rfjTGgQq3s
 ccAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GcW4wuBrTyTjnQBc6FqNdHSYF6tFxnwo6JN5i8uUYMo=;
 b=BGMtX5ddhdR6R3+YONyOMmU5D9pwldfm64wt6ZrEPLdVvJc9UO6omCzE9ETGPVsb++
 Gpjvu+1arrCbVcNjEc1Me6ZyotBQUCszbfA+I5o8JRZ7DUzDccSuhpWKOo0xjyjIzoAs
 nC9eF45QxgwDAF6b8/Tk2fSwWo64WQl0XwejFc/cps9ehhvD9K4rc4eiz8VemnJEDZJH
 NeNssVKNDNmqy+Us53OYelgNykzkPML9p0CK+geN6onxBa0ihTlQOE4pedslx3864FJE
 4pOxUji8/IjkNTGO1d7X8TeIwXSVBdRQAOfZnXYF+QijJ64RUxfDzk8pI2/y/1NJ5x7F
 3jJQ==
X-Gm-Message-State: AOAM530vSVWYMMWFfj+sSk95JQbQvX3hhMwF7x0o3Qylhgqhn7eEWoZI
 5Ac5uFJ3r17MUyS0dIscTqTIdAJK994=
X-Google-Smtp-Source: ABdhPJysY7W0zK1oCo1IZEz5FhzkEEE7F9dbrIkevfIk8QObdkgG1sYrxQ9Kw84fhooXac+xMMvdGA==
X-Received: by 2002:a5d:608c:: with SMTP id w12mr59802309wrt.384.1641727499233; 
 Sun, 09 Jan 2022 03:24:59 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id ay39sm3762930wmb.29.2022.01.09.03.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 03:24:58 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 12:23:37 +0100
Message-Id: <20220109112337.294418-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/btrfs-progs: fix build on kernel <
 5.10
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

zoned depends on kernel >= 5.10:
https://github.com/kdave/btrfs-progs/commit/d4b4baf312ff083fb1e85de92167ea3e968c684c

Fix the following build failure raised since bump to version 5.15.1 in
commit 20181c3f1b7191d2b6a1b78bfbe32c1f58e87359:

checking linux/blkzoned.h usability... yes
checking linux/blkzoned.h presence... yes
checking for linux/blkzoned.h... yes
checking for struct blk_zone.capacity... no
checking for BLKGETZONESZ defined in linux/blkzoned.h... yes
configure: error: linux/blkzoned.h does not provide blk_zone.capacity

Fixes:
 - http://autobuild.buildroot.org/results/381c7e8b4bfa624c3eca3ce072cfa412aba57f84

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/btrfs-progs/btrfs-progs.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index b010a0e0be..54922df839 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -44,6 +44,12 @@ else
 BTRFS_PROGS_CONF_OPTS += --disable-libudev
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10),y)
+BTRFS_PROGS_CONF_OPTS += --enable-zoned
+else
+BTRFS_PROGS_CONF_OPTS += --disable-zoned
+endif
+
 HOST_BTRFS_PROGS_DEPENDENCIES = host-util-linux host-lzo host-zlib
 HOST_BTRFS_PROGS_CONF_OPTS = \
 	--disable-backtrace \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
