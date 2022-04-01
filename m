Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB340C433F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 08:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90B9C4060E;
	Fri,  1 Apr 2022 08:30:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9t9QjLzvSTZN; Fri,  1 Apr 2022 08:30:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6B5E40607;
	Fri,  1 Apr 2022 08:30:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C82861BF35E
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 08:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B89C182C38
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 08:30:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gqBCcF_aD6uH for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 08:30:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D67B881286
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 08:30:15 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id d5so3496446lfj.9
 for <buildroot@buildroot.org>; Fri, 01 Apr 2022 01:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l9Hiu9EklNWTt/r55H9laNh8fTjydDNoT/+wc+ZqnAE=;
 b=mgJCE5nS9Sr2zf/yX8KfBusykazDFjhvoSJvda9T2Vh5r6UhO3PlkHk261CxtSGUwg
 3oaBcgLcLkwKANDflREMle9QrDSF3toxnjfaObJ7sU7ya17QFm0+GPayBrls53/oy7Mz
 W+nlBfVTHoTR6cXHm1hiYoQkvsN//o6CRuPEkf5vAAXKUpT1rL2hteRrBzqlMqQ34VTt
 s3bBUeJrlJrbM7hila086LErEt4WoKfsMHWAmg5JeR8M0v4GBnLlP7Du5eRBgWoG7xjN
 Het9A745NZA9wMYgpXzWBuDLgWuHr5r9GHqJQfxbp2rgfdG4Q1gn+dCIJPOSAIuCSa99
 BMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l9Hiu9EklNWTt/r55H9laNh8fTjydDNoT/+wc+ZqnAE=;
 b=4v6mFrvLdhdqrcGw9d/Q1d0cApJPLZmkQywtdqkBjiuQ05lqx/VNZq/KC+JqJ743Gr
 rpA911f/sFd4hFgMpB93Xs8qKEvHpCUfXaokNDhHRtLJIsojQuwted3fFtLMr8CiJxP3
 FsrFBXpiLCCoE73bQt2UV4Goxft2FIx2OGgCAb6C07+ivZTpqJNSqFcdWCbScjbrAHr5
 7+Lz8EZMA92qUd1dUSn9zmLyzTtXQeaCmA9pLaPElDFDQmSxtYDIwdESACLQDT6MblHB
 xVugYbMOOxqEfuzjfjb56jTtY077Yefu9aoA4LKmFPqCY9tVzo13LcSrh8yojCKM5kCi
 xirQ==
X-Gm-Message-State: AOAM530y1TD7SeGlqkmhs3GnEn4+1BjTUmwSIc//mS+VgmYtln1IbeQq
 nt4hA6gxPizwuGtmIVdmPnwDq6w2EC4=
X-Google-Smtp-Source: ABdhPJzzg6UwSx+wlaCYeoTfniKLws7hTg8upjQlStZ31ZrHq3yvbgl4leCBfKzaMc3o6PBeO6lz2w==
X-Received: by 2002:a05:6512:3b21:b0:44a:20fc:3e15 with SMTP id
 f33-20020a0565123b2100b0044a20fc3e15mr13133599lfv.266.1648801813519; 
 Fri, 01 Apr 2022 01:30:13 -0700 (PDT)
Received: from localhost.localdomain (82-209-154-112.cust.bredband2.com.
 [82.209.154.112]) by smtp.gmail.com with ESMTPSA id
 h5-20020a056512054500b0044a36e91a90sm171373lfl.197.2022.04.01.01.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 01:30:12 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Apr 2022 10:31:00 +0200
Message-Id: <20220401083100.64722-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libostree: bump to version 2022.2
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libostree/libostree.hash | 2 +-
 package/libostree/libostree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
index 3a06340575..4c8c2c4f10 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  43a00e7856842b8a34f6616fc2ce1ce238ef43210cca41f70e6b4b0d2a9fcad5  libostree-2022.1.tar.xz
+sha256  76e2f5b5784d8cb686e90be32fcecbb56c6c6a824e0374a1a6820b577103676b  libostree-2022.2.tar.xz
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 9cbf2848c9..07e0a2aaa4 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2022.1
+LIBOSTREE_VERSION = 2022.2
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
