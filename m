Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F16C433EF
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 13:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E307E61080;
	Mon, 16 May 2022 13:15:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2PIHRh3YDjYF; Mon, 16 May 2022 13:15:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB5756106B;
	Mon, 16 May 2022 13:15:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C2A9E1BF37E
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B10AE6106B
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:13:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8hh8zXX8mJQd for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 13:13:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F1C5761065
 for <buildroot@buildroot.org>; Mon, 16 May 2022 13:13:58 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 m2-20020a1ca302000000b003943bc63f98so8602832wme.4
 for <buildroot@buildroot.org>; Mon, 16 May 2022 06:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+lJdS9BGVzMU7H6ZjIU8FxXDKUHQxOQiRv3UhIaLL9A=;
 b=gfyxC9PYRiqnI/cPpsYSpc+mS+stpFTMf62oL2spnLeBGTZ2n7g+f8UlUiITSsAQw6
 uDRslZyLIdWeLNgQvktdswNtMJKIKh5ePhi7687MS/VxDCDgal+5B6Fw/uMyNrcSBmSp
 KF+IogMe5R1qwuucUHG/rbYMExNCoN+0ZpWlSoK/E86TYcm3xPfOTQDLEcrk4gBca+Ys
 M5vYVS6xM7cxXUx/WlLEfA0mXhl8jZB+6ZXpCRos7Ut412hoR9q7B+BqGhYJ0NjpRChM
 Ejmrmek+aJut0/48aJvwR6aCM2ZXr+6GHgvBZIg90/uPrXcCgIi61cFC3RWxv1dlwz03
 WWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+lJdS9BGVzMU7H6ZjIU8FxXDKUHQxOQiRv3UhIaLL9A=;
 b=bGRZbslYx9cFXk20m+jySC51cXVfu/G1xvq7FLZby9KHLd9b9ATKUUhelY3cosapLG
 pTuDJ1v7JQsNM2wdlfEFike6vnX5Ao6OGJZY1NO8/UjQxR9GWxOCcyx/mlhUy9H9cjVD
 cRiOjCtOTY+JWpJzlXpVrEzM2bjuR6enc2Hs0r0b4Q+nKLzgVt6w49rC/Xt7W3KCgEHe
 wnAgxMHnAdvf5YG+fqY4sHfnGI4p8tryB2eVSL36UHdnszRSJBFQ1jGJg8TA9uRwDUDM
 A1MO8yqApEjaO44w/qw1UoIUOCYroAgc1+pRb9BCqXARKpFITuPUe/YPcKwvF7D6Xa/N
 jMkw==
X-Gm-Message-State: AOAM531w7N25Kw8XMntA5NOmBSuYVAn7wC26WkmBf/Aiae5rCcRGgbxW
 vHDLyXKar0N8S81aJ/Sri8o4oAMWwaI=
X-Google-Smtp-Source: ABdhPJxGH9nZlZ0aTlQMr61eGse9i0Ts1N3nLC3sOc6r+FUEjp/63TDrOgQFdimGRljZIFMucQn9gQ==
X-Received: by 2002:a05:600c:3d8b:b0:397:87e:c8df with SMTP id
 bi11-20020a05600c3d8b00b00397087ec8dfmr4138058wmb.187.1652706836866; 
 Mon, 16 May 2022 06:13:56 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm13023789wmb.42.2022.05.16.06.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 06:13:56 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 15:13:20 +0200
Message-Id: <20220516131334.1910858-7-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220516131334.1910858-1-johan.oudinet@gmail.com>
References: <20220516131334.1910858-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 06/20] package/erlang-p1-stringprep: bump
 version to 1.0.27
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

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-stringprep/erlang-p1-stringprep.hash | 2 +-
 package/erlang-p1-stringprep/erlang-p1-stringprep.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-stringprep/erlang-p1-stringprep.hash b/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
index e23cc4f38b..eec611829a 100644
--- a/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
+++ b/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  47f9f8ee901f47b7f62c5140ea09f113efe7fedd5e8ffb92d50f51c5e11fb67f  erlang-p1-stringprep-1.0.23.tar.gz
+sha256  cdc2ffa6ba2171f55b78e69cfce5dab6099cbb6bc6955d88c5c53b0cf24d13af  erlang-p1-stringprep-1.0.27.tar.gz
 sha256  f44415631770cb818de6d92f3961fdfe6e407a5154f84b87cc06ac27323e919c  LICENSE.ALL
 sha256  42aef2a1337ef1f45ae2832aa5aa268c79b2560fb1f3ebab519629372cb24ffe  LICENSE.TCL
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-stringprep/erlang-p1-stringprep.mk b/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
index 580f4a9aa9..233be52c58 100644
--- a/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
+++ b/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_STRINGPREP_VERSION = 1.0.23
+ERLANG_P1_STRINGPREP_VERSION = 1.0.27
 ERLANG_P1_STRINGPREP_SITE = $(call github,processone,stringprep,$(ERLANG_P1_STRINGPREP_VERSION))
 ERLANG_P1_STRINGPREP_LICENSE = TCL (tools/*.tcl), Apache-2.0 (rest)
 ERLANG_P1_STRINGPREP_LICENSE_FILES = LICENSE.ALL LICENSE.TCL LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
