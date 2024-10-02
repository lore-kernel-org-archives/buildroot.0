Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99382CF8540
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 731F440261;
	Wed,  2 Oct 2024 21:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kb7I5KRxTfwN; Wed,  2 Oct 2024 21:20:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CD70413E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CD70413E2;
	Wed,  2 Oct 2024 21:20:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A3FF1BF5EA
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18F9540261
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:20:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ukJJL5vrnK-8 for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:20:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0D1140190
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0D1140190
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 21:20:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA0C284BC8; Wed,  2 Oct 2024 21:20:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Oct 2024 23:17:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 440b6a29164b9037f25947aa965a486fc7c0ac91
X-Git-Newrev: 4e5fd24c8b7438672c475d0559200ff72c4b1cc7
X-Patchwork-Hint: ignore
Message-Id: <20241002212024.CA0C284BC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libilbc: switch to github
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e5fd24c8b7438672c475d0559200ff72c4b1cc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The previous repo is not available anymore.

Fixes:
https://autobuild.buildroot.org/results/8c8b073ce163131763fca978b400e596fcf39e62

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libilbc/Config.in    | 2 +-
 package/libilbc/libilbc.hash | 2 +-
 package/libilbc/libilbc.mk   | 3 +--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libilbc/Config.in b/package/libilbc/Config.in
index 89d5db2fd6..db3486c1cb 100644
--- a/package/libilbc/Config.in
+++ b/package/libilbc/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LIBILBC
 	  iLBC (internet Low Bitrate Codec) is a FREE speech codec
 	  suitable for robust voice communication over IP.
 
-	  http://www.webrtc.org/license-rights/ilbc-freeware
+	  https://github.com/freeswitch/libilbc
diff --git a/package/libilbc/libilbc.hash b/package/libilbc/libilbc.hash
index bd0bf89d42..be88d6f9c3 100644
--- a/package/libilbc/libilbc.hash
+++ b/package/libilbc/libilbc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ba11bc22e353887cd7c605a25a5b9bac464f11f8cb103f652e095ae7e0f04f77  libilbc-829b08c7902ceb87a261279fabb36b6d523c6e07-git4.tar.gz
+sha256  fe4827a548e96f0549dd8f30eb6a48c6c55fd4535de6c8e9c6e4f38bea6190bf  libilbc-829b08c7902ceb87a261279fabb36b6d523c6e07.tar.gz
 sha256  b7f4cbb4a12cd11a3d1aeda9bd17c99f59b054de4b3ee53045531cd2fa74dd2a  gips_iLBClicense.pdf
diff --git a/package/libilbc/libilbc.mk b/package/libilbc/libilbc.mk
index 06d94eb36d..d8139ba205 100644
--- a/package/libilbc/libilbc.mk
+++ b/package/libilbc/libilbc.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 LIBILBC_VERSION = 829b08c7902ceb87a261279fabb36b6d523c6e07
-LIBILBC_SITE = https://freeswitch.org/stash/scm/sd/libilbc.git
-LIBILBC_SITE_METHOD = git
+LIBILBC_SITE = $(call github,freeswitch,libilbc,$(LIBILBC_VERSION))
 LIBILBC_LICENSE = Global IP Sound iLBC Public License v2.0
 LIBILBC_LICENSE_FILES = gips_iLBClicense.pdf
 LIBILBC_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
