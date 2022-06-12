Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70E2C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Jun 2022 15:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76CD160E7D;
	Sun, 12 Jun 2022 15:18:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id In--UkREw23M; Sun, 12 Jun 2022 15:18:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FFF860BBD;
	Sun, 12 Jun 2022 15:18:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B9371BF968
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 15:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08CF7415C1
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 15:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Q_kCc9Xrm-X for <buildroot@lists.busybox.net>;
 Sun, 12 Jun 2022 15:18:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A94D415A1
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 15:18:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E197986E4E; Sun, 12 Jun 2022 15:06:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Jun 2022 17:18:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49766be2f26b17305dd753b5012d246758d9821b
X-Git-Newrev: 975af835d1af3bd90177e19bbca31a72855aaad0
X-Patchwork-Hint: ignore
Message-Id: <20220612150625.E197986E4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wolftpm: drop WOLFTPM_CPE_ID_VENDOR
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=975af835d1af3bd90177e19bbca31a72855aaad0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:wolfssl:wolftpm has never been a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awolfssl%3Awolftpm

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wolftpm/wolftpm.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
index 760656e134..a4a9edce85 100644
--- a/package/wolftpm/wolftpm.mk
+++ b/package/wolftpm/wolftpm.mk
@@ -9,7 +9,6 @@ WOLFTPM_SITE = $(call github,wolfSSL,wolfTPM,v$(WOLFTPM_VERSION))
 WOLFTPM_INSTALL_STAGING = YES
 WOLFTPM_LICENSE = GPL-2.0+
 WOLFTPM_LICENSE_FILES = LICENSE
-WOLFTPM_CPE_ID_VENDOR = wolfssl
 WOLFTPM_CONFIG_SCRIPTS = wolftpm-config
 
 # wolfTPM's source code is released without a configure script,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
