Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866ADFCC069
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5341841F72;
	Fri,  6 Mar 2026 19:52:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NF_MQpLuIE0M; Fri,  6 Mar 2026 19:52:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C542341F4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826759;
	bh=nKYjmv8WzogDUJ+YlhHGCl4Mp/f6A1027Lq0lrgOXss=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nYBinfty1s1PMWGP3ivsJ1m1K3aA7MX08xGlMo7APaSbgW4LQ5E3VQeyKo0tQWlrt
	 aUfNQmjJdhLMqKxNTc4EY2UYRtm67UqC6hqYepLyJmFepyD4XFPtaG4mhw2QMUrJZM
	 ud1y1xH487CQtBSh0ZrrxAJvFyiyG7EhzT4hTOkDgHOhAyEvHWI4V/Vi2CG3C9Jjro
	 kTUrPlcrB3ZvyIemrBv9EkkaVXHHt7hmqDKXt6QWYAeQTxWMroq3uJNQSH7nrrkCge
	 EtrCGgddPERjRBdQikEcAhDBje6m2k1sO64+VntnAfQglOwP2C4pdmxIB8kmrc6Ofw
	 97tr2iS0EjOwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C542341F4E;
	Fri,  6 Mar 2026 19:52:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1259E39B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA12C833AE
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jmYGnGfkooK2 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E941283478
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E941283478
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0AD1A7FB67; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 14:06:20 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 16106d4861ba51f1b7a95e3e8ec1b9289dacca12
X-Git-Newrev: 6a1de0c6ac045dbbef35895947bfac7800ecf27f
X-Patchwork-Hint: ignore
Message-Id: <20260306195223.0AD1A7FB67@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/wpewebkit:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6a1de0c6ac045dbbef35895947bfac7800ecf27f
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
(cherry picked from commit 8d222e03c74f48461562581cced7d0d28dded0ca)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
