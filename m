Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1127710F2865
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 20:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA83140576;
	Fri, 27 Mar 2026 20:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MIYPKvEZASJw; Fri, 27 Mar 2026 20:55:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC5DD4057C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774644923;
	bh=23AuFTa2BdzIfdv50t6Qa8qpTEbIiFPpDokBbLGIdtc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hlFTrx6b9Mm/VUwFbsPywQWhvFgm98+LCQNAJ20xb9vuGHUJtFYRDayiA8I777ye4
	 Psai1+YmKFtTjJle/zI5tM6ZQAvN8Qb9e+ngQgcyicZ1ncMTCZulFABAPtcPOub8cB
	 BL+KYjrzUPMhdZUD5HBHdjsL13qnG0flWd5e3nUP9aejQfkyfdnEcoB6vfB9C50W47
	 RJu71yd/2WWzo/9ZzEYQZ3Y2QHng4f6DOVLPnz+5rpk53x4jnSVDjTI/Y/B+VPUkBu
	 Liaejdq1US4QH85eTSz5mZTkaTjIf+XDGcKel6pNLHfNAqTp4iM65U4CEthGQW6XDN
	 Z8u87UWsajJeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC5DD4057C;
	Fri, 27 Mar 2026 20:55:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CC692D5
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A213406AE
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:55:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UY7EUSRej4Dl for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 20:55:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A03B840142
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A03B840142
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:55:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D27EC7F93A; Fri, 27 Mar 2026 20:55:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 21:54:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84d5e144d705ab2277cc0ab8be3ed9125c736a80
X-Git-Newrev: cf77be26be856adb340596081992168565580cf3
X-Patchwork-Hint: ignore
Message-Id: <20260327205519.D27EC7F93A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-vpl-gpu-rt: bump version to
 26.1.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cf77be26be856adb340596081992168565580cf3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.1.5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index 38e8c14064..3043ae6df0 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1d567932451ed179a7f146677a48219cdc241787dcc72528e7ae8bff2804b8a1  intel-vpl-gpu-rt-26.1.4.tar.gz
+sha256  d2f297dc03d4e5585bee75ce3bafc5c8a35b30ac60ff7d6b49c1ed6f6b8152a3  intel-vpl-gpu-rt-26.1.5.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index bb0a83f730..2c496ad220 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 26.1.4
+INTEL_VPL_GPU_RT_VERSION = 26.1.5
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
