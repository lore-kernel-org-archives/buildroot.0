Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187A4C04AB8
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 17:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C98CB6139F;
	Wed, 20 Sep 2023 17:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C98CB6139F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9BL26LphMPFm; Wed, 20 Sep 2023 17:37:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 375716136F;
	Wed, 20 Sep 2023 17:37:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 375716136F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D5E2D1BF95F
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 17:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70D8B408A8
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 17:36:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70D8B408A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PDXTXNgFJQTc for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 17:36:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72265404DA
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 17:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72265404DA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60383873AB; Wed, 20 Sep 2023 17:36:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 20 Sep 2023 19:34:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8bf82aab0c0b7a1d329a02395e0353bb9c2eae67
X-Git-Newrev: 880e03ba7519597e813e910543b87b5a077c906c
X-Patchwork-Hint: ignore
Message-Id: <20230920173650.60383873AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cpio: drop CVE-2021-38185 from
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=880e03ba7519597e813e910543b87b5a077c906c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CVE-2021-38185 affects cpio <= 2.13.
The mentioned patches were removed in b0306d94 when bumping to 2.14.

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
