Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1A2C433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 23:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42F4A408B1;
	Mon,  3 Jan 2022 23:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o55XS3XegcAF; Mon,  3 Jan 2022 23:03:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 759BF408AB;
	Mon,  3 Jan 2022 23:03:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 614C51BF358
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 23:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F5B8813C0
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 23:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q8XGSn6Nq_eJ for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 23:03:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E8A5813B7
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 23:03:01 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id y9so2647783pgr.11
 for <buildroot@buildroot.org>; Mon, 03 Jan 2022 15:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zSqlx3sl/8ThYCfGoD6O5z0lQNZ6yo5Tp1TC4BefqFA=;
 b=DJzKUP8JihEPtE13sAxPRbfimJH9FYrslCTS/mh1MIsSWpM8XiQZqcdVFGzXendZ2s
 up6idFHj99fiFwFdsn10StUfoteGkQHataYc6ZMiZX+uZGbvCbKNJWFPE9zMj/P5BQGP
 isq6LAhtwT0lJW7ynod3//VzsK7SMXO1M+O67eSmUcmmc+zyIEBuZeIMUnDTUcG2rgrH
 vpgjft0kb9QneqdRHWGCOhgxPosFIuhVIYmoHZQ0AIq8TCnKF01fXBKuPmvtIiaU4r/o
 sckIpgCmRgszQLxBjOszB+y1GofkiPYIvhcZxe+uB/vjnwNOzLa4DYIr60yzkmynxtmB
 0G9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zSqlx3sl/8ThYCfGoD6O5z0lQNZ6yo5Tp1TC4BefqFA=;
 b=Rir76C1cwbSvUz4kKZ4eJcJP5u4Y+oe8QBUWQPQs2aF5dxY0qlpaDcq2d6rfHBY26V
 Q2sePSc3kGHfw6JvoTBnwVYgWBhn28SSd5tw7BqMH1X3nf0dKQF4iBuqh3TODd8HVlxx
 YuoT0TNPegh4NQzeYghuwcHzzQ5JkT898K+xDQfZM0IOGkODb5HZcsFF1n+w7t6lHOdn
 LgWntiuNB9gs2juOA5y7U7YGSIZkqR1n04wSfMQF4CBsPhlUHxx72ZgWUf7xMrNmdk4x
 pyyamUxEqeZ5wKMstQnE9kcNU6/Or/OI1xiVSUzeYd0+RtOdkOBBwUeOQBkhmgLmD9Ez
 K0Vw==
X-Gm-Message-State: AOAM530yCTK4Ww8FecFtpmmOdpomonCQm0qnHOSDGXu1YZKp2xEQmz2h
 dOaks6zjpy6J/3Ebxg8eDtizYhdP1uY=
X-Google-Smtp-Source: ABdhPJx4NT58X7WNPD0hRVuMQIgcAiuaTZi/KqVKYK/NidJeUfYoZlnuj+U47jHMWaZTMl241fBShA==
X-Received: by 2002:aa7:973d:0:b0:4ba:70f9:14a0 with SMTP id
 k29-20020aa7973d000000b004ba70f914a0mr48218202pfg.37.1641250980814; 
 Mon, 03 Jan 2022 15:03:00 -0800 (PST)
Received: from localhost.localdomain ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id o7sm38954864pfu.108.2022.01.03.15.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 15:03:00 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jan 2022 15:02:48 -0800
Message-Id: <20220103230249.310062-3-aduskett@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103230249.310062-1-aduskett@gmail.com>
References: <20220103230249.310062-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/pkg-cmake.mk: fix absolute paths in
 .cmake files for per-package builds
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
Cc: Adam Duskett <aduskett@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naumann Andreas <ANaumann@ultratronik.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some packages (notably qmake packages) generate .cmake files with absolute
paths. Unfortunately, doing so breaks per-package builds because the paths in
the .cmake files point outside the per-package sysroot.

Add the new pre-configure-hook "FIXUP_CMAKECONFIG_ABSOLUTE_PATHS" in
package/pkg-cmake.mk which searches for all .cmake files in a  per-package
staging directory and removes the $(STAGING_DIR)/ prefix from in them.
This simple fix allows non-qt5base qt5 packages to build with per-package
enabled.

Based off of Louis-Paul's earlier work found here:
https://lore.kernel.org/buildroot/a339f273-33f3-f232-eac4-6e50427abf6d@cordier.org/

And Yann Morin's feedback found here:
https://patchwork.ozlabs.org/project/buildroot/patch/20200217212350.29750-21-anaumann@ultratronik.de/

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/pkg-cmake.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 3b1db35fb6..47234fbdd9 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -65,6 +65,17 @@ else
 $(2)_BUILDDIR			= $$($(2)_SRCDIR)/buildroot-build
 endif
 
+# Some packages may generate cmake files with absolute paths. Remove the
+# absolute paths from the generated cmake files to keep per-package isolation
+# with the build sysroot.
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+define FIXUP_CMAKECONFIG_ABSOLUTE_PATHS
+	$(Q)find $(STAGING_DIR)/ -name "*.cmake" | xargs --no-run-if-empty \
+		$(SED) "s:$(STAGING_DIR)::g"
+endef
+$(2)_PRE_CONFIGURE_HOOKS += FIXUP_CMAKECONFIG_ABSOLUTE_PATHS
+endif
+
 #
 # Configure step. Only define it if not already defined by the package
 # .mk file. And take care of the differences between host and target
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
