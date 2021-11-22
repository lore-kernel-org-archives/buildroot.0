Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE70C433EF
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 22:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BCC360629;
	Mon, 22 Nov 2021 22:29:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id urzcVxL1Mpdn; Mon, 22 Nov 2021 22:29:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6C30605E1;
	Mon, 22 Nov 2021 22:29:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E2CBA1BF951
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 22:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEDF1605E1
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 22:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TNn9F92rce4V for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 22:29:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4EB04605DC
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 22:29:28 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d24so35484253wra.0
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 14:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mYDm2O9NuxkWnlJ49eL5Cavhj4Dg09xOr8XqKZspKX0=;
 b=e0S3bR6h74r7s8kFEjHIbLmLU5REprKzmJem5GDw560IBQnZPed9ah922ejaB5fG8L
 RHl9hrSE5YtgrRW2yDVyTF1VOS+UTQLrez+xDwuu6IFUJGM2ap196pyDIBZD7iKXDPmh
 /dxGEvP5Awoi0/U14Yrm/+2Q31n3AJTiEABnH/COZNenzc1akrKnQabavKshj0p5jj5O
 Pu59KTCqUGFTrvopisZCk767N8u42uz929JDcqfbjDQj4e3sxq9F1YIQyq3h79UaSucq
 e5HxcG6lWDGbZrsKJgjfKEmI/qBG7Rj3ZGSAmXlgwzywnWC0ykjKYeUyv/5oLl6821Zi
 W6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mYDm2O9NuxkWnlJ49eL5Cavhj4Dg09xOr8XqKZspKX0=;
 b=DtzrCWUHPXjzBAUYC5ZkgHB7gZJO9RIR7O35P9I/q3j116FxHzT8PJA+2jt+FCoswb
 7cxOcAoGeQ6fLj1pAwtgTBb10qmBwDwppjNzjo6QOkJRm7eZqYSn27LfYZglABY1Vzfy
 M/BPHnFblxXj7lESildnFNqxleM8u4aQQXn1zcwHvCLiFZANQchYcVVSNJQUEmGEhILw
 8pPAMvB7CZJLJGDv9N6ZnMxh07/TTbEnbUZ6ziWNLZSYVCmpqfa9GWXpP/iCxPql1zwH
 nwtXAdJJKGi2fnF+xvFLLFesgbBcdi4PnXlg8bhvUSRBoykHtHwEBQrMLpoMANTwcbx4
 SB4Q==
X-Gm-Message-State: AOAM5305FRBRX1oRT/g/trrbjJRDDIFAuAfW1shqb/1In2NmAAn71ktx
 KpKDFs361rN7+0KmX11NZ6EkH2CCxas=
X-Google-Smtp-Source: ABdhPJyl0bkqWpMaL9ENaNUk+90A2MsE5mJzpNEPTMOvO5v7ziI9Od+1Om2bHrN0VwBvGAIG112f2g==
X-Received: by 2002:adf:ce03:: with SMTP id p3mr941265wrn.145.1637620166205;
 Mon, 22 Nov 2021 14:29:26 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id bg12sm10136368wmb.5.2021.11.22.14.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 14:29:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Nov 2021 23:27:04 +0100
Message-Id: <20211122222704.3539724-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/spidev_test: rename
 SPIDEV_ADD_LINUX_IOCTL
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

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/spidev_test/spidev_test.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spidev_test/spidev_test.mk b/package/spidev_test/spidev_test.mk
index 80998f3400..bd2fcf6db3 100644
--- a/package/spidev_test/spidev_test.mk
+++ b/package/spidev_test/spidev_test.mk
@@ -24,12 +24,12 @@ SPIDEV_TEST_LICENSE = GPL-2.0
 
 # musl libc requires linux/ioctl.h for _IOC_SIZEBITS. Do a sed patch to keep
 # compatibility with different spidev_test.c versions that we support.
-define SPIDEV_ADD_LINUX_IOCTL
+define SPIDEV_TEST_ADD_LINUX_IOCTL
 	$(SED) 's~^#include <sys/ioctl.h>~#include <sys/ioctl.h>\n#include <linux/ioctl.h>~' \
 		$(@D)/spidev_test.c
 endef
 
-SPIDEV_TEST_POST_PATCH_HOOKS += SPIDEV_ADD_LINUX_IOCTL
+SPIDEV_TEST_POST_PATCH_HOOKS += SPIDEV_TEST_ADD_LINUX_IOCTL
 
 define SPIDEV_TEST_EXTRACT_CMDS
 	cp $(SPIDEV_TEST_DL_DIR)/$(SPIDEV_TEST_SOURCE) $(@D)/spidev_test.c
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
