Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8B7C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 18:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9A4183F54;
	Tue, 12 Apr 2022 18:01:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RsTAZbgQykbk; Tue, 12 Apr 2022 18:01:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF51383F2A;
	Tue, 12 Apr 2022 18:01:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B06F1BF3C6
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A19883F2A
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:01:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EY2F-phn9XxN for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 18:01:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED21483EFE
 for <buildroot@busybox.net>; Tue, 12 Apr 2022 18:01:14 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u3so28895181wrg.3
 for <buildroot@busybox.net>; Tue, 12 Apr 2022 11:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JmgutB+KY1G5q6ovHIx+7wu0OzdHK3WwyYOiHh/qyxA=;
 b=aYzR5orsiz/9rKdDj4oPv17MjCDlOnet9KUVYRxyOXLr7Lk86WvcUz5IdcAa47/u7f
 ogHGE4UWwypQ+Nlnxa24xVIMH3+Hmz/BFuvG0owIbGCgJqpwnYNBsjf8hUhYfW8+sz9y
 8kQv+6XpQZaAUh17cjhpRlaQ3Qp/UYDmxxFQSYGi6jL3OTABHyfsaDMQln0834+VO0uv
 MtPMGMsZJWVigdiUGKKCWoZ0oVIYkOFBROoRckXbXiONKU9XdnnMTvRJBAepxMsQ3h1E
 bnBf5Vof11ble6nX/c6VM41wjt9zx4fz8DJoQgQT1f6ms94jztazOQqYJvTezxyD7XzM
 AQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JmgutB+KY1G5q6ovHIx+7wu0OzdHK3WwyYOiHh/qyxA=;
 b=QWuPnpvsbwgLUNeXfOaO9C88T8XJbpK/QjkFKMtaPs/WCz7JztI5b21HHtn/ovsNjh
 QymHEkfKjVo2LvnoqFgyJ0omxsNgMehbbhdM/mtoU9LJNZ97CtYUg3JqQgHPDOzTiBx5
 YTL6kpGYseFsaq1FvWfY99rkRiY5rEBfOtOmajcox0ucrDR5TMiu9Pq4dWidciT6TPaS
 8cDyH0E0D38zh2YNVVbq26D9TJCfIwiF0UiaKrcYRxcUZhEXYM9YrbRW6KupAYiJ2kCl
 fYPnLe0qxNCLmOsAuGXImkjty5nTTkkJ3KD5FpNdQ9YS1Gq/gJhS0Hfouc1lmm2h7dOE
 X8Ww==
X-Gm-Message-State: AOAM533rnf3HYh58UgkOMcmkE8e5FucJ0sm/UdD+66nFFG2GMUV4snCF
 uGjAbVVXMFJwPtkqNuDH8YVf7xoSeuI=
X-Google-Smtp-Source: ABdhPJwTxoLOo3n0Ies+J9aX4DaGcuNYvt7TITVOkZwd3g3wqZs7eQyYnaog1TzvBPnInIxjywg9Wg==
X-Received: by 2002:a5d:68ca:0:b0:207:a1d3:da87 with SMTP id
 p10-20020a5d68ca000000b00207a1d3da87mr12811124wrw.492.1649786472878; 
 Tue, 12 Apr 2022 11:01:12 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b0038c9249ffdesm198727wmq.9.2022.04.12.11.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 11:01:12 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 12 Apr 2022 20:00:57 +0200
Message-Id: <20220412180057.2709514-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/freetype: bump to version 2.12.0
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
 package/freetype/freetype.hash | 6 +++---
 package/freetype/freetype.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index 7abc3d96d..78d0ba20d 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,8 +1,8 @@
-# From https://sourceforge.net/projects/freetype/files/freetype2/2.11.1/
-sha1  86bdc98b37efe447cf53420bf2c18402ff905112  freetype-2.11.1.tar.xz
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.12.0/
+sha1  fd1eb1a27f178808e1d8ccd82c71abfa5d0ebe13  freetype-2.12.0.tar.xz
+sha256  ef5c336aacc1a079ff9262d6308d6c2a066dd4d2a905301c4adda9b354399033  freetype-2.12.0.tar.xz
 
 # Locally calculated
-sha256  3333ae7cfda88429c97a7ae63b7d01ab398076c3b67182e960e5684050f2c5c8  freetype-2.11.1.tar.xz
 sha256  c85e842b7ff04d95dab7d68e812773de0f8b67940e5449d35b42c66eb0f619fe  LICENSE.TXT
 sha256  08c135755dd589039470f1fdbb400daaabaaa50d0b366d19cebff4d22986baa1  docs/FTL.TXT
 sha256  c4120c6752c910c299e3bd9cb3a46ff262c268303ca2069b61f92f10a5656c18  docs/GPLv2.TXT
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 912e6c4da..5c6b8c73b 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.11.1
+FREETYPE_VERSION = 2.12.0
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
 FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
