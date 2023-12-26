Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3DAC46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 22:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 452DB4192A;
	Tue, 26 Dec 2023 22:34:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 452DB4192A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qpx1AHO9sUuQ; Tue, 26 Dec 2023 22:34:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D681418C1;
	Tue, 26 Dec 2023 22:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D681418C1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A4791BF2A5
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 22:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32D3A61042
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 22:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32D3A61042
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lW_aqFqlVF9R for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 22:34:12 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 24D0761040
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 22:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24D0761040
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40d4ebcc207so34487005e9.3
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 14:34:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703630050; x=1704234850;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YuXhUDz0jVvhfxSfNsNcGMo31YIUDf0+kvVHAWNdWes=;
 b=JuLHFd0ECn4Qb3vg26tTIZXSqkM54Tt3H8LDZ7tshbrtKTaiKaJ3uyyH6QN5m1ExFl
 sc7XC0L8AeBqFjGCXldjVeyod0F4Nol676C6S17y0WffOYhbIczgHp+3JqSfm6X1GoQw
 bG94zGvUUayYZ7VHb0gzRJx8Ml4YGbE2GAGjC9aOQtGYIrd4Ux9Iym1r1t+/AnSpTRIj
 p/Gld6qo1abXsHLOLoirw3QudrrwoxPmaME08vMAuvRpyeNkJRar7WFYoLczNO9Dya3q
 O4H2VRh2rm7nFGYM+4Pbkqj6wXUYxC32HUMHXXnTZR/htV41oZmB2PwONwYEK5iwa8Ff
 JR2g==
X-Gm-Message-State: AOJu0YzRaqrwrByvfleecjCJY3wQ7dfvnSkQXnZNCS/VNnFP+61sIqZ6
 7vrm8gtms6dvfQ0IsGZzA9Dqzv0Eyro=
X-Google-Smtp-Source: AGHT+IHA8CcqDx6AkTORONtux55w7xJVpfL6ODVq04JwrrcplUPO3/F4MSIAmyT3dQSMSnoPZvDaKg==
X-Received: by 2002:a05:600c:3ba9:b0:40c:f7d:27b2 with SMTP id
 n41-20020a05600c3ba900b0040c0f7d27b2mr4410897wms.2.1703630049527; 
 Tue, 26 Dec 2023 14:34:09 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u11-20020a05600c19cb00b0040d531f4ecasm11382800wmq.15.2023.12.26.14.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 14:34:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 23:34:07 +0100
Message-ID: <20231226223407.2019962-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703630050; x=1704234850; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YuXhUDz0jVvhfxSfNsNcGMo31YIUDf0+kvVHAWNdWes=;
 b=Vx6xBMxs5dGQjsWt8a9p65tdB6+8qeH3ZMXQ1vDvKjWrGrju/Z+3TgB3Teh8OPGW91
 rWNTE9NBg8XzPHeGKHUp+uxtdVDDa9MFlAYvkurqB7nWC4oksK8ox66CxIpD6p6S+4xm
 N0Ac/L+gl1Ao8WGkNbdyIjU/FDO5UyJxuUh5SfoOofIauXxaZdnebIn5QgLNY+eH3xVN
 omBLu994gk98ILJTCj54DlLIfWa93GTzYV9y3Wd6whal3yQsW7teUs9ULN9q9khO634J
 MfTHhFwuPtGlO0Ty562ihmnC7njmZB+WVEqmTzrvimcfb2edQ/GG4kbqiNMwHwccAEOz
 vn/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Vx6xBMxs
Subject: [Buildroot] [PATCH 1/1] package/zlog: bump to version 1.2.17
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

License changed to Apache-2.0:
https://github.com/HardySimpson/zlog/commit/1a7b1a6fb956b92a4079ccc91f30da21f34ca063

https://github.com/HardySimpson/zlog/compare/1.2.16...1.2.17

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zlog/zlog.hash | 4 ++--
 package/zlog/zlog.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/zlog/zlog.hash b/package/zlog/zlog.hash
index 3b7c6aa78c..19881183e9 100644
--- a/package/zlog/zlog.hash
+++ b/package/zlog/zlog.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  742401902f2134eb272c49631fe5c38d7aeb9a2ad56fa3ec3d15219b371ba655  zlog-1.2.16.tar.gz
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
+sha256  7fe412130abbb75a0779df89ae407db5d8f594435cc4ff6b068d924e13fd5c68  zlog-1.2.17.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/zlog/zlog.mk b/package/zlog/zlog.mk
index 329f2cfe2c..ccf2576529 100644
--- a/package/zlog/zlog.mk
+++ b/package/zlog/zlog.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-ZLOG_VERSION = 1.2.16
+ZLOG_VERSION = 1.2.17
 ZLOG_SITE = $(call github,HardySimpson,zlog,$(ZLOG_VERSION))
-ZLOG_LICENSE = LGPL-2.1
-ZLOG_LICENSE_FILES = COPYING
+ZLOG_LICENSE = Apache-2.0
+ZLOG_LICENSE_FILES = LICENSE
 ZLOG_CPE_ID_VENDOR = zlog_project
 ZLOG_INSTALL_STAGING = YES
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
