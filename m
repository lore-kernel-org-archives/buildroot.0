Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B32CCFD637
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 14:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 892288222A;
	Wed,  7 Jan 2026 14:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CWa00e0-SMJs; Wed,  7 Jan 2026 14:09:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A76C82215
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767794945;
	bh=jWnlUEPxRvoFu9Bk0iChUnxVlnt0ubHowfkcd0Endgg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FnDzepnI6XZSBRhd/xpjSkaoYT7hIsMs3nkDPAi7UdgiMq0XPYekoioFMB5B3jXmY
	 VKN5iTMpGVaKgM9mT3F9KO4X0wvCZIW3fUHLhpYL5Cyh186ep0h5eY80KY+SoqS27L
	 XO3hqTNP/wGL+2wyIXN2womb/lmZKVxP76F0tFiPGBwncVcbMYckmQOBL6seMXktbZ
	 sAZEZ5EnwXhv64KMDsc1iBGqU1SR/dtUtc6O20xaaYcFWs8vVkkHETDPmGuKEq6pe1
	 jmAkDRTtlQD1j/5ivBaglM5tSGT/vBN8z8GigGMRjwQthMAWepagyHzODCN/GzKvJi
	 CMT1V6p0mZBjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A76C82215;
	Wed,  7 Jan 2026 14:09:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 94E2C436
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D60A60D50
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:08:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nAzSNSBvGmNg for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 14:08:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9394960BAE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9394960BAE
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:08:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F57488348; Wed,  7 Jan 2026 14:08:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Jan 2026 15:06:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c3d4008166e52e13e774f5b21b40ce4f75429cb
X-Git-Newrev: b75dffa7af2dd35019d2d5dafbf3254170695f38
X-Patchwork-Hint: ignore
Message-Id: <20260107140851.8F57488348@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils-bare-metal: bump to
 binutils 2.45.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b75dffa7af2dd35019d2d5dafbf3254170695f38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump the binutils-bare-metal package to version 2.45.1.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils-bare-metal/binutils-bare-metal.hash | 2 +-
 package/binutils-bare-metal/binutils-bare-metal.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils-bare-metal/binutils-bare-metal.hash b/package/binutils-bare-metal/binutils-bare-metal.hash
index 7cf24141f7..9fec966c72 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.hash
+++ b/package/binutils-bare-metal/binutils-bare-metal.hash
@@ -1,5 +1,5 @@
 # From https://gcc.gnu.org/pub/binutils/releases/sha512.sum
-sha512  c7b10a7466d9fd398d7a0b3f2a43318432668d714f2ec70069a31bdc93c86d28e0fe83792195727167743707fbae45337c0873a0786416db53bbf22860c16ce7  binutils-2.45.tar.xz
+sha512  ea030419eba387579ab717be7e3223fc99e93b586860b06003c12489f93441640d4082736f76aa5e98233db4f46e232f536a45e471486de1f5b64e1b827c167e  binutils-2.45.1.tar.xz
 
 # locally computed
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
index f7ee96ef97..3d1b9db343 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.mk
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BINUTILS_BARE_METAL_VERSION = 2.45
+BINUTILS_BARE_METAL_VERSION = 2.45.1
 BINUTILS_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/binutils
 BINUTILS_BARE_METAL_SOURCE = binutils-$(BINUTILS_BARE_METAL_VERSION).tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
