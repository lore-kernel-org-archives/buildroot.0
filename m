Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1C3C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 14:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 031B781858;
	Sun,  9 Jan 2022 14:12:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kj41jeHUNJOn; Sun,  9 Jan 2022 14:12:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D8FA8140C;
	Sun,  9 Jan 2022 14:12:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 642EC1BF4D6
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 14:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52BF78140C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 14:12:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RN4iuvEpDEP3 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 14:12:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 201BD813B7
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 14:12:02 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id e9so20261008wra.2
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 06:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FJri+huUFrAAs6dO+uMSJzYjm4Pcn+r+ptE3O3UkSfc=;
 b=GwIuD2XrmR1U9QujcLJ9+yFwuFunwL43RBPoxcswyFY6QFoG+sj8Yx+X7gh2X5tkr4
 5VAqHgBTd0T+sA8vEMvK/ujv4lxc8NzyzqjKAqi5AggiFOh6+bcl4frQ/ir/rhnyO6KP
 QNouWgnAWAW8xRCppKs/Kx3WPHVKs4HihnbOUONRk/65dI4IG3kb6Rw9INXN/HYuad5Y
 cCVTfp7Dr0dJYxShpXmnX/hjPXDcWI82zgzJrMjgp653Lfsw12jJcznptsum2YPICzpm
 kCHXpOr8GbZFTN22cG/yeGOf4kn3+XDbTydUeoW6IOIcKA1fTaIQyPTpJYWgtEpOHAvH
 yVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FJri+huUFrAAs6dO+uMSJzYjm4Pcn+r+ptE3O3UkSfc=;
 b=6YlyXjX7cggMyKtNWV8fodOyEedzqO9OSz125SolXUrt3J2vBFEdtp8HVB3i3KfWx2
 NhFq1DjfULXPWXRBdLxVfA/++nHLoh5r41MguktPmA1r4ojV23pESpMA4GL8YD8xR3DI
 TC/bHW2FuXs4XuQjBvjrhUvwHJimPnoHtsrXHznvJX4mgFzsCQtKMqTj36iOfDh4wdUk
 YcRUOGiOgGHoasWKiNcVzRMr7rhkGsosBiQn8CcJU6upZrrJHYEsEn8pwc1FjqfHBAZq
 U48fH0bHdMTGLYSQBUyuk5CJRPqu3JaZzp0FlYTbTnHwhWG80SxY+xGVqqQYcrrgLaf2
 1OCg==
X-Gm-Message-State: AOAM530GY35a21JQeL4SCUJsVEUvubKp6E76BmVSPCPVq+2gkE7XlMdP
 dSYiZNovB5S3+xas7h821DD5U/PNVKQ=
X-Google-Smtp-Source: ABdhPJx1jCqVB/8baWKLZFVCFTgUMfLCVf6pA2posyPmA/rOKruo923FT1JqFQbPw3lol7mG8glClg==
X-Received: by 2002:a5d:4012:: with SMTP id n18mr5479905wrp.674.1641737520278; 
 Sun, 09 Jan 2022 06:12:00 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id i4sm4255274wmd.34.2022.01.09.06.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 06:11:59 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 15:10:50 +0100
Message-Id: <20220109141050.665536-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/atop: bump to version 2.7.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.atoptool.nl/downloadatop.php

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/atop/atop.hash | 2 +-
 package/atop/atop.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/atop/atop.hash b/package/atop/atop.hash
index fb2eb1c727..18ba42340c 100644
--- a/package/atop/atop.hash
+++ b/package/atop/atop.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  a606705aaca940a6d44d67c886529a75db98fd88140f743eb0aaebb184c38af7  atop-2.7.0.tar.gz
+sha256  ca48d2f17e071deead5e6e9cc9e388bf6a3270d695e61976b3794d4d927b5c4e  atop-2.7.1.tar.gz
 
 # Hash for license file:
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index f2a1f1de51..8a0fcda33b 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATOP_VERSION = 2.7.0
+ATOP_VERSION = 2.7.1
 ATOP_SITE = http://www.atoptool.nl/download
 ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
