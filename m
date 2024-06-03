Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66E5C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 09:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90D9F40960;
	Mon,  3 Jun 2024 09:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i3oToIjNyyQF; Mon,  3 Jun 2024 09:20:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B31FE40BF1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B31FE40BF1;
	Mon,  3 Jun 2024 09:20:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 184E61BF3EB
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D1A64068C
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g2OweYlht_hT for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 09:19:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A8124065E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A8124065E
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 09:19:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27E7187988; Mon,  3 Jun 2024 09:19:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Jun 2024 11:03:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5cbcbf5078b51ac15fe58a506a51639685dcd370
X-Git-Newrev: b530de097f905e616e735baa3494a597e176e5b5
X-Patchwork-Hint: ignore
Message-Id: <20240603091957.27E7187988@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnetfilter_acct: use https for
 _SITE
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

commit: https://git.buildroot.net/buildroot/commit/?id=b530de097f905e616e735baa3494a597e176e5b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http redirects to https, so use that instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libnetfilter_acct/Config.in            | 2 +-
 package/libnetfilter_acct/libnetfilter_acct.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnetfilter_acct/Config.in b/package/libnetfilter_acct/Config.in
index ecfef6dc64..614af27fe1 100644
--- a/package/libnetfilter_acct/Config.in
+++ b/package/libnetfilter_acct/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_LIBNETFILTER_ACCT
 	  libnetfilter_acct is the userspace library providing interface
 	  to extended accounting infrastructure.
 
-	  http://www.netfilter.org/projects/libnetfilter_acct/
+	  https://www.netfilter.org/projects/libnetfilter_acct/
diff --git a/package/libnetfilter_acct/libnetfilter_acct.mk b/package/libnetfilter_acct/libnetfilter_acct.mk
index e791f6f13f..6763ad27dd 100644
--- a/package/libnetfilter_acct/libnetfilter_acct.mk
+++ b/package/libnetfilter_acct/libnetfilter_acct.mk
@@ -6,7 +6,7 @@
 
 LIBNETFILTER_ACCT_VERSION = 1.0.3
 LIBNETFILTER_ACCT_SOURCE = libnetfilter_acct-$(LIBNETFILTER_ACCT_VERSION).tar.bz2
-LIBNETFILTER_ACCT_SITE = http://www.netfilter.org/projects/libnetfilter_acct/files
+LIBNETFILTER_ACCT_SITE = https://www.netfilter.org/projects/libnetfilter_acct/files
 LIBNETFILTER_ACCT_INSTALL_STAGING = YES
 LIBNETFILTER_ACCT_DEPENDENCIES = host-pkgconf libmnl
 LIBNETFILTER_ACCT_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
