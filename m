Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DBFEDE994
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 08:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 227DD4159C;
	Thu, 14 Sep 2023 08:35:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 227DD4159C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ofXjN8e1IrjY; Thu, 14 Sep 2023 08:35:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5446B41712;
	Thu, 14 Sep 2023 08:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5446B41712
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C6171BF990
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 08:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6301241723
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 08:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6301241723
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rm5HMO26ITqm for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 08:34:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7923441702
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 08:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7923441702
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68E8D86EF1; Thu, 14 Sep 2023 08:34:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 10:17:44 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 4c6f56ebbc0778bb8014a54efe884f7c88a9ef13
X-Git-Newrev: 3baed49fb66f77086406becb1e86cb4206c9d7d5
X-Patchwork-Hint: ignore
Message-Id: <20230914083402.68E8D86EF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/heirloom-mailx:
 fix comment about ignore CVE-2014-7844
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

commit: https://git.buildroot.net/buildroot/commit/?id=3baed49fb66f77086406becb1e86cb4206c9d7d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

In commit
15972770cf34ed0b0ba330e3cc42c04f1c80c3c8 ("package/heirloom-mailx:
security bump to version 12.5-5 from Debian"), we added CVE-2014-7844
in HEIRLOOM_MAILX_IGNORE_CVES, but with the wrong comment about it: it
is a different patch in the Debian stack of patches that fixes
it. Indeed the description of patch
0011-outof-Introduce-expandaddr-flag.patch is:

=====================================================================
Subject: [PATCH 1/4] outof: Introduce expandaddr flag

Document that address expansion is disabled unless the expandaddr
binary option is set.

This has been assigned CVE-2014-7844 for BSD mailx, but it is not
a vulnerability in Heirloom mailx because this feature was documented.
=====================================================================

See also https://marc.info/?l=oss-security&m=141875285203183&w=2 for
details.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 94716fdb481247e962aa646ee1a95852d03db700)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/heirloom-mailx/heirloom-mailx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
index d3b8ad437a..bb2e1f48de 100644
--- a/package/heirloom-mailx/heirloom-mailx.mk
+++ b/package/heirloom-mailx/heirloom-mailx.mk
@@ -12,7 +12,7 @@ HEIRLOOM_MAILX_LICENSE = BSD-4-Clause, Bellcore (base64), OpenVision (imap_gssap
 HEIRLOOM_MAILX_LICENSE_FILES = COPYING
 HEIRLOOM_MAILX_CPE_ID_VENDOR = heirloom
 HEIRLOOM_MAILX_CPE_ID_PRODUCT = mailx
-# 0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch in the Debian patches
+# 0011-outof-Introduce-expandaddr-flag.patch in the Debian patches
 HEIRLOOM_MAILX_IGNORE_CVES += CVE-2014-7844
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
