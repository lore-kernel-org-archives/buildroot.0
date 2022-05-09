Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D82C433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 14:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4B30409BC;
	Mon,  9 May 2022 14:23:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Efzplv6xeNmM; Mon,  9 May 2022 14:23:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E28AD40917;
	Mon,  9 May 2022 14:23:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00E941BF33D
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 14:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E411C813C4
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 14:23:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U892KU_qq7vv for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 14:23:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E740E81351
 for <buildroot@buildroot.org>; Mon,  9 May 2022 14:23:01 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id bu29so24147277lfb.0
 for <buildroot@buildroot.org>; Mon, 09 May 2022 07:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ma9x25s8yBITPdnYoQyKBJgD00iBw9WhPnJVCW0SgY4=;
 b=XFmfbDZ2XARUOmvDkJQgG8IwHFPSeB1tsHyuMaAjulXL6AcU3liGlTmUSKFqAoTlj3
 7UnR85yQMTjzsCK5YW/4ExM8qcMX+zIUky2ybWtCjaRx+xhGr9oFEl8yAs6Uiw74Ozgi
 6p38hK18T4Iy3/IPU5/871KH30aiBn389uk5U2jKjKWPN1OxSXxiFEEk+YQpekwyPLi6
 dFbvEQF1vCkwEUDsftXXGY3TtEN6np7MZrZSnax+y/pmAwH1esWM6d5zEyJEp09FL54W
 RA5i5+KLFGCCY64DEuqmbpzkxXw5eIqZ4gx5nfRtVrPt/ZBtsOknmEiPE1f1vSgfS7Qx
 AddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ma9x25s8yBITPdnYoQyKBJgD00iBw9WhPnJVCW0SgY4=;
 b=Upazdzv/rYcDivbGIxGpsbuwJ0LcIJZQVockiCOHQ1poNpDGiIEubzHTp5p8ulItf7
 EuA7FfqTcXQ0VxhDbG7x8O11mIVXoJy/VVINaxMxg1Klx1scgX+GbW5IZRHI4i8qTw61
 zkZ/F5zGhEFnw8mscy8FP/1Z73fPZayB6/KJFRMaVS9nJkZs1XX7iVQ6OsqzeW29ySxT
 BBjKuLYNnoXgebgt587pZYTCa5BOfwGyPwHOg0myuXcOyIumW2oql4ZGnk6lWpLJluDJ
 oBtOi0Umg9LvNccqslJanTAKyS+dsvJJYk62/kSpzO1ymPo/fZBq6qTLOsp7zrgpGLEA
 MVmg==
X-Gm-Message-State: AOAM533cxTUY1K+6ynwFtsSRJlqpYSVqHkYczgtvuD8t8xNZ729vHZdU
 LuT8YDC+ZddzkZkytyFcK/gR2Mi4FUA=
X-Google-Smtp-Source: ABdhPJzdpbpDW4zI0pJDiAXVNO1Gygu5L6kUGyZtoMPQ0wDnfJuvzvmS8gKG0UsrlB3tMse33fZMZg==
X-Received: by 2002:a19:671e:0:b0:471:fe47:4588 with SMTP id
 b30-20020a19671e000000b00471fe474588mr12602152lfc.476.1652106179271; 
 Mon, 09 May 2022 07:22:59 -0700 (PDT)
Received: from localhost.localdomain (82-209-154-112.cust.bredband2.com.
 [82.209.154.112]) by smtp.gmail.com with ESMTPSA id
 h3-20020a197003000000b004742b9065c4sm272060lfc.230.2022.05.09.07.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 07:22:58 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 May 2022 16:23:40 +0200
Message-Id: <20220509142340.225623-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libostree: bump to version 2022.3
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
index 4c8c2c4f10..0395c1247d 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  76e2f5b5784d8cb686e90be32fcecbb56c6c6a824e0374a1a6820b577103676b  libostree-2022.2.tar.xz
+sha256  b823fd9dcd5503c5caf9febde24b0ed63ff46ca95188032ac567a2a95624f612  libostree-2022.3.tar.xz
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 07e0a2aaa4..75485a79e0 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2022.2
+LIBOSTREE_VERSION = 2022.3
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
