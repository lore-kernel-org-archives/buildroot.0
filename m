Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710FFE6529D
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 20:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 205BA60FB1;
	Sun,  1 Feb 2026 20:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w7BjsFwMJln8; Sun,  1 Feb 2026 20:41:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B1EE60EC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769978466;
	bh=DiafiDAIsMaJhOOqGmt1kyLJDhDCxc7/PfFhoMgXkPQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Fp7QcOxx42yupsNZzhzsKUzXpQ7pasq1neF9x2FPUEtSdBK0AYl/zoQciD8SEWqyg
	 +i+t5I3jqEXzUGGcq1v8szB/3zLztyExxntw92VRfw0OEGBTHnp9efdr3dPK0SNo32
	 B2X1ZWtzi/RVfKeFdUPLtZWvDlrFxGlEvzngxbeN4JCyxSHhPcJB4f8C+KnDjTLB+X
	 0Rk2JMZhC2adp/2OdVmeGQBOIfNmFxEXBBfy8kD4H9o1/4nsYpc8AN2EjT0vI3HJUx
	 W9UiBtFl89+To3gSV6ZYKJKyoqVQ1LxoorSX8QmmXv9FskqNMPbdtqMbiUe/tY86xB
	 j7HOrOaNEUPGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B1EE60EC6;
	Sun,  1 Feb 2026 20:41:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 693191E0
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A518606BA
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k3eKrZsj1IMt for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 20:40:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEBCE60688
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEBCE60688
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:40:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB9C986170; Sun,  1 Feb 2026 20:40:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Feb 2026 21:39:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 906ec9c2f196e97c30c129708820ba8bfbd75ca2
X-Git-Newrev: c6891a9f9e4c2aa8d643766ef9ee7e96adb4968e
X-Patchwork-Hint: ignore
Message-Id: <20260201204055.BB9C986170@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-vpl-gpu-rt: bump version to
 26.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6891a9f9e4c2aa8d643766ef9ee7e96adb4968e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.1.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index 6bbade9327..7497d862db 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  876c76714e891a44b1da7aad122318059bfedd17a5f4d2b3123efeca35aa0144  intel-vpl-gpu-rt-26.1.0.tar.gz
+sha256  67fd57d1c5709b58bb6406d60e3f2c4e0b47bd38c4a82c4c46619b78f6c23e72  intel-vpl-gpu-rt-26.1.1.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index c41b7eb051..54921be12d 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 26.1.0
+INTEL_VPL_GPU_RT_VERSION = 26.1.1
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
