Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DF5CD4F25
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 15:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BC4340F5F;
	Thu, 14 May 2026 15:02:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E6n4mb4peuTd; Thu, 14 May 2026 15:02:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 521F540F88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778770937;
	bh=NQOcYdV9kW+j+cCZsKkSq2AaLPbOEUaxD4Lz89O3VYc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XjfyS++JCWpNQ9P0GZsCBf+eDfTCdBdIQm34Ef+H09h9IWQhbyyQUifwtNLfmSGoh
	 Jp1VERAQsbBJb+MFaLd0MQsDtpciXfJwZKNQqbmnk4kn9uXQ+xhZrq2g10gp8by64f
	 p2oA+8W11RjlmmCnkLPWDH0yssdqohA8xF0nh4Bc4XqlQ5X5JHUnIjY2IQQ3UAwuKP
	 Ivyt2/8eQVNKtXu2QzCJ49HcEsXQIDr2iJrNpuvCk6ROGK6unVJpK8ayqh2RovvWHl
	 ZCeapCF08g0XHI813yAO7fe6gtBowtAWVGNhZvLE7usVLGCj2yir+5DMRoHHjNFUVk
	 cx8Ajy+v3T8Kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 521F540F88;
	Thu, 14 May 2026 15:02:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12F2536F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 15:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 772F540F5C
 for <buildroot@buildroot.org>; Thu, 14 May 2026 15:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uJ3pC3t0_q7M for <buildroot@buildroot.org>;
 Thu, 14 May 2026 15:02:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E22D640F5F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E22D640F5F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 15:02:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5A8486220; Thu, 14 May 2026 15:02:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 May 2026 15:44:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7e0c02b0912eeea18fb12ce159d3160f6d1169dd
X-Git-Newrev: 17aa65ebda86c8d6728582f83276a5c84995338b
X-Patchwork-Hint: ignore
Message-Id: <20260514150201.A5A8486220@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/semodule-utils: bump
 version to 3.10
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/17aa65ebda86c8d6728582f83276a5c84995338b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://github.com/SELinuxProject/selinux/releases/tag/3.10

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/semodule-utils/semodule-utils.hash | 2 +-
 package/semodule-utils/semodule-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/semodule-utils/semodule-utils.hash b/package/semodule-utils/semodule-utils.hash
index 65d34a0fce..feab08433a 100644
--- a/package/semodule-utils/semodule-utils.hash
+++ b/package/semodule-utils/semodule-utils.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  729be36e4726c5d0833732681a94b2e0e4aff973c076504e41f8547abb6c5424  semodule-utils-3.9.tar.gz
+sha256  1c2f14cc098cbb4d75912d131c5f747e70246e1042e72f2ab40e28f53cf45c10  semodule-utils-3.10.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/semodule-utils/semodule-utils.mk b/package/semodule-utils/semodule-utils.mk
index 75955845df..d1fe15e806 100644
--- a/package/semodule-utils/semodule-utils.mk
+++ b/package/semodule-utils/semodule-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SEMODULE_UTILS_VERSION = 3.9
+SEMODULE_UTILS_VERSION = 3.10
 SEMODULE_UTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(SEMODULE_UTILS_VERSION)
 SEMODULE_UTILS_LICENSE = GPL-2.0
 SEMODULE_UTILS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
