Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81C0CE7A8C
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 06:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95AA141559;
	Mon, 25 Sep 2023 06:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95AA141559
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s4O8fem-d7qu; Mon, 25 Sep 2023 06:44:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE14041551;
	Mon, 25 Sep 2023 06:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE14041551
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 324071BF308
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 06:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 193A160C2B
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 06:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 193A160C2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HpCtI4H5Ssu5 for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 06:44:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EE8860DF9
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 06:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EE8860DF9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3EC4780E0A; Mon, 25 Sep 2023 06:44:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 08:38:57 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: c01bba1bf85af4d2e654267ad45c86fe614c400f
X-Git-Newrev: 4131f4be8a6ef1576c598130b14f4854bdcb1c60
X-Patchwork-Hint: ignore
Message-Id: <20230925064418.3EC4780E0A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/cpio: drop
 CVE-2021-38185 from IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=4131f4be8a6ef1576c598130b14f4854bdcb1c60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

CVE-2021-38185 affects cpio <= 2.13.
The mentioned patches were removed in b0306d94 when bumping to 2.14.

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 880e03ba7519597e813e910543b87b5a077c906c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cpio/cpio.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
index 19224000bb..911d16822b 100644
--- a/package/cpio/cpio.mk
+++ b/package/cpio/cpio.mk
@@ -12,10 +12,6 @@ CPIO_LICENSE = GPL-3.0+
 CPIO_LICENSE_FILES = COPYING
 CPIO_CPE_ID_VENDOR = gnu
 
-# 0002-Rewrite-dynamic-string-support.patch
-# 0003-Fix-previous-commit.patch
-CPIO_IGNORE_CVES += CVE-2021-38185
-
 # cpio uses argp.h which is not provided by uclibc or musl by default.
 # Use the argp-standalone package to provide this.
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
