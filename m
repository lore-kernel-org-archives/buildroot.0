Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8639FE63F1D
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 22:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4152882404;
	Sun, 15 Feb 2026 22:19:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GQzBt4diXLcH; Sun, 15 Feb 2026 22:19:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD48A8237F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771193942;
	bh=SvEbsfNVYz9BettgfWNxTNGZYJ9qjD2WxKN/B6VNUPE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CrxNr6zw7vsFspu41asuNkIbw/LjXYj9M+RGmFWkaz2kxrGwka7Z+jdI4esXJYMS+
	 TLCnZfjeTtU5u00b0icHN37jElSFXeJPbICcv4J8/423zZnBuJyNJYb2xtROeUUCiB
	 DY11ffeVyjmFlPUYfmKdowzhxWdz4DmDfxF5iZx2G4WUzrM8ZwAdRvQdpH5sZPzvvs
	 J0m/eTXv2Gtqi2ZCO7vXTXKqB2r6KER2sgbNFwl5LUuUfOyFmVjmfWWpAVAYzXDYv6
	 vjNMcLEeSJlpbNkuIy+fdWQzXwjz/iF3VqcoopgQFwbroR23l0vYoy7owqwtO6UF5p
	 g9bBmtsa4duUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD48A8237F;
	Sun, 15 Feb 2026 22:19:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 005091EB
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E533182386
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:18:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g9zZimzU6osW for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 22:18:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 434288237F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 434288237F
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:18:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94E2F86EA5; Sun, 15 Feb 2026 22:18:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Feb 2026 23:17:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 576ce5a373666152f542e42029b0ab26d1b0653a
X-Git-Newrev: 11c8c6e81d02dbdae055126a8258715101d79e6d
X-Patchwork-Hint: ignore
Message-Id: <20260215221858.94E2F86EA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-vpl-gpu-rt: bump version to
 26.1.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/11c8c6e81d02dbdae055126a8258715101d79e6d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.1.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index 7497d862db..9cd12ae9c1 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  67fd57d1c5709b58bb6406d60e3f2c4e0b47bd38c4a82c4c46619b78f6c23e72  intel-vpl-gpu-rt-26.1.1.tar.gz
+sha256  1f0b4a81b206253d315d795e5c075312f6b20e0110c7cf9bc83d24bd548fc015  intel-vpl-gpu-rt-26.1.2.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index 54921be12d..6468462fc2 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 26.1.1
+INTEL_VPL_GPU_RT_VERSION = 26.1.2
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
