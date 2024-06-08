Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6B1C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 19:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FEC984C8E;
	Sat,  8 Jun 2024 19:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7UlzoRiJJLaz; Sat,  8 Jun 2024 19:17:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 204B984C96
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 204B984C96;
	Sat,  8 Jun 2024 19:17:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9949D1BF407
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A83FF416C1
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sum5CXbv4MzA for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 880D7413CC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 880D7413CC
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FAE287C6F; Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 20:08:36 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 61564410c95d58ed7b5f735f4d24dac15c85f056
X-Git-Newrev: 38a28aff85ff0fbbd42c212fe90132adff577843
X-Patchwork-Hint: ignore
Message-Id: <20240608191501.7FAE287C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/nfacct: use https
 for _SITE
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

commit: https://git.buildroot.net/buildroot/commit/?id=38a28aff85ff0fbbd42c212fe90132adff577843
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

http redirects to https, so use that instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5438d7d8034387c79111c70fecbdee356f704854)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
