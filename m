Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D80DC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 15:24:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C19256137C
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 15:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C19256137C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CA3C84A6E;
	Mon,  4 Oct 2021 15:24:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lD8-q0kOoIcS; Mon,  4 Oct 2021 15:24:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E54F084A59;
	Mon,  4 Oct 2021 15:23:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2DD841BF2FE
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 15:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DDE484A59
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 15:23:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P5AcPDkPOAHY for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 15:23:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5927484785
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 15:23:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C95A88E35F; Mon,  4 Oct 2021 15:21:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Oct 2021 17:21:51 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: ffdcd18d2abdd30e95832b894fbc72c428640864
X-Git-Newrev: 185b7ffdb6d0126d5292459421f9ee592e707fdf
X-Patchwork-Hint: ignore
Message-Id: <20211004152125.C95A88E35F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/cog: bump to
 version 0.10.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=185b7ffdb6d0126d5292459421f9ee592e707fdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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
(cherry picked from commit 59a19eb4c877067ec0db4eeed091f9bddccdd667)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
