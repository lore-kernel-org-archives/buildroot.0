Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AEAC4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 21:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AF8440948;
	Tue, 27 Dec 2022 21:32:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AF8440948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gAcyLqRgURt9; Tue, 27 Dec 2022 21:32:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1342440946;
	Tue, 27 Dec 2022 21:32:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1342440946
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 37D1F1BF847
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 21:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2107D60BB0
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 21:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2107D60BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4KSpo0hHF7UD for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 21:32:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43F9360B2C
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 21:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43F9360B2C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32A6686EE1; Tue, 27 Dec 2022 21:32:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 22:32:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1567516d8984a4bddfbee30ee69c771cf3f8e224
X-Git-Newrev: 85c5af46ad6c18841576c0f7abe241a617a44cb7
X-Patchwork-Hint: ignore
Message-Id: <20221227213230.32A6686EE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ucl: drop package
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
