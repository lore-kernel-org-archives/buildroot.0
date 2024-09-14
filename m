Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA20DC02181
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 08:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8307840CE;
	Sat, 14 Sep 2024 08:04:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3FF8d8M7lqGq; Sat, 14 Sep 2024 08:04:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C131A846EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C131A846EF;
	Sat, 14 Sep 2024 08:04:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 823AA1BF31D
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E719846EF
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yjihq8G2dXuZ for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 08:04:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A83D0840CE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A83D0840CE
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 08:04:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92B0686F52; Sat, 14 Sep 2024 08:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 10:00:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40bd80a74d64be448f5ab6f7688f1c9fbd386b93
X-Git-Newrev: 30bc9d9b1b86a0682f72f96a715381d0e221ef51
X-Patchwork-Hint: ignore
Message-Id: <20240914080440.92B0686F52@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xenomai: fixup download URL
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=30bc9d9b1b86a0682f72f96a715381d0e221ef51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported in [1], https://xenomai.org/downloads/xenomai/stable has
been moved to https://ftp.denx.de/pub/xenomai/xenomai/stable.

Fixes:
- http://autobuild.buildroot.org/results/83061154a9c21ecf981fdf5b4c02be6a793a8e56

[1] https://lore.kernel.org/xenomai/95d4f7a6-1237-4ae0-9fb6-3979fa058bcc@siemens.com

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xenomai/xenomai.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 9356919259..378e51ad3e 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -14,7 +14,7 @@ XENOMAI_SITE = $(call qstrip,$(BR2_PACKAGE_XENOMAI_REPOSITORY))
 XENOMAI_SITE_METHOD = git
 else
 XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
-XENOMAI_SITE = http://xenomai.org/downloads/xenomai/stable
+XENOMAI_SITE = https://ftp.denx.de/pub/xenomai/xenomai/stable
 endif
 # We're patching configure.ac
 XENOMAI_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
