Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0267FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 17:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A56A60C0D;
	Sun, 29 May 2022 17:22:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2-0KmLKOqWRk; Sun, 29 May 2022 17:22:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A261A60BD7;
	Sun, 29 May 2022 17:22:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DCE691BF3DB
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 17:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA2458437B
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 17:22:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E6Ixi9CK1ilS for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 17:22:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E80378436F
 for <buildroot@buildroot.org>; Sun, 29 May 2022 17:22:46 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id e4so9527529ljb.13
 for <buildroot@buildroot.org>; Sun, 29 May 2022 10:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Xsyxm3funcHI9mB595B8gx0gy1CYvsQK4eqnV4tMhU=;
 b=VZlhyTMjpkKbxLqntwo1THgRalA34cpyfasZPVLYvu0c403YqIS/FHpoQ5PTSAYrwU
 Lh+LsMDRPKbijYgqC+4ntDvVw4WfCrRrDXPxN7O/81E36oueq6hyI/9uJx77O7PR9jVU
 2S7PwYiuzdcyZ7oYwGZWfaN1pvMr+2FSoe/jl1gJ32Gh+sbjCJWHvajOirekr8ghyXgY
 P18s8jzi3puYidbBJde6eR7UnmcbySOjuNlQlQB3KY6kftjBHcAV54Jz4IAoyvt094/d
 mCkn+KqOOwCHtvW98gYBh22Gq0/3gtklvJ3SXyTynu/s/gimBdxIbsJYD/uVmh3BOBle
 QF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Xsyxm3funcHI9mB595B8gx0gy1CYvsQK4eqnV4tMhU=;
 b=VxfxB52TJOeVze95gvPCp7dApe8jDr+yrQc399ts4vQ38sHNLBqvmqQk87Bg1Py7G4
 apLGiyUjfZQOe61I2OqvCDIabQdt0iV8e5rjU4phHz3mm/QRx7vZhivv2H3cnSGybIva
 IaUWwLK5g5w7O9tzoFQEMvAm8KPewqNkjMjliN8fNNZsnGiPclp9ZCqefLj4DAgakkIJ
 xz+QyuxRdNuPc3/wh7umh5OrOxWJSK+2w1TdBHfTBbQoUVx6J+JRq7ZTIxn3EyuiLRz4
 gle3q75wsynt7WI9Bsq7Nk9mFqKuUZ3Ru2I+Q7BkkYPOUPXCKwlliSZjyBZz9BlUSg38
 02LQ==
X-Gm-Message-State: AOAM530bj3HJd0c/av6ASaGNTCPlszQjTufTj4ifleV8W6KTrjdHyIX8
 ySURAArP5aOBadXoGa2mmIhSZPz5EmQ=
X-Google-Smtp-Source: ABdhPJx2qF5FPnGhLK3t8ifdOhOFKd1osgEJyRlEvsgW2cmz7pWozuFsopj4bHX37g8iymsdjHdAZw==
X-Received: by 2002:a2e:9888:0:b0:255:4c03:21f with SMTP id
 b8-20020a2e9888000000b002554c03021fmr2975193ljj.7.1653844964439; 
 Sun, 29 May 2022 10:22:44 -0700 (PDT)
Received: from localhost.localdomain ([176.10.248.199])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a056512368200b0047255d210e1sm1866509lfs.16.2022.05.29.10.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 10:22:43 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 19:22:35 +0200
Message-Id: <20220529172235.446567-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sysklogd: bump version to v2.4.0
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

NEWS
  - Support for setting secure mode from the .conf file
  - Support for running in containers, mainly disables kernel logging
  - Support for running external scripts on log rotation, incl. SIGUSR2
    to initiate log rotation
  - Fixes for 8-bit data logging, use `-8` to allow
  - Fixes for malformed wall messages

See ChangeLog[1] for details, or the release notes[2] on GitHub.

[1]: https://github.com/troglobit/sysklogd/blob/master/ChangeLog.md
[2]: https://github.com/troglobit/sysklogd/releases/tag/v2.4.0

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/sysklogd/sysklogd.hash | 2 +-
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index 19405a9877..16a8bb4609 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  9a410b484713d9600c820d8113f2d80cb14708328c908b1a28e8b7b31fd54f57  sysklogd-2.3.0.tar.gz
+sha256  1d9ed88a772af95c8b46c9e92ddc5bf4a76ac233ec5850f084290b80df7e02c4  sysklogd-2.4.0.tar.gz
 
 # Locally calculated
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 20ce9d60e3..d6db71e50c 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.3.0
+SYSKLOGD_VERSION = 2.4.0
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
