Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B990BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 09:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 468EB409A6;
	Mon, 27 Dec 2021 09:51:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UZBxBtrHtBIx; Mon, 27 Dec 2021 09:51:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46FE2409A7;
	Mon, 27 Dec 2021 09:51:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 60C8B1BF3FD
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 09:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5040A813DA
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 09:50:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J39DHYDF89th for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 09:50:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CECA813CF
 for <buildroot@busybox.net>; Mon, 27 Dec 2021 09:50:58 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id w16so59664601edc.11
 for <buildroot@busybox.net>; Mon, 27 Dec 2021 01:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pbt8NCVeVqv+PtJAd8Cu4IlRS2ys+pTjbVScJPbIDBw=;
 b=hB7TDLuMVvTBs2bSz6MtHffLfe95j3oj1SjMRnSbTH3yNn8So52lu9FWCRULLtf8tk
 RDJoMeeEo3m+AAjS3N34QM9zrurlyvcf+hqyxZyXMEunXS2evCYozf8TKpYobDEzd0K7
 WFERVbVjROd10XSdrBnk6TjZwzoWDPgAHpIok/3c21spf98pNJMDjEaEYaEBNoNzL9xn
 PkWcCtMF5kCZrnUYH+b2IcpqYwsAKdeL+UamjDuyYcFMXi7EzwBRQ8JELVM7Kz3sBJJA
 /keeTVqzENE+2VNlUtqzwjmAb1vDFbihZ8xisQOpmFVKKxTcRNdq3pJlXR7lXSwWPeXp
 5Lzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pbt8NCVeVqv+PtJAd8Cu4IlRS2ys+pTjbVScJPbIDBw=;
 b=1r5DW86eVnjRkvf1Gb/MctvAxOJwxIlxgYbkfD3d96tpKqYraG3WtFOw7gIs0qjD87
 S/v1dkEITNUna8PcZhi4j/ZSKo6mrTxMBAtQcs5Q7IaLvilL5ATRjr+zKVHb7f2lVLqr
 s3x8ggLiGxQnSYa8fIHhe8y82Eki/elAwSCFoaYWbN+CUKbYVrqs17e4aULbC0ICwjf7
 8J8Fah/kn8ysPfMmkq7f4IQaB+whuuqtcfc3OIpFPvljzcDtp2BhQaG7yMOLUHpPHDv7
 31cDhGq6Fb6Dw2IlPWkFa1+CboL5aHOoUmCt12y7GQL9XQ9VL4sqvI51SrUUEP5xqB0V
 uT5Q==
X-Gm-Message-State: AOAM531ccaleNu78uBPpSFwEgHxFzUydfPNMLTwQC+dUKyI2mtGEemoi
 4PCEHax3+oiFl3t+Ct4VJqLFpqf3PHQ=
X-Google-Smtp-Source: ABdhPJw6K0oxiAwPoH8AQCiSvaVKQ3yzJ9PpjYFbNoYJgqR61vnv9/W0gvbXjYIztR7DgVfoZlJ7Kw==
X-Received: by 2002:aa7:c0d2:: with SMTP id j18mr15654421edp.281.1640598656361; 
 Mon, 27 Dec 2021 01:50:56 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id sa42sm5040120ejc.101.2021.12.27.01.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 01:50:56 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 27 Dec 2021 10:50:50 +0100
Message-Id: <20211227095050.1051510-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/prosody: bump to version 0.11.11
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
 package/prosody/prosody.hash | 8 ++++----
 package/prosody/prosody.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
index 4579545e3..ee459f85d 100644
--- a/package/prosody/prosody.hash
+++ b/package/prosody/prosody.hash
@@ -1,8 +1,8 @@
 # Locally computed:
-md5  6130b79fb64141909330caf83a79a131  prosody-0.11.10.tar.gz
-sha1  4dc8b2f783b43e7a5e781b1fc8aee48b0e106def  prosody-0.11.10.tar.gz
-sha256  c6d714e6d4a6ddd1db1266b205d9d8a3ed91818f42755c9268ffb18359d204e1  prosody-0.11.10.tar.gz
-sha512  419d8f8465f1807015f0a52d8f35ee89892b0869084dae38b60fc833d63c3d70892d8e59ae00039cd15e0e25f46d042954896f51f8c0520650a877f5296707cb  prosody-0.11.10.tar.gz
+md5  78d01bb97a935f6a776d141873a33fd7  prosody-0.11.11.tar.gz
+sha1  ff653812fcb1789a517b55281a8d01e9e8261848  prosody-0.11.11.tar.gz
+sha256  a1af90e2d4ac2f7cf81b385475140ecee60bec1eb83003efb5aeb89765b13774  prosody-0.11.11.tar.gz
+sha512  eb9851e1b279bef894d556ca6bc6210d1cd55e0c02a9d475f74e6e6b4a2dfef704fd3de77b71cff97909925c48c60940c34cfb541e6f3801e23e90ea21d119a9  prosody-0.11.11.tar.gz
 
 # Hash for license file:
 sha256 bbbdc1c5426e5944cf869fc0faeaf19d88a220cd2b39ea98b7b8e86b0e88a2ef  COPYING
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index 0eeb32cd3..7acfa4708 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROSODY_VERSION = 0.11.10
+PROSODY_VERSION = 0.11.11
 PROSODY_SITE = https://prosody.im/downloads/source
 PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
