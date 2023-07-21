Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D7EC001DC
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 21:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 745ED4013C;
	Fri, 21 Jul 2023 21:31:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 745ED4013C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XEcuoLiZuPYK; Fri, 21 Jul 2023 21:31:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83E3A40482;
	Fri, 21 Jul 2023 21:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83E3A40482
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B5C91BF82F
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50952418A9
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:31:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50952418A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TFRupLbcgIc6 for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 21:31:28 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86A3A4182C
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 21:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86A3A4182C
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3fbc12181b6so21040825e9.2
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 14:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689975086; x=1690579886;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8sm1mn/Co5dq8YO+vCYOx3U2jWALIrmlHwMhmzYg7Hk=;
 b=crerWGi1fVerv7NE6QHOW1nbPAvRQ1VZdS9FvqnlnbPLJUv5yBwqKoKj/3VfBoqFhr
 l8srEGoTxH76tBf9edrwpdVrVrJZ41/23ezZa7S8qZc+4KFIQtDlSMJ/ssTbEdWEaPcQ
 hwPut7MBjD5lgmxrlWkNQcM9nCkcgS6Ip1hv/d5aYoP7dINHa4wVrTYhZntUHZp0S+HT
 U34IDuiM9kg+wG8ey9FOuiPDbhXqoLShqPXbsr7+mPQHNqoC3OkoRR6UJpnRMF5iIg27
 CnZ98bYCRPO4EiO4kPztmcqtLVS12d0YjFLHBAG4vDQv76f4OvIKkJPdO0NnEEL+8MMb
 5/ag==
X-Gm-Message-State: ABy/qLYtbnNsCHgGRmMsL1Sb7Bcr323PWjyjU3b7RWPNaju01diHLJDK
 GLo+4/5JQC8NaVhVH+Z4lqkVJA6R+AE=
X-Google-Smtp-Source: APBJJlGp+mIIvq8TBba3uZhaWD50B01ZsItz6/xZArB4QFdBEt98EEd3I8P1CC47e2mFjcr3e2usCw==
X-Received: by 2002:a7b:c318:0:b0:3fc:186:284d with SMTP id
 k24-20020a7bc318000000b003fc0186284dmr2427049wmj.18.1689975086358; 
 Fri, 21 Jul 2023 14:31:26 -0700 (PDT)
Received: from atlas.home
 (2a01cb05945b7e00020ec6fffec68e56.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:20e:c6ff:fec6:8e56])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a1cf20a000000b003fbca942499sm6871817wmc.14.2023.07.21.14.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 14:31:25 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 21 Jul 2023 23:31:21 +0200
Message-ID: <20230721213121.178783-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689975086; x=1690579886;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8sm1mn/Co5dq8YO+vCYOx3U2jWALIrmlHwMhmzYg7Hk=;
 b=J6WPs09NOAT4ztcYBqYEtqbnAP613holfLhr1mjUsmH1/edmp4dpU909FDIy5mahKY
 YrO4/GzCxMneJhU0133DLTVsu6akMHfJBJAs0xBbQsluiY5ZLlwhbL9Ey4E6wx5o34Mg
 jwWKDuLOqTyN/r+aHiHDENMzGryvoZ0Jj+2vaA+aEYwKR/uS+dc2tdU6DjfHrPG7J92o
 5276p3qwYkq7Y5gk5cGCH50s3a9iLiCinJYbgVpaavutzUptZNelAHgtQX9nzRql0AhG
 oFq17EWyKjxrAKQplx4MtgUqbbLE+Q/asRG8U8hVwdKY59NJtoRMD/Z6uiWCX6CmqY5m
 z2XQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=J6WPs09N
Subject: [Buildroot] [PATCH] package/util-linux: bump version to 2.39.1
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
Cc: Romain Naour <romain.naour@gmail.com>, christian@aperture.us
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.39/v2.39.1-ReleaseNotes

"The main objective of this maintenance release is to address bugs in libmount and
resolve the regression that occurred due to the v2.39 rewrite for the new kernel
mount interface."

It also fix a build issue with waitpid program when built with a toolchain
with headers < 5.3 detected in our gitlab-ci TestDockerCompose.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4664846019

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---

TestDockerCompose still fail due to a recent update:

 # github.com/moby/buildkit/frontend/gateway/client
 vendor/github.com/moby/buildkit/frontend/gateway/client/client.go:18:29: Reference does not implement comparable
 note: module requires Go 1.20
 # github.com/docker/compose/v2/internal/tracing
 internal/tracing/tracing.go:102:22: undefined: errors.Join
 note: module requires Go 1.20

Reverting 490882ada94cf98da145feb4e7e47302aa31104f allows to pass TestDockerCompose.
---
 package/util-linux/Config.in       | 11 +++++++++++
 package/util-linux/util-linux.hash |  2 +-
 package/util-linux/util-linux.mk   |  3 ++-
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index b5d8cad15b..be87494b35 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -436,6 +436,17 @@ config BR2_PACKAGE_UTIL_LINUX_VIPW
 	help
 	  Edit the password, group, shadow-password or shadow-group file
 
+config BR2_PACKAGE_UTIL_LINUX_WAITPID
+	bool "waitpid"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3 # pidfd_open
+	help
+	  Utility to wait for arbitrary processes
+
+comment "waitpid needs a toolchain w/ headers >= 5.3"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
+
 config BR2_PACKAGE_UTIL_LINUX_WALL
 	bool "wall"
 	depends on BR2_USE_MMU # fork()
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index ab1807a287..7ecd165459 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.39/sha256sums.asc
-sha256  32b30a336cda903182ed61feb3e9b908b762a5e66fe14e43efb88d37162075cb  util-linux-2.39.tar.xz
+sha256  890ae8ff810247bd19e274df76e8371d202cda01ad277681b0ea88eeaa00286b  util-linux-2.39.1.tar.xz
 # License files, locally calculated
 sha256  64dfeae1519bf0e27563d905a71264310fb6a8fa74e5cf99bb36e4d30d7ef455  README.licensing
 sha256  9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 621e43ba79..bdb4fd6b90 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -8,7 +8,7 @@
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
 UTIL_LINUX_VERSION_MAJOR = 2.39
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
@@ -184,6 +184,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_UTMPDUMP),--enable-utmpdump,--disable-utmpdump) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_UUIDD),--enable-uuidd,--disable-uuidd) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_VIPW),--enable-vipw,--disable-vipw) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_WAITPID),--enable-waitpid,--disable-waitpid) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WALL),--enable-wall,--disable-wall) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WDCTL),--enable-wdctl,--disable-wdctl) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WIPEFS),--enable-wipefs,--disable-wipefs) \
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
