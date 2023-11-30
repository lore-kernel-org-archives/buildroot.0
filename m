Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9EF5C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 22:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A3338460D;
	Thu, 30 Nov 2023 22:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A3338460D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Phm3L37l-yIG; Thu, 30 Nov 2023 22:17:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E8DB84673;
	Thu, 30 Nov 2023 22:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E8DB84673
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B36D1BF355
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 22:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13B286FA3B
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 22:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13B286FA3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FzjNZN29O-9P for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 22:17:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBCA46FA30
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 22:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBCA46FA30
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3BA187610; Thu, 30 Nov 2023 22:17:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 23:16:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d590c2c9398bce36efe042233054a2c6b75fcad0
X-Git-Newrev: 9152ef591b8b140cf820d313a7aab97a317aa856
X-Patchwork-Hint: ignore
Message-Id: <20231130221739.C3BA187610@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cog: bump to version 0.18.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=9152ef591b8b140cf820d313a7aab97a317aa856
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a small bugfix release which solves a build issue, a memory
leak, and fixes touch input on rotated screens with the DRM/KMS module.
Release notes:

  https://wpewebkit.org/release/cog-0.18.1.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cog/cog.hash | 8 ++++----
 package/cog/cog.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index 9fb386dfa0..177113bb42 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.18.0.tar.xz.sums
-md5  9521458c72322e1b2e39e8b1cca93d24  cog-0.18.0.tar.xz
-sha1  73ec1684c31de7247ecbd5e852c16cf88416bedd  cog-0.18.0.tar.xz
-sha256  410bf70f9aa3812db72d75c25cefee421efa0391ab03dc3c37299dfaa388f4fd  cog-0.18.0.tar.xz
+# From https://wpewebkit.org/releases/cog-0.18.1.tar.xz.sums
+md5  204ae9353ed828e4ac39b1dd4c5c35dd  cog-0.18.1.tar.xz
+sha1  f0f0ebcd279170f427be0ad57fd356faff1a2732  cog-0.18.1.tar.xz
+sha256  72e3a84052b459e2d53d0e8b947f20e27bf5d8049766c4c1594eb9c6b6cf7ab3  cog-0.18.1.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index f41c114fa5..bd34f124c5 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.18.0
+COG_VERSION = 0.18.1
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
