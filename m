Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44473C433FE
	for <buildroot@archiver.kernel.org>; Fri, 30 Sep 2022 15:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA19C4105A;
	Fri, 30 Sep 2022 15:20:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA19C4105A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m-STxvhFtf1P; Fri, 30 Sep 2022 15:20:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DB6F41025;
	Fri, 30 Sep 2022 15:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DB6F41025
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2FBA01BF3DE
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 091C841D9C
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:19:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 091C841D9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RiNIk2Jap_SJ for <buildroot@lists.busybox.net>;
 Fri, 30 Sep 2022 15:19:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02E4E41D9A
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 15:19:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02E4E41D9A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E432886694; Fri, 30 Sep 2022 15:19:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Sep 2022 17:02:23 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 2a34da347622a2196ee2df80ed42c253ee27bf18
X-Git-Newrev: 0cccbb817a13c18e2e7359ad85fd84770362f7dc
X-Patchwork-Hint: ignore
Message-Id: <20220930151949.E432886694@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/m4: remove
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

commit: https://git.buildroot.net/buildroot/commit/?id=0cccbb817a13c18e2e7359ad85fd84770362f7dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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
