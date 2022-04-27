Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0B4C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 18:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06136403A4;
	Wed, 27 Apr 2022 18:58:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R-Bt_6ZB99Us; Wed, 27 Apr 2022 18:58:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 147D140151;
	Wed, 27 Apr 2022 18:58:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 208EE1BF322
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 859C0831D6
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:57:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gSWoQfL13mTE for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 18:57:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0C6182A6C
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 18:57:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4986B84601; Wed, 27 Apr 2022 18:47:26 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 20:50:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 915c1d0aa4cee24bf9f8d9c60cafd708fe4e2f19
X-Git-Newrev: cfaee5c49f1ace45adb84be671a49f7a6d1e6079
X-Patchwork-Hint: ignore
Message-Id: <20220427184726.4986B84601@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wtfutil: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=cfaee5c49f1ace45adb84be671a49f7a6d1e6079
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:wtfutil:wtf is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awtfutil%3Awtf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wtfutil/wtfutil.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/wtfutil/wtfutil.mk b/package/wtfutil/wtfutil.mk
index 6e841411a9..54fea09574 100644
--- a/package/wtfutil/wtfutil.mk
+++ b/package/wtfutil/wtfutil.mk
@@ -8,5 +8,7 @@ WTFUTIL_VERSION = 0.41.0
 WTFUTIL_SITE = $(call github,wtfutil,wtf,v$(WTFUTIL_VERSION))
 WTFUTIL_LICENSE = MPL-2.0
 WTFUTIL_LICENSE_FILES = LICENSE.md
+WTFUTIL_CPE_ID_VENDOR = wtfutil
+WTFUTIL_CPE_ID_PRODUCT = wtf
 
 $(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
