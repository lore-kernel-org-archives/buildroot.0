Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D822C5DF97
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 22:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D83F58131C;
	Fri, 21 Aug 2026 22:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o63Zabptid6I; Fri, 21 Aug 2026 22:49:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787352569;
	bh=QnCMnhc8A3Y5BQ2qkgASqPlpbnEGrznUmW5lhWQoGNQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XjxLdVUOy6OlkJixZPnkidZpOhpa2FaDulfjfpPC724lXj4Z2lQGzKp4CUirbAE2w
	 KBpoXfsWKz+d/n0XvcDyjq4SDq+yRu0X3RPbRqlMO+TslKtGu/mAy9vR08220EJ7Ns
	 CWzg3KT7yXJ60HxW6i2aEJuH9VYkNfOUBw3sg57kIX1HrodzsXNMEN9P9amG1gJBvM
	 aDNUgJZv7dfkup1qDb8tZeKzoGZ1EDQu/Q1B37pGb5FG4wWu1vOZsMEGvV7zKZS0Vz
	 Uol9iNqcgGMa+wzB0ar7SRGhlaUj6QiuDe/n1N3375hyuxd/eNr5qMRUYF/oG62lPP
	 kD4FSNvBw6iog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E526381307;
	Fri, 21 Aug 2026 22:49:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 71766118
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 22:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6349281307
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 22:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAElZhyf2PEi for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 22:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FA0281304
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 22:49:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A878B8E4A5; Fri, 21 Aug 2026 22:48:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Aug 2026 00:22:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0480567def9c99b6228b32c0f3638998b372ab4f
X-Git-Newrev: c7810e5847b50bd509401b7f44f3c18d28162ca2
X-Patchwork-Hint: ignore
Message-Id: <20260821224832.A878B8E4A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/xilinx-embeddedsw: versal2_plm:
 configure xilpm runtime lib correctly
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c7810e5847b50bd509401b7f44f3c18d28162ca2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The xilpm_runtime_lib is not enabled by default in the versal2_plm Makefile:
https://github.com/Xilinx/embeddedsw/blob/97f2baf7f69e9d5f447650110af0d8841e501277/lib/sw_apps/versal_plm/src/versal_2ve_2vm/Makefile#L13

Without it, there is a silent runtime failure.

Add config XILPM_RUNTIME_LIB=SUBSYS to make sure the xilpm_runtime_lib is
correctly configured and included to fix the problem.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
