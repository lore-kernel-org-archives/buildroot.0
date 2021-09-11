Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDAA2C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:22:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DDB3611BF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DDB3611BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13E65837A4;
	Sat, 11 Sep 2021 14:22:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RoSWD4u6OdOq; Sat, 11 Sep 2021 14:22:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F47D837C0;
	Sat, 11 Sep 2021 14:22:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B1ED1BF834
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 245DE61BDA
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:22:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T2YuBvNzybD6 for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 14:22:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 678AA61BD7
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:22:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4909489017; Sat, 11 Sep 2021 14:20:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 16:19:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 30ed82827c7862f4763d8f63723690f9e40aade6
X-Git-Newrev: 9955ab9a09f1b7d33f018855eca3935d25784cab
X-Patchwork-Hint: ignore
Message-Id: <20210911142032.4909489017@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vuejs: bump version to 3.2.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=9955ab9a09f1b7d33f018855eca3935d25784cab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also correct the comment about installing the minified js file, which
was changed with the update to 3.0.5 in commit 42bf38dca.

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/vuejs/vuejs.hash | 2 +-
 package/vuejs/vuejs.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vuejs/vuejs.hash b/package/vuejs/vuejs.hash
index c2804961d2..1801a0c6e9 100644
--- a/package/vuejs/vuejs.hash
+++ b/package/vuejs/vuejs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ddd5e07483d18d2abd645c01200f57d5ffd1c3bf262cdb9f9e1a66a7b855d84a  vue-3.1.5.tgz
+sha256  464ea5fdbcb51eee0b5f4762f169024b36a3bcd2c039ea8608b17fdd8a8595e9  vue-3.2.6.tgz
 sha256  1bb85cc9b13b81ef41c81c51866172fc345e0503c86726a6755b796590b70175  LICENSE
diff --git a/package/vuejs/vuejs.mk b/package/vuejs/vuejs.mk
index 18e12f69d4..e2fc2c2dfb 100644
--- a/package/vuejs/vuejs.mk
+++ b/package/vuejs/vuejs.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-VUEJS_VERSION = 3.1.5
+VUEJS_VERSION = 3.2.6
 VUEJS_SOURCE = vue-$(VUEJS_VERSION).tgz
 VUEJS_SITE = https://registry.npmjs.org/vue/-
 VUEJS_LICENSE = MIT
 VUEJS_LICENSE_FILES = LICENSE
 
-# Install .min.js as .js
+# Install .prod.js as .js
 define VUEJS_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 644 -D $(@D)/dist/vue.global.prod.js \
 		$(TARGET_DIR)/var/www/vue.js
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
