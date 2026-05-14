Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FFECD4851
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 08:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7503882257;
	Thu, 14 May 2026 08:25:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rf1KSdmg_7vS; Thu, 14 May 2026 08:25:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B93E82273
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778747104;
	bh=O/jbX3Qh3c609JgFiKamTESEnSR+Bbc0taOGw2osDFY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y8jVbVjYAeR0TrBkjzyw50YgoZDb3XjP0GrJSnbfr/7pAIj5zsfCzSZ0ku7H6gFxv
	 Vr5GsOUZWM3Qh36UqwD//AtkJHEzVF6bEJR7yQkWFpH1S9XM1eWk6Lqz0dqATRmqrX
	 Yi1fRwPOD+7JnoId/I8KSrE+sX/NHW92XVmOR2lOgZ4MDz1/myQbdoZKwHklakyoAS
	 /1mXWtXp25CCBDhxkP6eh/LFdYhaHbpbu6CxQJKMpI3k1La4LK0VggfFHCRZxLWwdN
	 TkfbOjlNMAjSHXJXK2+orVUIBOCDPtOxLpBUpgYsleJHnOcMieyLfvJFxUZHh7nafT
	 tSNa7gN8hAN2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B93E82273;
	Thu, 14 May 2026 08:25:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 405B937F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 08:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3282340556
 for <buildroot@buildroot.org>; Thu, 14 May 2026 08:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXrYmGY0b3WO for <buildroot@buildroot.org>;
 Thu, 14 May 2026 08:25:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F03A402F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F03A402F4
 for <buildroot@buildroot.org>; Thu, 14 May 2026 08:25:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0411861D1; Thu, 14 May 2026 08:24:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 May 2026 10:21:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 140d618567404950951afd0d26d4321c2247ed74
X-Git-Newrev: 3dfde73b678dfab6e147a7420442cc42ba48014d
X-Patchwork-Hint: ignore
Message-Id: <20260514082456.F0411861D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-microcode: security bump
 version to 20260512
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3dfde73b678dfab6e147a7420442cc42ba48014d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20260512

Fixes CVE-2025-35979:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01420.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 588cf7cde3..bb36a52fc5 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fcac5a08d7559a2ce4ad3b1ce5d59619c8adb364b9c51988fedd94220392bb37  intel-microcode-20260227.tar.gz
+sha256  5a07ce745d0bd8b360a4713564d46d5e38be797316a52abedaff0761e1b02370  intel-microcode-20260512.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 321272e10d..f6fbee54b4 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20260227
+INTEL_MICROCODE_VERSION = 20260512
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
