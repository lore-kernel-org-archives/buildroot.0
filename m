Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC236C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:00:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9625F61029
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9625F61029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 624BD403D9;
	Sun, 12 Sep 2021 20:00:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2mpYCN3_PdVJ; Sun, 12 Sep 2021 19:59:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D067403DC;
	Sun, 12 Sep 2021 19:59:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 333141BF95A
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16C9860030
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iDwWx74w8k0M for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 19:58:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B38B6072A
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 19:58:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6EE4E8A425; Sun, 12 Sep 2021 19:57:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 21:56:44 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 08db7c4153c13bdd602b3241c21e9bf720cc4c67
X-Git-Newrev: 480ca190882d592416c6fdbb66f0b06fde2a728f
X-Patchwork-Hint: ignore
Message-Id: <20210912195706.6EE4E8A425@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/swupdate: let
 buildroot handle stripping
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

commit: https://git.buildroot.net/buildroot/commit/?id=480ca190882d592416c6fdbb66f0b06fde2a728f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

In buildroot, stripping for the target is configured and implemented
with the global `BR2_STRIP_strip` option that drive the stripping in
the target-finalize step.

So, we explicitly disable stripping at build time for swupdate.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 1833c710ce73a1ca67143abd3fbcee6fd5d6fcdb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/swupdate/swupdate.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index d96a0c2e07..b5fd97568f 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -13,7 +13,7 @@ SWUPDATE_LICENSE_FILES = Licenses/Exceptions Licenses/gpl-2.0.txt \
 # swupdate uses $CROSS-cc instead of $CROSS-gcc, which is not
 # available in all external toolchains, and use CC for linking. Ensure
 # TARGET_CC is used for both.
-SWUPDATE_MAKE_ENV = CC="$(TARGET_CC)" LD="$(TARGET_CC)"
+SWUPDATE_MAKE_ENV = CC="$(TARGET_CC)" LD="$(TARGET_CC)" SKIP_STRIP=y
 
 # swupdate bundles its own version of mongoose (version 6.16)
 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
