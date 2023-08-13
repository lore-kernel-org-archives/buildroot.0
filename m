Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76DCC001DB
	for <buildroot@archiver.kernel.org>; Sun, 13 Aug 2023 17:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8A0D812FB;
	Sun, 13 Aug 2023 17:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8A0D812FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7uQwjE5ner3P; Sun, 13 Aug 2023 17:25:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4656E812F3;
	Sun, 13 Aug 2023 17:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4656E812F3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D382A1BF414
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 17:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACE1A400C8
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 17:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACE1A400C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u1VOfjS_pPKR for <buildroot@lists.busybox.net>;
 Sun, 13 Aug 2023 17:25:31 +0000 (UTC)
Received: from smtpcmd11128.aruba.it (smtpcmd11128.aruba.it [62.149.156.128])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08C31400BF
 for <buildroot@buildroot.org>; Sun, 13 Aug 2023 17:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08C31400BF
Received: from localhost.localdomain ([95.47.160.93])
 by Aruba Outgoing Smtp  with ESMTPSA
 id VEqDqsSYuuuYVVEqEq9tZz; Sun, 13 Aug 2023 19:25:27 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 13 Aug 2023 19:25:24 +0200
Message-Id: <20230813172524.354647-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJ88IjHmr43YusZVUGQ+1c2tWXBwqr8+AYeFHRYac08LzNmG01xSm2kU2MJXdzTGbzrtNFG4MIDm1OkOjJLx9PKsiVaQrxA6nOJMt9yGFOsSVcGTM7hT
 OVPzHKlVASFkNPi3BBuAuZCWNmZu43X8dboQmOxarWKFYtqrd1Zdivjv6brmfITS9Oh5Og3iJjv3yfqVU0G2iX5o5hKSQjjD4UBE/zwFF+6XTzU7RImhp5dC
 csp0Hsxv8/rO+GeXeJEdfWFXBOcCm0FAI035Tfimo/U=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1691947527; bh=p5WSzmLnpBi200ebTMr+ML3fRWDmgtmoociEPKhfFoU=;
 h=From:To:Subject:Date:MIME-Version;
 b=f9wxCiVQq8y6yjViqibCeSb9cI3yQpIgkxMHXb7rPy5fsc6aZ0OknxTHSYcn/hu42
 gQH4ugbfnVxpcVstQNahziogOts9NKeQiWE0CtTZcQNJIsJfVwmSOrBvgGH3iSken4
 C4iMA3GpYLyiPm3MR+U3MHkMYuYinva9IxggjSc/bqDRbDhiD5fZtrVQOR6TnixgMa
 jL9G/0h0aGh6P1pX6WfeXv4bsS26MOWEY3hW1rsjqJhqbk/zFIo5ZgGlwSqI7/qbVl
 pw9MXe82ILa8ScULwSDV8MgynmrW6JNStmac5qZt+RMs0Y0z4EhR8IPL8rtI3zWk8r
 tabma+Kk6E8OA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=f9wxCiVQ
Subject: [Buildroot] [PATCH] package/ramspeed: disable package if affected
 from gcc bug 43744
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

This package is affected by gcc bug 43744 and I have not found a work
around for it(i.e. the common -O0 we use or other), so let's disable it if
gcc has such bug.

Fixes:
http://autobuild.buildroot.net/results/ab289769c5fea435934ed260d38e0a4fdd2ba72d

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/ramspeed/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ramspeed/Config.in b/package/ramspeed/Config.in
index b236329a84..bd0438ffe1 100644
--- a/package/ramspeed/Config.in
+++ b/package/ramspeed/Config.in
@@ -1,5 +1,9 @@
+comment "ramspeed needs a toolchain not affected by GCC bug 43744"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_43744
+
 config BR2_PACKAGE_RAMSPEED
 	bool "ramspeed"
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_43744
 	help
 	  RAMspeed is a free open source command line utility
 	  to measure cache and memory performance.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
