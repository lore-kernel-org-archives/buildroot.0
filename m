Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2D2EE49A5
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B177140B8C;
	Mon, 21 Aug 2023 20:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B177140B8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cwcsAM6dy6ys; Mon, 21 Aug 2023 20:15:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E69F140B7F;
	Mon, 21 Aug 2023 20:15:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E69F140B7F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 68A671BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ABF8414D1
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ABF8414D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wZY6RLG5r4Hc for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBB6E409CB
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBB6E409CB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF36386025; Mon, 21 Aug 2023 20:01:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Aug 2023 00:12:35 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d74515a3e83b6139aed764a5ef0f40115dc92e22
X-Git-Newrev: fc2a530c5b8a700978e29eae2ef6deef3cefe20c
X-Patchwork-Hint: ignore
Message-Id: <20230821200124.CF36386025@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/dracut: add CPE ID
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

commit: https://git.buildroot.net/buildroot/commit/?id=fc2a530c5b8a700978e29eae2ef6deef3cefe20c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

dracut_project:dracut is a valid CPE ID:
https://nvd.nist.gov/products/cpe/detail/8050B12A-93FB-453E-8459-9B8B9CC7544E?namingFormat=2.3&orderBy=CPEURI&keyword=dracut&status=FINAL

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dracut/dracut.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index 597492bc5e..3eb9bcc474 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -8,6 +8,7 @@ DRACUT_VERSION = 057
 DRACUT_SITE = $(call github,dracutdevs,dracut,$(DRACUT_VERSION))
 DRACUT_LICENSE = GPL-2.0
 DRACUT_LICENSE_FILES = COPYING
+DRACUT_CPE_ID_VENDOR = dracut_project
 
 HOST_DRACUT_DEPENDENCIES = host-pkgconf host-kmod host-prelink-cross
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
