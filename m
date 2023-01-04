Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C716AC3DA7D
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 00:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A96960FB2;
	Wed,  4 Jan 2023 00:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A96960FB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 08UGMNFIrxeG; Wed,  4 Jan 2023 00:22:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C68EC60B5E;
	Wed,  4 Jan 2023 00:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C68EC60B5E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 78DE31BF95E
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 00:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FD9D417C3
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 00:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FD9D417C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 24MbF27V-Xzz for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 00:21:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F232417C5
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F232417C5
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 00:21:19 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id CrWtpAYj2eo8HCrWup7N9U; Wed, 04 Jan 2023 01:21:17 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  4 Jan 2023 01:21:13 +0100
Message-Id: <20230104002113.1038775-5-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230104002113.1038775-1-giulio.benetti@benettiengineering.com>
References: <20230104002113.1038775-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOnRwtsui42CUDnF7RmOv0rh0S6yrRREjRDhot00tlqTUeG429B643Eef+Hft2O4yQEY2tBwnyen3EtAgKJw40CU4lIStPCr2EMypTimt0w+N+f39whm
 1GKa37Vnx1nxF8syMfTMn0sfdQtUDuq28EAaJeHStUwOWNsCP6ASdZxnupq9W4+vy/TPLf5exIwD8gexVUywtdoWSNqvGWks/Rz4DDVUm4e0GchZde8YQE8E
 5MhsNQY7eLWDpL6ehBM44FmYrGnxY5pZBdfjSWJOE1WK4adTrbwDY4VqVvcgBZp8x3qQRNCa5nt1PZQ5azuOOg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1672791677; bh=b2xCdcegA27bpr763JLQUCU6suu4H0tRs2U3+gTT5Fg=;
 h=From:To:Subject:Date:MIME-Version;
 b=OGpjCWjBceZ5wcGE5thSJxMI28FMTHgAI8ozbs0bxwj5VirBDj9zDuqq1G/Ck36Ub
 XT43Q3NjuTiw76FBGU0RVCV0Ae45HN0MFFnAMJOViI7QNdyjo0eL/DRg1qd4R7DsET
 wkfCpYAkUAzNoNTyIyJlkkOalv3leVHfbeHtn77BTvNnDnEv8B04Y6SiiWxUJ1gH1g
 /p1THtTejJ6Hiy69lfJGa7XoCUKvQaAFrQXGQkfwRZvGKhUpt2UAbLpHmGGKt+BdfY
 zpdpT0iV0R8myES8W10XG8y8wQ7SpHLoQim+e/aWY/D9MS3u9ByjWRhJ+XB2mrd1ap
 7eDFNGRdJqfqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=OGpjCWjB
Subject: [Buildroot] [PATCH 4/4] board/asus/tinker: add a note to readme.txt
 for power supply
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/asus/tinker/readme.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/board/asus/tinker/readme.txt b/board/asus/tinker/readme.txt
index 7372d29520..9affd6399f 100644
--- a/board/asus/tinker/readme.txt
+++ b/board/asus/tinker/readme.txt
@@ -35,3 +35,8 @@ You can write this image directly to an SD card device (i.e. /dev/xxx):
   $ sudo sync
 
 Finally, you can insert the SD card to the Tinker RK3288 board and boot it.
+
+NOTE:
+Usb power supply requires more than the standard 500mA Usb current, so
+this board must be supplied from a capable port or from an external ac/dc
+adapter. Otherwise it will hang on loading uImage forever.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
