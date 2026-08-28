Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190B2C61DD3
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95EE48118F;
	Fri, 28 Aug 2026 14:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FVGrl13Njt7E; Fri, 28 Aug 2026 14:26:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927165;
	bh=uTdr05M7+Q4li/RodHk3ALgdGo/5meYflCIJFGkzDV4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QbtSAvGfZHjepWT/uX2KpfCWY9AYuYi3DLi8/foZK2YsNog7WqjEf3apO0oH1/EFe
	 We96QyD1kbg8Dc/T0qJOl3dQUDEeftqjXl9flFVTLjyN+O7VqjgTX9AmuWCbKQEeZz
	 a6080tSmpnz0qjAuer6kUf+faD2c/9d1QkftFtd4OmQWEGn7Mfdt/wAwLkGyIOfbRk
	 TWJbEbYVR4Sayy+laiPoxM+TXFx1Rs5zvuPoavK1sipkkWOf7V8nPnNKP/PRn5n9Dl
	 8YOFQ2s4ZZ6rEqLY9AbeoCIW1+uRfAV1njseh3E52PWpaQiBROgkxEVajgEtWIVa12
	 gGSHuprrFXQFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD78E8118B;
	Fri, 28 Aug 2026 14:26:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B5F5D2A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F5C780F49
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PFv0812zdisd for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C5FB80E1D
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5AC36921FA; Fri, 28 Aug 2026 14:24:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:58:04 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 79cfcaf399307d671dbefa3b69aee67591897484
X-Git-Newrev: c267ef53bc00fb7226c757d95ca3eedf26601c3b
X-Patchwork-Hint: ignore
Message-Id: <20260828142442.5AC36921FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] boot/xilinx-embeddedsw:
 versal2_plm: configure xilpm runtime lib correctly
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c267ef53bc00fb7226c757d95ca3eedf26601c3b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

The xilpm_runtime_lib is not enabled by default in the versal2_plm Makefile:
https://github.com/Xilinx/embeddedsw/blob/97f2baf7f69e9d5f447650110af0d8841e501277/lib/sw_apps/versal_plm/src/versal_2ve_2vm/Makefile#L13

Without it, there is a silent runtime failure.

Add config XILPM_RUNTIME_LIB=SUBSYS to make sure the xilpm_runtime_lib is
correctly configured and included to fix the problem.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c7810e5847b50bd509401b7f44f3c18d28162ca2)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 boot/xilinx-embeddedsw/xilinx-embeddedsw.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
index 5fb442ee2a..b19c420d32 100644
--- a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
+++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
@@ -53,7 +53,8 @@ define XILINX_EMBEDDEDSW_BUILD_VERSAL2_PLM
 		COMPILER=$(XILINX_EMBEDDEDSW_MICROBLAZE_CC) \
 		ARCHIVER=$(XILINX_EMBEDDEDSW_MICROBLAZE_AR) \
 		CC=$(XILINX_EMBEDDEDSW_MICROBLAZE_CC) \
-		CFLAGS=$(XILINX_EMBEDDEDSW_CFLAGS)
+		CFLAGS=$(XILINX_EMBEDDEDSW_CFLAGS) \
+		XILPM_RUNTIME_LIB=SUBSYS
 endef
 
 define XILINX_EMBEDDEDSW_INSTALL_VERSAL2_PLM
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
