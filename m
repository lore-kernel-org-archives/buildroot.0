Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256F2C433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 08:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3700813DF;
	Mon,  2 May 2022 08:27:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QnGVLG0GMJEL; Mon,  2 May 2022 08:27:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C211A81325;
	Mon,  2 May 2022 08:27:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 201431BF3CE
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 08:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07348402F2
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 08:27:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q_jWBmFaiFTu for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 08:27:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA37740241
 for <buildroot@buildroot.org>; Mon,  2 May 2022 08:27:06 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-ed9ac77cbbso3075796fac.1
 for <buildroot@buildroot.org>; Mon, 02 May 2022 01:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tawucb8/qtgJ4gsRF0EBDS13Y48OrJ1Y2MtJurc2mxQ=;
 b=W601GZ5aD6+KtGHBgdvdFl9RFyZ6/R54G0wBRUmmH//H6/vpAAS4+tNuqoE9DUkF/n
 NkvoMoUPvZ/upgADxNXqdHWrVcSj/JMrQKWsuaE7tNo8BzGRK8YN9DMhaXFCWNpXnoAX
 ZVZYUP1ZlAbmYwjr44FpUvJrvT9z6W5u8nJEEfpUL6PH6rqJxh6mtFpgZRpRLJrEz2dS
 iLdxlbaXojp/e4l5MogVFgHRIo+AVLg68e/Jw8xDNLmPhVaeCwsdSYxp7OPTJ1Nw5Wg5
 uGlxdOojPADs4viKMm3CGXUVcnogM9bNfjfRcwf5/6KRhOvUESrPGPKy5tej1Lswq/nO
 62lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tawucb8/qtgJ4gsRF0EBDS13Y48OrJ1Y2MtJurc2mxQ=;
 b=usRV0Ft21UoFUXZfldd1q7a9URT/SNUN0/JQEPHcr+WPDIG/B3qnwEY7xle+rADn03
 KNNSeHyF+DwECCpKBxjRZ6bc6xF+gv2cljtIqxJ1UT71Rw6CIFX4ngs4kY3V9vxQxnFR
 qmNa2w1wq1Qv6AycKzhwbykqBhEYfikoPS3GPGYZ8GHmhEd4LwT2k/WHWjduJNx+tkLi
 clFDxnr+bBZRkPQ9WANHUEAGzQRcT1x2joJOJLiLf1iQMArjTHMD+HxkHJER9Ep6Pwan
 RfY7HO29gl6hJRY8YSg0y9qhx8/mfohZmoZHbIz/84usgI9dGzucxf6eoarJrmhOVS5A
 9Iww==
X-Gm-Message-State: AOAM532J+/BEpj2gS3WExV1K6w9LfYg3C0sW2Z31jhQf8HS2gVJGZ2V+
 2AaLG/O287HihgfvrHSRB1Bfrnu5aZ4=
X-Google-Smtp-Source: ABdhPJye67ZvvYCW0Ri/RbjT86QAk/rTbPhrsNWTX0FZKBUUgbNO7RenbDNG1PZ+qv/pS6qXmVUJPQ==
X-Received: by 2002:a05:6870:b616:b0:e2:f8bb:5eb with SMTP id
 cm22-20020a056870b61600b000e2f8bb05ebmr5974195oab.218.1651480025587; 
 Mon, 02 May 2022 01:27:05 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 m17-20020a9d7e91000000b006060322126csm662379otp.60.2022.05.02.01.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 01:27:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 May 2022 02:26:55 -0600
Message-Id: <20220502082656.461316-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/rtai: bump to version 5.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/rtai/rtai.hash | 2 +-
 package/rtai/rtai.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtai/rtai.hash b/package/rtai/rtai.hash
index f0afafbd7c..f2eb7f33ad 100644
--- a/package/rtai/rtai.hash
+++ b/package/rtai/rtai.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 13669da744a0ba411bdb8e47fa47b6e19171646ae42c8dbb2735d12e555fb1a3 rtai-4.0.1.tar.bz2
+sha256  57acd3ad46cc8f1e01dc21089a24587c59e7328cbac06abb62bb0152de0b9df7  rtai-5.3.tar.bz2
diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
index 90f2cc4c8d..6b309ebf85 100644
--- a/package/rtai/rtai.mk
+++ b/package/rtai/rtai.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTAI_VERSION = 4.0.1
+RTAI_VERSION = 5.3
 RTAI_SOURCE = rtai-$(RTAI_VERSION).tar.bz2
 RTAI_SITE = https://www.rtai.org/userfiles/downloads/RTAI
 RTAI_INSTALL_STAGING = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
