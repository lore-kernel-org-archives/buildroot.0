Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E141C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E404760D54;
	Tue,  1 Feb 2022 22:35:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id teKWgdCzg3xp; Tue,  1 Feb 2022 22:35:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B69A60AF0;
	Tue,  1 Feb 2022 22:35:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7AE1E1BF3BE
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76E2A832EB
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:35:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3CR1Q8jxEnvA for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:35:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 974DB826BB
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:35:47 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id h7so3007039wrc.5
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 14:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BK5o73GC0U3Xq1IRUfBAqm9Ly82+/IcsP4M6N12bOts=;
 b=CDB8uP1xOKw1o9Fc1jXMNIdwP80suHGfAxnbhoLmCWsXuXIrInVV2sRBLuda8GyQzc
 13cvNYNIoybkzRYSDY5AwXbpNeCqnFRn23qB5AHh+kPcuK/lW8hqlQhCyXrAs/Fac91z
 L4TI8lXqshqKdtUpxcvyNgBLChKAkJ7R0nQqUyBud3Bs8U15XIXCjftuyhdVpVHQPUOT
 2ctIFbN+ANVNtVS25wIsUUjKJgf7r8CIM5DBiqqnAvI8x7PFiLN+RGJP7DVO17Vqdmas
 m9+KiQygkyzkSKl+eF57m6n5w/QxkBhJhLtqQldFD+jobyj4sKv/YJg4Qzi4xrNAIeCW
 Fpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BK5o73GC0U3Xq1IRUfBAqm9Ly82+/IcsP4M6N12bOts=;
 b=18U1XlXcG92E48BYhgRDBnNuVYR446xucG7ouYbN8kuP/owmCWuCEFOfEH9iy4FYR7
 pPJaW1EKRNojwIa0F4F71yQoJcs47TvQHQQtniHbJkeE9X9V9HCNZHS+Bh8ZyeJRSRbC
 GexEVkaGtnsyY2HApt3dUArR3rK2Lznv0atTVrdOkPq7BGgRI58wJTE4Hd+6cofFlqFG
 TIRwJJ2jbkoCO2BGU4Ygudz+t6fKh2C4ayZQWdX752jIa9p27YD2RQ1nVmh1vl1inQ0G
 GsEWzzWVANpY07mSRkr3j4R1HrjlBi6m+yYZ4hu49evopZG7LSPXCD/hf+LCNR5ZsVHH
 R2Mg==
X-Gm-Message-State: AOAM532Tb0wS/a/nN51w0N4VNsj0U97tVBvLeGklAOvWwPnGWbTxpOd3
 8eVN6tiwt1JC804DhYCT2QMaLYKBcj4=
X-Google-Smtp-Source: ABdhPJwPTZg0Y8xK94nBD+hqob2HIp9op/Cs20Usnj43bOroclgIHfqzjC4w6654+s3dlTa5hFA1AA==
X-Received: by 2002:a5d:46d1:: with SMTP id g17mr23723298wrs.471.1643754945728; 
 Tue, 01 Feb 2022 14:35:45 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id i17sm5058486wru.107.2022.02.01.14.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 14:35:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 23:33:49 +0100
Message-Id: <20220201223349.424073-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lcms2: bump to version 2.13
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

https://littlecms.com/blog/2022/01/28/lcms2-2.13

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lcms2/lcms2.hash | 6 +++---
 package/lcms2/lcms2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
index 8477610ff0..d3ae1d934f 100644
--- a/package/lcms2/lcms2.hash
+++ b/package/lcms2/lcms2.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/lcms/files/lcms/2.12
-sha1  3d0c0276fcd3930b80c424512ec0b1ed54ec1497  lcms2-2.12.tar.gz
+# From https://sourceforge.net/projects/lcms/files/lcms/2.13
+sha1  1676097fb18fce83c9c876d56828c83a6ad829dd  lcms2-2.13.tar.gz
 # Locally computed:
-sha256  18663985e864100455ac3e507625c438c3710354d85e5cbb7cd4043e11fe10f5  lcms2-2.12.tar.gz
+sha256  0c67a5cc144029cfa34647a52809ec399aae488db4258a6a66fba318474a070f  lcms2-2.13.tar.gz
 sha256  46d4e05af3bce75332a12d01f19bcce7e32b6bac544be28a64043d0231291e31  COPYING
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 49ddccd82b..5a253d044b 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LCMS2_VERSION = 2.12
+LCMS2_VERSION = 2.13
 LCMS2_SITE = http://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
