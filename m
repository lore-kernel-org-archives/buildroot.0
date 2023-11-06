Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7838FC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 07:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4E1B41DD9;
	Mon,  6 Nov 2023 07:07:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4E1B41DD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5uTho_A6fOJ9; Mon,  6 Nov 2023 07:07:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CC5E41DD5;
	Mon,  6 Nov 2023 07:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CC5E41DD5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 963F51BF368
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 07:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DA4A40C01
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 07:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DA4A40C01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vWIbjFyWmaQ4 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 07:07:21 +0000 (UTC)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7101840C05
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 07:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7101840C05
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c50906f941so59128221fa.2
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 23:07:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699254438; x=1699859238;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J+LiHJTn9taCR4bs0B8gN0OnGjoLiuBDI+mlnDsdANk=;
 b=mqnDXdZ95w7eFWIEDKNSnrkBLIjgplBUiHvjtgaNUGXmRfVM9mMlNJ/MYFXdAA2CS2
 4IknkErGiBT7MDf5JqU65pmPsY3Oqx4ZxjtsBkDBCR/KEt0BMRD+msicofxfnSd/41fA
 yt3UQk2/6BitedPMbx18ZVbe7zlg3dvVLTq353+dwQshals65fQcrRz+xuCaN9LZj/lL
 /0oOJeQf3tQBfTtr4aAzLlqgLAKUJ2/NEPiMuoDVEHZ8FSasznBFy3EfQX7y9yC9zo38
 HrwjEcW/WW5oskOmEzHmjF+D6KJyT72yvJNfS8vxOnqHu6EMTGkkR7Lwt4mVUoZAnjY/
 fdlg==
X-Gm-Message-State: AOJu0Yw8Pbtf+NqXqdy5ykUN5xOus+6xceyInx/jpcL8lwSVwWB717+E
 C2o1dPqp0N8XWSeQyV9NZ/PR7e2DFD4=
X-Google-Smtp-Source: AGHT+IFTis1FfCTT9ZzIpvn6fb7YQV4VBQzlpNl4Kb+jm9g/y53dJRsnr5mdr3EPZQMYU6Ke5x3AkA==
X-Received: by 2002:a05:6512:3b87:b0:508:2b98:d6ce with SMTP id
 g7-20020a0565123b8700b005082b98d6cemr26728042lfv.45.1699254438359; 
 Sun, 05 Nov 2023 23:07:18 -0800 (PST)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 d11-20020a0565123d0b00b005057fe45833sm1047429lfv.227.2023.11.05.23.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 23:07:17 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Nov 2023 08:11:31 +0100
Message-ID: <20231106071131.1207382-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699254438; x=1699859238; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J+LiHJTn9taCR4bs0B8gN0OnGjoLiuBDI+mlnDsdANk=;
 b=kmdO5+YLWMqNuAcGrdOSjjo1CM3IfCSHZiAOEyUhqvilP7Hr/AjaXq/arlVcVh03DS
 4bAdOVSdpwJdoHqrMmLpUeLvCMeSBbzdPO5VysNldQ4LL716XKd08NF+nl9Emni4zGcM
 EDfvrK1L++r/fknWv5kSXfoJmebSPof/h//mL31b5qTcusot6OP9ytmY17MhMMJ6d0A5
 vjnTMSUbR1DJoKdjlQNQT+cqSm3Ap3cAtSJ6lVTjAo0vUJB67GbGx3CaY0r/1V0MJtXx
 QRlp95RVzX2g28ZQ421czovp+hgfYZ27iamSAOecrvzOqG+DdRR27Kb9ri86ebppYuV+
 zk9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kmdO5+YL
Subject: [Buildroot] [PATCH] package/libostree: bump to version 2023.7
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
index d122fee86e..2d8284a99f 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b43c4a373799681989bae12b3a1b94f453068dece6540b8e05a23b834c1037e2  libostree-2023.6.tar.xz
+sha256  19cda718705f7ac8c018c939c38b1bb8412deaaa04862da98cd9fe9243f073bf  libostree-2023.7.tar.xz
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 15093f4b7a..c1bd5886bf 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2023.6
+LIBOSTREE_VERSION = 2023.7
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
