Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E2CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Jun 2022 10:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D249410DD;
	Thu, 23 Jun 2022 10:40:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D249410DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PcqgOXhqvcOv; Thu, 23 Jun 2022 10:40:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88A13410D7;
	Thu, 23 Jun 2022 10:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88A13410D7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B96C1BF39C
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 10:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5435184747
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 10:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5435184747
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5DZFMSLmPdcB for <buildroot@lists.busybox.net>;
 Thu, 23 Jun 2022 10:40:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58FF084746
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58FF084746
 for <buildroot@busybox.net>; Thu, 23 Jun 2022 10:40:12 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 0B5C3440061;
 Thu, 23 Jun 2022 13:39:42 +0300 (IDT)
To: buildroot@busybox.net
Date: Thu, 23 Jun 2022 13:39:45 +0300
Message-Id: <df12f8b1481e658fc40847e4e741bc7dae8dcb38.1655980785.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1655980782;
 bh=6jn72g+HkQo4XN/YwdaU22bWZVFRHKS6SUxUFEXa9Hs=;
 h=From:To:Cc:Subject:Date:From;
 b=grKz+44CwFQgvPCgZky8bNFVucxeJLj82XYPKzwpXr5lDYOpo77IGmE+edol95IfK
 UY9Yx49Do5GbdM29p3kEP9pwnYY5ZAaMZ9IpVAAqbEKoBNA1Col6F4whismLtNSsk3
 AS8Nxv46zEtjCv+Gn/loEI2VISt/b5vZKfJaS9J2YkcCaN0ldh64238RbqQDrJWgbr
 XcrsA6cTjPS16uHj6omJcMUzdEzIOAk7MqhPqBXM6Yui1jBGr0UNDVsCmOlwRPansw
 zl8nb42GG/E87WALotwwtENB8+ElBzXci8Ze8SswfcAJ5p2bGSva23paxc4YAQdSnC
 qxACstTMVtuRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=grKz+44C
Subject: [Buildroot] [PATCH] package/strace: bump to version 5.18
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index f3567db637ee..c044563b33d5 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/5.17/strace-5.17.tar.xz.asc
-sha256  5fb298dbd1331fd1e1bc94c5c32395860d376101b87c6cd3d1ba9f9aa15c161f  strace-5.17.tar.xz
+# https://strace.io/files/5.18/strace-5.18.tar.xz.asc
+sha256  60293ea79ac9253d600cdc9be077ad2988ca22284a439c9e66be5150db3d1187  strace-5.18.tar.xz
 sha256  d92f973d08c8466993efff1e500453add0c038c20b4d2cbce3297938a296aea9  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 4eef43a419c5..0e1cb04c447a 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 5.17
+STRACE_VERSION = 5.18
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
