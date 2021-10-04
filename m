Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1CBC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:35:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C964261248
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C964261248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D6986068A;
	Mon,  4 Oct 2021 20:35:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B_NPWKRiRAy4; Mon,  4 Oct 2021 20:35:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0B3960698;
	Mon,  4 Oct 2021 20:35:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE3901BF2C5
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E1B44059A
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:35:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oYD5keOvOkj6 for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 20:35:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp4.osuosl.org (Postfix) with ESMTP id 075E740598
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 20:35:38 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XUgSmGDTrqG1wXUgSm80Lm; Mon, 04 Oct 2021 22:35:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1633379736; bh=W5+6d1t44qxI3C2coro/7FOMicve75gS+tpCFig1ez0=;
 h=From:To:Subject:Date:MIME-Version;
 b=ZRXwETZznyK9AjvsymLFrYOCY02lR8W8CzCqZN73aVgwnvFChVNdbDA2LofWRSOn+
 tJ2lODNJmPc5rLNhkVlOZo0a32d/RF0PPKqa3C/RSBQzCv4ZyaaIpZX3GmEfLaAm3E
 XiOYv+ytpiUOLsBhvq9A4tHcnNCFLcu7e2iDRRl83sEfzEWUGV5XvP168L8XkNJvWM
 hcbzCThedNrTtP+mzNRR85E2NqiTnTEUTIMxqvwedEZ/FB3olIgk/vY7HEZ1fdd5O4
 VoY61C7nRndTy4yL/tKn9oeRWre1Qn3GyirgQAe82VVVzmXXz66aTEUiGkKC168czG
 3x4QEnEVymQYA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org, Peter Korsgaard <peter@korsgaard.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Date: Mon,  4 Oct 2021 22:35:35 +0200
Message-Id: <20211004203535.923467-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfE4RmDB4FtkE2+upYzsfropSCD0AB/5mlhiteCEKIKgBJGIA2dJTrd0noD5KHufuX9NncdlNruhjq4mELfxoRaZ8woact4ekaWVx7hPC6xDyvukAJq35
 M4N2Vjy3Fa7YFfRHx7akwtWJbvD0xFxhMmAYDN5SBlmgLe0ZCgGK2DyZd9jt11FfKOp1NPZ8WLfUNlKcTiQVxWLSTKhpazlzO9t2k8UJaIxCV7/q78l5Onoj
 L03Dc9CsFHItRbex4IgWVljxQU/bZXKswkr4EMXpd2qxKXI3DO6DNIoatVNOEv8Hq6Cebe2u+VjAF0o+0IbIGO0zmv7HKN+Xmt7SB/uRQYWIrCU7SyoCrCFQ
 ZW2r+7EjLTjAbcq/wpYk7HdrDod4rTBBZJpOkyYni9a3yW1Dwiw=
Subject: [Buildroot] [PATCH] package/mesa3d: remove unnecessary passing of
 CFLAGS
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package uses meson-package infrastracture, so we don't need to
explicitly pass its additional CFLAGS to some variable. The only thing we
need to pass them is to use MESA3D_CFLAGS, because in package/pkg-meson.mk
we have:
$(2)_CFLAGS ?= $$(TARGET_CFLAGS)
that makes the work automatically, where $(2) is exactly the package name,
though $(2)_CFLAGS expands to MESA3D_CFLAGS.
So let's remove the MESA3D_CONF_OPTS += -DCMAKE_C_FLAGS="$(MESA3D_CFLAGS)"
line that has been added by mistake.

Note: this doesn't fix any bug, but remove an unnecessary and ambiguos line

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mesa3d/mesa3d.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f1862aed69..dc63d8c9f4 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -266,6 +266,4 @@ ifeq ($(BR2_m68k),y)
 MESA3D_CFLAGS += -mlong-jump-table-offsets
 endif
 
-MESA3D_CONF_OPTS += -DCMAKE_C_FLAGS="$(MESA3D_CFLAGS)"
-
 $(eval $(meson-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
