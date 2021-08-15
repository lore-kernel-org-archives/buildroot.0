Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93BBC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:25:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A20E760E93
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A20E760E93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 762B540786;
	Thu, 26 Aug 2021 22:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wbtZD7CMz7lJ; Thu, 26 Aug 2021 22:25:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B60C340790;
	Thu, 26 Aug 2021 22:25:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 85D5E1BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 908664079D
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cebokJqirEHZ for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88FB2407A7
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DCA7A8DC50; Thu, 26 Aug 2021 22:01:29 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 15 Aug 2021 16:52:26 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d77aba25a55560d4c15bf319d6dc24619232a8ee
X-Git-Newrev: 770ff2bc25404fb219221b843de2a0b35d2522eb
X-Patchwork-Hint: ignore
Message-Id: <20210826220129.DCA7A8DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/terminology: set eet
 path
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

commit: https://git.buildroot.net/buildroot/commit/?id=770ff2bc25404fb219221b843de2a0b35d2522eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Set eet path to avoid the following build failure raised since bump to
version 1.9.0 in commit	6ac557a54bb4613e79728ad96724e7681c9c3c18 and
https://git.enlightenment.org/apps/terminology.git/commit/?id=f15dd2881a5e87e7f3b03594983826f7480c12e7:

/home/buildroot/autobuild/instance-2/output-1/build/terminology-1.9.0/data/colorschemes/add_color_scheme.sh: 30: /home/buildroot/autobuild/instance-2/output-1/build/terminology-1.9.0/data/colorschemes/add_color_scheme.sh: /usr/bin/eet: not found

Fixes:
 - http://autobuild.buildroot.org/results/767acf73e4eade48cd3fdb43e9dd599ba7ef9661

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/terminology/terminology.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/terminology/terminology.mk b/package/terminology/terminology.mk
index c17a6b0771..29b59fb39e 100644
--- a/package/terminology/terminology.mk
+++ b/package/terminology/terminology.mk
@@ -12,7 +12,9 @@ TERMINOLOGY_LICENSE_FILES = COPYING
 TERMINOLOGY_CPE_ID_VENDOR = enlightenment
 
 TERMINOLOGY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) efl host-pkgconf
-TERMINOLOGY_CONF_OPTS = -Dedje-cc=$(HOST_DIR)/bin/edje_cc
+TERMINOLOGY_CONF_OPTS = \
+	-Dedje-cc=$(HOST_DIR)/bin/edje_cc \
+	-Deet=$(HOST_DIR)/bin/eet
 
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 TERMINOLOGY_CONF_OPTS += -Dnls=true
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
