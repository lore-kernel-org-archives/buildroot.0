Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A88C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 22:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 915DA4109F;
	Sun,  7 Aug 2022 22:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 915DA4109F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0FvKK4jEhOp3; Sun,  7 Aug 2022 22:25:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E2904097B;
	Sun,  7 Aug 2022 22:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E2904097B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B08F81BF42E
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 22:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84EAA405A8
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 22:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84EAA405A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6GSXO9GE-uMl for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 22:25:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2893840181
Received: from smtpcmd0766.aruba.it (smtpcmd0766.aruba.it [62.149.156.66])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2893840181
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 22:25:32 +0000 (UTC)
Received: from localhost.localdomain ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPSA
 id KoiAoWIrgHDAJKoiBomAKS; Mon, 08 Aug 2022 00:25:31 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  8 Aug 2022 00:25:28 +0200
Message-Id: <20220807222529.1501004-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220807222529.1501004-1-giulio.benetti@benettiengineering.com>
References: <20220807222529.1501004-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEP2Pu10kkjKxpr/7GY2Sj9XQdWIvO1R89pWcTA2cpTPbUtiJ6iLWinoRl7pEPhFSgplT1YRFrn94qEfr1xbjFvZvyB6o3fCyZ4MiGEAygYJSNDYg1Rp
 R8uruXuEkviyTRWKD7LgE8Wjz0oX3YYtMFpFRejzS/Fd7LT/XVAKEbDRBk+1AMiOYNxjpcqGnHw9Ta4dc3M6jx0T8guSmVPi6kCo2BikOzKr/NhIVd9MMBz6
 YEFCb2XbE1FaWPg4qdSl8j7/CredT5iy44NX2cHgQYyE9abKssV1GyWfI4mOegT0bAA1SqGKxwIE9zPIOwu0F4nEu/A5eVJMZyae0Tf+mIIxn0zuDus+3bDQ
 QzAtRFlG
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659911131; bh=4wmjBj7uuJGPsVxPTwN0nhkM8SDv0Q8tPpiCzDBuv7Q=;
 h=From:To:Subject:Date:MIME-Version;
 b=dMRngPCnhCu6gZP2mwT5Oi5aw7fSchMUxgaN90lLwx+Ur+yoGz612JIPmZTrnJrWQ
 GeGlPF358xoWANCMKxwHAytufLHDV9+/ASq1A/zYR6EwNKFI7c5H4TSbdkwSbKnOwW
 SHXRmR5N5Y96ICb6lb9MIZBgC/w8M0RFEfnWct9WIs/Z1E2UpVgvi5eexSOCMPoJKs
 +Jm43XxlbAd83kbI+NdjEanzsyfzW1PO2QHyvhJ3q/87yl+wygozmgvBSEq5yG2vOl
 yAOI7ZkLf9uDwOK49MCbBFmYh8YUsug1qDcrRsOsDaJebLio4na89fPQ1V4qT58lxN
 n1O6c0reVBAiw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=dMRngPCn
Subject: [Buildroot] [PATCH 1/2] package/opencv4:
 BR2_PACKAGE_OPENCV4_LIB_DNN requires protobuf
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

Opencv4 requires protobuf library otherwise it disables DNN:
```
if(NOT HAVE_PROTOBUF)
  ocv_module_disable(opencv_dnn)
endif()
```
https://github.com/opencv/opencv/blob/4.x/modules/dnn/CMakeLists.txt#L5-L7
So let's "select BR2_PACKAGE_OPENCV4_WITH_PROTOBUF" if
BR2_PACKAGE_OPENCV4_LIB_DNN is enabled.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/opencv4/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index a61a106952..bdeddcc089 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -34,6 +34,7 @@ config BR2_PACKAGE_OPENCV4_LIB_DNN
 	bool "dnn"
 	# dnn needs fenv.h which is not provided by uclibc
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	select BR2_PACKAGE_OPENCV4_WITH_PROTOBUF
 	help
 	  Include opencv_dnn (Deep Neural Networks) module into the
 	  OpenCV build.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
