Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C94EE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E54F740C5C;
	Mon, 21 Aug 2023 20:17:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E54F740C5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LQo68V02NZ8E; Mon, 21 Aug 2023 20:17:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 112DE41480;
	Mon, 21 Aug 2023 20:17:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 112DE41480
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A05B1BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 502C2409AA
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 502C2409AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oP1WLRhRhrnO for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 542E841525
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 542E841525
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D5AC86023; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Aug 2023 19:21:26 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 503cfb40c74bcb8bd6be9bcd977c9dbd1b22d0ed
X-Git-Newrev: 144cacd07bd613bc4a293b8c0ec7c7304bdf8cc0
X-Patchwork-Hint: ignore
Message-Id: <20230821200125.4D5AC86023@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/flite: add
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6045885908259657527=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6045885908259657527==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=144cacd07bd613bc4a293b8c0ec7c7304bdf8cc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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

--===============6045885908259657527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6045885908259657527==--
