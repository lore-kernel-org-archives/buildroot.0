Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFABC4332F
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 06:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3D0040275;
	Tue,  8 Feb 2022 06:34:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G7YGVyrmuv41; Tue,  8 Feb 2022 06:34:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C001C40178;
	Tue,  8 Feb 2022 06:34:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8AAF71BF31B
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 06:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 791EF813E4
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 06:34:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wdz7iaU55QSa for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 06:34:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8718181340
 for <buildroot@busybox.net>; Tue,  8 Feb 2022 06:34:45 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v12so100265wrv.2
 for <buildroot@busybox.net>; Mon, 07 Feb 2022 22:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eA7QFkGSQQ1WjzOiguDRyWuxa13RcmF091qK1c+IXPw=;
 b=hDIFInuGopP758LjgkOj4uU0Z8HoLuwXw+z5JoxJakv062rY1TkrbmjzWMqdtQkf0W
 4A1pEInMy2jjnk2km42N1NGZddaUeqkjnJ0uBTA6eumJI4tRZPSx+d3VKu6fTURs8Jwn
 v6qHyasLZFJCB0f518fXDWUiAKPsuhf/3+jC91HlHlL8GmE+Z2nnDCqJS14yrtj9jkSl
 tS3XdFL/w/bEEiy4qecNy9jOGBK/2tB8MQu4fDRF8W4Orw1jrpxqKY4jcq9LcH1CBY45
 MStMCIIed2bcr0gnXM7RepZfMIyPOpIQG1PrxixIK9j515+qSavOeohQJeJKXA/AtYKZ
 5ndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eA7QFkGSQQ1WjzOiguDRyWuxa13RcmF091qK1c+IXPw=;
 b=Pvl7NZijUDpYxWKpcrLs32ENq380r25g7n8U6E2ZCoiHhAhTcyvXOXRIcPr2RKklCK
 2QJjCBJLqFcH+rmQPRT64DvNo8v2ZgEmeQQQ9KK0xk8nh0yvlQoy1pVR+TW4jp8GqxZf
 u+7QQIcyJa74U2TkBg2ZwaupKd6xza4ZoDGQc9bh/0vIdN0b5ibTFL4g4sgfQGx3LEmd
 zk2pJ8fBaJANgALiO/GMROXRx03XPuHl6Wt4r/Gpj2+jQXIohg8+gv3/yF8Vaaj9bSz3
 8omYF8jUbIS1yaoB0VtY9NxSADHbkoeI59FbqYkFHBmQC5ci9WHcXggx6JR2R5EtXL9P
 tRWA==
X-Gm-Message-State: AOAM5308XWHk69YMZOvOFr293fQnDe+7ka8oDIRW9qRt6K8mX/FSDcf5
 CbL6Rr6EGxKieZLgl/QmT2Si3HOQvOQ=
X-Google-Smtp-Source: ABdhPJy+bysmArhpUld6lkSicKf6IviRcPbuER7Uuh9pIRlOXvv1VLzLQQSRl8VHWYj6LzGHDkNoEg==
X-Received: by 2002:adf:f5d2:: with SMTP id k18mr2283807wrp.381.1644302083105; 
 Mon, 07 Feb 2022 22:34:43 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id g4sm13530025wrd.111.2022.02.07.22.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 22:34:42 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  7 Feb 2022 13:24:23 +0100
Message-Id: <20220207122423.1561946-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/zstd: bump to version 1.5.2
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
 package/zstd/zstd.hash | 4 ++--
 package/zstd/zstd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
index d7d8a448f..eca44b89f 100644
--- a/package/zstd/zstd.hash
+++ b/package/zstd/zstd.hash
@@ -1,5 +1,5 @@
-# From https://github.com/facebook/zstd/releases/download/v1.5.1/zstd-1.5.1.tar.gz.sha256
-sha256  e28b2f2ed5710ea0d3a1ecac3f6a947a016b972b9dd30242369010e5f53d7002  zstd-1.5.1.tar.gz
+# From https://github.com/facebook/zstd/releases/download/v1.5.2/zstd-1.5.2.tar.gz.sha256
+sha256  7c42d56fac126929a6a85dbc73ff1db2411d04f104fae9bdea51305663a83fd0  zstd-1.5.2.tar.gz
 
 # License files (locally computed)
 sha256  2c1a7fa704df8f3a606f6fc010b8b5aaebf403f3aeec339a12048f1ba7331a0b  LICENSE
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 476190e9a..a4bbada82 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZSTD_VERSION = 1.5.1
+ZSTD_VERSION = 1.5.2
 ZSTD_SITE = https://github.com/facebook/zstd/releases/download/v$(ZSTD_VERSION)
 ZSTD_INSTALL_STAGING = YES
 ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
