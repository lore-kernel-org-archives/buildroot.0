Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6F0C433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 07:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06F5740273;
	Mon, 24 Jan 2022 07:41:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ULK8KtGoVdYs; Mon, 24 Jan 2022 07:41:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E27F4015C;
	Mon, 24 Jan 2022 07:41:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 417641BF356
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 07:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C5334015C
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 07:41:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ETowqByah1nb for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 07:41:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 30E2A400F1
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 07:41:55 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 h20-20020a17090adb9400b001b518bf99ffso12412345pjv.1
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 23:41:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kor4SgieObnHk0krk1y4sNpx9Wtzy5/lQyxhJAsMgY0=;
 b=xq92F2F39BNR+HhjZYHnIvp9lP1gb0xQ+FBWTXbgkxLnrOmVrqZ/OhdU3GbPdlDmli
 jqMiWIK66f4qix7zdTQCxDF8VnxW9xBLmCsU2uklfDkFjDXfupAQxRe5eL9X9+n7Gq3P
 oZV5p5IqdCpcXFZCQ+faAPevV4OwNEl7YwfhAWsvNLuB6o05JW9WBoiXgyUTk0TPcmhu
 ns4P6mLXM3QntDCjAXVxMVo4EK7rS+R7E+h+2NEPQgZBkbyr+LTAdi835ORpo1HeMBEu
 DuLFsn5Q04iatSkoorcKT30k/KGpLsx0uy/wc78gY0iAqOht+xqpS9aH0qHjLYqke9Gx
 emxQ==
X-Gm-Message-State: AOAM530uDCzGnOI0tDPwl+T7t4oe2anAjhOTBmNp05l1OsSb1w+B6SoG
 9hRlgZh89GoLN9SnXRMdlpHuFxq59D7MPA==
X-Google-Smtp-Source: ABdhPJyjsxB8UM9UAw5tYcBFLxH2oCnM53sZo5RRTyYBZPRO42hi/e1uKau991bp/t4AEt3KRnAMzg==
X-Received: by 2002:a17:90b:33c6:: with SMTP id
 lk6mr688098pjb.217.1643010114408; 
 Sun, 23 Jan 2022 23:41:54 -0800 (PST)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 n35sm10400171pgb.25.2022.01.23.23.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 23:41:54 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 23:41:51 -0800
Message-Id: <20220124074151.58966-1-christian@paral.in>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gocryptfs: bump to version 2.2.1
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/gocryptfs/gocryptfs.hash | 2 +-
 package/gocryptfs/gocryptfs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gocryptfs/gocryptfs.hash b/package/gocryptfs/gocryptfs.hash
index 94487815f5..ae161d1cd8 100644
--- a/package/gocryptfs/gocryptfs.hash
+++ b/package/gocryptfs/gocryptfs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4d89b76fe0b0c7218099f6f0ea6c1c87efe13927d95579a6ede82f20b6dbe48a  gocryptfs-2.2.0.tar.gz
+sha256  88f32bb8e18fa89e4ab666f7c8ad622281a11e423b4093e50ac260f960bc40b6  gocryptfs-2.2.1.tar.gz
 sha256  322a7e3b02cf18e38b7e6b18cafefb773df8676c65634b34e8a2beb931294a4b  LICENSE
diff --git a/package/gocryptfs/gocryptfs.mk b/package/gocryptfs/gocryptfs.mk
index 2a00e9a959..8f70dba7c3 100644
--- a/package/gocryptfs/gocryptfs.mk
+++ b/package/gocryptfs/gocryptfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GOCRYPTFS_VERSION = 2.2.0
+GOCRYPTFS_VERSION = 2.2.1
 GOCRYPTFS_SITE = $(call github,rfjakob,gocryptfs,v$(GOCRYPTFS_VERSION))
 GOCRYPTFS_LICENSE = MIT
 GOCRYPTFS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
