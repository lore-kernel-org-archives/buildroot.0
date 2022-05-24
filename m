Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EFCC433EF
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 17:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4563241B59;
	Tue, 24 May 2022 17:11:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rVq73X_-ePg2; Tue, 24 May 2022 17:11:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC44141B52;
	Tue, 24 May 2022 17:11:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8AD451BF3D5
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 17:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7167F60EAD
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 17:11:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 732xFTto_8y4 for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 17:11:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 691A460ABD
 for <buildroot@buildroot.org>; Tue, 24 May 2022 17:11:45 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u3so26652033wrg.3
 for <buildroot@buildroot.org>; Tue, 24 May 2022 10:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zP6d19tje31vNGV+b0RSWbt1MgVaRH/HEa68cmv1hS8=;
 b=okGCXoAyDUfAnOuDGjxZEA2JAlrDZCAUIDbOsNKcSqTII1ibEr97zqTjgmDW5fi5qj
 d7Jrv/76/RsAQBEUIUClzK5FEjLf49VJrwFG/5DxO/erAhQTQKX2171S3mVRftw8MzSK
 f28f0N+c1CxJR+aN9tT0wgkVVTsdd1heq4TS55HcvYO8+6b/qm17/FHaAkH2YlZpgvJJ
 dBBAplwVouwKQuUtGQEiqYFBW2xmswn7nTn/9j5/eGEsJ51wDy2zZjHlCHmPqqe9dEkT
 IKY9bo0CGPYmTm9WzBIfpG/GIpm1Zby8ncmfPcUedv68j/0hWzfolTZ7gcifn3UMe80v
 fvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zP6d19tje31vNGV+b0RSWbt1MgVaRH/HEa68cmv1hS8=;
 b=7JxUqu6Ata8aFc4s6kZKWDgGJrBhCnWVknSNOr6BktBOH7frUQlgt625a2OkrbAywW
 zBBJHOWv/ye5QhqG07aalZ3bQNGN4+rWd78SBP2zYwSB5NplINXraC/IN8aPbDzq2e3G
 b3y1LKKhCWQdMPch455xMaNIYKk8f2qWtiC1q45d8xiZB6WgessP9crt+nL+mU4+sMg6
 hO5kHfYMECroLe43lRLqd7DZ3lizBVc0E6AKZCdPNPVD+jneCLDWLpOUIfEo6cCeq0cr
 enJ5cmV1pi80vPi8r4XKFaxen0/+NetdWVkrJ8MXK47w774fJhk+7SaZ8pyMYriHPryw
 lB7g==
X-Gm-Message-State: AOAM531azS8t8/mlFmNOtZ6UF7j6AfE+PHTA1B60Mog2D2YOG/d3cysK
 GvkPCaeknclPNjb+WNrikPiuj4BSOLE=
X-Google-Smtp-Source: ABdhPJzbTddf0lBaKv/YanL2IdH626NOl9II0GEopm183xFEEz6yNUHuaYSNnwBRxg9X2R1qUbOc9g==
X-Received: by 2002:a5d:59af:0:b0:20f:d3fc:c5ba with SMTP id
 p15-20020a5d59af000000b0020fd3fcc5bamr11278357wrr.436.1653412303387; 
 Tue, 24 May 2022 10:11:43 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c4e5000b00397473ae25esm2808921wmq.34.2022.05.24.10.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 10:11:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 24 May 2022 19:09:11 +0200
Message-Id: <20220524170911.2350456-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libostree: fix build without systemd
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without systemd raised since bump to
version 2022.03 in commit 0eb073ca2ba89dad2e531644fd33f693d228ef94:

src/libostree/ostree-sysroot-deploy.c: In function 'child_setup_fchdir':
src/libostree/ostree-sysroot-deploy.c:2837:19: error: 'uintptr_t' undeclared (first use in this function); did you mean 'intptr_t'?
 2837 |   int fd = (int) (uintptr_t) data;
      |                   ^~~~~~~~~
      |                   intptr_t

Fixes:
 - http://autobuild.buildroot.org/results/c134d849e7942911cb6bd13869dd2f3aefd8c21c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...y-add-a-missing-include-for-stdint-h.patch | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/libostree/0001-lib-ostree-sysroot-deploy-add-a-missing-include-for-stdint-h.patch

diff --git a/package/libostree/0001-lib-ostree-sysroot-deploy-add-a-missing-include-for-stdint-h.patch b/package/libostree/0001-lib-ostree-sysroot-deploy-add-a-missing-include-for-stdint-h.patch
new file mode 100644
index 0000000000..35f92c37ff
--- /dev/null
+++ b/package/libostree/0001-lib-ostree-sysroot-deploy-add-a-missing-include-for-stdint-h.patch
@@ -0,0 +1,24 @@
+From 4b7fc4f1e90bbeac89d2f939cde3070e69b4787a Mon Sep 17 00:00:00 2001
+From: Luca BRUNO <luca.bruno@coreos.com>
+Date: Fri, 6 May 2022 10:07:23 +0000
+Subject: [PATCH] lib/ostree-sysroot-deploy: add a missing include for stdint.h
+
+[Retrieved from:
+https://github.com/ostreedev/ostree/commit/4b7fc4f1e90bbeac89d2f939cde3070e69b4787a]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/libostree/ostree-sysroot-deploy.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/libostree/ostree-sysroot-deploy.c b/src/libostree/ostree-sysroot-deploy.c
+index 404f336fb5..96cc07531e 100644
+--- a/src/libostree/ostree-sysroot-deploy.c
++++ b/src/libostree/ostree-sysroot-deploy.c
+@@ -22,6 +22,7 @@
+ #include <gio/gunixinputstream.h>
+ #include <gio/gunixoutputstream.h>
+ #include <glib-unix.h>
++#include <stdint.h>
+ #include <sys/mount.h>
+ #include <sys/statvfs.h>
+ #include <sys/socket.h>
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
