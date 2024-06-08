Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2934C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 06:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2EDD4265F;
	Sat,  8 Jun 2024 06:42:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RkEcqvnfjKl3; Sat,  8 Jun 2024 06:42:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DF104278A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DF104278A;
	Sat,  8 Jun 2024 06:42:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 152591BF47F
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 06:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 015874265D
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 06:42:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ieobVUpap4gP for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 06:42:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB3234264D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB3234264D
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 06:42:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D541E87CA5; Sat,  8 Jun 2024 06:42:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 08:41:42 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 1781340fa382466f64e048a3a3f5f468d46062a9
X-Git-Newrev: c243e5549419068e7224a87b35534dcc417fd123
X-Patchwork-Hint: ignore
Message-Id: <20240608064243.D541E87CA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/cog: bump to
 version 0.18.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=c243e5549419068e7224a87b35534dcc417fd123
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

This is a small bugfix release, with fixes for device scaling handling
(i.e. HiDPI displays), and with support to toggle WebKit runtime
features. Release notes:

  https://wpewebkit.org/release/cog-0.18.3.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e695da731ffe3a8b06526840055cb38c71b47fde)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cog/cog.hash | 8 ++++----
 package/cog/cog.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index 387666969a..c0e99e14aa 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.18.2.tar.xz.sums
-md5  7fbfc2e19304132be0d73f5e5512151c  cog-0.18.2.tar.xz
-sha1  045294f7fa878db86e4b8a617ee4ac056a71cb75  cog-0.18.2.tar.xz
-sha256  3c4237cff6323b8c3eaf52c6f3f6415b898a22c0127c6c396c1eaa6eef46c279  cog-0.18.2.tar.xz
+# From https://wpewebkit.org/releases/cog-0.18.3.tar.xz.sums
+md5  e457de5b5ac8994ae9971c0a5a22b8a2  cog-0.18.3.tar.xz
+sha1  21df2a84c651b45e78d08e45e71631250a0078c3  cog-0.18.3.tar.xz
+sha256  cd4ec937175a290ccd7c8ec398e4569aec04084cd94b11b2d83518778ba9d055  cog-0.18.3.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index e96909f779..11c0e3b502 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.18.2
+COG_VERSION = 0.18.3
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
