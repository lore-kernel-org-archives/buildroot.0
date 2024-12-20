Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567CEE77188
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 15:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E934D4154B;
	Fri, 20 Dec 2024 15:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TMiw1ZXygXw6; Fri, 20 Dec 2024 15:11:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C89D0417F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C89D0417F6;
	Fri, 20 Dec 2024 15:11:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EBD32920
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 15:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9C6A607EC
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 15:11:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jotmNrLw4jhJ for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 15:11:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.103.80.155;
 helo=mx.kolabnow.com; envelope-from=zgyarmati@zgyarmati.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 63B01607D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63B01607D2
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.155])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63B01607D2
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 15:11:36 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id 220253004C52
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 16:11:34 +0100 (CET)
X-Virus-Scanned: amavis at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out013.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id Ov4rnPVuGOrk for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 16:11:32 +0100 (CET)
Received: from int-mx009.mykolab.com (unknown [10.9.13.9])
 by mx.kolabnow.com (Postfix) with ESMTPS id D8B2D30005A2
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 16:11:32 +0100 (CET)
Received: from ext-subm010.mykolab.com (unknown [10.9.6.10])
 by int-mx009.mykolab.com (Postfix) with ESMTPS id ECDC820D3033
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 16:11:31 +0100 (CET)
From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
To: buildroot@buildroot.org
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Date: Fri, 20 Dec 2024 16:11:23 +0100
Message-Id: <20241220151123.620117-1-zgyarmati@zgyarmati.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kolabnow.com; h=
 content-transfer-encoding:mime-version:message-id:date:date
 :subject:subject:from:from:received:received:received; s=
 dkim20240523; t=1734707492; x=1736521893; bh=CCCynHodrJg0BHumCB9
 Vto1SQpIsZJeR7Ep+jG1rmx0=; b=O8prF2wfHSiMuyOKVppQc4guJGUNMCVjZ7c
 d8jcJp/KHoPc4fIa7m74bAdn/ix5xvykKoecG+zN/jYlXVHXkaedZgN/TjGvoPgu
 0Bte0i4hoi68+xssqLnFiCyH9g6IJGnJif08OhpqWbCNFmJF52861QrB+S11a6sX
 yQ/Dee1OukwFGLEBEYwxzElrnu4mKf7wAjh6cmL1L9Dfsj90zgWO1Lf/YT6z+MRv
 XgoSobc1LYEO59/6ktPUgjqMo/67oVxbkBWrg25YPyvamyFIsCQmyoeI0qbLmN4K
 LsrhwmM8kJFjndobqbIQIjJ/BaQmnmOA5Xmk3ZykQm63FJk3rDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zgyarmati.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kolabnow.com header.i=@kolabnow.com header.a=rsa-sha256
 header.s=dkim20240523 header.b=O8prF2wf
X-Mailman-Original-Authentication-Results: ext-mx-out013.mykolab.com (amavis); 
 dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
Subject: [Buildroot] [PATCH 1/1] package/proj: bump to 9.5.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
---
 package/proj/proj.hash | 6 +++---
 package/proj/proj.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/proj/proj.hash b/package/proj/proj.hash
index 8a1650ade5..5249f52c10 100644
--- a/package/proj/proj.hash
+++ b/package/proj/proj.hash
@@ -1,5 +1,5 @@
-# Fetched from https://download.osgeo.org/proj/proj-9.5.0.tar.gz.md5
-md5  ac46b4e31562890d012ea6b31e579cf6  proj-9.5.0.tar.gz
+# Fetched from https://download.osgeo.org/proj/proj-9.5.1.tar.gz.md5
+md5  07c44ca4a65a0664ce823c8448707c78  proj-9.5.1.tar.gz
 # Locally calculated
-sha256  659af0d558f7c5618c322fde2d3392910806faee8684687959339021fa207d99  proj-9.5.0.tar.gz
+sha256  a8395f9696338ffd46b0feb603edbb730fad6746fba77753c77f7f997345e3d3  proj-9.5.1.tar.gz
 sha256  6a8f30793e877d32e3f88b972f0970a051a3b5a26cd057d3993cb51e21c43319  COPYING
diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index a17a0a1feb..19b5f1012e 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROJ_VERSION = 9.5.0
+PROJ_VERSION = 9.5.1
 PROJ_SITE = http://download.osgeo.org/proj
 PROJ_LICENSE = MIT
 PROJ_LICENSE_FILES = COPYING
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
