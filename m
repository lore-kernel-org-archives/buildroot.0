Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67CDC433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 07:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 728624025D;
	Mon, 24 Jan 2022 07:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Edwo_tr2ZHJs; Mon, 24 Jan 2022 07:40:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81D0E4015C;
	Mon, 24 Jan 2022 07:40:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 56A8E1BF356
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 07:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 447FC60AD6
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 07:40:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q5tFwn6uqxoZ for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 07:40:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4734460AD2
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 07:40:39 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id b15so126112plg.3
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 23:40:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kor4SgieObnHk0krk1y4sNpx9Wtzy5/lQyxhJAsMgY0=;
 b=Mq/GnbUGeGcNKr5yooM9paJ2/wPyheXs5u9sCBHdj9L/BWVG1BDN6HAs0xa7oCoePM
 hxmTKfgy6Qr+UjkaOOVDxKKPRDtfIWIhUms5n/AlqZCjPSvMKb1RT5b6uXaFrCEjtif3
 DJiev1SMI1ozX1lu6iK5iyIGu8a6ZKMwAHG9aWVyKhpoEZMqYI1F/gCYBmj3JbkiJ3TB
 v2bUTFXr0Zim0eHP3UlsjRiw0dFxnHUhfMLbhZZb8/j3aF+uGFXPF9KdOpsVF/5B7w9a
 aYTDBFylI4e6F3IyGd03XI1nwKNlXzT9BqY0FtDs7J6Zf5oF1JkkwEGnlDj8gfUJntLh
 2yyg==
X-Gm-Message-State: AOAM530U+16iS0ATOwM6F6IzXy6cMz4zm89bJ1+52R6NrlAgvtF7RQU7
 g78DSewB9FVGlBrdUuonqeO6znDryhTaUA==
X-Google-Smtp-Source: ABdhPJyf7SjuKMYybGALUWJA4taIb0JVXk2Q8EC5tgxb9KpUFh1rWiM40y221FjdIp7he/avirVMJA==
X-Received: by 2002:a17:902:690b:b0:149:6e91:9693 with SMTP id
 j11-20020a170902690b00b001496e919693mr13055810plk.162.1643010038524; 
 Sun, 23 Jan 2022 23:40:38 -0800 (PST)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 l17sm1826221pfu.61.2022.01.23.23.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 23:40:38 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 23:40:36 -0800
Message-Id: <20220124074036.53636-1-christian@paral.in>
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
