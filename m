Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F129C52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 12:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B80B481EF5;
	Fri, 23 Aug 2024 12:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZicySfkdN9YT; Fri, 23 Aug 2024 12:33:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3F0681F08
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3F0681F08;
	Fri, 23 Aug 2024 12:33:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0974D1BF3C6
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 12:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAB3281F08
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 12:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aP2jlvhj9UqA for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 12:32:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F084581EF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F084581EF5
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F084581EF5
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 12:32:57 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1shTTM-0043I3-Ch; Fri, 23 Aug 2024 14:32:55 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 46f8ab29;
 Fri, 23 Aug 2024 12:32:55 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 15:32:53 +0300
Message-ID: <20240823123255.3328195-1-aperez@igalia.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0cb6g1OCmSVD7XLfIrJt/ki4a9haOhRdu6gPgFyBSA4=; b=dvN9Yr75kPNYPB3Mq10EDJJoRz
 WtnQjeXa/nPNs5dYK4/NP0q76U4gsFZM+fR+cx6ENb/DxCPaAeFu763VeVBsOFTAUyRO2f+5oIdhz
 OzxiQ7BJrWNtSZd0yH2VbcZ0k0rGvX1rvYMtOBQdBzPhqLpqlODzph+5FChROMZvjxeLx0Rg2gI9y
 yhPTZ2jceBSPKVzHUFtSkMfdeD4NBZ34SOAuXwkQwkLfN38Ob4S8O4x9XO1MSHbgvkc+VmWRU1qPN
 qvHLIKxcFsRpoAgU81vBZJPyrkrJDZtuob4cH0pQvK0lXZGFqiKbsVYVsZyf6I/YNvyAtPZlJIGeU
 8gbl5+Bg==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=dvN9Yr75
Subject: [Buildroot] [PATCH] package/webkitgtk: disable JIT for all MIPS CPUs
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change the mips32r6 into a blanket BR2_mips[el] check to disable the
JSC JIT. Upstream removed JIT support for all MIPS processors in
January 2024 [0], and the change trickled down to stable releases
starting on version 2.44.0 [1].

While at it, change the upstream bug links to point to a more
appropriate bug report.

[0] https://commits.webkit.org/272866@main
[1] https://lists.webkit.org/pipermail/webkit-wpe/2023-September/000612.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.mk | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 468fefab0e..9aaff5da8f 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -130,18 +130,16 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_JOURNALD_LOG=OFF
 endif
 
-# JIT is not supported for MIPS r6, but the WebKit build system does not
-# have a check for these processors. The same goes for ARMv5 and ARMv6.
+# JIT is not supported for MIPS, ARMv5, and ARMv6, but the WebKit build
+# system does not have a check for these processors.
+#
 # Disable JIT forcibly here and use the CLoop interpreter instead.
+# Also, we have to disable the sampling profiler and WebAssembly, which
+# do NOT work with ENABLE_C_LOOP.
 #
-# Also, we have to disable the sampling profiler and webassembly,
-# which does NOT work with ENABLE_C_LOOP.
+# Upstream bug: https://bugs.webkit.org/show_bug.cgi?id=278559
 #
-# Upstream bugs: https://bugs.webkit.org/show_bug.cgi?id=191258
-#                https://bugs.webkit.org/show_bug.cgi?id=172765
-#                https://bugs.webkit.org/show_bug.cgi?id=265218
-#
-ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
+ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_mips)$(BR2_mipsel),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON \
 	-DENABLE_SAMPLING_PROFILER=OFF \
 	-DENABLE_WEBASSEMBLY=OFF
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
