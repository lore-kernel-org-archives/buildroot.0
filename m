Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437A3E7070F
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 10:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1C2683C5C;
	Thu, 21 Sep 2023 10:31:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1C2683C5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DEBN99r2uUFs; Thu, 21 Sep 2023 10:31:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E6AF83C4A;
	Thu, 21 Sep 2023 10:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E6AF83C4A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2302D1BF3C2
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 10:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09D1383C51
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 10:31:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09D1383C51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QQUoRs2zTjin for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 10:31:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AA46837D3
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 10:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AA46837D3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 328EE87422; Thu, 21 Sep 2023 10:31:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 12:30:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a01a6b8dc840eb99528d3c876d18e1f8952d2a58
X-Git-Newrev: f71c7940210420e156530e0993756f9c41e66f4a
X-Patchwork-Hint: ignore
Message-Id: <20230921103102.328EE87422@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/icu: drop CVE-2021-30535 from
 IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=f71c7940210420e156530e0993756f9c41e66f4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mentioned patch was removed in 7549e05b when bumping to 70-1.

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/icu/icu.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index d4be2e4e8f..73547a7537 100644
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
