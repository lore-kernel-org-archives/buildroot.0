Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28034C3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 08:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE62280CF1;
	Mon, 16 Sep 2024 08:34:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 95l5mSe6iKIe; Mon, 16 Sep 2024 08:34:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC002812B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC002812B4;
	Mon, 16 Sep 2024 08:34:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A4C31BF311
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 08:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1580340689
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 08:34:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vRfKmIP-HhGS for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 08:34:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 033DA40686
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 033DA40686
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 08:34:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEAC583762; Mon, 16 Sep 2024 08:34:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 10:22:02 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 29405a94994496b309caf87ffba92ce4a9d4afae
X-Git-Newrev: 0c99fd35bfb5e3d912e40155412e98348ef847d4
X-Patchwork-Hint: ignore
Message-Id: <20240916083409.EEAC583762@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/unbound: add
 missing unbound user
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c99fd35bfb5e3d912e40155412e98348ef847d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Without the unbound user the daemon does not start on bootup.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 67e6d0a3f1a0893183885b947f4472ef4c04bfc4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/unbound/unbound.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index ff0262bef1..6ce6f9a1ba 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -54,4 +54,8 @@ define UNBOUND_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S70unbound
 endef
 
+define UNBOUND_USERS
+	unbound -1 unbound -1 * /etc/unbound - - unbound daemon
+endef
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
