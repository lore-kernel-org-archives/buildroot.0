Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFADC433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 23:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3AE860D91;
	Sat,  1 Jan 2022 23:00:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EBDnUTZhEEni; Sat,  1 Jan 2022 23:00:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23A8C60D7B;
	Sat,  1 Jan 2022 23:00:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 326911BF32D
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 23:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2195C60D7B
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 23:00:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RAV8b-9qGb2C for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 23:00:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F7E2605B3
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 23:00:10 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id v7so62279640wrv.12
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 15:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JyzYPodUwYwoSC3r7vigqAlXSwozdbFUf0XF31OttA4=;
 b=ATFQPB9aZZ5MfBoC/oxjzQM5yadQ5FY+yQ0+SzLXm38L2rAwBjR8N38Q1Lm2QNbBsU
 4jfunHr6U5Na1e3WunNUay/r7yFxBxF1MDiN7gMtd2dwhmMprwPFW3S/R1TZBjLrewjh
 o0ef+VeWHjML5JIR/GAFKB3oDewlZBis6mqcsFISCYqUKNh1INcTuUReUKS0unv3E20R
 LT5DN3Si9epEnnsKstt8NADzzjMwWq0+Dmr22pAhsZJunZZCoVGudrGJo2G9CqFaOvFT
 dJIq9IYviinrPV5JP3DmIL0PwvZ69hEzqSM6jqBMOL+pajWlutI5l1tbVxCs5axbH3o9
 nF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JyzYPodUwYwoSC3r7vigqAlXSwozdbFUf0XF31OttA4=;
 b=28tlOiC8F/6sx7yPdPS8uykVz6OLpu8+zUEokil/8M8oBPDZd/926ZXWlJ+oVcVITB
 634qLJxxGlP6+OfBpS69iB+Hb448H05E5tCKLJZ1bzhW+Sqp7GAarDds13akQY6u0yuT
 Kk4AF2tqPOZnOm0QDTLOezQB7n7H3/mUWATjJWL0bNd3kv1m+enU6C9CPyGqUN0Lf9+J
 xslK8J0fB8Poew80upuTWkp5gioq+KCTB9CRnuwvpLtviDKBM40buhJNM1S4cLgj7AMT
 KG7JCPHB/6W8AbjE9MkKG9gYHBQvZydk5yc31sQKDc/pmXT2bA0ininb1Felqna6VOc3
 /yoA==
X-Gm-Message-State: AOAM530nKfoc02sTjG4b3icyqvxxrcap9yerMPqmTa0GDYS0LF8sIxbN
 sx8idCwzKuNOoB3gUWT0KHuVy76lOH0=
X-Google-Smtp-Source: ABdhPJxYY8zPgCj8yBn1XzAWJ/ZpvnMU6ZbZ5MRlV7OzFjYTHVGt7MznBb+V+L2p6zJD0HJRX3N9oA==
X-Received: by 2002:a5d:6d85:: with SMTP id l5mr33566946wrs.579.1641078008369; 
 Sat, 01 Jan 2022 15:00:08 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id e1sm31420183wrc.74.2022.01.01.15.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 15:00:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 23:59:06 +0100
Message-Id: <20220101225906.2341845-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lxc: bump to version 4.0.11
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The LXC 4.0 branch is supported until June 2025.
Only bugfixes and securitiy issues get included into the stable bugfix
releases, so it's always safe and recommended to keep up and run the
latest bugfix release.

https://discuss.linuxcontainers.org/t/lxc-4-0-11-has-been-released/12427

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lxc/lxc.hash | 2 +-
 package/lxc/lxc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index efd7a8e42c..2b58df2f1d 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  a10c518056d2e497bd600e4ffac2853bdeab1e835bf455a6d87cc8df128bfae9  lxc-4.0.10.tar.gz
+sha256  afa481e17ca9a9cf9fd3d2d7a04e42a8f6bfe60b323909326c968e852cd9f02c  lxc-4.0.11.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 93f6d2535f..4d63fc14cb 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LXC_VERSION = 4.0.10
+LXC_VERSION = 4.0.11
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = GPL-2.0 (some tools), LGPL-2.1+
 LXC_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
