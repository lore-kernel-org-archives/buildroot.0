Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0BAC25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 09:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE1FD40519;
	Mon,  3 Jun 2024 09:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MlJW6a9XH2BW; Mon,  3 Jun 2024 09:20:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B799F403C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B799F403C0;
	Mon,  3 Jun 2024 09:20:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BCF7E1BF3EB
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A4C281F6E
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sFOPlJ_grqjQ for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 09:19:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 871A181F70
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 871A181F70
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 09:19:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E52A8798B; Mon,  3 Jun 2024 09:19:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Jun 2024 11:11:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f7de59273144a9c6c173ff14e2cc7eb6649a078
X-Git-Newrev: 5438d7d8034387c79111c70fecbdee356f704854
X-Patchwork-Hint: ignore
Message-Id: <20240603091957.7E52A8798B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nfacct: use https for _SITE
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

commit: https://git.buildroot.net/buildroot/commit/?id=5438d7d8034387c79111c70fecbdee356f704854
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http redirects to https, so use that instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nfacct/Config.in | 2 +-
 package/nfacct/nfacct.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nfacct/Config.in b/package/nfacct/Config.in
index e30d2d997b..02e7a6dbaa 100644
--- a/package/nfacct/Config.in
+++ b/package/nfacct/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_NFACCT
 	  nfacct is the command line tool to create/retrieve/delete
 	  netfilter accounting objects.
 
-	  http://www.netfilter.org/projects/nfacct/
+	  https://www.netfilter.org/projects/nfacct/
diff --git a/package/nfacct/nfacct.mk b/package/nfacct/nfacct.mk
index d4c7c4ce70..0092cb9c26 100644
--- a/package/nfacct/nfacct.mk
+++ b/package/nfacct/nfacct.mk
@@ -6,7 +6,7 @@
 
 NFACCT_VERSION = 1.0.2
 NFACCT_SOURCE = nfacct-$(NFACCT_VERSION).tar.bz2
-NFACCT_SITE = http://www.netfilter.org/projects/nfacct/files
+NFACCT_SITE = https://www.netfilter.org/projects/nfacct/files
 NFACCT_DEPENDENCIES = host-pkgconf \
 	libnetfilter_acct
 NFACCT_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
