Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C65C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 14:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 499954010F;
	Sun,  9 Jan 2022 14:04:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cjoFvfvgv-XF; Sun,  9 Jan 2022 14:04:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DD12401B2;
	Sun,  9 Jan 2022 14:04:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2561E1BF4D6
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 14:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 140FA60B1B
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 14:04:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MxlEC58HdcwP for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 14:04:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22F5F60B12
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 14:04:32 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id b7so13838836edj.9
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 06:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=yE6Qz4lP+STQ6dTCBADP3vHfs/OVSLuUOL7lBochYgQ=;
 b=YQ5VHcsLo1343vx3xRcFSwz9BEDVHmFFd1N2OdZMCwel2LYKEoP8pb+qvwfPm0uP+w
 iY7T/T70eXrOoJi02ZkC+BQ5wuRUELa07llJKyxydK8Ij1VsklsWt2iBk2s42xspckdj
 A3Qup4aFmInkGZGVbUL3aM9GvvSczAzFStC+4r7SKeFy3oNZ8jdL7euMiDqwZO7VYZpj
 +qEBia9+Ok9xEcHAc08vOGFD6kahXaTz7jE30iBH94V4x8pephiTznQjcIi0eP/fiiOg
 aX/3SE7GGaDaXo00F6HOgRjNiXvO0sDjZr0h7bvksJ5nxzup74rxpV2reTExjuAde3Sx
 lByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=yE6Qz4lP+STQ6dTCBADP3vHfs/OVSLuUOL7lBochYgQ=;
 b=dH5cxwzO1DD/8wJRAz2ULGM+w45krAoJmJ1hGRXTDsDuvYBN0b1MC5NaWcPVMYQMI0
 NiLkaB13B/a0H3Xo8FjV8OwP5rrcI/3ctYS2iM5jMme9qCzIX+FHzaIv/xvpEU4+ah1C
 RQ7erl1Xwj9lM2aYqSgHTMkCE+zkq1ZkkhioJLh54qGZM1jz2u4U/EW9z1YWN4KN5rnV
 hi1XGGnAyaj6ix0bWhFfRBI1LQbhG+MjCMqyoyArfiFshyI/sZqusNJa9QNoIBU/5kAk
 g9dUyEZB57uZh6wod27dzKh7+byjbe9c2crfN3blSsd2FnbVG59agH1L307HaEoE/ABA
 J49w==
X-Gm-Message-State: AOAM531j1rmKPPX2eQA07eZ1BofBoKs1lPuXQYrpwRsjBlfPeE3Q/vLe
 /gHzznSji+bkkZqcvIB930jb7N8IHx8=
X-Google-Smtp-Source: ABdhPJxV2yGsNnbrBMkru1cmdex3WJX0icxT32OTlQhxa5cdL7wMYAdblBGmcrgqj/ZM4+q5VDRn2Q==
X-Received: by 2002:a17:906:9948:: with SMTP id
 zm8mr12800637ejb.396.1641737070098; 
 Sun, 09 Jan 2022 06:04:30 -0800 (PST)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202])
 by smtp.gmail.com with ESMTPSA id cn9sm2068003edb.88.2022.01.09.06.04.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 09 Jan 2022 06:04:29 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 15:04:21 +0100
Message-Id: <20220109140421.27820-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
Subject: [Buildroot] [PATCH] package/avrdude: bump to version 6.4
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

The project moved to GitHub, hence change the download location.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/avrdude/avrdude.hash |  4 ++--
 package/avrdude/avrdude.mk   | 11 +++++------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/avrdude/avrdude.hash b/package/avrdude/avrdude.hash
index ec43355451..1c7758afcd 100644
--- a/package/avrdude/avrdude.hash
+++ b/package/avrdude/avrdude.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2a09913450c6457c3fe8d43d5141de579d4e57d67e593e7399a4cd3768cc60f9  avrdude-r1450-br2.tar.gz
-sha256  201babc7da198873304a77a30dbfc7ca449c9bba52df2dffa4cca0009dbdfcb2  avrdude/COPYING
+sha256  bbe2cf09163b3561ea28e9d48c2a588838f7adcd7858e34ced9c886feacb5be6  avrdude-v6.4.tar.gz
+sha256  201babc7da198873304a77a30dbfc7ca449c9bba52df2dffa4cca0009dbdfcb2  COPYING
diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index ae623a7929..5bbbc4e8c2 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-AVRDUDE_VERSION = r1450
-AVRDUDE_SITE_METHOD = svn
-AVRDUDE_SITE = http://svn.savannah.nongnu.org/svn/avrdude/trunk
+AVRDUDE_VERSION = v6.4
+AVRDUDE_SITE = $(call github,avrdudes,avrdude,$(AVRDUDE_VERSION))
 AVRDUDE_LICENSE = GPL-2.0+
-AVRDUDE_LICENSE_FILES = avrdude/COPYING
-AVRDUDE_SUBDIR = avrdude
-# Sources coming from svn, without generated configure and Makefile.in
+AVRDUDE_LICENSE_FILES = COPYING
+
+# Sources coming from git, without generated configure and Makefile.in
 # files.
 AVRDUDE_AUTORECONF = YES
 AVRDUDE_CONF_OPTS = --enable-linuxgpio
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
