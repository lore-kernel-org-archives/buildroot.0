Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDBB8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 12:13:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C2E560FDA
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 12:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C2E560FDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 337C26084A;
	Mon, 25 Oct 2021 12:13:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZK332Oi3Jvsw; Mon, 25 Oct 2021 12:13:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94D5460826;
	Mon, 25 Oct 2021 12:13:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 44BB21BF375
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 12:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DAE9401E1
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 12:13:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KoX2f80fpeVs for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 12:13:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D4314019E
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 12:13:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7D44E8876B; Mon, 25 Oct 2021 12:10:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 14:13:15 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 05138836654a29397bb56fd8e3be902af2d2c935
X-Git-Newrev: 948ca1d6b4c5adcffff38ecc94b39c5bb09fca74
X-Patchwork-Hint: ignore
Message-Id: <20211025121022.7D44E8876B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/lightning: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=948ca1d6b4c5adcffff38ecc94b39c5bb09fca74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
