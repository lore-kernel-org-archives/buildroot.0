Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87F3C78820
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 891E042C2D;
	Fri, 20 Sep 2024 10:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id siJetpwfftOE; Fri, 20 Sep 2024 10:37:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 207B842DF6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 207B842DF6;
	Fri, 20 Sep 2024 10:37:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 65AC31BF599
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4273984C31
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:36:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IKdbYwxt5ZpY for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:36:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 150D984C78
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 150D984C78
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:36:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 119A084117; Fri, 20 Sep 2024 10:36:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 12:33:44 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: dcc8b10cc70957cfe2266c7cd2ee51dcdfeae13a
X-Git-Newrev: 747fcc5e7a02287caba7805d502b976b1c17de48
X-Patchwork-Hint: ignore
Message-Id: <20240920103607.119A084117@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/net-tools: fix
 appropriate typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=747fcc5e7a02287caba7805d502b976b1c17de48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0353d684828acfac36321c3f84c27b61c5ec61f7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/net-tools/net-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
index 0744bf18cb..03e1c73406 100644
--- a/package/net-tools/net-tools.mk
+++ b/package/net-tools/net-tools.mk
@@ -16,7 +16,7 @@ define NET_TOOLS_CONFIGURE_CMDS
 	(cd $(@D); yes "" | ./configure.sh config.in )
 endef
 
-# Enable I18N when appropiate
+# Enable I18N when appropriate
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 define NET_TOOLS_ENABLE_I18N
 	$(SED) 's:I18N 0:I18N 1:' $(@D)/config.h
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
