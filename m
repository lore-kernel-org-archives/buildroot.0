Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DCFC433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 23:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC14340235;
	Sat, 18 Dec 2021 23:23:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PT0n_MuRBjy2; Sat, 18 Dec 2021 23:23:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0570340204;
	Sat, 18 Dec 2021 23:23:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DDC5B1BF306
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 23:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA60741820
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 23:23:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nFJQXmsDTfTe for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 23:23:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 065EA417FB
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 23:23:06 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q16so11651733wrg.7
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 15:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sa+/NzS24mUuVImhOGOcl9R7j3XHuOsaaRl9dbWR6vo=;
 b=PWWU2XY1syC31BeHpoHDO0U3aViII70qP6Q5HF8tFnx9Fao3q1COTZVSj062mcnKP0
 6QMiYUMtXQZwRu8ug/MjB8LjJBZi4bK6CBml12DavuQaKsWOHrTA96MAaEsW494oI5Zd
 62OjYyvYZtJuLV4Ddl6aovv3j6oC/oEHqYAFUclzOoT3YsOHFXsqpAio9Gcmo126nC2J
 VlTZynOcvlyyzK88eXlQpTaUbM4qwXunU17mGOtNj7hRV6w/dK+J9r2l4txVL3BGN4+0
 C3gRFXGHoRT66wl0nedvsY5X6QtBCJNfCG5HFctx0ElMG8TyUZ1320zb27bEyDwiC1ld
 LBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sa+/NzS24mUuVImhOGOcl9R7j3XHuOsaaRl9dbWR6vo=;
 b=x7fyDT0ehBRi1pBM4lvdvgFKP2XSzU60f5db6zh86fyRcFFYEedZO/ZmzzfK9tt61p
 YSNNRhLQN1FWETmxnlYoILNr85W2wFlMsPtRD2CEutHunpuUoI0fhzUw9g1vh8YD52K/
 LEFHXaq1XvV5n5N5scyLtjZ3aWkKGfxjUxhP5/LfRyyPUcoeBNz0aisiDcoYuMbsac/u
 yQnb9EJaK6Ww2+XwV0eaBzICm+4KKb7ukT96s9xkNcB4X/HnIadcwb1jDOQGwgXFhpUJ
 lec+pCtd+xuuDlxERKMgyH9YHSaM/5+fG+jXPeD2DxG6NwNm8S4m0YuLF4btyz3SVQ+U
 qnMg==
X-Gm-Message-State: AOAM532e0Uivnrn5ulMEbImislm89Q3DlWvJC20FyTyUmoY+x8wZ7Llm
 +npLsGHuNG63ZThZCo2syijy7GEpoCaXQw==
X-Google-Smtp-Source: ABdhPJxFWrmXa1P9pb+gaDtIq/NtK/OPAcjrzkAFWjdXdDKae8BUYOkQRRIoI8EGQWaMGmGYJpE0IA==
X-Received: by 2002:a5d:6488:: with SMTP id o8mr7616403wri.631.1639869785202; 
 Sat, 18 Dec 2021 15:23:05 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id g124sm14237118wme.28.2021.12.18.15.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 15:23:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Dec 2021 00:22:38 +0100
Message-Id: <20211218232238.667138-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libopenaptx: use official tarball
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
 Yunhao Tian <t123yh.xyz@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use official tarball and while at it use 2 spaces and reorder files in
libopenaptx.hash

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libopenaptx/libopenaptx.hash | 4 ++--
 package/libopenaptx/libopenaptx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenaptx/libopenaptx.hash b/package/libopenaptx/libopenaptx.hash
index 76b4e66c9b..acaec5d642 100644
--- a/package/libopenaptx/libopenaptx.hash
+++ b/package/libopenaptx/libopenaptx.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING
-sha256 a19b3b642def6f86441b73dd4efda6e6f13d49e7e2d6e5e91cc7eb464ebb505a libopenaptx-0.2.1.tar.gz
+sha256  f13eac1ebfe31a563943cd47819eece1109960e10a1e85c111975bcfd37d5361  libopenaptx-0.2.1.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libopenaptx/libopenaptx.mk b/package/libopenaptx/libopenaptx.mk
index c2f5fa2390..12c33f6225 100644
--- a/package/libopenaptx/libopenaptx.mk
+++ b/package/libopenaptx/libopenaptx.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBOPENAPTX_VERSION = 0.2.1
-LIBOPENAPTX_SITE = $(call github,pali,libopenaptx,$(LIBOPENAPTX_VERSION))
+LIBOPENAPTX_SITE = https://github.com/pali/libopenaptx/releases/download/$(LIBOPENAPTX_VERSION)
 LIBOPENAPTX_LICENSE = GPL-3.0+
 LIBOPENAPTX_LICENSE_FILES = COPYING
 LIBOPENAPTX_INSTALL_STAGING = YES
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
