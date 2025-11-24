Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EF3CFD360
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 22:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE83D830E3;
	Mon, 24 Nov 2025 22:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4CD-bjavr8g0; Mon, 24 Nov 2025 22:33:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60F008308D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60F008308D;
	Mon, 24 Nov 2025 22:33:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 59FDF35C
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 22:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BEC3607A3
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 22:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E1FXM-qGI-kv for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 22:33:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A7DD6078E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A7DD6078E
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 22:33:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96EAC85E4F; Mon, 24 Nov 2025 22:33:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Nov 2025 22:06:26 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e46695bbe4ab583f39f9448f3ef3e044efa28808
X-Git-Newrev: 3837c92d7160d2af4e7c44810b69ce76fb5eb8c6
X-Patchwork-Hint: ignore
Message-Id: <20251124223300.96EAC85E4F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ninja: bump version to
 1.13.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3837c92d7160d2af4e7c44810b69ce76fb5eb8c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes: https://github.com/ninja-build/ninja/releases

Version 1.13.0 added GNU Make jobserver support[1] so we switch back to
the official repo by partly reverting buildroot commit
227d7e0cbaaf093f509f5728f06fad5f53caed7b.

Comparing build times of mesa3d/iris between 1.13.2 and Kitware's latest
tag v1.13.0.gd74ef.kitware.jobserver-pipe-1 showed no difference on a
16c/32t machine with BR2_JLEVEL=0. The Kitware version adds pipe support
whose future is uncertain[2].

[1] https://github.com/ninja-build/ninja/releases/tag/v1.13.0
    https://github.com/ninja-build/ninja/pull/2506
[2] https://github.com/ninja-build/ninja/pull/2506#issuecomment-2659944455

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ninja/ninja.hash | 2 +-
 package/ninja/ninja.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/ninja/ninja.hash b/package/ninja/ninja.hash
index 57c10bb287..5e099de591 100644
--- a/package/ninja/ninja.hash
+++ b/package/ninja/ninja.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  7ba84551f5b315b4270dc7c51adef5dff83a2154a3665a6c9744245c122dd0db  ninja-1.11.1.g95dee.kitware.jobserver-1.tar.gz
+sha256  974d6b2f4eeefa25625d34da3cb36bdcebe7fbce40f4c16ac0835fd1c0cbae17  ninja-1.13.2.tar.gz
 sha256  eb7e9ab9690124c5c9f42bdc81383d886a3dede26345b6ed15bbad7caf81f7ea  COPYING
diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
index 805fef4541..c59984b6bd 100644
--- a/package/ninja/ninja.mk
+++ b/package/ninja/ninja.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-NINJA_VERSION_MAJOR = 1.11.1
-NINJA_VERSION = $(NINJA_VERSION_MAJOR).g95dee.kitware.jobserver-1
-NINJA_SITE = $(call github,Kitware,ninja,v$(NINJA_VERSION))
+NINJA_VERSION = 1.13.2
+NINJA_SITE = $(call github,ninja-build,ninja,v$(NINJA_VERSION))
 NINJA_LICENSE = Apache-2.0
 NINJA_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
