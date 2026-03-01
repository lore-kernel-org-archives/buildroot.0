Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DE7FD0066
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 14:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5A6740928;
	Sun,  1 Mar 2026 14:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I2Bw1p1n4dIq; Sun,  1 Mar 2026 14:16:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06D1B40932
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772374612;
	bh=udoFXOCbxB6DQrYCHI9aAhIsYw8iY2ju1UeXVBh0jWc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bmOlFcQfRcgbOJD1oEtNIr/Fpz9CAVL6ePaTXW7GcF+U3WHbNZH3c4ZAq72RN6jCi
	 f3itLWiVE6QfeRgVLWIJof0u038/S9xGfs3NrBNXXBDRmIra0v5bK64fKeSRAu1iBI
	 YdR5VxENjY0KLIvj1OQPhVFLSueHCLRf+Ne0/Zvh2up/OHgipwi5Sk60tertwqBGP8
	 49DuVfpG6IfYAMB7XTBSrzvxfp1ips+ogSjtlGb9a+aijeXMhosFuqoaU3IAMpSyUo
	 EgsVRLs3TDJeWITJMDTRIZSku/60NK7br6UU4ggDjpzF+wclS4ypNiOzOT7I8qfIvN
	 IXbvi6CHYDwkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06D1B40932;
	Sun,  1 Mar 2026 14:16:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 75C2E24E
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 14:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BAE560B97
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 14:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ekJLLBMP2z3 for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 14:16:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC82F60B8F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC82F60B8F
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 14:16:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE76285D67; Sun,  1 Mar 2026 14:16:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Mar 2026 15:02:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be61be55e522d384863784e2ae8fd3b18d39d4bd
X-Git-Newrev: 8d222e03c74f48461562581cced7d0d28dded0ca
X-Patchwork-Hint: ignore
Message-Id: <20260301141647.CE76285D67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpewebkit: disable JIT for all
 MIPS CPUs
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8d222e03c74f48461562581cced7d0d28dded0ca
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Change the mips32r6 into a blanket BR2_mips[el] check to disable the
JSC JIT. Upstream removed JIT support for all MIPS processors in
January 2024 [0], and the change trickled down to stable releases
starting on version 2.44.0 [1].

While at it, change the upstream bug links to point to a more
appropriate bug report.

[0] https://commits.webkit.org/272866@main
[1] https://lists.webkit.org/archives/list/webkit-wpe@lists.webkit.org/thread/JM7GLPPKGAB6DIQ2YDHPEIWNOYSUHBC7/

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpewebkit/wpewebkit.mk | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 03deb6e991..1f5f4aa5e6 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -156,18 +156,16 @@ else
 WPEWEBKIT_CONF_OPTS += -DUSE_GBM=OFF
 endif
 
-# JIT is not supported for MIPS r6, but the WebKit build system does not
-# have a check for these processors. The same goes for ARMv5 and ARMv6.
-# Disable JIT forcibly here and use the CLoop interpreter instead.
+# JIT is not supported for MIPS, ARMv5, and ARMv6, but the WebKit build
+# system does not have a check for some of these target processors.
 #
+# Disable JIT forcibly here and use the CLoop interpreter instead.
 # Also, we have to disable the sampling profiler and WebAssembly, which
 # do NOT work with ENABLE_C_LOOP.
 #
-# Upstream bugs: https://bugs.webkit.org/show_bug.cgi?id=191258
-#                https://bugs.webkit.org/show_bug.cgi?id=172765
-#                https://bugs.webkit.org/show_bug.cgi?id=265218
+# Upstream bug: https://bugs.webkit.org/show_bug.cgi?id=278559
 #
-ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
+ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_mips)$(BR2_mipsel),y)
 WPEWEBKIT_CONF_OPTS += \
 	-DENABLE_JIT=OFF \
 	-DENABLE_C_LOOP=ON \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
