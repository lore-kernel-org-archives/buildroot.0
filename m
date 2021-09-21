Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 628EDC433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:28:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D36861050
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D36861050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C62A40420;
	Tue, 21 Sep 2021 19:28:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jOH1R96wlkbm; Tue, 21 Sep 2021 19:28:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0710E40417;
	Tue, 21 Sep 2021 19:28:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D874B1BF578
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4323F403F9
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:26:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AtwWxKm9VBu6 for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 19:26:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A4C540409
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 19:26:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 64FF98C1EA; Tue, 21 Sep 2021 19:24:43 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 21:24:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdd05a2b1323b4bdfbcaf559e0567a7d09f4837d
X-Git-Newrev: 59a19eb4c877067ec0db4eeed091f9bddccdd667
X-Patchwork-Hint: ignore
Message-Id: <20210921192443.64FF98C1EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cog: bump to version 0.10.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=59a19eb4c877067ec0db4eeed091f9bddccdd667
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to version 0.10.1, which fixes the build when the DRM platform
module is enabled, fixes handling of absolute pointer events, and makes
the headless platform optional.

Although the headless platform is optional, Buildroot keeps it enabled
unconditionally (as previously) because the wpebackend-fdo dependency
is always needed anyway because Buildroot does not include any other
WPE backend.

Release notes:

  https://wpewebkit.org/release/cog-0.10.1.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/cog/cog.hash | 8 ++++----
 package/cog/cog.mk   | 3 ++-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index 566d30fa2a..3abc5f2c83 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.10.0.tar.xz.sums
-md5  1b0407b6163a3a01afdfc0fb454a7570  cog-0.10.0.tar.xz
-sha1  911816c00a2b08f4cfd388b1d2e176835c9b4e9e  cog-0.10.0.tar.xz
-sha256  2c72369c636ca4684370adad1344071b23c9ee2c851eb7d738fa2e1d7092031f  cog-0.10.0.tar.xz
+# From https://wpewebkit.org/releases/cog-0.10.1.tar.xz.sums
+md5  b997da3c143bc34ec5e953eb7e7ccefc  cog-0.10.1.tar.xz
+sha1  f25312141de918f41add3e3c9984faa985cda0a9  cog-0.10.1.tar.xz
+sha256  aecf546d7b0645119d79559c5574cb5eb68364fc8409dfbd47a4920bd1f221bc  cog-0.10.1.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index d373e6e1b6..07b8e245ef 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.10.0
+COG_VERSION = 0.10.1
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
@@ -13,6 +13,7 @@ COG_LICENSE = MIT
 COG_LICENSE_FILES = COPYING
 COG_CONF_OPTS = \
 	-DCOG_BUILD_PROGRAMS=ON \
+	-DCOG_PLATFORM_HEADLESS=ON \
 	-DCOG_WESTON_DIRECT_DISPLAY=OFF \
 	-DINSTALL_MAN_PAGES=OFF \
 	-DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))'
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
