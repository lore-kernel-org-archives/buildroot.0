Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BCBC433EF
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 14:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EF6C41A06;
	Thu, 19 May 2022 14:09:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2FlXDC5FdwhG; Thu, 19 May 2022 14:09:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42C434162C;
	Thu, 19 May 2022 14:09:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AEF8D1BF3CE
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DC7F40124
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ukFxfakRpdGt for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 14:08:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00B3A404D1
 for <buildroot@buildroot.org>; Thu, 19 May 2022 14:08:33 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 n124-20020a1c2782000000b003972dfca96cso1005575wmn.4
 for <buildroot@buildroot.org>; Thu, 19 May 2022 07:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z23x0l7n7WVWtHoMhWoBi9e7/Fh2I+wpsgrYZCf+RCQ=;
 b=CH68CbX14C87TQNsu9+6S/g+QtjmI3rVObVvqJjmHk1uoWOm78xQ/vFSYL9YvkWqgd
 p+wo4yWQh6YuUD+yI+ERDHPCbs/YDWn1y/3aw6H1qQZmvqBLQkGOf0IJJUZjfmE7XJqZ
 Cvr7gMNJ8SgjwxzaOVkYCl9yUlG7Z5lPtbtEy585FwZ0dGLh1Yk/lw6EBlA/Cgzgk9VL
 PSyCN6THCmasW/iKwIayV/hEcg8ibI/fASxlrpnUqjeAPriR8wTxSstGJA1jVpFWjeaj
 i/Mo7PyNKWSbc8UhcGkzJOihtuhBuXCGArkCN2kWNRaNz7o1v3NY5FS6NOBzWXcubVPC
 F3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z23x0l7n7WVWtHoMhWoBi9e7/Fh2I+wpsgrYZCf+RCQ=;
 b=tJalEvG4meU+y9CtSeaAhqIsAXfd6PZIx215EevLnemSkg4p/3O1yTwM0Dp+YApRCD
 oIO9QFf1S50d8NBSlm8qoEuGqXFN0MDUixIvx7TxPSLbc5Q1nGDD8u2mHB4JxAgvVhXp
 nzSCE8VQOhmpN9EYDXvt4rYqJinwFaeZawfa2mi4DedTw94SPTHA94LJeB3VqUqsrSkP
 Na3KUUYnvQYGSp/h3z/MSxNSO0/+2N3RhLNGF9d6f972Ax5CwTu+jVLT6qUFm1k6gEr+
 Lsw+OSteMqgxGpDz1fg92ZWqZNO2xC8CUAUgWUFkDVBsHVN3G8BbfmGGxEm3xlDeL7CX
 OT+A==
X-Gm-Message-State: AOAM530/tPqoKMjbTHVB42HWpGBnrnboV6HUkOHhm7oOLj4LYLg4tzAv
 kCmK9yBFqYX6Z5SWPFAU47Jepy04V1s=
X-Google-Smtp-Source: ABdhPJzOdXOVWVKLPVpKd4uLh6DXRzjG4zyThD+3nPAD01cYT8QZ4OSA4MGAV3X+ALijmEk8XX4qTQ==
X-Received: by 2002:a05:600c:a42:b0:393:d831:bf05 with SMTP id
 c2-20020a05600c0a4200b00393d831bf05mr3869762wmq.187.1652969311981; 
 Thu, 19 May 2022 07:08:31 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 f18-20020adfb612000000b0020d00174eabsm4790214wre.94.2022.05.19.07.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 07:08:31 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 16:07:53 +0200
Message-Id: <20220519140810.1953601-4-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220519140810.1953601-1-johan.oudinet@gmail.com>
References: <20220519140810.1953601-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 03/20] package/erlang-p1-utils: bump version
 to 1.0.23
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
 package/erlang-p1-utils/erlang-p1-utils.hash | 2 +-
 package/erlang-p1-utils/erlang-p1-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-utils/erlang-p1-utils.hash b/package/erlang-p1-utils/erlang-p1-utils.hash
index dec7c26039..082622098e 100644
--- a/package/erlang-p1-utils/erlang-p1-utils.hash
+++ b/package/erlang-p1-utils/erlang-p1-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  234b88227f61ef03a6177d97ed062c62a22760b6fd189a5a24d2fd1599d95ac9  erlang-p1-utils-1.0.20.tar.gz
+sha256  05f29bc55a51840c84f4055b89d4cc312078badc5571a5962f15348fa5d87015  erlang-p1-utils-1.0.23.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-utils/erlang-p1-utils.mk b/package/erlang-p1-utils/erlang-p1-utils.mk
index 084382cd2b..5804c2531d 100644
--- a/package/erlang-p1-utils/erlang-p1-utils.mk
+++ b/package/erlang-p1-utils/erlang-p1-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_UTILS_VERSION = 1.0.20
+ERLANG_P1_UTILS_VERSION = 1.0.23
 ERLANG_P1_UTILS_SITE = $(call github,processone,p1_utils,$(ERLANG_P1_UTILS_VERSION))
 ERLANG_P1_UTILS_LICENSE = Apache-2.0
 ERLANG_P1_UTILS_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
