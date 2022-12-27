Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16962C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B77E883E38;
	Mon, 20 Feb 2023 23:30:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B77E883E38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bLH4StPAC0V2; Mon, 20 Feb 2023 23:30:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5C5883163;
	Mon, 20 Feb 2023 23:30:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5C5883163
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC44C1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE7A46137C
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE7A46137C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FS80VWT9LvNu for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC1866176D
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC1866176D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2B0C8648F; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 22:32:21 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1567516d8984a4bddfbee30ee69c771cf3f8e224
X-Git-Newrev: 85c5af46ad6c18841576c0f7abe241a617a44cb7
X-Patchwork-Hint: ignore
Message-Id: <20230220205216.A2B0C8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ucl: drop package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=85c5af46ad6c18841576c0f7abe241a617a44cb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

ucl is directly vendored in upx since version 3.99 and
https://github.com/upx/upx/commit/61e1366122f8d1b9e2434a8103e7af00a35ea902

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ucl/ucl.hash |  3 ---
 package/ucl/ucl.mk   | 15 ---------------
 2 files changed, 18 deletions(-)

diff --git a/package/ucl/ucl.hash b/package/ucl/ucl.hash
deleted file mode 100644
index 0252f69297..0000000000
--- a/package/ucl/ucl.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  b865299ffd45d73412293369c9754b07637680e5c826915f097577cd27350348  ucl-1.03.tar.gz
-sha256  70439f6e2b47057a408d2390ed6663b9875f5a08066a06a060a357ef1df89a8c  COPYING
diff --git a/package/ucl/ucl.mk b/package/ucl/ucl.mk
deleted file mode 100644
index aac068ef60..0000000000
--- a/package/ucl/ucl.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# ucl
-#
-################################################################################
-
-UCL_VERSION = 1.03
-UCL_SITE = http://www.oberhumer.com/opensource/ucl/download
-UCL_LICENSE = GPL-2.0+
-UCL_LICENSE_FILES = COPYING
-
-# Fix ACC conformance test failure for host gcc 6.x
-HOST_UCL_CONF_ENV += CPPFLAGS="$(HOST_CPPFLAGS) -std=iso9899:1990"
-
-$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
