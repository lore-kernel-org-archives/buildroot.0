Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02335C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 14:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4D6240304;
	Mon, 27 Dec 2021 14:59:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cZVgK9TmVkT9; Mon, 27 Dec 2021 14:59:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0998402E5;
	Mon, 27 Dec 2021 14:59:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EFE4C1BF20F
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 14:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECA5260E5B
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 14:59:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4GxS2r0Jm9Cp for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 14:59:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F19E460E3F
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 14:59:40 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id s1so32807694wra.6
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 06:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BI3I9HgaddCdnwK1R0s3/2ireLRwmU2iJsPv52+eIgA=;
 b=eiG3/79uy6Gcl5jmS5CcaORevz1UNON6lsbiC5m/Wb/EC495HvmUWas6CiICceyUDY
 w9ytzpNe3XQYDmE/wF9GHshtrKe5csIGRClfeDVR0miHfU0s+8fLz5yhTuqv5aRLfbTT
 4SgQd1v7tTJOD5VH6oOZnSsF0W2EUTdg9sBm/RoZiukP9hz9PKwLmwgWdvskk+dVCPGm
 PYu9nusS1DxmyyZF9fEGHw+M/SLlvq31G2UggSXESr6iQ+nTAtdOvchSBT5jOgOUCfWZ
 Y6gPIficr08YCWmVczXv+wnpyiZMiJNlwuAF4Pn3gJEOIql9HGS+I06jCoCpLqKKV5Sy
 zldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BI3I9HgaddCdnwK1R0s3/2ireLRwmU2iJsPv52+eIgA=;
 b=5iNaIT4EPlWVEH8ofFfWuDZR5wOEpROha3twALmd+ZBy470jOxjVJsYJ3nPf+q3PJ7
 xkrsh1PUPBuUrv+Pf5G5s7/ClwQKZ7KyjvyN1cvjhMw4HlZLQ8x+QYSDkpesXJWn/t/m
 4lWU18EdsVJAsO75ctJzqUO1Cf28uwKwgGEwFHNPHA8gIlx/whA2eLD+2D4HMatwo3L5
 dM5p3wCqHPpySc7IeIaZDnRGbks1V/Ll3xWZ/aBB2vD2hLV41BAU0YlCXXSERY8Sx14f
 5y1kB1BJ+yruc1xmnKSSM3Toxe4cr5rl2OakJqHTSWHVptwPVFcWSp/mkTRE5cIoyEmZ
 KAAQ==
X-Gm-Message-State: AOAM532Ho/MdzNzt5EZqSGytzZ02mdKd3zVENgUH3vQyb+6nStmkdK0e
 scRpqqnv0MNGNl3I4epossZxCFqi+sTLCQ==
X-Google-Smtp-Source: ABdhPJy5+8hntn8Hb9hJGpYFj0ZlPaxXNisuBau/1P7RqWzFPIbUFmwV87+DlLA+25cWwWadvP2Elg==
X-Received: by 2002:adf:d225:: with SMTP id k5mr13053428wrh.360.1640617179103; 
 Mon, 27 Dec 2021 06:59:39 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id c7sm17360293wri.21.2021.12.27.06.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 06:59:38 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 15:59:00 +0100
Message-Id: <20211227145900.1969442-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tk: bump to version 8.6.12
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tk/tk.hash | 4 ++--
 package/tk/tk.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tk/tk.hash b/package/tk/tk.hash
index 5fc0b6fc66..acf5e45157 100644
--- a/package/tk/tk.hash
+++ b/package/tk/tk.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 d62c371a71b4744ed830e3c21d27968c31dba74dd2c45f36b9b071e6d88eb19d  tk8.6.6-src.tar.gz
-sha256 2cde822b93ca16ae535c954b7dfe658b4ad10df2a193628d1b358f1765e8b198  license.terms
+sha256  12395c1f3fcb6bed2938689f797ea3cdf41ed5cb6c4766eec8ac949560310630  tk8.6.12-src.tar.gz
+sha256  2cde822b93ca16ae535c954b7dfe658b4ad10df2a193628d1b358f1765e8b198  license.terms
diff --git a/package/tk/tk.mk b/package/tk/tk.mk
index 102d368518..830b241f74 100644
--- a/package/tk/tk.mk
+++ b/package/tk/tk.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TK_VERSION_MAJOR = 8.6
-TK_VERSION = $(TK_VERSION_MAJOR).6
+TK_VERSION = $(TK_VERSION_MAJOR).12
 TK_SOURCE = tk$(TK_VERSION)-src.tar.gz
 TK_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TK_VERSION)
 TK_LICENSE = TCL
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
