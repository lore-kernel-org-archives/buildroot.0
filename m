Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5A0C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 15:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85FCA828C5;
	Sat,  6 Aug 2022 15:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85FCA828C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tFb-VFPWF2pB; Sat,  6 Aug 2022 15:44:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FB1B82890;
	Sat,  6 Aug 2022 15:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FB1B82890
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC8361BF5A8
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 15:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 959D74161F
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 15:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 959D74161F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TAh0TAW8Ptq3 for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 15:43:59 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67AB841609
Received: from smtpcmd09100.aruba.it (smtpcmd09100.aruba.it [62.149.156.100])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67AB841609
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 15:43:58 +0000 (UTC)
Received: from localhost.localdomain ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPSA
 id KLrAoNOrUij11KLrAokWmP; Sat, 06 Aug 2022 17:36:53 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat,  6 Aug 2022 17:36:51 +0200
Message-Id: <20220806153651.4013424-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKxkAGheK/q1Qb5XPRez/wfHvIqoOZ3aCR2khUEmDb/3CSwNcwfnoxdPY+ICuw2A6JIA/fw2N/mARDOpRiRvSJ44M+yDs9ATwhqajGUfGokK9ZZ4cILj
 9+kXpoJuj/hu0JJDFzYDcB0bcopMnOuxJKhxbVLQSCVs0WM3u5G8jCl51IaeJqaXF6PHV2kFdy8CcRdtqRKd5TKIYpxhmHNt3KtJixccefdXdiIh/nuy4QUN
 CpjaG1KHauefMgnx7/kPpTL17x9ZPD4NmVW8LTzkGO/gJumUdEdi3nEENDosenO81BAofww0kBpTBJhl8AQRVw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659800213; bh=J1z4eHLBhYhDqv4BK1/fxm9mILgMIeuD3nljZBcEkyw=;
 h=From:To:Subject:Date:MIME-Version;
 b=Le+o3emhRMD+B8gnktBJvQkLUIAvKfMlEk/dwxJU8Ebs65VPNM0wGki3hMXKo95YL
 DZyMmGJE7koVyfcnCC1hiIb6IeBRBlmPA4Ru9RPvqFt8U3mx8DUOaM5Ffwfw1/Yhi7
 vXcx+Z+OINU1f56mGIJF2Ss/mj7vz70IwLCzJgGTUfDqlEdOO2IcgdBbsD6U8U/F5u
 qFBtnwSt/AqO0oyew9y+HYVPnrjcbnhb3y91rn0dx31OzKKcAR1/hdArY9G9KTkkJl
 F+BfwHkt/hz2Z5rXm5gFyF8CUU+D4cGAFgiJdvsg8R+9Agn8gHSI9uVibW9PoRG2Ks
 p+ieulpyzSfkQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Le+o3emh
Subject: [Buildroot] [PATCH] package/libnss: fix build failure due to
 missing missing libnspr in link list
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

FREEBL_NO_DEPEND is usually set to 1 and this means that:
```
build libfreebl3.so with no NSPR and libnssutil3.so dependencies by
default
```
But PR_SetError() and other PR_*() APIs are contained right in
NSPR(libnspr) that we already build and it's a libnss dependency, so let's
make libnss to link with libnspr by default by setting FREEBL_NO_DEPEND to
0.

Fixes:
http://autobuild.buildroot.net/results/c5b440bae5cd6dc6d5f1a632a6b5950b32d13f66/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 4283ef520f..bc878adc35 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -57,7 +57,8 @@ LIBNSS_BUILD_VARS = \
 	OS_ARCH="Linux" \
 	OS_RELEASE="2.6" \
 	OS_TEST=$(BR2_PACKAGE_LIBNSS_ARCH) \
-	NSS_ENABLE_WERROR=0
+	NSS_ENABLE_WERROR=0 \
+	FREEBL_NO_DEPEND=0
 
 ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),)
 # Disable Altivec if not supported
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
