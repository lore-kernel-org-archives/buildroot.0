Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1162CF3962
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 19:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC8EE4150A;
	Thu, 19 Sep 2024 19:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJbwejQQDAa6; Thu, 19 Sep 2024 19:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D4E4414F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D4E4414F7;
	Thu, 19 Sep 2024 19:58:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 75D7B1BF982
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71F5C42B20
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 76ZjNixaCm5N for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 19:58:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 719BF42B15
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 719BF42B15
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 19:58:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4242083CEE; Thu, 19 Sep 2024 19:58:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 13:54:33 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 8a7af697645a23343f94d3fe496010d2d9a02753
X-Git-Newrev: c412bac1098444228b49dc129a0205213ec2524d
X-Patchwork-Hint: ignore
Message-Id: <20240919195837.4242083CEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/xenomai: fixup
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

commit: https://git.buildroot.net/buildroot/commit/?id=c412bac1098444228b49dc129a0205213ec2524d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
