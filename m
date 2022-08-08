Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795D7C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 14:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECF2B60F23;
	Mon,  8 Aug 2022 14:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECF2B60F23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cyiDm0hsAmCA; Mon,  8 Aug 2022 14:29:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0776C60E68;
	Mon,  8 Aug 2022 14:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0776C60E68
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 725141BF982
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 14:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BA2760E3A
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 14:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BA2760E3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kitofcWI4Y2g for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 14:28:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E07460DCB
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 14:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E07460DCB
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 016F186FC0; Mon,  8 Aug 2022 14:14:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Aug 2022 16:28:30 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: f36b3571320e3411e555f284fa6f89e6555ea8cd
X-Git-Newrev: 94ea58679815319e7cef6c32d734585f137b0151
X-Patchwork-Hint: ignore
Message-Id: <20220808141437.016F186FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/i2pd: add
 I2PD_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=94ea58679815319e7cef6c32d734585f137b0151
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

cpe:2.3:a:i2pd:i2pd is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ai2pd%3Ai2pd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 107cff4616e31acc97890643df5fc689665649cb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/i2pd/i2pd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index 8eea09493f..2b5c6a1f54 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -8,6 +8,7 @@ I2PD_VERSION = 2.40.0
 I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
 I2PD_LICENSE = BSD-3-Clause
 I2PD_LICENSE_FILES = LICENSE
+I2PD_CPE_ID_VENDOR = i2pd
 I2PD_SUBDIR = build
 I2PD_DEPENDENCIES = \
 	boost \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
