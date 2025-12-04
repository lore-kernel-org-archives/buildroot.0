Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B96BD4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 403BF83F3D;
	Fri, 12 Dec 2025 07:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f9GOlljz_vlg; Fri, 12 Dec 2025 07:57:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0494683E21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526245;
	bh=TQMMo1IqKpiLhvV3zW73n2CGzbQ81qdC2tSxQ4/FU3w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dOoAGk6Voa45OM7MxWihi7GhANxelCRvkSCUTV557hOzGY/7yVKJxAQUO933XDb8U
	 png6AuNSrlGbaT92wYrjvrooJhwWIPwOzPV/ua4l9zDa44Pj4WQb45XIguPml6tzgo
	 cJEYx9x/qUYGUQUsudyVyQIRRegHa2+oxZm0o9o1NR+GInCNomCuCvumJFK5Cc1pAB
	 X6rNbIibmtAz076GmmItKt7vOKxRJc+CDBdLUD7q4CdeyB4XoSc6BvclkoPxoEffrG
	 NrY8XqzSEseFwPp/8/tUyT+bWEo9MNTGmBVHVcKxFrlQcd2zOg7Tsh+/cCDpp+uOsm
	 /HoOCHX93VH4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0494683E21;
	Fri, 12 Dec 2025 07:57:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CB5BE7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 702B34114F
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DLSRL6zapES9 for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F355741156
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F355741156
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F293F86C93; Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Dec 2025 21:47:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7437415a56fdb054b77b5a7f1944d9728aaf75d
X-Git-Newrev: 150bb46a0483736aebf44b6026ffa621049c01ad
X-Patchwork-Hint: ignore
Message-Id: <20251212075536.F293F86C93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llama-cpp: bump version to b7271
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

commit: https://git.buildroot.net/buildroot/commit/?id=150bb46a0483736aebf44b6026ffa621049c01ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/ggml-org/llama.cpp/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/llama-cpp/llama-cpp.hash | 2 +-
 package/llama-cpp/llama-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/llama-cpp/llama-cpp.hash b/package/llama-cpp/llama-cpp.hash
index 81ddf4508f..765025f180 100644
--- a/package/llama-cpp/llama-cpp.hash
+++ b/package/llama-cpp/llama-cpp.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  c108fadd61d34da6ff2cfdf085821ff03a45acde2245d9eeeba9358482b305c3  b6865.tar.gz
+sha256  b2c4c89b6282c4ddc7c9c00c79af77d84811b6092aa47838a194e8a2981fa104  b7271.tar.gz
 # License
 sha256  e562a2ddfaf8280537795ac5ecd34e3012b6582a147ef69ba6a6a5c08c84757d  LICENSE
diff --git a/package/llama-cpp/llama-cpp.mk b/package/llama-cpp/llama-cpp.mk
index 7554d80a1e..5112022656 100644
--- a/package/llama-cpp/llama-cpp.mk
+++ b/package/llama-cpp/llama-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLAMA_CPP_VERSION = b6865
+LLAMA_CPP_VERSION = b7271
 LLAMA_CPP_SOURCE = $(LLAMA_CPP_VERSION).tar.gz
 LLAMA_CPP_SITE = https://github.com/ggml-org/llama.cpp/archive/refs/tags
 LLAMA_CPP_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
