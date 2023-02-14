Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE74C61DA4
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 10:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43CEF610C2;
	Tue, 14 Feb 2023 10:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43CEF610C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ZIP8WCeC5-P; Tue, 14 Feb 2023 10:50:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B89AE610A5;
	Tue, 14 Feb 2023 10:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B89AE610A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5CF0C1BF2B7
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 10:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36F9D81D70
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 10:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36F9D81D70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u3Jn_UM3sjGo for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 10:50:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EF5681D46
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3EF5681D46
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 10:50:37 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id RstOp9O14ZOVXRstPpXFUB; Tue, 14 Feb 2023 11:50:35 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 11:50:33 +0100
Message-Id: <20230214105033.1042139-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHy0epwNGHhtvrg7sovnDEZ6IQ42Fw9H5gWezx/lV2qWXbQnnNs44ROYbn+eeNFYoayooZUjBKXjcJ/OS5ibZC8Ewws7zWJ0jFFt1IsGLYG3gZJCl8zO
 qSc6ahtrt2muaVmCxHWhFtVn1WSRdXBJWZJXNoBYb19Ccv3sTNiGvRxG5hmx5x0KrL+puKCjipIafoiQpn67oOQUZJQfxlZU+obi0J8MD+sGBads1qlSX3w3
 nTE8ZHsTbQ9JGtsDMaC9rVhNtickMg+COJuTrxv/9tg9yzyzF9TAxK/ewm2Y9IIr2GMR5Ha7VgMuA1x9MVpwiw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1676371835; bh=b0iDeR0qT3Dt/qZPNN5B6YfgA7zQ8obbY8Gd04MsNLE=;
 h=From:To:Subject:Date:MIME-Version;
 b=J1YQu+8HWZIRckvv3csQULR6w5hifIRZik+rlxqOl3FNfyB4APMoMY9mkBKNZc4f4
 iyDBFi0sH595B3u1A3H8Z/0sV+bOnacHfOEQ3on2VgiZIoIXYfFGGs05rgQ1OcEPw8
 RKYC3etzssjFmys6Kb9dc86Vwzk+Zy27xVn+jKfthg2jkk6lzsb0FIInaKkbrL3hk+
 F/uN8ZhGDsyIk07W7lDBtqw5a1jKvqncN55g7E6vk6pJ4923p2MhLwm8pgt4OEfaim
 xxlhDKD3tdmLayJi247mxiXhMUZGCxZunU6Kyr0H6gv5M/c00PFoM/5pwwDSHrMCIT
 ETzln4mJWMNUQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=J1YQu+8H
Subject: [Buildroot] [PATCH] package/rtl8821cu: disable package for s390x
 architecture
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

s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this
package for this architecture.

Fixes:
http://autobuild.buildroot.net/results/3a74d393cdbc308eab9ec3f0f9e420947669a0ea/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8821cu/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rtl8821cu/Config.in b/package/rtl8821cu/Config.in
index a5a7b9d255..00a41b5196 100644
--- a/package/rtl8821cu/Config.in
+++ b/package/rtl8821cu/Config.in
@@ -1,8 +1,10 @@
 comment "rtl8821cu needs a Linux kernel to be built"
+	depends on !BR2_s390x
 	depends on !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_RTL8821CU
 	bool "rtl8821cu"
+	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
 	help
 	  rtl8821cu wifi driver
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
