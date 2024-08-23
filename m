Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2D4C52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 12:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06BEC80543;
	Fri, 23 Aug 2024 12:29:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39kyp6Xbw1iA; Fri, 23 Aug 2024 12:29:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 068EF80529
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 068EF80529;
	Fri, 23 Aug 2024 12:29:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FBD51BF3C6
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 12:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D427612E7
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 12:29:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iysR-3IJ3GgH for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 12:29:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2D36B60F3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D36B60F3E
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D36B60F3E
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 12:29:24 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1shTPt-0043EC-7L; Fri, 23 Aug 2024 14:29:20 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 1cc76416;
 Fri, 23 Aug 2024 12:29:19 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 15:29:16 +0300
Message-ID: <20240823122919.3325906-1-aperez@igalia.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9mctnNrqHNUyZ9kX++xovibmnoV/ifNX2JQ6dnwZfMI=; b=iuAlrLGUx7aHlrJQlMTQ624wix
 GB9036WMWBa9H4YfxI7lbYkeN0dmNbMFXE6TqBHV0kR8S2LjMfuoGwhStoW2v5CCmf15fTQc8yc0c
 bCeU5ZePe4y5ggsJUGHXhc1r6UZB1ELtElhaS38mrqPVIRY0fOAmAUqyU9mNngfvQ0VragjX9lbpa
 G7gKlNtdRQv1vD2P+rytW6Qd4twqVdAzqF6+5+Ek8pdWKgO6k679CUBAm26eGq+8oX7zyPJGL8NER
 dtAMeig7y8C8BvmoRMWZVC156Z7DlptH6pjYGf94eVsej2Nj7zrT2+jEVJMQjJAB6M7E9sA8xnNOJ
 EiCcdFbA==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=iuAlrLGU
Subject: [Buildroot] [PATCH] package/wpewebkit: disable JIT for all MIPS CPUs
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
 package/wpewebkit/wpewebkit.mk | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 948f260e35..d71ade577d 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -128,18 +128,16 @@ else
 WPEWEBKIT_CONF_OPTS += -DUSE_GBM=OFF
 endif
 
-# JIT is not supported for MIPS r6, but the WebKit build system does not
-# have a check for these processors. The same goes for ARMv5 and ARMv6.
-# Disable JIT forcibly here and use the CLoop interpreter instead.
+# JIT is not supported for MIPS, ARMv5, and ARMv6, but the WebKit build
+# system does not have a check for these processors.
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
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
