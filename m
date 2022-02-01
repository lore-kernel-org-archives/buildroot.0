Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D167C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 23:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 179F640137;
	Tue,  1 Feb 2022 23:22:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R41vyqhIWq9q; Tue,  1 Feb 2022 23:22:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 158CC4056B;
	Tue,  1 Feb 2022 23:22:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A12C1BF94B
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 23:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27E9B41615
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 23:22:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U8IdT_66N5AW for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 23:22:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp4.osuosl.org (Postfix) with ESMTP id C473B41613
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 23:22:05 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id F2TLn1CyRroAhF2TMnar8G; Wed, 02 Feb 2022 00:22:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643757724; bh=Y21rTNQDKbJIL+5fF0H4ufnLn2+38fr9OZ/CU9yQVAE=;
 h=From:To:Subject:Date:MIME-Version;
 b=lSTuKdgo1BLJuR/hOusX0Oyp0KOZI3V1jyR05Maz5n29iVf7QjlO5EWH4jkAWf76E
 pkFajAuB1EeRDUHcN4chWYA5ye9pgrrwXOfSeCGG+RYSOz6e+SWmh99B2dBGA6DSse
 ZtXUE0NMSo+6fjTd2T26mJLd/IMHlgwLay7xNZ+/URbqG8cPjRnB+/Bm1y9Hv3pQWp
 9BGIwcSnVH9CcKtBBasqTqKJNzGhmNnF0Fu2H083vgGArTnt0tjOlqHEoQGfm3uepz
 6N97vkX3is2NEJ3aGfqmZ327/EkbKizSnCZ+778UnW0iBGJ9nte2+1nIjuShzI0yFh
 J2RC6MgRd+W5w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  2 Feb 2022 00:22:03 +0100
Message-Id: <20220201232203.333403-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201232203.333403-1-giulio.benetti@benettiengineering.com>
References: <20220201232203.333403-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHv96KLrMVHxFnGG6sqb6FlzK7Ounfmj7hMOynkNllcYr1sMOgzK20jA8wmkL5fHFvT/Y0dAatFFd4dSq1SOixWgcPV5UZZr42wHgvIeKP/+Y5+PlQll
 LwQMoewqkDLrCa28XalGzc3vgxWgfiLPunuiWY49hJmEuBA5UiHOeljxD52qifulJUoucbR0PukvlSUwYjK3iLgxzME3F7EKCrgOkxiTpAgwFM6BYWm5BTp9
 L/5fV9k+o6+9eC8ItoGEFKfYOIDcNWGAk0jC/CVuoMYycpfSoqSuCdXv3u6y4YjN4raMbdea0aIQOUCb6Tas7R0V0b58WRH7yUdADDkh3uRJO/Lkfxg98dWr
 uwWWAzygilfGeJWLo0RibyT0F+7sLu54IE/NYS8kJk2SJPbcEx5D4ovo3Wv0kl8r+XLyhTEV1VCn5CcOLA/p3H2klqe2nQ==
Subject: [Buildroot] [URGENT 1/1] package/util-linux: fix host build failure
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The UTIL_LINUX_FIX_DISK_UTILS_COMPILE workaround is needed for host
building too. So let's add it to HOST_UTIL_LINUX_POST_PATCH_HOOKS.
host-util-linux is used a lot, so this patch fixes a lot of future
builds.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/util-linux/util-linux.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index e59ef7dadc..5a4ff64d01 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -41,6 +41,7 @@ define UTIL_LINUX_FIX_DISK_UTILS_COMPILE
 	touch $(@D)/disk-utils/raw.8
 endef
 UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
+HOST_UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
 
 HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
