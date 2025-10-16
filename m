Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADB6CCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2E1240CC0;
	Wed, 22 Oct 2025 16:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EZd-E9eZJyMX; Wed, 22 Oct 2025 16:41:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D51A40CCD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D51A40CCD;
	Wed, 22 Oct 2025 16:41:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CA4743F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE81340BB8
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:41:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AGcBsKKCXKD6 for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:41:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1F3C40754
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1F3C40754
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:41:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC8938615A; Wed, 22 Oct 2025 16:41:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 16 Oct 2025 09:57:38 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: be6504cecb25f28a4697495009c55a8a4fbd26cc
X-Git-Newrev: d16be5cbc2c5c19cf880e5081badc8f8ccfef2c7
X-Patchwork-Hint: ignore
Message-Id: <20251022164129.EC8938615A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/4th: switch to
 https
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d16be5cbc2c5c19cf880e5081badc8f8ccfef2c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 033fc7ca8f6417204f65f24644954dfa3ab71efc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/4th/4th.mk    | 2 +-
 package/4th/Config.in | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/4th/4th.mk b/package/4th/4th.mk
index 276423b255..08b3dbdebc 100644
--- a/package/4th/4th.mk
+++ b/package/4th/4th.mk
@@ -6,7 +6,7 @@
 
 4TH_VERSION = 3.64.1
 4TH_SOURCE = 4th-$(4TH_VERSION)-unix.tar.gz
-4TH_SITE = http://downloads.sourceforge.net/project/forth-4th/4th-$(4TH_VERSION)
+4TH_SITE = https://downloads.sourceforge.net/project/forth-4th/4th-$(4TH_VERSION)
 4TH_LICENSE = GPL-3.0+, LGPL-3.0+
 # The COPYING file only contains the text of the LGPL-3.0, but the
 # source code really contains parts under GPL-3.0+.
diff --git a/package/4th/Config.in b/package/4th/Config.in
index 4554664ab4..0463a4a087 100644
--- a/package/4th/Config.in
+++ b/package/4th/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_4TH
 	  C-embeddable bytecode, standalone executables, but also
 	  works fine as a scripting language
 
-	  http://thebeez.home.xs4all.nl/4tH/
+	  https://thebeez.home.xs4all.nl/4tH/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
