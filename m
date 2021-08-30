Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3D4C4320E
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 11:25:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 830196112F
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 11:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 830196112F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=green-communications.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3331E400DF;
	Mon, 30 Aug 2021 11:25:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4D9R__XVCQW3; Mon, 30 Aug 2021 11:25:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F2A64017E;
	Mon, 30 Aug 2021 11:24:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B50041BF39C
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 11:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A41374017E
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 11:24:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9htpoXlu6NJ4 for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 11:24:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA0D9400DF
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 11:24:52 +0000 (UTC)
Received: from houde.tangerine ([185.65.135.179]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1M8xwu-1mOXYs3Jn4-00688Q; Mon, 30 Aug 2021 13:24:49 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Mon, 30 Aug 2021 13:24:30 +0200
Message-Id: <20210830112431.144659-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:mgeQZUAA3jhABUqjKGLgYPOfHC8th/c+U2xKvbtGb3D08A2GL4G
 TBCpPuu5GCPpgvLtdr8EU5QWrbMhEYpaysX/W/gCz56ggpKY5Oug/LgXMTZDDMeLoAy8TXQ
 KhQZumxfcNkbX3boBt3gzLdDaQ9tDqfLDoXIJvV2KvWsr8T/3537gTq9dZZ8tdBWxWpl07O
 BRF8SviF+XpDSQ+sh46mw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hI2bAmnAFHY=:yzScOhdSdN73nkggcugsGz
 IEeCoLhQ8KN6hjEl/FM66c/XyyH5kZQptIrFJhC+BM0/sPdDVgsZo7mwe7dREFEtawKx8kBdm
 oaX8ema+QWKFHixS0NTxuc3fL4k/7A6y7gsFH6E0emqyJO1cKOBgnVXQZF4jaHQ90Ml3dbZtl
 4IbGWIobuZbx2mWb0pyNlRxoEIVquIVEwAKDrTXg0WeWBRW4CTBGh3eLYTh1IkWbWAA7naG9V
 OVKsCrNQaViT8ZuZUYwfYMBGIK8zdaxhoX8oMrEGmrfUW683Cxq8AnENZ9baoz+nYYJcKsMIy
 6FdnZVHtWCPoHg/1mo0icyePu8KGj1M/xogT5coJevCJ5B8Mlqoigitj4HRQUeGkKj+Nzy+ia
 gR/BVzWoRwYc7SA8mi+9DXd/UQ1ujzwNJD55miiRI4oNA3BkFErPKeRea9z6nwdwZEDJEqZho
 2QYs6hjTqCfccEWmH3TjxXmXXGio6e56WB4YMzf9q/m6CK+qteQ5NjxrDLR8GEaDxv4iIvKs0
 zZbF2NoE262LJYlN4kGqUYtWOyQzQ05MCwb+JyqK4iSJh8Es/mAqjKcGfK+Y84Q5GGQq9fCum
 yO7heZL4fJqxG6rqN/q2NuKBB/tobpZsX+2tIWQtxd/8IiwvvHCmppQHudb8rEE9EXt+danoL
 TN8VpnczxGNCoRI55g+6iWQN2STZTJXRnt/ztyZX/8ASaK8jPR4HO9DwQgxy9L3SBtsD3v+Bc
 kk0dYzBveQKda3K2tFXEstD3EzTGGiCLhOwjZPhoWgjNiFtpeKeNSDJAKYlZBwxgWO1iSwpdp
 mcHz11j
Subject: [Buildroot] [PATCH] package/vuejs: bump version to 3.2.6
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
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
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
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
