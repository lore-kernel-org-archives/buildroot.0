Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F292AEDE990
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 08:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1F7E4177B;
	Thu, 14 Sep 2023 08:35:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1F7E4177B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z7snmSAoyhP4; Thu, 14 Sep 2023 08:35:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C65A041770;
	Thu, 14 Sep 2023 08:35:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C65A041770
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A0B11BF5A2
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 08:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55F0081366
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 08:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55F0081366
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S1umbGhE6c2I for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 08:34:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 870E181238
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 08:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 870E181238
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 770DD86EF2; Thu, 14 Sep 2023 08:34:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 10:17:55 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 3baed49fb66f77086406becb1e86cb4206c9d7d5
X-Git-Newrev: 43e316ca8ae166e2c38d666a7730f8a298974158
X-Patchwork-Hint: ignore
Message-Id: <20230914083402.770DD86EF2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/heirloom-mailx:
 ignore CVE-2004-2771
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

commit: https://git.buildroot.net/buildroot/commit/?id=43e316ca8ae166e2c38d666a7730f8a298974158
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

The CVE-2004-2771 is already fixed by the Debian patch
0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch. The Debian patch
description is:

Subject: [PATCH 4/4] globname: Invoke wordexp with WRDE_NOCMD (CVE-2004-2771)

See also https://marc.info/?l=oss-security&m=141875285203183&w=2 for
more details.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 829610c701ba322514facd8e24ef4b9518a00601)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/heirloom-mailx/heirloom-mailx.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
index bb2e1f48de..063fccf5eb 100644
--- a/package/heirloom-mailx/heirloom-mailx.mk
+++ b/package/heirloom-mailx/heirloom-mailx.mk
@@ -14,6 +14,8 @@ HEIRLOOM_MAILX_CPE_ID_VENDOR = heirloom
 HEIRLOOM_MAILX_CPE_ID_PRODUCT = mailx
 # 0011-outof-Introduce-expandaddr-flag.patch in the Debian patches
 HEIRLOOM_MAILX_IGNORE_CVES += CVE-2014-7844
+# 0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch in the Debian patches
+HEIRLOOM_MAILX_IGNORE_CVES += CVE-2004-2771
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 HEIRLOOM_MAILX_DEPENDENCIES += openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
