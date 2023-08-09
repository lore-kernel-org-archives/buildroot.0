Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C10CC001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 17:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B1E7401FB;
	Wed,  9 Aug 2023 17:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B1E7401FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OzAq6dvc14PI; Wed,  9 Aug 2023 17:40:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC0A3418E5;
	Wed,  9 Aug 2023 17:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC0A3418E5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E4A1B1BF3B9
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC347402FD
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC347402FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IeYwvY8hRfo9 for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 17:40:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45EAB401FB
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 17:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45EAB401FB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 345138516E; Wed,  9 Aug 2023 17:40:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Aug 2023 19:21:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 503cfb40c74bcb8bd6be9bcd977c9dbd1b22d0ed
X-Git-Newrev: 144cacd07bd613bc4a293b8c0ec7c7304bdf8cc0
X-Patchwork-Hint: ignore
Message-Id: <20230809174025.345138516E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flite: add FLITE_CPE_ID_VENDOR
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1094542526792860191=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1094542526792860191==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=144cacd07bd613bc4a293b8c0ec7c7304bdf8cc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:cmu:flite is a valid identifier for
this package:
https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=flite

Signed-off-by: Clément Ramirez <clement.ramirez@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

--===============1094542526792860191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1094542526792860191==--
