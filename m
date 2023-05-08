Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BB4C77B75
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 05:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C791883B5F;
	Mon,  8 May 2023 05:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C791883B5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vb8OJNcoOiBM; Mon,  8 May 2023 05:40:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1FC883B41;
	Mon,  8 May 2023 05:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1FC883B41
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB3B31BF27E
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 05:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B86BB60F98
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 05:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B86BB60F98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XUdEzOaDpCid for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 05:40:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E9A060F65
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E9A060F65
 for <buildroot@buildroot.org>; Mon,  8 May 2023 05:40:44 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f14ec4efb0so2476750e87.2
 for <buildroot@buildroot.org>; Sun, 07 May 2023 22:40:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683524441; x=1686116441;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NO5t2A0Q0Bah07rLFVG0lniPXxvj6E5IdCv6c4VFZ/A=;
 b=lXsYEALWhtza/NVDURtDdXhUHH6Ol2qZEYkFnbZEIFQJeWpQ6coztPNvveI/eDB8ZX
 FcGruvrGkvOyBIIJfWdzw0oGc+fbJhUO4ZQ6hYByYiZR0+4xRPw4yZPUZ8SjjWyz1zkQ
 Uoj0gw70r55iA3DUU+cYeIkCvQDJhEAB4s4iNIVMm5HQi4zBe6xTqs53XSEjrsxmuLbU
 pe2BOgGzAgN1zHefZ2DMQ5Na5wte2JtCH30l+/NuN+CywRWfvU0tHSFoQDuV1/NgVneg
 qW9ZBzYtQ+lgcz8JeIHGgcxUY7FmDlUczGOJfMNzU2lX3cW9HtMurHqZu8ZHmgyI0E1u
 looQ==
X-Gm-Message-State: AC+VfDwaoX+aqzUBPB8YTw8lWmUkaxwXcXMhX6G3tl7Dz2sMxcLnHT62
 I2nP9vIuM6ASCWu/I4I8t30kFScWYsg=
X-Google-Smtp-Source: ACHHUZ5H+2HQkJpEu4GslA/XI0I/l73RpNJDmfZM3U9ifdtKugBb/GPIMmM5pesN+lnD5WEekpfhrQ==
X-Received: by 2002:ac2:42c9:0:b0:4dd:9ddc:4463 with SMTP id
 n9-20020ac242c9000000b004dd9ddc4463mr2316068lfl.5.1683524441289; 
 Sun, 07 May 2023 22:40:41 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 z15-20020a056512376f00b004ebae99cc1dsm1171891lft.159.2023.05.07.22.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 22:40:40 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 May 2023 07:41:34 +0200
Message-Id: <20230508054134.570140-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683524441; x=1686116441;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NO5t2A0Q0Bah07rLFVG0lniPXxvj6E5IdCv6c4VFZ/A=;
 b=FwX5op0/kbuvHBW8tGhyWlYsj/XNCeNZwIMamRDSukrljXsiCXJxA4l7AHJyKEB/st
 /e7GLWZVFVzHZjKzYmgeD8Q9+Gego4bJ4Y23T9KFGPvXEiTAWmdp+3JVnjEecxKXjQT3
 3niwuJSmYeERwyHp1J/8MUNq3vgZUDFjTVjM5f75gI/9VIc2ODqXV4OvaiOH2rZzPbaH
 W2jjoeDZymG7nUjus6Y+akx+u2Zv+/EK/wA5Qv3sTD3M0/gjoFlUqobLjv3ciTHHTwG1
 3AW6NT6BdJC4MR0AIBaDpm0pAB6nBVoHHgq9Vc+YE4E95y2Y7UrMCGVyJU2FWHh4d526
 ZH7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=FwX5op0/
Subject: [Buildroot] [PATCH] package/libcamera: bump to version 0.0.5
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libcamera/libcamera.hash | 2 +-
 package/libcamera/libcamera.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index ea204aee98..01505aa02e 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  13e53b33652b16454264b6eff0a6f032aa9331f919b07b6d0e622917ed7f7dd8  libcamera-v0.0.4-br1.tar.gz
+sha256  0cad66dc09520dddd47510603e053cc9913dc968db4cebe2ac5ddd43fd08fef6  libcamera-v0.0.5-br1.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 01c4cb2ff2..2e30077e20 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = v0.0.4
+LIBCAMERA_VERSION = v0.0.5
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
