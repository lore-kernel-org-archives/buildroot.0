Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FAEC433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6495A82733;
	Sun, 27 Mar 2022 15:08:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nsFtcTeNaiCD; Sun, 27 Mar 2022 15:08:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C3E381C0A;
	Sun, 27 Mar 2022 15:08:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 579301BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4688481C0A
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:08:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lskeNv1y1cqV for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:08:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7095981B7B
 for <buildroot@busybox.net>; Sun, 27 Mar 2022 15:08:14 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id m30so16941819wrb.1
 for <buildroot@busybox.net>; Sun, 27 Mar 2022 08:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=laCEhnKzn4Tr2MNDIbAtmOxPuU1m6d+Qu0pJMoIKdEs=;
 b=XzamgWXdeOmXP/OW0N5beFjgV7aiUkrEVWGDvTpvJe1iVwQ3UIfUCoBhPijJe/yYt+
 H98BLT0m5XbZxmyPMnvo4HASyh4pTvozjKrTlUwuJKx7r8Tf2S0jOqG0p2/J2NAny9ti
 yYMJRRKs4VWKsGpMo7yHeHn4viZxgWQMPLrcycS4naD9L6hKgm3ZwHGe/oqiaSOEa7/7
 IpdFsHq0GZF83t+TS0YZzf4vFlSJsvF7uhh0fKfJVN9RE1743XjnS8uq2T/znQy+xCho
 K+qxQh4LdSPpG2jdPs9tw9746L5U71tAJVIrf01MhYlNn07piHYaArsG9Z+XGKJ9aY6S
 XBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=laCEhnKzn4Tr2MNDIbAtmOxPuU1m6d+Qu0pJMoIKdEs=;
 b=uweH2WbuZrC4ZxhNHJ5FtcEjyZnsVLOpaK4At/weBaOQUKTsgwQw9UHBP5eqJ90hLs
 3Qoq57+XSWw1So7+UyylrwR+sdUGq+IH68NPWyBaZir3+UTOJlCK03O+FL4awLAP5Q8S
 zyf1GkV9k4lrj46VjAcWsuzVeeaoDBjxQO+bWSxlGNzaRreMN70nshUjljs68C0zPVxu
 Ti+CSR0izR9eKZ8JsD9MJKzYVNAoCpSkrV/i5lljkpq4XXiK+UqQhZE3p30DDd2yuDYj
 wZew4JkP1DlQU00clgC60QirgXf009TDVORcgD+6pYy6KtuyM+N5XyyZp45Fvg1AQF5f
 VB8Q==
X-Gm-Message-State: AOAM531MwPHmy3Vmo6No/VJnqrYXdum0oPsjb3HGLUhWB6CD6opsbfTW
 EAZA59hghkuJ4A2L6V1bINliXnDW9J0=
X-Google-Smtp-Source: ABdhPJxffaGssnC4MAY0pQY17ir5grf4PIyVwoZ120uKdq0zcXTgjqZYVtRvkBNQOtqgBxXB1b3efQ==
X-Received: by 2002:adf:e2cb:0:b0:203:7564:1076 with SMTP id
 d11-20020adfe2cb000000b0020375641076mr17776479wrj.199.1648393692362; 
 Sun, 27 Mar 2022 08:08:12 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a5d6d09000000b00203ecdca5b7sm10855796wrq.33.2022.03.27.08.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 08:08:11 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 27 Mar 2022 16:20:48 +0200
Message-Id: <20220327142048.1477306-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/luasec: bump to version 1.0.2
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

diff LICENSE:
-LuaSec 1.0 license
+LuaSec 1.0.2 license

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luasec/luasec.hash | 4 ++--
 package/luasec/luasec.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luasec/luasec.hash b/package/luasec/luasec.hash
index 1ea422aa9..1e381612b 100644
--- a/package/luasec/luasec.hash
+++ b/package/luasec/luasec.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  b7e18f475c64896fe4921d367adabae765914f7526a68487a5fa6831040e7138  luasec-1.0-1.src.rock
-sha256  0d3431dad143f41c8902e4ee867e386a702ebad856c45239fb86460e27dabfbf  luasec/LICENSE
+sha256  7ed5d08aad8f0e8659abb3f43c935da1c898474d4dc121e9edfbeae5c4c67fb0  luasec-1.0.2-1.src.rock
+sha256  84376baf33cefbcc1e9adbca23fcf87f51c1107956660cda2880feaef86d6075  luasec/LICENSE
diff --git a/package/luasec/luasec.mk b/package/luasec/luasec.mk
index 3ef0c14da..4ace94d16 100644
--- a/package/luasec/luasec.mk
+++ b/package/luasec/luasec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUASEC_VERSION = 1.0-1
+LUASEC_VERSION = 1.0.2-1
 LUASEC_SUBDIR = luasec
 LUASEC_LICENSE = MIT
 LUASEC_LICENSE_FILES = $(LUASEC_SUBDIR)/LICENSE
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
