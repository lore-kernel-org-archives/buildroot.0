Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6C1D6CFA4
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 20:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E9E98236F;
	Thu, 22 Jan 2026 20:14:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pqIpmALAdJtz; Thu, 22 Jan 2026 20:14:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE19A81097
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769112881;
	bh=UFlYJBwTxeIhdK5LaXFFh/yRQzCw8Biz4SK6EZnqKy8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ysny9muWULOA5kzQk2kjb5QS36QA4cVkTrbtgOGTpWZsTiGJUhpmaLl9vRTwWlkBS
	 mI7n9CyOb88HPmBmvdUt8GwkVvvJj7kPQvhL1G5wSG95yxYkGRBNBBmjg8Rn1W5TZA
	 LBaZqPnAmlwRIpeL1FcI296QMbn1mk8/gSWfwlsrYahL4Oh1/uagasGvw0tBLXYqTe
	 yGN47gVDV/OLQmgOm2PI16lm/x49JgwmW4O5O+SADgjxv2SgMAXkvfFkSMDlfzlYuI
	 mlwB1AlCbi4VnHrNVg7tNMSAFrJRVIAojtBD192iLCOEmi0ASxkgJMYy/KS8qt/T/b
	 viI8yPNN3XV0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE19A81097;
	Thu, 22 Jan 2026 20:14:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BBD5122
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 20:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F16AD60617
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 20:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ZAMFhPw7Y4t for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 20:14:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F28060777
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F28060777
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 20:14:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E1CF8757E; Thu, 22 Jan 2026 20:14:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 20:58:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2089d0ff1ec1d19a37a503946bc80131b907f2b7
X-Git-Newrev: 6860a94a09b42b896fd2a5a1f437cd1aa1a357a5
X-Patchwork-Hint: ignore
Message-Id: <20260122201438.2E1CF8757E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-vpl-gpu-rt: bump version to
 26.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6860a94a09b42b896fd2a5a1f437cd1aa1a357a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.1.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index 720503317a..6bbade9327 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a4cc2429fba49ee1d5f48883930e2e7325f0af38af83c8048793c8b1d3fa4a8f  intel-vpl-gpu-rt-25.4.6.tar.gz
+sha256  876c76714e891a44b1da7aad122318059bfedd17a5f4d2b3123efeca35aa0144  intel-vpl-gpu-rt-26.1.0.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index 6f5abaf9b4..c41b7eb051 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 25.4.6
+INTEL_VPL_GPU_RT_VERSION = 26.1.0
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
