Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D165CD4F3D
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 15:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE692824D4;
	Thu, 14 May 2026 15:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gWHYeFF-netJ; Thu, 14 May 2026 15:02:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28A0B824CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778770936;
	bh=uv4/2DP26mKQQeus+4fWjOZBXBkawnIeJqNSbbyXZ9w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L2utG0/GA7pIXlFO9SWMP6BYY0F/P2I1hd0DE4ScxDDFT0i8u+4hCskqeqDVPn4fo
	 /Z0UoL7SQbjUHslUWWRubVplEO1rxZxtGCuVwpdYgHPHBNoYqrg1hnWyi66jAHdHRT
	 A6bPQEwzgcQ4lrOVkPsC5jXy8YrfDxbA0vNaJneGPBqN6OR/ZIiRQEumYxF4VtDdLo
	 unX3Zk/idTuGWtdHiC+ljD4zPr7gF1VZ4pRJWHdDM3Xyce3zNWfXxNExsedMDkT8/J
	 ECDxYE5DtkkLm8g1cbowQCO9rSo20/+cd4swypHJUmrO3zImkbeIEsyI/dWZLBr5eO
	 qXAqobpXU5ECw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28A0B824CE;
	Thu, 14 May 2026 15:02:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8812E42B
 for <buildroot@buildroot.org>; Thu, 14 May 2026 15:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8354A40F59
 for <buildroot@buildroot.org>; Thu, 14 May 2026 15:02:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gqj8Akj1Kqmv for <buildroot@buildroot.org>;
 Thu, 14 May 2026 15:02:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA2C840F5C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA2C840F5C
 for <buildroot@buildroot.org>; Thu, 14 May 2026 15:02:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 869C9861F0; Thu, 14 May 2026 15:02:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 May 2026 15:44:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ec210e7c87ef7b631d1dc1438cf9c9547ae1480b
X-Git-Newrev: e07f0eba7eced2d5d382ea4f74e414104ee03119
X-Patchwork-Hint: ignore
Message-Id: <20260514150201.869C9861F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/restorecond: bump
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e07f0eba7eced2d5d382ea4f74e414104ee03119
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://github.com/SELinuxProject/selinux/releases/tag/3.10

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/restorecond/restorecond.hash | 2 +-
 package/restorecond/restorecond.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/restorecond/restorecond.hash b/package/restorecond/restorecond.hash
index dcfbd54617..19c1c36473 100644
--- a/package/restorecond/restorecond.hash
+++ b/package/restorecond/restorecond.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  d57b6ffe7eafd01af58e5efa50f8522eca73c0b3cb2955ca3f33397ba074a1a7  restorecond-3.9.tar.gz
+sha256  a1ae64084d4a9dd550669301cc456873879f49fe77f71ee2fca9f9d3a16646a0  restorecond-3.10.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/restorecond/restorecond.mk b/package/restorecond/restorecond.mk
index e8f432c88d..c0234aadab 100644
--- a/package/restorecond/restorecond.mk
+++ b/package/restorecond/restorecond.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RESTORECOND_VERSION = 3.9
+RESTORECOND_VERSION = 3.10
 RESTORECOND_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(RESTORECOND_VERSION)
 RESTORECOND_LICENSE = GPL-2.0
 RESTORECOND_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
