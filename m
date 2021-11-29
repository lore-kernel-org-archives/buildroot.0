Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECBFC433F5
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 06:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3368540275;
	Mon, 29 Nov 2021 06:35:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mVxDESwx3UUT; Mon, 29 Nov 2021 06:35:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DE4740146;
	Mon, 29 Nov 2021 06:35:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 069391BF405
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 06:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E947860809
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 06:35:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Dfum1O5Gw-J for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 06:35:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 368B360807
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 06:35:45 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id o29so13664060wms.2
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 22:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0DrlgJuNFfPOgnUYFvw3RWsFMwSB8dASq/iJvl9BbAU=;
 b=cZ5/1I6odWkwM7Ypyrc4lwsjvOdqlSdI0BdXsrVfONCbn7b+iI/r+aMX6SI/CdHPQm
 FLMNjHf0FOpbFrBkNS8QQxo0RV/r0zixsr6eXG3eUUXhOTGdo7yi5tkm1fXIEGiCvvV/
 zNbEadQ5dWJfhbTxVEZnQ6fMLOpTYQdlNdOKb9Wau0UmLfdCPUWe1O3Mx+LUrk3BN9um
 ZoLybxwK2k0qtzln3J6VQ+YLRPKx+oZ1ldDgGlwlA8U/rf8j73KHkZRikqa/If0KytQ5
 P+EF4SyKkQc9l9xjzdDtO3BkS7ZCNpDtkF4eops48yBghF3lmWE13I2NkyE3t6MDLwID
 lMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0DrlgJuNFfPOgnUYFvw3RWsFMwSB8dASq/iJvl9BbAU=;
 b=IIeYKROkxF9oFe13lQBxwvLSJt6mGNe6L8IZrpiTUd4y2B+zGKTssTZwMtNaqFD5kX
 oLl0KyuAYOJxxCdxfvcNl+VqEKlTB/4L1vmstZKoC0tX9HFpl6F6y4SqJ/OrcUa/o69U
 2/Mad6yYofaxuCqF2cwHroLu0JjoJW/y5Mh+vzLG6ms1zvc4nGHlVG2bOO0FwXxMOSma
 3bvIomm+tT4sw08+6UCXhHasxHP9j2fsZSsTtfu9gYui1kiRzUXraUFbk/cvmqaVehn8
 LLQGdInoP7mkb1nygaldoNVSmm25xfQBa9FQMEMudOBsvPG6SZfhYfOUFalK6VB4Z4/v
 t9QA==
X-Gm-Message-State: AOAM5303vvcrsOGPSYUpj5nSZn8D5ZcoeFX7BiGHRIcaHVUNAhChZ1ez
 Tk9oe9itERs/RumPOFKqNoiprq3HHeI=
X-Google-Smtp-Source: ABdhPJwJ93qZ6sbBIqKtGZdPO+VVeC6f5ytBdL/NPEag3dIyE6GCpiDnHfvV3WWVSBSRg+T0wxNRBQ==
X-Received: by 2002:a05:600c:3510:: with SMTP id
 h16mr33964469wmq.144.1638167744125; 
 Sun, 28 Nov 2021 22:35:44 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id j11sm12666809wrt.3.2021.11.28.22.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 22:35:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 07:32:15 +0100
Message-Id: <20211129063215.2174139-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/leptonica: drop spurious spaces
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop spurious spaces added by commit
ccab2d636fbee6eb8073ea2010442d7678a9ec54

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/leptonica/leptonica.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/leptonica/leptonica.mk b/package/leptonica/leptonica.mk
index 368078bf10..8791b0c4c2 100644
--- a/package/leptonica/leptonica.mk
+++ b/package/leptonica/leptonica.mk
@@ -16,9 +16,9 @@ LEPTONICA_CONF_OPTS += --disable-programs
 
 ifeq ($(BR2_PACKAGE_GIFLIB),y)
 LEPTONICA_DEPENDENCIES += giflib
-LEPTONICA_CONF_OPTS +=  --with-giflib
+LEPTONICA_CONF_OPTS += --with-giflib
 else
-LEPTONICA_CONF_OPTS +=  --without-giflib
+LEPTONICA_CONF_OPTS += --without-giflib
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
