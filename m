Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0D0EE49A6
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83AF740BB6;
	Mon, 21 Aug 2023 20:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83AF740BB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZeRuKz7aDQxg; Mon, 21 Aug 2023 20:06:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A811B40B75;
	Mon, 21 Aug 2023 20:06:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A811B40B75
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F5991BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C519E81F88
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C519E81F88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z7-mI27AMu1f for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 071B881FA9
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 071B881FA9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 04FFA86028; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Aug 2023 00:12:42 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 159e469f53a1220249e8df41e287668a3d726678
X-Git-Newrev: 35d97842a234b429531be8164028497d59446ca8
X-Patchwork-Hint: ignore
Message-Id: <20230821200125.04FFA86028@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/yajl: add CPE ID
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=35d97842a234b429531be8164028497d59446ca8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

yajl_project:yajl is a valid CPE ID:
https://nvd.nist.gov/products/cpe/detail/CD8C46A4-151E-4DC3-BCE8-4C322E9E10DB?namingFormat=2.3&orderBy=CPEURI&keyword=yajl&status=FINAL

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/yajl/yajl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/yajl/yajl.mk b/package/yajl/yajl.mk
index d14a68b402..cd23c8728d 100644
--- a/package/yajl/yajl.mk
+++ b/package/yajl/yajl.mk
@@ -9,5 +9,6 @@ YAJL_SITE = $(call github,lloyd,yajl,refs/tags/$(YAJL_VERSION))
 YAJL_INSTALL_STAGING = YES
 YAJL_LICENSE = ISC
 YAJL_LICENSE_FILES = COPYING
+YAJL_CPE_ID_VENDOR = yajl_project
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
