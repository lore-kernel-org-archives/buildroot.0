Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A534CD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6117820CE;
	Fri,  5 Jun 2026 12:39:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z97Cn6p0vJQI; Fri,  5 Jun 2026 12:39:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06566820CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663178;
	bh=mcq2STeOCOINFosCR7JTdGwWgL1v6131Y23fWzgX3Qs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Evy1SE3yIykHX7aHc4Ni5hJPm1Cd+0ooobP2oAAou4BVMnQmFCWrOFmDik2ThPGjx
	 6BL0TmlzLRD8yvhkRAXwDEneej1RxVdLn+0qQK72HTJYG2go7cRC7hz8LE0HWRqo4n
	 Al1D6QZ41I8lzs2PrwM31uBxncHDwxuRnKSAYjHFJF/KRgYtLhQUi6PEoFxweapvI6
	 UAVWIyA7XLduwzgQB0QlXb9pctsWeLXB1sSx2xlHTFtprEzq0BaP+dCxCfZEhMpMi2
	 e2WDvhD+Ftl8XYqWK35iZr+NH3BdtFO5jpO9jOmLFnvOEibyrkyUYtfemWXDRqN2Gz
	 qzOBpa8KrYSVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06566820CF;
	Fri,  5 Jun 2026 12:39:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DA52F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4955081FC9
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6STSFuvXoZOR for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6461D81EBE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6461D81EBE
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E3C287B03; Fri,  5 Jun 2026 12:38:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 10:54:12 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: d3108998390b9bbeffda3d030a2efffc830fefde
X-Git-Newrev: 89d3ff3f50670610fd42be18214572b51ff51aa8
X-Patchwork-Hint: ignore
Message-Id: <20260605123834.8E3C287B03@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libmad: remove
 Debian patches
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/89d3ff3f50670610fd42be18214572b51ff51aa8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

In Buildroot there are multiple way to apply patches on a package [1]

- Adding `.patch` file in the package directory.
- Define `<pkg>_PATCH` variable with the location of the patch tar.gz.
    It used to download Debian patches tarball.
- Implement custom patching logic with `PRE`/`POST` patches hooks.

The libmad package is downloading a diff file from the Debian
mirror with the `<pkg>_PATCH` method [2] and then apply that diff to
create a directory containing patches. The patches are then applied in
the `PRE_PATCH_HOOK`.

The Debian patches were integrated in commit [4], in commit [5] the
application of the patches was moved to the PRE_PATCH_HOOK.
The problem is that in the PRE_PATCH step the `_PATCH` downloaded from
Debian don't exist yet and end up not being applied at all.

Since this is not used, remove the Debian patches.

[1] https://buildroot.org/downloads/manual/manual.html#patch-policy
[2] http://snapshot.debian.org/archive/debian/20190310T213528Z/pool/main/libm/libmad/libmad_0.15.1b-10.diff.gz
[3] 1167d0ff3d docs/manual: mention CVE trailer
[4] 858df3643f package/libmad: switch to debian to fix CVEs
[5] b21184a877 package/libmad: update the patches to be applied with fuzz 0

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 103f84b30fd8dfd4f8e27910d7136aa3cd7a6133)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libmad/libmad.mk | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
index db04d22e92..611f13eb67 100644
--- a/package/libmad/libmad.mk
+++ b/package/libmad/libmad.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LIBMAD_VERSION = 0.15.1b
-LIBMAD_PATCH = libmad_$(LIBMAD_VERSION)-10.diff.gz
 LIBMAD_SOURCE = libmad_$(LIBMAD_VERSION).orig.tar.gz
 LIBMAD_SITE = \
 	http://snapshot.debian.org/archive/debian/20190310T213528Z/pool/main/libm/libmad
@@ -13,20 +12,6 @@ LIBMAD_INSTALL_STAGING = YES
 LIBMAD_LICENSE = GPL-2.0+
 LIBMAD_LICENSE_FILES = COPYING
 
-define LIBMAD_APPLY_DEBIAN_PATCHES
-	if [ -d $(@D)/debian/patches ]; then \
-		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches *.patch; \
-	fi
-endef
-
-LIBMAD_PRE_PATCH_HOOKS += LIBMAD_APPLY_DEBIAN_PATCHES
-
-# debian/patches/md_size.diff
-LIBMAD_IGNORE_CVES += CVE-2017-8372 CVE-2017-8373
-
-# debian/patches/length-check.patch
-LIBMAD_IGNORE_CVES += CVE-2017-8374
-
 # Force autoreconf to be able to use a more recent libtool script, that
 # is able to properly behave in the face of a missing C++ compiler.
 LIBMAD_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
