Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC8FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 13:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA66B400A8;
	Mon, 30 May 2022 13:22:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uO_EZXFIfDYi; Mon, 30 May 2022 13:22:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E38AC40A79;
	Mon, 30 May 2022 13:22:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0CA281BF357
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 13:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEA66419FD
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 13:22:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BgjeMXyJ1KTd for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 13:22:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73191419F2
 for <buildroot@buildroot.org>; Mon, 30 May 2022 13:22:49 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id jx22so20697528ejb.12
 for <buildroot@buildroot.org>; Mon, 30 May 2022 06:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WncbB/QQNZvYjynvfj1792SZfy/r33sKcU6I+wyjifA=;
 b=T3CmyhJOv/AA7yz8/481BbOzKjVk3Aqj8ddJ4ewxc06wITa/yZUEee3wWqRjdPDRBS
 ESOv2RoDjBC0OobIhaD434/m+CzCWfvAICn/Nhe0GqacRSlqs9EWemDZD0WQ3d0ThMxq
 rb7jQlRQUTmEC5cYvce6qMtdGdYCE+Tajws36vJjvigm6M+aqEdu2zTztjajFHeQUKki
 xmzZs46oV+410sMhUs3jvxqBCMGJYOXXkrWG1xV0aTnLiGsoYhoVK3tAZQyOGmlNUmac
 Da9lg32bA7StcHpo1y93+OXJzgIK74r1Uy677rnU6XV/DwmB7G3dUjLWTpGBNXHWW9AG
 UVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WncbB/QQNZvYjynvfj1792SZfy/r33sKcU6I+wyjifA=;
 b=jl8IDDY/tm1albY+R9MDcVRd29b7CcYrYFXXvS+fUVHD1gsZtVqh0fpyvF3/rT62bI
 duaJHfcurzJ4FMDu8Jo7lLOljr3i7JJ4EXlj0WE9toE2L3tWOt4vUjVEEd0k/ATzIylY
 /pBplhP8Qd3b5Sy06rRBBjSMvIDR5arineWwE6ux733k1zhweee/1GuYKRZrybbapfkq
 vIabGWMRk1+l1Izbx20YzqPLYGSBr27hVhBFYrfSHLDOWrUgrfsnpgEUSXV3j9yyityB
 ywPXsaaC4iHNe0Vz/Vowm+X0Nf9gDDpX8qoiLNyQ4TQfY6+ti7wIp9SeLX7NORRYUxvj
 dWDw==
X-Gm-Message-State: AOAM5306+QRWLB5z9aO0WmmS+1elV8hLjfL08tNam+lcVq0BYNEHNVuO
 kP56ZgpsnhM4hGMqO08v4Bm0og+ai+mMMw==
X-Google-Smtp-Source: ABdhPJyJe9YgNCN3TXL8s431KS2zJYied5C5z3UswuRhDTeUNNvD1UIxjrQ0ksrVafRqb0mNLvHWjQ==
X-Received: by 2002:a17:907:78cb:b0:6fe:9ca3:2a9b with SMTP id
 kv11-20020a17090778cb00b006fe9ca32a9bmr48258226ejc.727.1653916966971; 
 Mon, 30 May 2022 06:22:46 -0700 (PDT)
Received: from 320-ntb-p0632.Speedport_W_724V_01011603_07_006
 (p5b2cdeb2.dip0.t-ipconnect.de. [91.44.222.178])
 by smtp.gmail.com with ESMTPSA id
 bl16-20020a170906c25000b006fea43db5c1sm4017753ejb.21.2022.05.30.06.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 06:22:45 -0700 (PDT)
From: Andrey Nechypurenko <andreynech@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 15:22:39 +0200
Message-Id: <20220530132239.20818-1-andreynech@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cmake: bump version to 3.22.3
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
Cc: Andrey Nechypurenko <andreynech@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 3.20 is the first one where the following issue is fixed:
https://gitlab.kitware.com/cmake/cmake/-/issues/18299
Was affected by this bug and decide to bump the version to the
latest stable

Signed-off-by: Andrey Nechypurenko <andreynech@gmail.com>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index da514a6d6b..1749db8c27 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.18/cmake-3.18.6-SHA-256.txt
-sha256  124f571ab70332da97a173cb794dfa09a5b20ccbb80a08e56570a500f47b6600  cmake-3.18.6.tar.gz
+# From https://cmake.org/files/v3.22/cmake-3.22.3-SHA-256.txt
+sha256  9f8469166f94553b6978a16ee29227ec49a2eb5ceb608275dec40d8ae0d1b5a0  cmake-3.22.3.tar.gz
 
 # Locally calculated
 sha256  131b9ff756b64a25b7461c3c1382e70b16c70a5b4833a1577897fa3ea6d88f8d  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 4177b119ab..053658fad6 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CMAKE_VERSION_MAJOR = 3.18
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).6
+CMAKE_VERSION_MAJOR = 3.22
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
