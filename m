Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1990C433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 02:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 410F94091C;
	Mon, 31 Jan 2022 02:45:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q8Ke4SzPK-Xr; Mon, 31 Jan 2022 02:45:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D0C240908;
	Mon, 31 Jan 2022 02:45:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4DC591BF471
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 02:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CE0E40908
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 02:45:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f32r7inycCLp for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 02:45:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6CF57408FF
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 02:45:38 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id s9so24162778oib.11
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 18:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UGU152CI6fcFQ22X/1gULakkRHoWnVdSoT+7fNmwJao=;
 b=o6yb/qHxoGrj3XPguSX2j0/kZ3WTjzSw057tGEZVAu8dYAExT1L04Tl+Q9PnUCtR+Z
 /TT1FVIiLX8L2R+zBCvYtiWgG+iMDpQqJ3o+tgOUEBlfeEpldeNSCWKZmkbywBGjRgqH
 Ncyh1B+TixQyl34IlrSdXIl3E/U7YrMc40mrXoaozMQhVU2Vnxg/XQ1l543kF/HII6Y0
 3z9POy7daymMwIqqet7YcMRti/kqUEeomvLVD+zgfOycegOUsemy2ci5RadtrAMrbVey
 zAc+nUJbTeDaLnajsBk0B+QYrJ6wBTbblYYgrp2tunQd8SiDYnUvwkLTJo35uOGB9RqG
 RZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UGU152CI6fcFQ22X/1gULakkRHoWnVdSoT+7fNmwJao=;
 b=lRNbZEFeJJr2IcDf6XG99TOxEh8GVA0xcIQeP4iFkf0cvdikrmpNxXLry/Am5Ng/Ac
 oG1R2T8gfjmq6qxUcMjNYaRJL1t791i6Rhly1enCYgsf2E9aytkJaJ0hlWB0joSnWYQu
 yhcbrpmcwKc8312GR+5FAuXGW9gBicJl7iJh+L4Xj7yKnvThGIA0Tee9uIyiPX6xyOzn
 NJXdzo16Y/+BPUhQX7oP9kLacJ/zQ+pbY6LuR7CX8ujXmvKcsK4IUMnTa1ItZS8f3mvD
 xlnlw+1RbuaZSWXJ5X2nh777nTrKxwo8i1Nf5g/ti7EAmQCvVIstkRPTw/FhuxMsayZA
 IEeA==
X-Gm-Message-State: AOAM531WyyPQO2YovwgFEDpWEKH7EdYZsOWH1hJ4yMGmYEOTs9pPEo6c
 XJcYZZgXkJ4BnJtn0mvc3FsEgUozi7s=
X-Google-Smtp-Source: ABdhPJzodKglE1DGBAqNZrsyunsoPQNhOBH0PceDwMvKQrZ/2zdte+fk/ZWzDSqdLE3CKjboh+0usA==
X-Received: by 2002:a05:6808:e8c:: with SMTP id
 k12mr11393775oil.66.1643597137507; 
 Sun, 30 Jan 2022 18:45:37 -0800 (PST)
Received: from localhost.localdomain ([201.37.117.8])
 by smtp.gmail.com with ESMTPSA id v4sm10363585oou.1.2022.01.30.18.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 18:45:37 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 23:44:51 -0300
Message-Id: <20220131024451.2580165-2-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220131024451.2580165-1-ricardo.martincoski@gmail.com>
References: <20220131024451.2580165-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/thermald: bump to 2.4.8
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Two source files had their header updated to correctly state the licence
is GPL-2.0+, not GPL-2.0. There is no real licensing change to the
project in this bump.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
It is a bugfix release, so it is only for master:

Release 2.4.8
-Fix Ideapad thermal shutdown issue #328

Release 2.4.7
- Fix AC/DC power limit issue in some HP TigerLake systems
- Regression fix for RAPL MSR usage in xml config file
- Added Japer Lake and Alder Lake CPU models
- Debug scripts for log collection to upload
---
test-pkg config 1:
BR2_PACKAGE_THERMALD=y
BR2_INIT_SYSTEMD=y
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/459263710

test-pkg config 2:
BR2_PACKAGE_THERMALD=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/459264537
---
 package/thermald/thermald.hash | 2 +-
 package/thermald/thermald.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/thermald/thermald.hash b/package/thermald/thermald.hash
index 0a37f0e413..3a7c0f6952 100644
--- a/package/thermald/thermald.hash
+++ b/package/thermald/thermald.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  80c92902a89b72a9df85c51a8b5fc472cc01b4410600ef1f56d62c4ac23890c1  thermald-2.4.6.tar.gz
+sha256  3e5a5033339c021de41ed4f946dd39e13f79f722fb5bd98d798e83658184c39b  thermald-2.4.8.tar.gz
 sha256  e98be8bc482e038a14bfbc01caf800bbd0024fff275ef14cd999db6560254a8d  COPYING
diff --git a/package/thermald/thermald.mk b/package/thermald/thermald.mk
index 9b303104e3..4e43277128 100644
--- a/package/thermald/thermald.mk
+++ b/package/thermald/thermald.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-THERMALD_VERSION = 2.4.6
+THERMALD_VERSION = 2.4.8
 THERMALD_SITE = $(call github,intel,thermal_daemon,v$(THERMALD_VERSION))
 # fetched from Github, with no configure script
 THERMALD_AUTORECONF = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
