Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFED7C433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 16:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8893660F45;
	Mon,  9 May 2022 16:13:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z7fdE0afKruf; Mon,  9 May 2022 16:13:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92E7C60B20;
	Mon,  9 May 2022 16:13:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B48CE1BF281
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 16:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B247E81A95
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 16:13:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XLMEnSPNVQiG for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 16:13:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5893813EA
 for <buildroot@busybox.net>; Mon,  9 May 2022 16:13:26 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d5so20172857wrb.6
 for <buildroot@busybox.net>; Mon, 09 May 2022 09:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s/Jlifgtno1U0vo/M4bxHGrHSjAaO/vyjHlwrCSr86A=;
 b=WaxFvMdMnT+eryv2BfzjsiGvHRX9fYQSk2g3BoO3fB+iO1ZlRYYcYgaktK4POwKE8W
 1QdKM/PNWAOBp66bMu+DH+FNSt77FtIyZ6BBrsrOHj04V7B4JM2VM5apYe6O08MasKx1
 hRNMkT2SWvcSVASd9lnCYn8onFL6reOFOkIiyQ7rLuH8Acd0EVWmc5ENFaTV6+WHTMOj
 w6laFdYxd4/MKSur5sdJ3rPPQZhL9XFPF3xya+9ZS/da1W24kBvpLk1K4792oXpTHMwj
 V4Zj93mWpVOyx7WnZrcqPTbX6Llq2RmuUtps/PpS5hNAMA91Nu6vc+amcH/vfJnyY7xD
 GKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s/Jlifgtno1U0vo/M4bxHGrHSjAaO/vyjHlwrCSr86A=;
 b=cyE26RRAxHVs8Oa2hoVlmRRWurqBXA9hgs/by+lO40NuE5qk7KkZUvOA6c8d5xXflA
 kutkAS2/gjAK/fkiQ2k29Eyk90H/MpbGq0f0FmkovHPOKqLGAfRqCIVeUNi5GASnCwNK
 PHO52CNCmrVIMlSNOBkaREp3InOCRmwTNpvIdRUFnvh6Ijwk+b/Pcoe6GD5yjW6HCEBr
 iPPAWD9n5MS1OFLhT5XYJhWSaXl3Cnyp+quKSJtAwihFWBSGZPBjt2P0fFnbXRXfAtJv
 t1tLW8y0NgnNw9yqjsFifT75dQ2utXuXzAYr79uHnENA2963mSYTVRHxfNBuKTRYHJD4
 hWfg==
X-Gm-Message-State: AOAM530tOY0FPmjCOQHiSCpqf95bBO2lH9JTNHf0PsKW9qG2Ea0BSR2m
 y/KXiXExY/sQD6nsj5iG0gIS3NcxgGk=
X-Google-Smtp-Source: ABdhPJwUvbierZrCEJOBPzOM4kYlYd0+ew/YT1jruY2AwUrTcmrJ8+Rb2S/xq0Ny8xXqTdzQsDqt1w==
X-Received: by 2002:a5d:6489:0:b0:20c:6c3b:d49e with SMTP id
 o9-20020a5d6489000000b0020c6c3bd49emr14905563wri.75.1652112806379; 
 Mon, 09 May 2022 09:13:26 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a05600c348700b003942a244ed7sm12453272wmq.28.2022.05.09.09.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 09:13:26 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  9 May 2022 18:13:16 +0200
Message-Id: <20220509161316.188916-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/sqlite: bump to version 3.38.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 12a543f00..69ff5ed69 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  61f2dd93a2e38c33468b7125967c3218bf9f4dd8365def6025e314f905dc942e  sqlite-autoconf-3380300.tar.gz
+sha256  5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c  sqlite-autoconf-3380500.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 3ba120df8..667ea1d01 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.38.3
-SQLITE_TAR_VERSION = 3380300
+SQLITE_VERSION = 3.38.5
+SQLITE_TAR_VERSION = 3380500
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2022
 SQLITE_LICENSE = Public domain
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
