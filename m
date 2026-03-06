Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33494FCC066
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 056B36144A;
	Fri,  6 Mar 2026 19:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uc-LDMzM3kJk; Fri,  6 Mar 2026 19:52:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D60261462
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826768;
	bh=8BcvPAX1/+XkINKb1YR5aKSdDs+am8RKu2lYV3V6ZB0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PKkEx7gBphVMjuSxv4EIJxGweGTAXo0tf2AeIaN67UkFdQwkXAULYfaJpUetf5v4q
	 xGxHoCXk0QW2qDZPlgeVGdxv142cL3oMtroxy/jenFchx6Jh0JPjgGQZv0PKgCRLJi
	 TvEpmC8/yEec0yqSJUb14maEzbZu1rtPGrkQRjOlie2YXpaJlUjZ0aR+vSQ9B0F4My
	 /rDPYvXaID7UPf3mPXFgHkuZk/6TWSrTvurxvHBdQXz5dcAPc6qykm4wnYlLspGZrg
	 FGyHrV5+5avTS9EHhrf6NFQnh87MX0gxsjKIM+Kc1InxkSKzIM6AHGlAPDaaba+Pxo
	 /nwXy3TvgSxWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D60261462;
	Fri,  6 Mar 2026 19:52:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1058025B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91BDD41E84
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y4nLzT-L1rFJ for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD0CE41E5C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD0CE41E5C
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2F1A83582; Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 14:05:03 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8239565b288e2d57db21dae1b5d06b69230d8513
X-Git-Newrev: 16106d4861ba51f1b7a95e3e8ec1b9289dacca12
X-Patchwork-Hint: ignore
Message-Id: <20260306195222.F2F1A83582@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/webkitgtk:
 disable JIT for all MIPS CPUs
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/16106d4861ba51f1b7a95e3e8ec1b9289dacca12
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit be61be55e522d384863784e2ae8fd3b18d39d4bd)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/webkitgtk/webkitgtk.mk | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index d9aa48f024..161807bc5a 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -173,18 +173,16 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_JOURNALD_LOG=OFF
 endif
 
-# JIT is not supported for MIPS r6, but the WebKit build system does not
-# have a check for these processors. The same goes for ARMv5 and ARMv6.
-# Disable JIT forcibly here and use the CLoop interpreter instead.
+# JIT is not supported for MIPS, ARMv5, and ARMv6, but the WebKit build
+# system does not have a check for some of these target processors.
 #
-# Also, we have to disable the sampling profiler and webassembly,
-# which does NOT work with ENABLE_C_LOOP.
+# Disable JIT forcibly here and use the CLoop interpreter instead.
+# Also, we have to disable the sampling profiler and WebAssembly, which
+# do NOT work with ENABLE_C_LOOP.
 #
-# Upstream bugs: https://bugs.webkit.org/show_bug.cgi?id=191258
-#                https://bugs.webkit.org/show_bug.cgi?id=172765
-#                https://bugs.webkit.org/show_bug.cgi?id=265218
+# Upstream bug: https://bugs.webkit.org/show_bug.cgi?id=278559
 #
-ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
+ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_mips)$(BR2_mipsel),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON \
 	-DENABLE_SAMPLING_PROFILER=OFF \
 	-DENABLE_WEBASSEMBLY=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
