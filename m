Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A568C433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 19:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC7D340B84;
	Tue, 22 Mar 2022 19:01:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PiJzaGT5oBgR; Tue, 22 Mar 2022 19:01:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9210140B0F;
	Tue, 22 Mar 2022 19:01:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B10691BF59A
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 19:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FA1061291
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 19:01:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nqiXT8ifZj5S for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 19:01:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B89BA6127A
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 19:01:52 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id a1so23389951wrh.10
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 12:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4xFJKwbz28/u/66340f7VaHI2oMXT3NCleQhBPKPW64=;
 b=aDfZWFNNcFTJ8xMbf7F6NaDJrHcNvvyaiS+C01bWTNrqcFolb1ggnwiSp/DFZfgsDm
 71kiaNKAtSCPE9wtWctMDwzW8ltQIoEtWiuYANHLgBeAYA5zNTjmLrmLF4yTYhWEsD5r
 etTPf8xFMVLChbw4JGz5T0qv4NsAaIXaHWOnmVChC+MA4U3XRtuYUakCff6p7X+5q/bC
 aEqRXjIsbZG/N3ab//wgdQPeO3yXCjulGuCYnTZvcrbwAsbfMw6ixFmuk2z4Y31Zn9bO
 sCZLRmo6OflygFfiA5UZmC/uquCSGbXp+kKmb71I+LMqkvGtPsoAhynZZPFxsUwkdpyS
 /rbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4xFJKwbz28/u/66340f7VaHI2oMXT3NCleQhBPKPW64=;
 b=iSBAy+dyAIoPDc8C473A93wLjRTUCGI+f6miGrRsZ2pDm4GrHoknwm8mp0DMI3GDS4
 X4pTWvLY9Hk3VXNV6TtxWf5aqK8usbijXrOq/qp0kjwoDWbOQ13SGJLgKF2Qj1pne7Zd
 kWMoxhHjvh34DGpvHEUt9aDhCII/4Lu0wSqcDT7HXO1D1klXoE64YyvB40q15Ub4vX56
 Nu6bxjZbBFqbkrvs7c5fqHtjLBJfETjBC5MuNPL0v2kcBpPfXketL8Y3SfwSWNMI1dsh
 QP536FI2VE7TKSt964hCn7eOfm1s5/TL6AGDfaddblKpwOTy1r5uHstMdsbMm1L2aJeR
 ZvZw==
X-Gm-Message-State: AOAM533QrVF3WGmfuzw0e9Ala/hwnxlGcOnc4021r9fG7y1goe7Eup4S
 xXoHDlBjMqa1XWUeGEoRGAjAos1dFA8=
X-Google-Smtp-Source: ABdhPJyDKnGyTYC6h1aEM0N3OlhLJF/ooBEYKQL44A3lgSPJ5HgRxxeUSnqdU9Hr8p17+6IuD/HeBw==
X-Received: by 2002:a5d:5848:0:b0:203:fef3:888b with SMTP id
 i8-20020a5d5848000000b00203fef3888bmr14758719wrf.611.1647975710643; 
 Tue, 22 Mar 2022 12:01:50 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a5d47ce000000b00203e0a21c16sm19462122wrc.3.2022.03.22.12.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 12:01:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 20:00:32 +0100
Message-Id: <20220322190032.2566880-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gdk-pixbuf: fix target loaders.cache
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As reported by Rutger Sassen in
https://lists.buildroot.org/pipermail/buildroot/2022-March/638895.html,
target loaders.cache is broken since commit
75361a9aba042799040591fb84192802b137fc3a so fix it by prepending /usr/
to relative host paths

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gdk-pixbuf/gdk-pixbuf.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 6eaf023789..69bb34b0cb 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -70,14 +70,14 @@ endif
 # gdk-pixbuf requires the loaders.cache file populated to work properly
 # Rather than doing so at runtime, since the fs can be read-only, do so
 # here after building and installing to target.
-# And since the cache file will contain absolute host directory names we
-# need to sanitize (strip) them.
+# And since the cache file will contain relative host directory names we
+# need to prepend them with /usr/.
 ifeq ($(BR2_STATIC_LIBS),)
 define GDK_PIXBUF_UPDATE_CACHE
 	GDK_PIXBUF_MODULEDIR=$(HOST_DIR)/lib/gdk-pixbuf-2.0/2.10.0/loaders \
 		$(HOST_DIR)/bin/gdk-pixbuf-query-loaders \
 		> $(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
-	$(SED) "s,$(HOST_DIR)/lib,/usr/lib,g" \
+	$(SED) 's,^"lib,"/usr/lib,g' \
 		$(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
 endef
 GDK_PIXBUF_POST_INSTALL_TARGET_HOOKS += GDK_PIXBUF_UPDATE_CACHE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
