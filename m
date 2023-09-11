Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE84CA0EC0
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 20:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B41940576;
	Mon, 11 Sep 2023 20:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B41940576
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vmKTFG7C1BCG; Mon, 11 Sep 2023 20:59:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CF614189B;
	Mon, 11 Sep 2023 20:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CF614189B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 765381BF3A9
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 20:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 309B061064
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 20:58:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 309B061064
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uOj88baeD9p5 for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 20:58:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67BD56105A
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 20:58:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67BD56105A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 572C386D42; Mon, 11 Sep 2023 20:58:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 22:46:46 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 24acc5978d8d0e72c949781b8af34a95610074da
X-Git-Newrev: 8d9f6075cac0d7e9e43c022e23b67b38fca58942
X-Patchwork-Hint: ignore
Message-Id: <20230911205823.572C386D42@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/flite: add
 FLITE_CPE_ID_VENDOR
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
Content-Type: multipart/mixed; boundary="===============2234217578335130653=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2234217578335130653==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8d9f6075cac0d7e9e43c022e23b67b38fca58942
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

cpe:2.3:a:cmu:flite is a valid identifier for
this package:
https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=flite

Signed-off-by: Clément Ramirez <clement.ramirez@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 144cacd07bd613bc4a293b8c0ec7c7304bdf8cc0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flite/flite.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/flite/flite.mk b/package/flite/flite.mk
index 79b2288fe3..bee4c7394f 100644
--- a/package/flite/flite.mk
+++ b/package/flite/flite.mk
@@ -8,6 +8,7 @@ FLITE_VERSION = 2.2
 FLITE_SITE = $(call github,festvox,flite,v$(FLITE_VERSION))
 FLITE_LICENSE = BSD-4-Clause
 FLITE_LICENSE_FILES = COPYING
+FLITE_CPE_ID_VENDOR = cmu
 
 FLITE_INSTALL_STAGING = YES
 # Patching configure.in

--===============2234217578335130653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2234217578335130653==--
