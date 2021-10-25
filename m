Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4261FC433FE
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 12:14:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9C9861078
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 12:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9C9861078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5BEC403F0;
	Mon, 25 Oct 2021 12:14:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wzWcrQaCx5E4; Mon, 25 Oct 2021 12:14:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE302403E0;
	Mon, 25 Oct 2021 12:14:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 75A901BF375
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 12:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 725CF6083E
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 12:13:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DPNhH8QtGtmn for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 12:13:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C519D60826
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 12:13:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E7F7F88771; Mon, 25 Oct 2021 12:10:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 14:13:09 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 80e404bac36a72b3d05ce14550095dacd1d84965
X-Git-Newrev: a2bc7a73c2551fb03e2fe7c720be0e7e7fb447dd
X-Patchwork-Hint: ignore
Message-Id: <20211025121030.E7F7F88771@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/lightning: add
 LIGHTNING_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=a2bc7a73c2551fb03e2fe7c720be0e7e7fb447dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

cpe:2.3:a:gnu:lightning:*:*:*:*:*:*:*:* is a valid CPE for this pkg

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Alightning

Signed-off-by: Matthew Weber <matthew.weber@collins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit fe6767f7cd4b078f1e0c6699b75291810c16c150)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lightning/lightning.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
index 3bd17bef56..da8c07e61f 100644
--- a/package/lightning/lightning.mk
+++ b/package/lightning/lightning.mk
@@ -9,6 +9,7 @@ LIGHTNING_SITE = $(BR2_GNU_MIRROR)/lightning
 LIGHTNING_LICENSE = LGPL-3.0+
 LIGHTNING_LICENSE_FILES = COPYING.LESSER
 LIGHTNING_INSTALL_STAGING = YES
+LIGHTNING_CPE_ID_VENDOR = gnu
 # We're patching include/Makefile.am
 LIGHTNING_AUTORECONF = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
