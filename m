Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C28CF3963
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 20:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AB5D41BDC;
	Thu, 19 Sep 2024 20:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JYPkKVhBX95S; Thu, 19 Sep 2024 20:00:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E90F432A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E90F432A2;
	Thu, 19 Sep 2024 20:00:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA1811BF215
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A62B36F4EB
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:59:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a57NMmZQBBHj for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 19:59:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9F556F4C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9F556F4C6
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 19:59:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B75AA83D7F; Thu, 19 Sep 2024 19:59:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 13:54:47 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: b0a601d8c601b6ba67f8da725fc29ba3ab16f71f
X-Git-Newrev: 243df597f3fd2b53d73a453211141aaf3127c2a9
X-Patchwork-Hint: ignore
Message-Id: <20240919195948.B75AA83D7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/xenomai: fixup
 download URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=243df597f3fd2b53d73a453211141aaf3127c2a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

As reported in [1], https://xenomai.org/downloads/xenomai/stable has
been moved to https://ftp.denx.de/pub/xenomai/xenomai/stable.

Fixes:
- http://autobuild.buildroot.org/results/83061154a9c21ecf981fdf5b4c02be6a793a8e56

[1] https://lore.kernel.org/xenomai/95d4f7a6-1237-4ae0-9fb6-3979fa058bcc@siemens.com

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 30bc9d9b1b86a0682f72f96a715381d0e221ef51)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
