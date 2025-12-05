Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D599AD374A1
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 21:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3DEF6EAA1;
	Fri,  5 Dec 2025 21:02:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QfTekdh_K26t; Fri,  5 Dec 2025 21:02:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B98A7606EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764968555;
	bh=c2eqk9hfqcJJavTpccUOTiyDtz1cpGyjCovfubnfEGc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VE2DkKZ7k98kwonAiw8h8B8rR6OC4vxRs6jxvdy/sARVOQAx1syzAq10Ev/o2aBs0
	 KcOJlqyt8c6Emj1nKbp7CvzpslIWdNamsCEuo52VS5WVN3nt1mf/TCUWXZ5f3+Lx+B
	 KYAWOul3+cH73AoaGN0n/Rftu+hgfJZKNDqheXB5Tw2eiObK41Ve9QPf/JhidDgWBv
	 kZlU0y4zdNmJ0h8VceQ62TslmhIhtkHcoh40o7+ccrPHIIKgdIA3AwzSLArn5fv5wf
	 d/XuPTTa25udnFeBANwLo7paFPUyMoJmpxZDUqUp/MfS/tsRorAN4xs2iIMmEv6jL8
	 uRBSczaxBTAJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B98A7606EF;
	Fri,  5 Dec 2025 21:02:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6605B1A9
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BDBD40446
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OqyqWIjnwQBU for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 21:02:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EEE340417
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EEE340417
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:02:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F26D865F2; Fri,  5 Dec 2025 21:02:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Dec 2025 22:02:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29fae1d4595417ae7fd12ce946b4abe306a5bee3
X-Git-Newrev: 181242dfe8d5f9d39f3d9d503b5dde0818667186
X-Patchwork-Hint: ignore
Message-Id: <20251205210233.8F26D865F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-vpl-gpu-rt: bump version to
 25.4.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=181242dfe8d5f9d39f3d9d503b5dde0818667186
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes, see:
https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-25.4.5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index 7c3aa1ec37..89c7099b45 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  028837bf8d756d5e74dbca4218b4ef5b853b923b6d2361ecc02270fbc63c15e8  intel-vpl-gpu-rt-25.4.4.tar.gz
+sha256  c1c779e86f147495e50a83feeeee290526d0cd46329f05772fae97eb271a8ef6  intel-vpl-gpu-rt-25.4.5.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index acb942da73..d149d58a77 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 25.4.4
+INTEL_VPL_GPU_RT_VERSION = 25.4.5
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
