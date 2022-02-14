Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18F7C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 21:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A11384136C;
	Mon, 14 Feb 2022 21:19:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NcEq_gK1BiAQ; Mon, 14 Feb 2022 21:19:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F27FE410DC;
	Mon, 14 Feb 2022 21:19:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A75771BF275
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9534E4010C
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:19:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xsgyavacAh48 for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 21:19:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE2D0400B9
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 21:19:40 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id y18so11506998plb.11
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 13:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IN45awpTLOkNyOd/Br4uEOQSiSaOMss1EsLEuJ7HRH0=;
 b=Sm2VeprJI7py5F606n7W8KJVI/oOfpfQdHuS2WtNHQxdWuBycJse1jGLIZVOvS5vFz
 wDqyQnfxtbbzv3haZTmp4ojaiCuEEO3aw4f8py6OX00r+dxR5LoUJi9H5R1B3tMEzc3z
 Sykx0vB8fz/FiTiOuilf3ar5Reo4GmzICS0oGCAsHkoBMfMv2OdPTenV7ZY+Wtic/kTU
 iih71jNdF3ODvqmv3ljkfHanu5CmnnVEdK/LBxaOxzc8alvVuYclCuJFh/xi51JJezML
 FhmpZTjKHzQ/W3tx9V+8xJrn1Gmd/fOvmEd9cYAeeFbrQqQpNAln7Xu/+JNue2rGtUtp
 YDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IN45awpTLOkNyOd/Br4uEOQSiSaOMss1EsLEuJ7HRH0=;
 b=OKff5+TdwPxljh52MbtDxksi1NQXWNI/VoyA6oByFLRhtBUH3JQsYGqgPRubCdaObA
 k9RGnCOTqtEXkhy1ahjpMgXv4DmJ9/jrHKDd/UgvEvTTSpoD94dbk5YlSZeqjh7WHnFF
 gNmJ7IGkro2nQG4AS8aPgKhT00vN7AWFJLr9mijpqChqgZi0ZcDTCpILhPOCt7Cu3UpV
 tl4rZgkViXDI4d1OQ1LFxA8p10dNW17+ZO1fBF6R0pPWglG52s9Eb2+QrPhQDk1GDxsb
 1yne9GvZMFFGqlwsbf2c4DSIpvDCp3VsloR3zPvgMTiO5vmw3/WmvHXtSFpWU1a2CJwD
 76cQ==
X-Gm-Message-State: AOAM532jD9C3KyiVEAwOophbdq5oLyN7/CtRa5w60UIqmFp9J9SiobOW
 Lyag/UVo5mEaZmhTzH+s2OZQf8aAwXw=
X-Google-Smtp-Source: ABdhPJyyel0BOhkBhYYr7YTLeDLQR5lagRR+xmOtw9IQ4WHIaL8NFsrHVkYLTQsD4rwUz1l5fEXMug==
X-Received: by 2002:a17:902:6903:: with SMTP id j3mr681428plk.23.1644873580009; 
 Mon, 14 Feb 2022 13:19:40 -0800 (PST)
Received: from chrisp-dl.atlnz.lc ([2001:df5:b000:22:a54a:1650:6ba3:f974])
 by smtp.gmail.com with ESMTPSA id e8sm20646845pfv.168.2022.02.14.13.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 13:19:39 -0800 (PST)
From: Chris Packham <judge.packham@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Feb 2022 10:19:27 +1300
Message-Id: <20220214211927.3673441-2-judge.packham@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220214211927.3673441-1-judge.packham@gmail.com>
References: <20220214211927.3673441-1-judge.packham@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] micropython: Bump version to 1.18
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
Cc: Chris Packham <judge.packham@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LICENSE hash is update due to change in copyright year.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/micropython/micropython.hash | 4 ++--
 package/micropython/micropython.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
index d5045e8f27..6beea78bc7 100644
--- a/package/micropython/micropython.hash
+++ b/package/micropython/micropython.hash
@@ -1,3 +1,3 @@
 #locally computed
-sha256  c21dbf8144237b3dbe3847c9ad5264cd0f3104eb078c810b3986004cce8fcd70  micropython-1.17.tar.gz
-sha256  59b1f0947a87c90d0d29dbe2c8deb3d1f8263bbbd2fb5ebcc79a649cff6dfcba  LICENSE
+sha256  d804a422872c6fe283c6e4fd392698472035b34b5a683ac26adbd5c7582267f9  micropython-1.18.tar.gz
+sha256  0f678c2abd7fe2cfca36693630506bbcbdfc219bd04bf4a02fe3b094ae4c666f  LICENSE
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 55c00ba08a..d8ba5ac0c0 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MICROPYTHON_VERSION = 1.17
+MICROPYTHON_VERSION = 1.18
 MICROPYTHON_SITE = $(call github,micropython,micropython,v$(MICROPYTHON_VERSION))
 # Micropython has a lot of code copied from other projects, and also a number
 # of submodules for various libs. However, we don't even clone the submodules,
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
