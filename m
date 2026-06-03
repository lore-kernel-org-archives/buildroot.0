Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DE0CD6E6B
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E5E361B55;
	Wed,  3 Jun 2026 18:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U4FuCBi1bUXZ; Wed,  3 Jun 2026 18:55:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED3EF61B57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780512923;
	bh=H0Hz6qxnW5S4N7Q8ZMUK/mwvIPtUguZAa+yQod7qNVE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L2aNdvqooiYeEqUM7sI+w5EHC7IaEwzUkrGpf+ly0gx5XUXHREtT7fNJlsNWDwz9v
	 AjFqlQO/RG4icM5pdCoMNpDBW4DWvLo1GJBvxrLwqbmEm+RFSIVHIlHffkPqe+VIma
	 zxXJ4RKft94aIOAj2t8dq88xOXrwmZAdL1hlRcTqtidvjskUjq59+7gm4CsxQwfF40
	 5vgTDHeEAD2/zC9BP2aZLeG80VG9vyBn4WojEsjJEil97pcAYQ74Ua0wlTfyMLOPRH
	 yNDcaNSspRSmmt6VaRSWN/RKLIAlJNnRAwgRXrvc0HpZIHVmLoRdQRcQzesHX2WPIz
	 1FU3F8b7zVmow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED3EF61B57;
	Wed,  3 Jun 2026 18:55:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B8C12F5
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 906B781237
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:55:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NZoggtI_C_8O for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:55:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EED3A843D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EED3A843D1
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:55:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E35C887992; Wed,  3 Jun 2026 18:55:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 20:53:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 69060189f37c4a1a286c8e6120fad2ea9383d9a7
X-Git-Newrev: e35ac186f1494f55fa83fdf1f3729f0d2a44edf0
X-Patchwork-Hint: ignore
Message-Id: <20260603185500.E35C887992@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/intel-vpl-gpu-rt: bump
 version to 26.2.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e35ac186f1494f55fa83fdf1f3729f0d2a44edf0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.2.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index f7a2bcbc8c..d1e4c58fda 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  597e72a77e9eba8d6efc79a083a775ac0cc47801b2bb7572749ec84acebb1917  intel-vpl-gpu-rt-26.2.0.tar.gz
+sha256  b9a84d5d2255cbea8586019a3bd03165f0269e06dba03e9c6f6cdf363b6b2fab  intel-vpl-gpu-rt-26.2.1.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index 4dd563d1bc..e812ca31cf 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 26.2.0
+INTEL_VPL_GPU_RT_VERSION = 26.2.1
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
