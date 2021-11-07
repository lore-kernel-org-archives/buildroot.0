Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB4D3C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:46:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75A9461884
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75A9461884
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50C6C6066C;
	Sun,  7 Nov 2021 02:46:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cpHwCzp4qA0m; Sun,  7 Nov 2021 02:46:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B26DC60717;
	Sun,  7 Nov 2021 02:46:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C9C91BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2989C402A9
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id njbpeK5ODAc1 for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:43:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59C98401D0
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:43:41 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljY9kmR7HV; Sun, 07 Nov 2021 03:43:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253021; bh=eXocxhNhI31rJbYXrDTZVTnssU67XV7dNtOvxjo+C7I=;
 h=From:To:Subject:Date:MIME-Version;
 b=fvqiIbMl7uO2SmPkzn2Z2dGOwUVrhCnIo8UgU8M7Wk8m3vZDLSlkgtnEBqrNY9rES
 8gsovvJLWRAYDi52yLTWSjwIFdYw8tE2FFw6JlCkhB4on26teIHySRvRr6yRXL+wj7
 rSs3FUaVeqgAD8abiBCvDOItGymgGHgsHVm4BCY7hxPUh3AUouz/1MYi0Qshh4vEjo
 NaFmfhlSd3FyfqtTKILqQb8eug26Vhza1k3MK+QWdtZ+oY6XoJe0eSDV2cu+RpwSWV
 hU0PkGkmP6Yzr+rdNFsaIY70gXdmxqNClD5dS6eU4FUA6Kw7EdqJq1M4o8Eaoc3LWk
 Ng200AR6/gX/g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:42:59 +0100
Message-Id: <20211107024330.3061378-12-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfAhZmrgajndCYP8aj2W+mEamPV94TeQXfMvHPrHOGq/h0c9suGwkNr06/mWLaO2z5YUD493E1a6SKtQhyfqNElOAaM6srmVNnkU7Xb6lyTlvh+OS70nK
 OvYRAUcy5U1+10MhcBGjuexVTyKi07jwxFsNuWYi7v8Qblc4rLMoU4CiXIhQCYUk79MNXEL211oa/QagNM8ja2q0YMjP6+gs6Or/qyoMD2tWti3QVborjO95
 TfxsQa8WC9hYY/lFr476WI46t4jgQg4JDEyjYjiHzgY=
Subject: [Buildroot] [PATCH 071/102] board/pc/genimage-bios.cfg: beautify
 file
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/pc/genimage-bios.cfg | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/board/pc/genimage-bios.cfg b/board/pc/genimage-bios.cfg
index c669499915..26d12d9ab3 100644
--- a/board/pc/genimage-bios.cfg
+++ b/board/pc/genimage-bios.cfg
@@ -1,24 +1,22 @@
 image disk.img {
+	hdimage {
+	}
 
-  hdimage {
-  }
+	partition boot {
+		in-partition-table = "no"
+		image = "boot.img"
+		offset = 0
+		size = 512
+	}
 
-  partition boot {
-    in-partition-table = "no"
-    image = "boot.img"
-    offset = 0
-    size = 512
-  }
-
-  partition grub {
-    in-partition-table = "no"
-    image = "grub.img"
-    offset = 512
-  }
-
-  partition root {
-    partition-type = 0x83
-    image = "rootfs.ext2"
-  }
+	partition grub {
+		in-partition-table = "no"
+		image = "grub.img"
+		offset = 512
+	}
 
+	partition root {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
