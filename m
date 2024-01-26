Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07368C47422
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 16:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B02F34212F;
	Fri, 26 Jan 2024 16:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B02F34212F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22ZiDxbC0tBf; Fri, 26 Jan 2024 16:12:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD96D42134;
	Fri, 26 Jan 2024 16:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD96D42134
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27E661BF284
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 16:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00DA583FEB
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 16:12:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00DA583FEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mm3-hZts61Ye for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 16:12:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D26083FE7
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 16:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D26083FE7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16B6D86582; Fri, 26 Jan 2024 16:12:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 17:06:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d433f06371f58c6a8705697b7cdf317518c984c5
X-Git-Newrev: afe633d6beef29b05514e2272414b6db6a727cb8
X-Patchwork-Hint: ignore
Message-Id: <20240126161218.16B6D86582@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cog: bump to version 0.18.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=afe633d6beef29b05514e2272414b6db6a727cb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a small bugfix release, with a fix for a crash in the DRM/KMS
module that affects i.MX6 boards and probably others. Release notes:

  https://wpewebkit.org/release/cog-0.18.2.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
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
