Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4E5C433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 16:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E9944094D;
	Tue, 18 Jan 2022 16:24:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id src40dPBZKrZ; Tue, 18 Jan 2022 16:24:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0EE04091D;
	Tue, 18 Jan 2022 16:24:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 821E01BF5A4
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 16:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CEF64053D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 16:24:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aabcicgTTCRv for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 16:24:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D87BF4051C
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 16:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642523054;
 bh=QJan5/sD56tE2YsgLkrctzYcA8X/uKzfHGr5j13MX24=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=QdShmrUprUXOoAfmwruWbeZcBSJelw4R/v+x2Mk0fU2NVrFEurYZg2rCzpyKXNHz5
 2TmoPyS3NEuKHDM15OCnR/MuW5mk+HZ/VwyC07Qh/euZb108lGNEIelVmN6x5iqK75
 AAtWel18d+9sLqeBrjF9hmc5P+GfqrZThiwBXOBU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.124]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M8QWA-1nEH8A0Kum-004SQi for <buildroot@buildroot.org>; Tue, 18 Jan 2022
 17:24:14 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 17:24:13 +0100
Message-Id: <20220118162413.24664-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:hegMRzeQm1xp0xMRczi3N5he0UTPLgwkab5XD/HLJX3QNHpcMn4
 r96XJUhl3ag2wwCppOabY9fZph8Ok7AhUKpXh/EEK/RnOXqxbIPR2X7GX++lJaC+1zg56Cz
 JuKoK4Ks2etNWyQ18ZQFh7CV2RGR+5INjrKb4oJeuFVRVQTPiczB7sQ5a+u6TYO8H/bjjoU
 1e6d1UdCkLt9rYPo3BxWw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2R0y6zKVHiI=:RIrND/RN38LYHiJEet50RV
 9soYLU9Lb/LILLeAofWQSKJ7a3pBDp2HgXzVPqKHjYXHyiQ4itbhgVDcKVhzkPB7EvoF3021I
 N5eIqDq2fbV9xdARy2E1WExHAi9Gpw/EGRFHMXx6mf2yyUpKKG0B10OIQ9xpUQ6/zBcSJHwPs
 YB9UX98h+goiXLXvB4BxZBG7mt2KArdVShqejiZvGEKCzoumISgtEBQ202P1cL1Rjy/nVM1vv
 XhAUeQgApFN1acqL7ZPHY/YbCGiXrInG0Cb5KgL+psGlVnORKX/DwHXM4MxrOUp6w6+V4MQAN
 qRX1mxAMvvA1H5Nu2iymDwTd5LrHh8ZIEIOxGZqWV1Jq2iZe38Yto5GeNXv1fSVEwow6QFetW
 tDIP2OjGPO2gny74PrnQ2pD4yprE8s0mVI3d6oKNtcIewRqgUh5QOgFzZc4taWm2zVrof5T/E
 qs6xV5K3KAALZSSqB63ECW64+y5/at+NNmg5uG4jMTATaoZI5h4evhCi72Coyv0nUY+RFUrzK
 2VKBQGgxh6uw9J/U2X0TQuGjH45nwRz2uLX5D8CW2LMJRV5gLIkJm/z9QaqrIYp4GGOtXjTcL
 vnUHL4OS9g8ol7k7paUvVQeLs4mjExstbt2AH24K9VyEbV4STonVzzbz9rn0zr7JRRTntaKAf
 SejmHPlNDMhsKYHgjYk9+Py1jteFplszKZKb+y7P6Pm2eiExdQlWn7NoA0+1ubBE0fzSR4N/e
 UkmzvqEZANohRDkIxVeFUzMNTtWCpVIc3j2qnf+72MfOaVRfL6UVx9oowjvx3g8b+iKT1Z11+
 YKwk5zOr/3vX+9xXVOl8/LPpXpqYOXtvX9h2y4u2t3PHtiNHVLNHYTRbgroL+XD4jryvNSEmk
 21W6e4Db+/fQfUx53axxPLKWytn4Hb2upjqOggVIAN05sqeSb7GDTAdTA1ZsiipdmRFo806dC
 PalOK0puPw2JDuhrp4GRh1yxgh7TcRvSatgl6sIqUw6+jewgJkelUwCUsQbSFJ0R1eGzh/Foh
 aBy3Oi36boO4ocTVq+NrdLEo7EIzxmEpmcy4zuCmPY013e/9UcVk0MeJWvLEX+7PFSJBoacY+
 AHjVyUSKp9f6pg=
Subject: [Buildroot] [PATCH v1] package/rtl8812au-aircrack-ng: bump version
 to 3a6402e
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:

  47a38b7 Fix kernel 5.15 compilation
  6fd304f fix libc6_2.34 dependency on build
  307d694 Merge pull request #898 from CGarces/fix_5.15
  191f5bc Remove REMAKE_INITRD
  bd8e44b Add back 8814au support
  849206d Merge pull request #913 from iyanmv/iyanmv-remove-remake-initrd
  7bb5114 Fix kernel v5.15+ compiler warnings
  1b63ee6 Fixed compiler warning for unused function
  a72835d Fix (test) for IPX header on various distros
  3a6402e Fix for kernel v3.20

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash | 2 +-
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
index 5503b4f22e..ed1921d1c2 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2c5d8286a00273343fc10d0e16afc52e788ac73b7df57c8159e58a40707f61da  rtl8812au-aircrack-ng-b8167e66b4ac046b3b76c2c40008d84528e91594.tar.gz
+sha256  acae758c3834196c71f4ee58f53a3c1b29ffd984f63ff2f40f2b080c8785c49f  rtl8812au-aircrack-ng-3a6402e9e79802891f1531b435be54f4d8b71f0b.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index d42d953496..2bbca88cfb 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8812AU_AIRCRACK_NG_VERSION = b8167e66b4ac046b3b76c2c40008d84528e91594
+RTL8812AU_AIRCRACK_NG_VERSION = 3a6402e9e79802891f1531b435be54f4d8b71f0b
 RTL8812AU_AIRCRACK_NG_SITE = $(call github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
 RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
 RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
