Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C227C4338F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 19:15:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 153B060C51
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 19:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 153B060C51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF4F040539;
	Wed, 28 Jul 2021 19:15:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zGZRSMh8a2VD; Wed, 28 Jul 2021 19:15:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C01A8401EA;
	Wed, 28 Jul 2021 19:15:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 068641BF2BC
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 19:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94F0882F51
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 19:12:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LWJYHRE_gTHo for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 19:12:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79D1F831B0
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 19:12:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2EE1A890B2; Wed, 28 Jul 2021 18:37:21 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 28 Jul 2021 21:05:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ebd856ccab34186f731402d6da9a0c56c8278c0e
X-Git-Newrev: 79660c173e06b3290cf7b5f3c56da0f1bacecf92
X-Patchwork-Hint: ignore
Message-Id: <20210728183721.2EE1A890B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libogg: switch back to http
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=79660c173e06b3290cf7b5f3c56da0f1bacecf92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LIBOGG_SITE has been switched to https since commit
c8dd578b135041eed639c06810e67b8b018402d4 resulting in the following
download failure:

Connecting to downloads.xiph.org (downloads.xiph.org)|2001:470:eb26:42::1|:443... connected.
OpenSSL: error:1407742E:SSL routines:SSL23_GET_SERVER_HELLO:tlsv1 alert protocol version

So switch back to http

Fixes:
 - http://autobuild.buildroot.org/results/56225b5daa471668d25cbe3b794e83c75c6724f7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libogg/libogg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libogg/libogg.mk b/package/libogg/libogg.mk
index 3faf1b7357..49f9c7b6ac 100644
--- a/package/libogg/libogg.mk
+++ b/package/libogg/libogg.mk
@@ -6,7 +6,7 @@
 
 LIBOGG_VERSION = 1.3.5
 LIBOGG_SOURCE = libogg-$(LIBOGG_VERSION).tar.xz
-LIBOGG_SITE = https://downloads.xiph.org/releases/ogg
+LIBOGG_SITE = http://downloads.xiph.org/releases/ogg
 LIBOGG_LICENSE = BSD-3-Clause
 LIBOGG_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
