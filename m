Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E2CC47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 23:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E92240A88;
	Sat, 20 Jan 2024 23:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E92240A88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZUFbXLVHzsRw; Sat, 20 Jan 2024 23:03:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8997240A91;
	Sat, 20 Jan 2024 23:03:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8997240A91
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 851171BF471
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6975B83E96
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6975B83E96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kWMWu6b6jgLj for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 23:03:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A002E83D53
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 23:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A002E83D53
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86AA28634C; Sat, 20 Jan 2024 23:03:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 20 Jan 2024 23:58:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 107d39c1a7e77b3668f923f2f84f961acfaefa53
X-Git-Newrev: a1bac67ba7442b3836621cc96943dffa45ddd880
X-Patchwork-Hint: ignore
Message-Id: <20240120230317.86AA28634C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6base: add
 QT6BASE_CPE_ID_VENDOR and QT6BASE_CPE_ID_PRODUCT
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1bac67ba7442b3836621cc96943dffa45ddd880
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:qt:qt:6.4.3:*:*:*:*:*:*:* is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/8397D12E-2D77-458E-B9C3-DC7B4775B1A7

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qt6/qt6base/qt6base.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 67c705fb93..667dd4133f 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -7,6 +7,8 @@
 QT6BASE_VERSION = $(QT6_VERSION)
 QT6BASE_SITE = $(QT6_SITE)
 QT6BASE_SOURCE = qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERSION).tar.xz
+QT6BASE_CPE_ID_VENDOR = qt
+QT6BASE_CPE_ID_PRODUCT = qt
 
 QT6BASE_CMAKE_BACKEND = ninja
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
