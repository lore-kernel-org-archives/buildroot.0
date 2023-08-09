Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9475CEE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F2F241452;
	Mon, 21 Aug 2023 20:16:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F2F241452
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4_dN5K4B9-o3; Mon, 21 Aug 2023 20:16:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AFB84116F;
	Mon, 21 Aug 2023 20:15:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AFB84116F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 11A631BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF711414CC
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF711414CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l14JfbKahYSS for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4566B41522
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4566B41522
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A38B86025; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Aug 2023 19:21:21 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b10ceec75520fab80f76081f50daaaab9df890f5
X-Git-Newrev: e763128b6b16becdb476f52af106302e18c26233
X-Patchwork-Hint: ignore
Message-Id: <20230821200125.2A38B86025@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/diffutils: add
 DIFFUTILS_CPE_ID_VENDOR
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
Content-Type: multipart/mixed; boundary="===============6091803060805006585=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6091803060805006585==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e763128b6b16becdb476f52af106302e18c26233
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

cpe:2.3:a:gnu:diffutils is a valid identifier for
this package:
https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=diffutils

Signed-off-by: Clément Ramirez <clement.ramirez@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/diffutils/diffutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 2c66434a9a..1119266863 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -10,6 +10,7 @@ DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
 DIFFUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 DIFFUTILS_LICENSE = GPL-3.0+
 DIFFUTILS_LICENSE_FILES = COPYING
+DIFFUTILS_CPE_ID_VENDOR = gnu
 
 # Since glibc >= 2.26, don't try to use getopt_long replacement bundled
 # with diffutils. It will conflict with the one from glibc.

--===============6091803060805006585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6091803060805006585==--
