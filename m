Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A127C77B78
	for <buildroot@archiver.kernel.org>; Wed, 19 Apr 2023 08:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AB4883F11;
	Wed, 19 Apr 2023 08:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AB4883F11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kJeZHIgtS4F7; Wed, 19 Apr 2023 08:10:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1DD282214;
	Wed, 19 Apr 2023 08:10:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1DD282214
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3312B1BF41C
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 08:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C42460F6E
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 08:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C42460F6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q-cXLAOirgTm for <buildroot@lists.busybox.net>;
 Wed, 19 Apr 2023 08:10:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B775160F1E
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B775160F1E
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 08:10:18 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3293e4b2cb5so35465725ab.3
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 01:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681891817; x=1684483817;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YaxG+g8+idTNUKTyeB8ua3GcofCaH9cIxFOmmhfEgB4=;
 b=BIaBgUJAWliMAZ5FBaT/h9C2AsWdbxq/dEJofvWgCnI5Xn8+9GNaAIIDiSqNoanABJ
 8ldaFznUhGoiVATEj8ccyKXgKaWI0roktv1P0EH19yuniT/U1TDYzUxZ0xZ4z00CUoWx
 7SwC3qBRj4uRwwF8uIkNN8XfAvB0MSscbXSjDILZuh9em89gDsdYoa0+s9+aPfeGj5XO
 +NAT+TqQtrvFJyeLVq3je7TZ+NluN8W1yZQoXv84OTfPtq6xdCFiZyYn2SBa9xf4ARjf
 MCUBapJLLLFIB9oNjU/kkAD6RYV932SKpq8v49R3G/0s9Z8Zo+P4wwsXVvUpkFctcXy/
 k70g==
X-Gm-Message-State: AAQBX9eA/cSny4yvKU/A0VexBQbFBQbm6qR05ujJhArccIUaPB1HsDkn
 tPyv9vBWCP925jk8iRPgKP4VZOG/uoM=
X-Google-Smtp-Source: AKy350aSGB1Bm/j0x28LAHwQmFdGUUDWWdD5DG2pS2PrggpDlUxvv6enfAI4CrhbC6YvPmfWPTKM+Q==
X-Received: by 2002:a92:c985:0:b0:328:b244:9364 with SMTP id
 y5-20020a92c985000000b00328b2449364mr15664305iln.18.1681891817387; 
 Wed, 19 Apr 2023 01:10:17 -0700 (PDT)
Received: from james-x399.localdomain (71-218-108-164.hlrn.qwest.net.
 [71.218.108.164]) by smtp.gmail.com with ESMTPSA id
 r13-20020a02b10d000000b0040da046d6fasm1218068jah.146.2023.04.19.01.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 01:10:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Apr 2023 02:10:15 -0600
Message-Id: <20230419081015.204308-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681891817; x=1684483817;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YaxG+g8+idTNUKTyeB8ua3GcofCaH9cIxFOmmhfEgB4=;
 b=lB8WDRF47ucXRBwaW3Z2pFBdXQaZ6wFwest1AUtEEudWpHsD0dEc+F3BRFfdkzRpaw
 zP1QqeXJROfnk+zZJ82aO05wABCDnOP8VCPokLsNreTlzsiWcUCzTpbzIYUuQCkgFFVG
 U16pArrgOlRL1KHN/IwpK5lqenc9ozbCsEinJqhv0kWiB3lplKNKhDK9aYuPVgpy/VGS
 W72zk2pnb29ZbDnTr3I5Jw+Q6BSiK5Bi6LP+yMQaklbLI4xDhegko1cHBx/UnomZKuzg
 NHrc32WxvuQP9+FsVkDXrysC1PDw6H7XPby5MNuPQNeIEvN+98PZqSedV/FGLb2DFIIc
 0+1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=lB8WDRF4
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 1.1.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 6993b756ae..49f367f5f7 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/1.0.0/meson-1.0.0.tar.gz.asc
-sha256  aa50a4ba4557c25e7d48446abfde857957dcdf58385fffbe670ba0e8efacce05  meson-1.0.0.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/1.1.0/meson-1.1.0.tar.gz.asc
+sha256  d9616c44cd6c53689ff8f05fc6958a693f2e17c3472a8daf83cee55dabff829f  meson-1.1.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index e417d8d627..6b901eb805 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 1.0.0
+MESON_VERSION = 1.1.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
