Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDFEC19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 22:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC4934097A;
	Sun,  7 Aug 2022 22:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC4934097A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id syQQbokhmsJN; Sun,  7 Aug 2022 22:26:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 509BE41570;
	Sun,  7 Aug 2022 22:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 509BE41570
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E5B581BF973
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 22:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC2F94097B
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 22:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC2F94097B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KhpKOe_YMJ8h for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 22:25:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8C294097A
Received: from smtpcmd0766.aruba.it (smtpcmd0766.aruba.it [62.149.156.66])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8C294097A
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 22:25:33 +0000 (UTC)
Received: from localhost.localdomain ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPSA
 id KoiAoWIrgHDAJKoiBomAKg; Mon, 08 Aug 2022 00:25:32 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  8 Aug 2022 00:25:29 +0200
Message-Id: <20220807222529.1501004-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220807222529.1501004-1-giulio.benetti@benettiengineering.com>
References: <20220807222529.1501004-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJNCEto5gYs7E+BkC94G4XDaloWNp4Id3BcCwC46aZW9a6pTbCQLwF/SUwCXtxW4b076bnR1+W+lk9pOslKGqphVJnY+fSYz2VI3XBguoRx9DgXxMhtl
 Lzd8MgEf7LlbV5rSuPf48lxCUGCw5QXGX9/3kQa04V+aD4VdWMw1UURDRnh7ZxwNLEYGaEjM5LDCQkyl1N8wvrPGiZ65nb4aMMM3qQyZQL60p0LExSWI3kRg
 aLbx5pA/6NJdPIgM4cvKTCmzPlI28zxxjzyF4LPGG6B3OJi2Z44+tQUjsecUU3ui/5Hw3beoNNKvBjzvkCBvpAsw7CL+WY3sSsciwhP1OYMELnW1UBoUJQS/
 M4Dngf5b
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659911132; bh=kV2Y6NpRsCrk9fYRRQpX2LkLmzX+a/XplrfBfu3r5Ac=;
 h=From:To:Subject:Date:MIME-Version;
 b=ifKdxgj5YGdUHUopDsckeRv7M/zL5vIIGCvUKHynG19/eNmM37jQx8zEy3C9HsQlR
 9a9TkJI4QF/VfIAC70WCtA71sBcFmHeyLFcrYTyepgAldOAHFemBnyByzjDb1G3rsC
 bAnMop5FPZXx3CXDRHfScbTfbXNii/xoGKd8wrAm+DKlWfD9AnCr8FouJbafVLjLsy
 I9n+GMdKC6uCtQGmWUfSW+/93k8LHube/2A55J+pFn7F1ItRpAiyBIzRom1OuGQVeN
 9QQ6LjPYX718m121gcjvGELZyOkhtLBqB9zvQAb/0jBFgZA8l9LW6N3fQS0Lam7xY0
 YvGsi52Gl+prw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ifKdxgj5
Subject: [Buildroot] [PATCH 2/2] package/opencv4:
 BR2_PACKAGE_OPENCV4_LIB_OBJDETECT requires BR2_PACKAGE_OPENCV4_LIB_DNN
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
Cc: Stefano Cottafavi <stefano.cottafavi@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Opencv4 library objdetect needs library dnn, otherwise it throws:
```
-- Module opencv_objdetect disabled because opencv_dnn dependency can't be resolved!
```
So let's "select BR2_PACKAGE_OPENCV4_LIB_DNN" if
BR2_PACKAGE_OPENCV4_LIB_OBJDETECT is enabled.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/opencv4/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index bdeddcc089..4991b4252b 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -155,6 +155,7 @@ config BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
 	select BR2_PACKAGE_OPENCV4_LIB_CALIB3D
 	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV4_LIB_ML
+	select BR2_PACKAGE_OPENCV4_LIB_DNN
 	help
 	  Include opencv_objdetect (object detection) module into the
 	  OpenCV build.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
