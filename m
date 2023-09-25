Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32BACE7A81
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 12:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BFDF611C9;
	Mon, 25 Sep 2023 12:03:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BFDF611C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EqNYC5CodUIs; Mon, 25 Sep 2023 12:03:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC8FE611B9;
	Mon, 25 Sep 2023 12:03:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC8FE611B9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 688F91BF2C9
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 12:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CD9281FCF
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 12:02:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CD9281FCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kWoBY4LtGpyn for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 12:02:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBA2281FC2
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 12:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBA2281FC2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A738C87747; Mon, 25 Sep 2023 12:02:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 13:57:43 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: bd82856138cf60f6117496c0a7296cc15a295dc8
X-Git-Newrev: 226616fec125ada6d54e5dc7ef88ceeba3c20cc7
X-Patchwork-Hint: ignore
Message-Id: <20230925120252.A738C87747@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/icu: drop
 CVE-2021-30535 from IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=226616fec125ada6d54e5dc7ef88ceeba3c20cc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

The mentioned patch was removed in 7549e05b when bumping to 70-1.

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f71c7940210420e156530e0993756f9c41e66f4a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/icu/icu.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 8107796ae9..111c2124e4 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -17,9 +17,6 @@ ICU_CPE_ID_VENDOR = icu-project
 ICU_CPE_ID_PRODUCT = international_components_for_unicode
 ICU_CPE_ID_VERSION = $(subst -,.,$(ICU_VERSION))
 
-# 0005-ICU-21587-Fix-memory-bug-w-baseName.patch
-ICU_IGNORE_CVES += CVE-2021-30535
-
 ICU_DEPENDENCIES = host-icu
 ICU_INSTALL_STAGING = YES
 ICU_CONFIG_SCRIPTS = icu-config
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
