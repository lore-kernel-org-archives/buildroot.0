Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F61AC433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 13:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0F1F4051C;
	Wed, 26 Oct 2022 13:27:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0F1F4051C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id maaV-Qj4W8J5; Wed, 26 Oct 2022 13:27:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D12D640518;
	Wed, 26 Oct 2022 13:27:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D12D640518
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E2EC1BF5B4
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 13:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A5CC60648
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 13:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A5CC60648
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YF4fRmugpR4t for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 13:26:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB58F60608
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB58F60608
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 13:26:42 +0000 (UTC)
Received: from localhost.localdomain ([146.241.83.94])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ngQVojcL4uz2mngQaoqm8b; Wed, 26 Oct 2022 15:26:41 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 15:26:31 +0200
Message-Id: <20221026132634.999254-5-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026132634.999254-1-giulio.benetti@benettiengineering.com>
References: <20221026132634.999254-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOSO1nWTx4arpkVNZyEhB9YbC4OVOYcEyTYgF41EhX29U86TdkWnLG1Miruft1BHRLWlZLMyFP2Ym+tdJhyCpK0LyZHz2upJxUTVTY61xqJL61ZTczH4
 SOPqgetQ24m+Wn8/tIORykUnjgULntIy+BomKFufWSqIv7OssG+mU9+eirL1CngJ0sL/y5+xEXpPw9Ja5LPa7DdjeZTOsFw2vCQto/8w1Ia/dojnHwRD7NHN
 V/CJFvw8PACIAq01UGJ6ZWIslmSJPSVraCuW8DWMtjrzu+tpuqj5o1wz1DOIDjogxfLAtHEJiAgaj45QQ1xmqsZTNHzS4hiJPHJYM5No52omkXENDSa8XIOX
 smXEsOyFNG1LsE1o1CCZII7nEl/ZpHi0FxXMOJ0hOpsj9Kcc1cUlBCN7fMFyjZ1YIGCJK6OYvGPZnfCyu78wErJSlXyE/VVAd+s7TghKLD4KsVGVIP0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666790801; bh=EXF1xLRn9OWxrx3n5szHGph8HAbRi+yH37VpU6THdi8=;
 h=From:To:Subject:Date:MIME-Version;
 b=OdSENKqGp2oRwrVCES2f+hB/qmxgFPnfPpZQqPfdc4hEsWvSFbdtfOkHM0kGcP5f/
 i3Dz2GKpQwREqOQE6wS74JCpFyYTF3dbYAGIxIAcdJ+Lf6OvLQQUO9K5gP7E6Z6Res
 8JC5PPa7NlyzsVnxXQPQor1mZu8DhrvOxrRTzAPAHNz3RjU0mBC3MxwII/CoR5qM1R
 yhlrwP+84nJ+lq1rNc9b3YRRA0T0VubPLK/s9WEnYWOO0UJWV+TFWLchNnJV0V2SYP
 3qPV3RM1/kLpleFMBF+PPc0nhmr8oWIafWgHi6igxbw4rIo7t76hJERXihYb9kgva6
 kvdOO2Z05sBow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=OdSENKqG
Subject: [Buildroot] [PATCH 4/7] package/rtl8723ds: disable package for
 s390x architecture
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kris Bahnsen <kris@embeddedTS.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this
package for this architecture.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8723ds/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rtl8723ds/Config.in b/package/rtl8723ds/Config.in
index ef7dd39a68..e5123a2aae 100644
--- a/package/rtl8723ds/Config.in
+++ b/package/rtl8723ds/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RTL8723DS
 	bool "rtl8723ds"
+	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
 	help
 	  rtl8723bs wifi driver
@@ -7,4 +8,5 @@ config BR2_PACKAGE_RTL8723DS
 	  https://github.com/lwfinger/rtl8723ds
 
 comment "rtl8723ds needs a Linux kernel to be built"
+	depends on !BR2_s390x
 	depends on !BR2_LINUX_KERNEL
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
