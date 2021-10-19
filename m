Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF22C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 19:30:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82F256008E
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 19:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82F256008E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B4E680E3F;
	Tue, 19 Oct 2021 19:30:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vrIa9ANaMIad; Tue, 19 Oct 2021 19:30:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4A6980E8F;
	Tue, 19 Oct 2021 19:30:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA58D1BF328
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 19:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7A8B80E41
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 19:30:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oi19x9XDHjxo for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 19:30:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C987F80E3F
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 19:30:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3B7C487F38; Tue, 19 Oct 2021 19:27:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 19 Oct 2021 21:08:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d721c95b8b28e549d19d11d7b530fdd71cb0a54c
X-Git-Newrev: fe6767f7cd4b078f1e0c6699b75291810c16c150
X-Patchwork-Hint: ignore
Message-Id: <20211019192732.3B7C487F38@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lightning: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe6767f7cd4b078f1e0c6699b75291810c16c150
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:gnu:lightning:*:*:*:*:*:*:*:* is a valid CPE for this pkg

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Alightning

Signed-off-by: Matthew Weber <matthew.weber@collins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lightning/lightning.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
index 38b132e082..c0036e5cd1 100644
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
