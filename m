Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCCEC433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58AE981757;
	Mon, 20 Dec 2021 22:42:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QUcZ5Xwc9L25; Mon, 20 Dec 2021 22:42:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB91D815CD;
	Mon, 20 Dec 2021 22:42:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 589BB1BF97F
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43C1D8174C
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:42:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7j1U1aPQBqyf for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:42:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0F7B81501
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:42:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 03F798289B; Mon, 20 Dec 2021 22:36:41 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 20 Dec 2021 23:06:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da5c80f6750899578882688e68c128d8a21032c8
X-Git-Newrev: 6000c027f99c5ba9baa1caca1f41e93b668f03c1
X-Patchwork-Hint: ignore
Message-Id: <20211220223641.03F798289B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/frr: add sqlite optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=6000c027f99c5ba9baa1caca1f41e93b668f03c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/frr/frr.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 3bd587a1cd..cc83016f9f 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -54,6 +54,13 @@ else
 FRR_CONF_OPTS += --disable-capabilities
 endif
 
+ifeq ($(BR2_PACKAGE_SQLITE),y)
+FRR_DEPENDENCIES += sqlite
+FRR_CONF_OPTS += --enable-config-rollbacks
+else
+FRR_CONF_OPTS += --disable-config-rollbacks
+endif
+
 ifeq ($(BR2_PACKAGE_ZEROMQ),y)
 FRR_DEPENDENCIES += zeromq
 FRR_CONF_OPTS += --enable-zeromq
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
