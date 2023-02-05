Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B88C636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 17:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 471F360692;
	Sun,  5 Feb 2023 17:10:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 471F360692
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AJoqOS7QyjR2; Sun,  5 Feb 2023 17:10:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E18D6077D;
	Sun,  5 Feb 2023 17:10:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E18D6077D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A6EA91BF3EE
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 17:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E43981A4E
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 17:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E43981A4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wgk2a1LhXa8b for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 17:10:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEC5E81A47
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 17:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEC5E81A47
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D017838E1; Sun,  5 Feb 2023 17:10:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 18:07:09 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 03c15062c33a92145ef28d71819ce52adb8851fe
X-Git-Newrev: b25f3d1723a35e1dffcfcb0168367697ba20e2b1
X-Patchwork-Hint: ignore
Message-Id: <20230205171024.9D017838E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/libgit2: security
 bump to 1.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=b25f3d1723a35e1dffcfcb0168367697ba20e2b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Fixes CVE-2023-22742: when compiled with BR2_PACKAGE_LIBSSH2,
libgit2 fails to verify SSH keys by default.

https://github.com/libgit2/libgit2/blob/v1.5.1/docs/changelog.md

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cc47da516cf5b76752d63361a8a7579d93e6fbbb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index fb760fd4cc..e834525df5 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8de872a0f201b33d9522b817c92e14edb4efad18dae95cf156cf240b2efff93e  libgit2-1.5.0.tar.gz
+sha256  7074f1e2697992b82402501182db254fe62d64877b12f6e4c64656516f4cde88  libgit2-1.5.1.tar.gz
 sha256  0fc09da43d666b5b0cf5695defc3100d5cf387936b260ebab37e396d7e0dbc83  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 9409011eb4..c962c8030f 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.5.0
+LIBGIT2_VERSION = 1.5.1
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
