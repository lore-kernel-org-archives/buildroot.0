Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F09C433FE
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 14:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1E2460EE0;
	Thu, 19 May 2022 14:08:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HXCwHSM9Op40; Thu, 19 May 2022 14:08:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D10E660F83;
	Thu, 19 May 2022 14:08:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32F371BF3CE
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 221C44162C
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xCZVL28BwIba for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 14:08:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37E9741CE4
 for <buildroot@buildroot.org>; Thu, 19 May 2022 14:08:29 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t6so7350305wra.4
 for <buildroot@buildroot.org>; Thu, 19 May 2022 07:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=naej13St5CCYhjRGa0ABI2UYk1Z2tjXEvaQANQLMAqY=;
 b=gxLIVLgrLwZMrqT/xoRXS0IPUcdE5OuVg7q6YWT2Q6wabXMwv+4Omvg1pU18uyo0gp
 ZNNPw5XcAxVzw022lfoZVq7WnT3J2atjUKKJ7LSvrrT5xkTY2vmGekUqLZcV5nP3mrVf
 5rZ7i8vIT3TNDs9VVxbz/UnIRIF71F+R/wC26wUxf3KlRCcFVZ6IMDkAq1dH1OrTeFCi
 zhCo01rgh2JV0zSw8sEng2J68abUH9qYBpgxLd3b02Kxdo5HBrjNErJYQwSn0pu/IBSW
 KRliyNFSIPD3wcP4uhGCaO0kzfHQsoPsjfvzT2aQ1cCn46ijOMTfIjvyBOVrnmaoUEug
 v9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=naej13St5CCYhjRGa0ABI2UYk1Z2tjXEvaQANQLMAqY=;
 b=c39j6mrDEjG4P+0cWKA5z1Ef6tGa3YS2epi+mBOIWO4JCFdhlYSqFPt+XvUi4wg2YT
 ZQqcgrPowLqdVEO17HOY3Fhib1lOGpZy8CZcHlVG/0AgugIOEtzxw/Zrcjcwaehypu3W
 SDovKle3At7UtVort7JrCQKhlAWSnEClfAgksyHYiB5owuUFhhgA815lV5xn+SOefa1/
 wOXD2LYdJ1URlYspI62TsvYsUNncsPwHChcbvMken22pbN6ae1vrDugtjDLcR7yF6FAe
 wp6qCRcmDVyXUJTPEkqO5TDFyeq92dhyKGefMwWc7oLhZD4GnwW2ybfnQJYIwToMI1rN
 j4MA==
X-Gm-Message-State: AOAM5331W+dxEk3OacPRFa7QQDGRrgsaQLHp6vO6azKhD1HnFFSbxJEi
 VHTLHFlPDe70fEMo9dVbDimYRu4F+gI=
X-Google-Smtp-Source: ABdhPJys3z5nvfJlJN/V+i6U8BP+eD7Qg6D+ArLtztxP5y/R3xWeciRJ8SDM19LLKZFx+M8/tW8tCw==
X-Received: by 2002:a05:6000:144f:b0:20c:6090:3040 with SMTP id
 v15-20020a056000144f00b0020c60903040mr4118163wrx.479.1652969306972; 
 Thu, 19 May 2022 07:08:26 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 f18-20020adfb612000000b0020d00174eabsm4790214wre.94.2022.05.19.07.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 07:08:26 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 16:07:51 +0200
Message-Id: <20220519140810.1953601-2-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220519140810.1953601-1-johan.oudinet@gmail.com>
References: <20220519140810.1953601-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 01/20] package/erlang-idna: bump version to
 230a917
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove the unicode_util_compat library, which is not needed for the
erlang version packaged in Buildroot.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
Changes v1 -> v2:
- use the master version to avoid backporting the last commit (suggested
  by Yann)
---
 package/erlang-idna/erlang-idna.hash | 4 ++--
 package/erlang-idna/erlang-idna.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-idna/erlang-idna.hash b/package/erlang-idna/erlang-idna.hash
index 2200bbad8d..7ee4807195 100644
--- a/package/erlang-idna/erlang-idna.hash
+++ b/package/erlang-idna/erlang-idna.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 d57e20ee88018ff0431e0275e91ada5915782870c9981fc798bcd05589031d6f erlang-idna-6.0.0.tar.gz
-sha256 95f5c9410a95332b0833c4606028ee00008cd8c497336e230df3144d1a720bda LICENSE
+sha256  916b092cb8d35ca6e63ec183a674a28ff2f745ce05fd0c9c06da34875f6fe8d8  erlang-idna-230a917.tar.gz
+sha256  95f5c9410a95332b0833c4606028ee00008cd8c497336e230df3144d1a720bda  LICENSE
diff --git a/package/erlang-idna/erlang-idna.mk b/package/erlang-idna/erlang-idna.mk
index 27a32fb06d..4ef34e82bf 100644
--- a/package/erlang-idna/erlang-idna.mk
+++ b/package/erlang-idna/erlang-idna.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_IDNA_VERSION = 6.0.0
+ERLANG_IDNA_VERSION = 230a917
 ERLANG_IDNA_SITE = $(call github,benoitc,erlang-idna,$(ERLANG_IDNA_VERSION))
 ERLANG_IDNA_LICENSE = MIT
 ERLANG_IDNA_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
