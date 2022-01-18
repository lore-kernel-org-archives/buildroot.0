Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB65C433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFFF080B82;
	Tue, 18 Jan 2022 10:55:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xjO1z8XQdx9d; Tue, 18 Jan 2022 10:55:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4631F80C18;
	Tue, 18 Jan 2022 10:55:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3CBD1BF990
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B05FF405EC
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:53:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EeyNEUr17BW0 for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:53:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10106.aruba.it (smtpcmd10106.aruba.it [62.149.156.106])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D0D4400C6
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:53:36 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9m0Qna6Fz; Tue, 18 Jan 2022 11:46:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502795; bh=MYURZAFvE86DjX+/l6Acq5Hn42HC+SanzBayCCPPps0=;
 h=From:To:Subject:Date:MIME-Version;
 b=ZtpkRXOXSPMVMxhu7iyPJeLj1+98LLJLJIXZvFHZtyDEbESFj6BadkLVJbUT0mNol
 h0gpR+Gv45+IQ6jssyVjPXw0P4whSEsPHt+nVDBq90JLQsV+ld7KripzdjtSZCaJVY
 dk2g4WSVbob/ttjDsTkUAs9umgiQbLVdTZa6MAZOUDFXccogtT9/xptnbtrHKOgfN2
 Rd0cxMEMbKLaJyFHc3DcBKLcpm1rvIBTBS3RF0+9gDwDCBjvsGMbLCW64gBbv4yuuu
 52ua8QAs8b766l272zo07Ar7/sK/q3856JluJ7YrGAIO/jRHu8h6JyfE5lJ7iUsFe0
 zruEYlbspLMcA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:22 +0100
Message-Id: <20220118104338.2081259-13-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfBYKNTEfMU3iIzrRNUvIxKU4dTDbFyiUA6AK0CZOQRyQnwUuzd62dK+kLfKZGAD2GctgwlsTwR4Mr8GLBheedNqxh4pH4YsBe53Yn2tYZl7dwh1lf+Zf
 W+lAPuj9BostTg+V4qH9af7rHOac59hLyD7NKcJAmOGlsrj15mLyCgtjPMZ2e1KDSN8xNNSiwfNY6ReAQWP5A4FAXPG6IPz/4TxVU3bWfW7RIQI1RqmrwSA4
 B53uwdpTrFJyjeoD3vkVGfULu0S1Mn+ybI6oOTrN4DM9L7VbgxHj20lbfL0ZleDaSZ3OLV7xOgeg0C07V8rSOyKGIpLi+sxXxyO6Wo4gKjuEirCXyGJnU/I5
 xWKvnzEje2mm3+klydTBg0DID5XJ5MLDak1onoZEdgNEfU3n9jpZ6AyAr5NfsNCN/Z+q04aLUynG/6vWInFC7M36D1IgFhZEVcVZzqWCJtsF7vQDMiDYvQH8
 oltnsK6Gh7iMGNkgFQbynJYC9+DWyBsUGhO67kARxlgyt5MeKTO0hdnhqtu7NP/+poOkmy8PriLWdVglWb6uQnKP8IEa0ymsZsxt/sbkiCqQlHwtBVKnDVp2
 2vKhnCQ3O8JVLxUoz8suf0+3+J38ITbjFKyPJYcPecajnmJYpwj2/v2KGl5o55DHN0s2z4GDEqc9hXlVRVEZbqG0oj6DfZQczOZeYGks21Thzfh1x7jOC4jG
 bWyzI32fmhRt0nxPfJbNZUdg/9xC6NL+5z8CMTozeqRKTmFJhqjIGNYZ3tNYk4kpY7qrTy+xmADNxi2y7tZu/U8W6vfRmvs9GaLwuXjlDvdrnHPkZXSkpJrV
 dzwdaiA+1/3Mjt4AasQE/sSCwrqHFkSVc4nFls6wX/p3iV4Z2uJgrG/tMo6Qrw==
Subject: [Buildroot] [PATCH 12/28] configs/friendlyarm_nanopi_r1_defconfig:
 enable NEON/VFPV4 FPU strategy
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
Cc: Theo Debrouwere <t.debrouwere@televic.com>, Simon Doppler <dopsi@dopsi.ch>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>, Jan Kraval <jan.kraval@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Davide Viti <zinosat@gmail.com>, Mike Harmony <mike.harmony@snapav.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Michel Stempin <michel.stempin@wanadoo.fr>,
 Lothar Felten <lothar.felten@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Biagio Montaruli <biagio.hkr@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This board has Allwinner H3 that is a cortex-A7 and supports NEON/VFPV4
FPU strategy, so let's enable it instead of only VFPV4.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/friendlyarm_nanopi_r1_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/friendlyarm_nanopi_r1_defconfig b/configs/friendlyarm_nanopi_r1_defconfig
index 8b03f6dd00..8e382b5677 100644
--- a/configs/friendlyarm_nanopi_r1_defconfig
+++ b/configs/friendlyarm_nanopi_r1_defconfig
@@ -1,7 +1,7 @@
 # Architecture
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_ARM_FPU_VFPV4=y
+BR2_ARM_FPU_NEON_VFPV4=y
 
 # Linux headers same as kernel, a 5.0 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
