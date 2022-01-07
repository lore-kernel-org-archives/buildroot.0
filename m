Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35F9C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 22:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CA9160B36;
	Fri,  7 Jan 2022 22:59:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pMlbih_a1SVP; Fri,  7 Jan 2022 22:59:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7966D60B10;
	Fri,  7 Jan 2022 22:59:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7CED11BF30A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7758E82EE1
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:59:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7yejWYAHXfmQ for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 22:58:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9680282C04
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 22:58:59 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v6so13710500wra.8
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 14:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ESIGDQIBts8kpQTyHt7XjW/2uq3Whz8un5mNEAJ6DJI=;
 b=IiQUlUMQuqk5rR5oIma/fiNNhpvWGfXRsM5hKIbLq2FHGL4VB74zhikT06/AiEWQ5t
 ZURfYnisQqauZh52jS9BLCYTOCLc4ccd58k1I2BRnwaOTRmBQqpUwbnpB9JwzGbao6mp
 GNcBwIttld9vzhmMkdQOPExlJcbd4eeqT61UtKIS/AG5r4YuJ2HrawPafurnHtmQzTlj
 iPMts8bGE3LDvuZtsoEvnfoFcmNbjbiC8LIw7vR5HjzmcCgujPyEZhVzMCQbS155k/y+
 M9MTETe1v7+zBK+r2/0gYFN3JclRjRoCuluYyuZKkMhRxijJB1Lcx0RJmQ2+7Z91WjyO
 t8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ESIGDQIBts8kpQTyHt7XjW/2uq3Whz8un5mNEAJ6DJI=;
 b=dJWzixogzGCLWJus4Z24jA4FFD7/fzflJilUz+W3K6AkzNbT+DAQ2iJ2aXm6OHtH2G
 e1HxxlbhhieV3NVmtEIggXfPXsisiFN7u4ypOBP2RHHSCEucIA4WxGcrmuQdcF992gvG
 yVuh37PICpMWZpujfdbwFHaMcSczbyxY++tqBXSIZlJU2f9qe3dCCJq3bAniHnwhS5O0
 PZGZO0TGz273gTPQyQ6Tun95FPNl//qK0G7VV9jWY/dE6LleIC24TW4Z5D4we8R8vv/W
 2pYHFknfEg7zK4edaZv/C5p8TSO07JX+jK8TdzwVxZAjPaTKfQowzw5UFnGzhWgSi/R7
 ZR1w==
X-Gm-Message-State: AOAM530oEgRY41Bg+qVe8HrTxB0SYQNkdw5Uf+gtHhI0BFH6gH/3vrSs
 myLkoJmK1NBG3kNT+u9mQJMwEx/NPFI=
X-Google-Smtp-Source: ABdhPJzeh+kgbc6KlodYDIyIpYo9TZZbL6QQXd8trUK/VKnfuDX2toXuYR8Pbx7ilvWyBtaBh7ikbQ==
X-Received: by 2002:adf:e4ca:: with SMTP id v10mr8150417wrm.536.1641596337703; 
 Fri, 07 Jan 2022 14:58:57 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id b4sm39849wrw.4.2022.01.07.14.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 14:58:57 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 23:57:39 +0100
Message-Id: <20220107225739.2145636-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/xfsprogs: bump to version 5.14.2
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

liburcu is a mandatory dependency since version 5.14.0 and
https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=e4da1b16e29f6fe6b34de9b9b0f97141fb2e1855

https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/tree/doc/CHANGES?h=v5.14.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xfsprogs/Config.in     | 3 +++
 package/xfsprogs/xfsprogs.hash | 2 +-
 package/xfsprogs/xfsprogs.mk   | 4 ++--
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index b8e07cc83d..a382b63ff8 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -1,12 +1,15 @@
 comment "xfsprogs needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_XFSPROGS
 	bool "xfsprogs"
+	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_INIH
+	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
diff --git a/package/xfsprogs/xfsprogs.hash b/package/xfsprogs/xfsprogs.hash
index b379839e7e..bb546601dc 100644
--- a/package/xfsprogs/xfsprogs.hash
+++ b/package/xfsprogs/xfsprogs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/sha256sums.asc
-sha256  e04017e46d43e4d54b9a560fd7cea922520f8f6ef882404969d20cd4e5c790e9  xfsprogs-5.10.0.tar.xz
+sha256  01ccd3ef9df2837753a5d876b8da84ea957d13d7a461b8c46e8afa4eb09aabc8  xfsprogs-5.14.2.tar.xz
 
 # Hash for license files
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 71d02278e9..695471bddc 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-XFSPROGS_VERSION = 5.10.0
+XFSPROGS_VERSION = 5.14.2
 XFSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/fs/xfs/xfsprogs
 XFSPROGS_SOURCE = xfsprogs-$(XFSPROGS_VERSION).tar.xz
 XFSPROGS_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1 (libhandle, few headers)
 XFSPROGS_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
 
-XFSPROGS_DEPENDENCIES = inih util-linux
+XFSPROGS_DEPENDENCIES = inih liburcu util-linux
 
 XFSPROGS_CONF_ENV = ac_cv_header_aio_h=yes ac_cv_lib_rt_lio_listio=yes PLATFORM="linux"
 XFSPROGS_CONF_OPTS = \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
