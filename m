Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB99EDE990
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 08:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B25B41715;
	Thu, 14 Sep 2023 08:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B25B41715
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZGcEv8CbV7rX; Thu, 14 Sep 2023 08:33:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36C0141729;
	Thu, 14 Sep 2023 08:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36C0141729
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 491241BF990
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 08:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2482141706
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 08:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2482141706
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sSG-Sve44ea3 for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 08:33:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33AC941702
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 08:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33AC941702
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E53886EF1; Thu, 14 Sep 2023 08:33:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 10:18:02 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 70abf358a6e82f39da160aa5198e42e9690eb85e
X-Git-Newrev: fffed388de65ddfbe796ec4baf942e1d10ec6108
X-Patchwork-Hint: ignore
Message-Id: <20230914083342.1E53886EF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/heirloom-mailx:
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

commit: https://git.buildroot.net/buildroot/commit/?id=fffed388de65ddfbe796ec4baf942e1d10ec6108
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
