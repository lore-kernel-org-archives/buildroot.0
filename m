Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1004AC44501
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 16:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03234608C9;
	Fri, 10 Jul 2026 16:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74C3OUEiVb6Z; Fri, 10 Jul 2026 16:44:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 132C2608D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783701854;
	bh=GsCB97wIFW3Y1KeIS79Y2a98wTjKr/MCiVkeLOvV+oY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=szRMmvSG4Hm3BacPBKqD6INgzEsAyEY/tQMOWRXS33m2X9GK3lQsfazV83WwsRpEe
	 MgdHIVKV2qhSgFyOqHKE1gaYUfcy6qr2A9DlIuyYMuWfDkyULhFL60rDso+jzcKc9j
	 DBpLQOSvhPx501AcSMiJ9KX4M4702ZBb0/7SSBQFVlfNzJOapZxYLLOzYM7eJbvUtz
	 l3Tlfbniw+6589BbYgJ9vGKqQ0O19p8GjmbiM8aw0tkuHf44R26aTm17HluZXHfJqw
	 wVt+59Mf3HF/t5UCallPrqUpL43IuQP9IF5FQvvB2oxDOAT3fU5UUZgj81qgG1Ic4+
	 RE/iFfnsji44A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 132C2608D0;
	Fri, 10 Jul 2026 16:44:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 301AC2FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16011409DB
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kt4Oit99_dBD for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 16:44:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFCCB409D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFCCB409D7
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:44:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9BE6886A2; Fri, 10 Jul 2026 16:43:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 18:42:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c2b9973818852bafc12526c80608cf2a22084bc
X-Git-Newrev: b1329e7860f4004bcc998547ce3dc887dffe1da0
X-Patchwork-Hint: ignore
Message-Id: <20260710164336.E9BE6886A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-vpl-gpu-rt: bump version to
 26.2.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b1329e7860f4004bcc998547ce3dc887dffe1da0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.2.4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index 325ceff9ff..ab25475be0 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7cb0ce0c3b22e7f370053db5c363244feb8900fbd63da84f1e13f82776f8fddb  intel-vpl-gpu-rt-26.2.3.tar.gz
+sha256  c103d936d708a3910ef8572e9403aabf423197cfce6c8a6fcf870072b6564ada  intel-vpl-gpu-rt-26.2.4.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index b2bef9c6dd..3cdcb40d9a 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 26.2.3
+INTEL_VPL_GPU_RT_VERSION = 26.2.4
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
