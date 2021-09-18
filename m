Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8863C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:36:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A36B461244
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A36B461244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7669C42588;
	Sat, 18 Sep 2021 15:36:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xAk8J18G2CVJ; Sat, 18 Sep 2021 15:36:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCD344257D;
	Sat, 18 Sep 2021 15:36:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B9ED1BF861
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33F2460704
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:36:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8P-Wprd0YExz for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 15:36:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7230A606FF
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 15:36:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E85D08A39E; Sat, 18 Sep 2021 15:34:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 17:33:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b897e778a487fb8693d8595009d6c2c4692dd99
X-Git-Newrev: 1d952aafab5600fc3f0eb6ce71221e509a339996
X-Patchwork-Hint: ignore
Message-Id: <20210918153459.E85D08A39E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glmark2: bumped to latest version
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1d952aafab5600fc3f0eb6ce71221e509a339996
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a segfault happening on Raspberry Pi4 on the fourth test

Signed-off-by: David Corbeil <david.corbeil@dynonavionics.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/glmark2/glmark2.hash | 2 +-
 package/glmark2/glmark2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glmark2/glmark2.hash b/package/glmark2/glmark2.hash
index 33a99de12a..8405819770 100644
--- a/package/glmark2/glmark2.hash
+++ b/package/glmark2/glmark2.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  9ad57e4eec0049c47a367b57f5f8d3e31e4c488b1d5d6673a75f1b2282e40888  glmark2-c493520253fbfe3676c8b34b6f91a7c9a838fc8e.tar.gz
+sha256  12aef3ce80406bc723542979b9818886a28d0a4c93f62379eaadfd830974790d  glmark2-06e78b67702b5413335ecdf1ae816da9c20f6ed9.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  16fbc228292bd774b263b212ae422c524cbf3b2078bcf21b22f8bdd4373be617  COPYING.SGI
diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
index 9e47b426fe..5c2dd06362 100644
--- a/package/glmark2/glmark2.mk
+++ b/package/glmark2/glmark2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLMARK2_VERSION = c493520253fbfe3676c8b34b6f91a7c9a838fc8e
+GLMARK2_VERSION = 06e78b67702b5413335ecdf1ae816da9c20f6ed9
 GLMARK2_SITE = $(call github,glmark2,glmark2,$(GLMARK2_VERSION))
 GLMARK2_LICENSE = GPL-3.0+, SGIv1
 GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
