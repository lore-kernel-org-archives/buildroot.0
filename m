Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186D7CE7A96
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 12:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6E8961036;
	Mon, 25 Sep 2023 12:04:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6E8961036
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l1UK6kpR5KwA; Mon, 25 Sep 2023 12:04:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31E1960F5F;
	Mon, 25 Sep 2023 12:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31E1960F5F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7300F1BF2C9
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 12:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C3E260F5F
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 12:04:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C3E260F5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rQX2zZk5yvMC for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 12:04:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90DE360A94
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 12:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90DE360A94
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FCC487772; Mon, 25 Sep 2023 12:04:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 13:59:32 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d2ed3df411c653778bf7aedbfd35fbaa09340f2d
X-Git-Newrev: a1f6dbd031e0dc2769163f2a4b971acb60da34d9
X-Patchwork-Hint: ignore
Message-Id: <20230925120414.7FCC487772@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/tar: drop
 CVE-2007-4476 from IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1f6dbd031e0dc2769163f2a4b971acb60da34d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

As off 2021-05-17 NVD added 1.19 as the first version that isn't
affected by CVE-2007-4476.

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 487c12a1f29140bf61abcf4cc575bd83b1fc933b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tar/tar.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 80d7495b00..690a5952ba 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -13,8 +13,6 @@ TAR_CONF_OPTS = --exec-prefix=/
 TAR_LICENSE = GPL-3.0+
 TAR_LICENSE_FILES = COPYING
 TAR_CPE_ID_VENDOR = gnu
-# only tar <= 1.16
-TAR_IGNORE_CVES += CVE-2007-4476
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 TAR_DEPENDENCIES += acl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
