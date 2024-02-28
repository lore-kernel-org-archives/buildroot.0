Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FEAFC47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 13:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2121E41714;
	Wed, 28 Feb 2024 13:41:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R-fGANwjIOtK; Wed, 28 Feb 2024 13:41:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7803341609
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7803341609;
	Wed, 28 Feb 2024 13:41:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC1091BF97A
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 13:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 990254152A
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 13:41:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ahsdi9JcmLaV for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 13:41:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D425340815
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D425340815
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 13:41:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC40487BA4; Wed, 28 Feb 2024 13:41:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 14:37:19 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 8667430da27b9c07ab0bb78a96dc0c3957041e64
X-Git-Newrev: 9a46e9e1718f3e8ba764a6233f39bf2338609c93
X-Patchwork-Hint: ignore
Message-Id: <20240228134102.CC40487BA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/cog: bump to
 version 0.18.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a46e9e1718f3e8ba764a6233f39bf2338609c93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

This is a small bugfix release, with a fix for a crash in the DRM/KMS
module that affects i.MX6 boards and probably others. Release notes:

  https://wpewebkit.org/release/cog-0.18.2.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit afe633d6beef29b05514e2272414b6db6a727cb8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cog/cog.hash | 8 ++++----
 package/cog/cog.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index 177113bb42..387666969a 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.18.1.tar.xz.sums
-md5  204ae9353ed828e4ac39b1dd4c5c35dd  cog-0.18.1.tar.xz
-sha1  f0f0ebcd279170f427be0ad57fd356faff1a2732  cog-0.18.1.tar.xz
-sha256  72e3a84052b459e2d53d0e8b947f20e27bf5d8049766c4c1594eb9c6b6cf7ab3  cog-0.18.1.tar.xz
+# From https://wpewebkit.org/releases/cog-0.18.2.tar.xz.sums
+md5  7fbfc2e19304132be0d73f5e5512151c  cog-0.18.2.tar.xz
+sha1  045294f7fa878db86e4b8a617ee4ac056a71cb75  cog-0.18.2.tar.xz
+sha256  3c4237cff6323b8c3eaf52c6f3f6415b898a22c0127c6c396c1eaa6eef46c279  cog-0.18.2.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index bd34f124c5..e96909f779 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.18.1
+COG_VERSION = 0.18.2
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
