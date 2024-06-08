Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED6DC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 19:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2B4A84B4A;
	Sat,  8 Jun 2024 19:16:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SiSb1rmgxcws; Sat,  8 Jun 2024 19:16:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D3B38440C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D3B38440C;
	Sat,  8 Jun 2024 19:16:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 553FF1BF407
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1D0040364
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0gDhI3yJPei for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7C99403D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7C99403D6
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 19:15:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2E0A8710D; Sat,  8 Jun 2024 19:15:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 20:07:21 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 4021703e86062b3f6a105ce0f49188210c8aaa80
X-Git-Newrev: 8e95fe54dce40b41052afe611caae5fbaba5af37
X-Patchwork-Hint: ignore
Message-Id: <20240608191500.E2E0A8710D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 package/libnetfilter_acct: use https for _SITE
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

commit: https://git.buildroot.net/buildroot/commit/?id=8e95fe54dce40b41052afe611caae5fbaba5af37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

http redirects to https, so use that instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b530de097f905e616e735baa3494a597e176e5b5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
