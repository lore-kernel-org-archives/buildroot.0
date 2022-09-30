Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BB1C433FE
	for <buildroot@archiver.kernel.org>; Fri, 30 Sep 2022 15:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B6D040C36;
	Fri, 30 Sep 2022 15:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B6D040C36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m6rkbeJ869sG; Fri, 30 Sep 2022 15:18:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E2D040C31;
	Fri, 30 Sep 2022 15:18:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E2D040C31
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6185B1C2747
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C06240996
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:18:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C06240996
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jmBhtmrLc0DQ for <buildroot@lists.busybox.net>;
 Fri, 30 Sep 2022 15:18:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CB9340984
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 15:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CB9340984
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 388F786694; Fri, 30 Sep 2022 15:18:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Sep 2022 17:02:28 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 369aefe055180b15c31ec80d229a31d56aaadb88
X-Git-Newrev: 66a6465ac67110558ec396f77adb0c51f77c2d1e
X-Patchwork-Hint: ignore
Message-Id: <20220930151818.388F786694@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/m4: remove
 --disable-static for host package
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

commit: https://git.buildroot.net/buildroot/commit/?id=66a6465ac67110558ec396f77adb0c51f77c2d1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

This issue was reported by Firas Khalil Khana on a Github pull request
at https://github.com/buildroot/buildroot/pull/113/.

There is no --disable-static in m4. Research in the dark corners of
the Git history has shown that it was apparently added by Peter
Korsgaard back in 2009, in commit
3467cf73051d2b8d28d48dfdd694f66315f3b8ca ("m4: cleanup"). At this
time, the version of m4 used was 1.4.9, but even looking at the
tarball of this old release shows that the ./configure did not support
--disable-static.

So let's drop this option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bddc64e866186356297240240c69be7b17ff6d40)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/m4/m4.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index 3a12092971..39ad898b10 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -9,6 +9,5 @@ M4_SOURCE = m4-$(M4_VERSION).tar.xz
 M4_SITE = $(BR2_GNU_MIRROR)/m4
 M4_LICENSE = GPL-3.0+
 M4_LICENSE_FILES = COPYING
-HOST_M4_CONF_OPTS = --disable-static
 
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
