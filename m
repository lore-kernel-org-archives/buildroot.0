Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1FEC55822
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 16:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6822B80993;
	Tue,  4 Aug 2026 16:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qX4H60wbO9-u; Tue,  4 Aug 2026 16:19:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CD5380A91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785860396;
	bh=vF9cFYnC0vbfwco6EvscDTaLY4SV1DEbH1C3p6nBX/w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jnTbyiELHvhbkKO7U7SXIkrxq8FxlMuAIfWL82GqGIr7Qy/OMwkpqZTtbFoLTm1Ep
	 F5EHQ/z2lzWemoPB/MrulYxRdNtCnOr2IrSIhOSVkIDT+/MMJXpTwVNlnnG2bV4otu
	 pQBjciTuwvXx4aJY1Fkoiu2w35zr4pnoZ+hxoUrF3KkJVqcfnIqdzDPfHXCu9LNtXM
	 MHJGBoVOsGHF+zMLh9LYc3P8rdJQPiH6bfDske+Y8E1cvM8DozFlx0WfclIlxGi7yC
	 iJX7L2RsgOamPOkRIyUmPMvN83muLa3xvvJ+buAMu+HlvX7df+HuBTyXrBYYZOsuCB
	 FESjepF/LtE2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CD5380A91;
	Tue,  4 Aug 2026 16:19:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A885350
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0461D80A91
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eNpIWLL4wMjX for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 16:19:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12EFF80993
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12EFF80993
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:19:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DBE688BE98; Tue,  4 Aug 2026 16:19:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Aug 2026 18:16:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2938f827f7eef628b4758cd19f699ca972661730
X-Git-Newrev: b60d3e2c5291d09f989751df9950775ad360df69
X-Patchwork-Hint: ignore
Message-Id: <20260804161907.DBE688BE98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils-bare-metal: bump to
 binutils 2.47
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b60d3e2c5291d09f989751df9950775ad360df69
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bump the binutils-bare-metal package to version 2.47.

Release notes can be found here:
https://sourceware.org/pipermail/binutils/2026-July/150449.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/binutils-bare-metal/binutils-bare-metal.hash | 2 +-
 package/binutils-bare-metal/binutils-bare-metal.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils-bare-metal/binutils-bare-metal.hash b/package/binutils-bare-metal/binutils-bare-metal.hash
index 99556d8b15..d029c55943 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.hash
+++ b/package/binutils-bare-metal/binutils-bare-metal.hash
@@ -1,5 +1,5 @@
 # From https://gcc.gnu.org/pub/binutils/releases/sha512.sum
-sha512  32f880bb4f69351f4ae54a5d00359625c6c49d8e76624fb5cffdf174c79c8d3212f66225b81c12933c6ed59604ab652560773dd92fab384b930c97a9d4e1fdf2  binutils-2.46.0.tar.xz
+sha512  3126a1064374d8da40d4d70630c204ed1e75d542c447d53fca9778c7ceff095c28e9b445e15a313fef9729082d7966471ee6b5b715d479aa6d568528743e1d98  binutils-2.47.tar.xz
 
 # locally computed
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
index 3239dfb18a..343bf44c4d 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.mk
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BINUTILS_BARE_METAL_VERSION = 2.46.0
+BINUTILS_BARE_METAL_VERSION = 2.47
 BINUTILS_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/binutils
 BINUTILS_BARE_METAL_SOURCE = binutils-$(BINUTILS_BARE_METAL_VERSION).tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
