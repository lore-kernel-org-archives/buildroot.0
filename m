Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8E3F9D0EC
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 17:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D3E484DB6;
	Tue, 14 Apr 2026 17:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q3YpzEab2UBx; Tue, 14 Apr 2026 17:51:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B95484C2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776189097;
	bh=mzgHSBfYtD5owYGUUb/chpvxdNwB+zahNaMknismMPo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XlSKHncj6fOeedsuPVDkjet/tCgAjXSNmcjf422UaRZxq+QCvYAVTZ99EIkf9w8qC
	 X9lvxbIgrIt31I68VoV5BqBfMTo/xGNXOmPnQoUU+53+PAPURkThGU4bfBva89s9ew
	 eLsfaRYqr+t2IYJoRBs5Y42Et6Vvqbj1AKcgfRLyIqMIBcnEW01fNvfZSGtIGS4IYt
	 XqiZTOnRUbOp5xaWXd0s+zPiTenTYROdyJJ/MluoViCIG6CwsA8ENgeUDTAjmuX4g2
	 R4k7CU7oqCjD45iklKUH2TMn34dyk57DzLlt7Pya5QMJtVaBJ7MSL9k+byHek1P1kf
	 1F8OPt5HyyYtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B95484C2A;
	Tue, 14 Apr 2026 17:51:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 80EF2375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66CB161C9E
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:51:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zU8Ur8KhsO9y for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 17:51:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8923560A95
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8923560A95
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:51:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CFB77FCF9; Tue, 14 Apr 2026 17:51:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 19:50:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b84a18218ce556e6b499b8304b1e0f7cdf14f2ae
X-Git-Newrev: 4ea6da577326a337e9c643cda40c901ca514868d
X-Patchwork-Hint: ignore
Message-Id: <20260414175134.1CFB77FCF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-vpl-gpu-rt: bump version to
 26.1.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4ea6da577326a337e9c643cda40c901ca514868d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.1.6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index 3043ae6df0..ae00cb8fba 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d2f297dc03d4e5585bee75ce3bafc5c8a35b30ac60ff7d6b49c1ed6f6b8152a3  intel-vpl-gpu-rt-26.1.5.tar.gz
+sha256  41456ec8bff819b29a69601aeaffec72fd408ea6c79ab0e4184cc11b6b04f1ba  intel-vpl-gpu-rt-26.1.6.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index 2c496ad220..973ba6299b 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 26.1.5
+INTEL_VPL_GPU_RT_VERSION = 26.1.6
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
