Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B8AC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 19:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42C7384B8B;
	Sat,  8 Jun 2024 19:16:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qY_yhtPc5Sjv; Sat,  8 Jun 2024 19:16:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1A7E84B90
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1A7E84B90;
	Sat,  8 Jun 2024 19:16:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C4B21BF407
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 009E64042D
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HnFOnc2nw5li for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EC94403C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EC94403C0
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1AE028710D; Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 20:07:38 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 3779f0c5225fa6c1ff1ae0eabb8480334d8f8a51
X-Git-Newrev: b7a7f87bc4537547a591217032b9ab5ee5fc1d4f
X-Patchwork-Hint: ignore
Message-Id: <20240608191501.1AE028710D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libnetfilter_log:
 use https for _SITE
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7a7f87bc4537547a591217032b9ab5ee5fc1d4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

http redirects to https, so use that instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9f615dc406e20b0d07394ab1a863826c0928f016)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnetfilter_log/Config.in           | 2 +-
 package/libnetfilter_log/libnetfilter_log.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnetfilter_log/Config.in b/package/libnetfilter_log/Config.in
index b244e8a8e9..66e1b170bc 100644
--- a/package/libnetfilter_log/Config.in
+++ b/package/libnetfilter_log/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_LIBNETFILTER_LOG
 	  libnetfilter_log is a userspace library providing interface
 	  to packets that have been logged by the kernel packet filter.
 
-	  http://www.netfilter.org/projects/libnetfilter_log/
+	  https://www.netfilter.org/projects/libnetfilter_log/
diff --git a/package/libnetfilter_log/libnetfilter_log.mk b/package/libnetfilter_log/libnetfilter_log.mk
index 01f94aac41..9b01f819bb 100644
--- a/package/libnetfilter_log/libnetfilter_log.mk
+++ b/package/libnetfilter_log/libnetfilter_log.mk
@@ -6,7 +6,7 @@
 
 LIBNETFILTER_LOG_VERSION = 1.0.2
 LIBNETFILTER_LOG_SOURCE = libnetfilter_log-$(LIBNETFILTER_LOG_VERSION).tar.bz2
-LIBNETFILTER_LOG_SITE = http://www.netfilter.org/projects/libnetfilter_log/files
+LIBNETFILTER_LOG_SITE = https://www.netfilter.org/projects/libnetfilter_log/files
 LIBNETFILTER_LOG_INSTALL_STAGING = YES
 LIBNETFILTER_LOG_DEPENDENCIES = host-pkgconf libmnl libnfnetlink
 LIBNETFILTER_LOG_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
