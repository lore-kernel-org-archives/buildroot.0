Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DBECFD641
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 14:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8AE482028;
	Wed,  7 Jan 2026 14:09:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KGb9VGUN5N3J; Wed,  7 Jan 2026 14:09:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 911CB821BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767794943;
	bh=f2jKTypPfPnoFn0Ltkpk8TJjPn4qXMMYtJ+K3tyT9LU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NY8S37yx21uKzmQW32j9/IbBWPhi7bxNx4gtSbXkQbl/XwqzWlXPDQTlrQekVH4UT
	 5XKhbiLAne7ym89KjOKbG5Z61thseDORZy4kzdirDaQFum5h5vhzVGQGJOIc919as4
	 0vgSxgnvIjIc+N8r3cT413ZF4Z4xWtIg/Kr5Qd7xUQXyWbTDVWGl9n60Af3gyxvD/7
	 zd4dp//vchBeE5BGPnVggxQKdxSHhCvq3tZ2146tqVIVXa3P8hRFhCqCUQE5CqvV/2
	 v3a+KzWwA9+vZrde0F2v/RgnuDwU8EYC3DXtVTcdrbtSQG4rlUnNQWTj2RzCHdMlXl
	 Myqa6gyaM7dkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 911CB821BB;
	Wed,  7 Jan 2026 14:09:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 30CEE436
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA35C60D59
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ODFSE1cChx9V for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 14:08:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A745860D50
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A745860D50
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:08:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 993F1883AA; Wed,  7 Jan 2026 14:08:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Jan 2026 15:06:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b75dffa7af2dd35019d2d5dafbf3254170695f38
X-Git-Newrev: 405a1682a034c7be58140ff073857028de4bfd72
X-Patchwork-Hint: ignore
Message-Id: <20260107140851.993F1883AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rdma_core: bump to version 61.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=405a1682a034c7be58140ff073857028de4bfd72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/linux-rdma/rdma-core/releases/tag/v61.0

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rdma-core/rdma-core.hash | 2 +-
 package/rdma-core/rdma-core.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rdma-core/rdma-core.hash b/package/rdma-core/rdma-core.hash
index fd538fc5a4..e2da879aa2 100644
--- a/package/rdma-core/rdma-core.hash
+++ b/package/rdma-core/rdma-core.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  aa9ca1f5a9e356f770441f52254ddc70ff0a4df76a25383e422075eb730efb4b  rdma-core-60.0.tar.gz
+sha256  c7db745c72fca8168503b73bb0c6f0ff110a865944b7f73f791480c2bff1ab87  rdma-core-61.0.tar.gz
 sha256  99e0df1d009a21d0dfb031600c550fd8f4efc0c6b2a4ef8b34a995aa6f79c9f4  COPYING.BSD_MIT
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL2
 sha256  c46a557f25b8ef9bec76526c4e593fc13e6cba27e7ba30d73b6497a689cf06f6  COPYING.md
diff --git a/package/rdma-core/rdma-core.mk b/package/rdma-core/rdma-core.mk
index 99b77dc03c..4ace1b8a3d 100644
--- a/package/rdma-core/rdma-core.mk
+++ b/package/rdma-core/rdma-core.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RDMA_CORE_VERSION = 60.0
+RDMA_CORE_VERSION = 61.0
 RDMA_CORE_SITE = $(call github,linux-rdma,rdma-core,v$(RDMA_CORE_VERSION))
 RDMA_CORE_LICENSE = GPL-2.0 or BSD-2-Clause
 RDMA_CORE_LICENSE_FILES = COPYING.GPL2 COPYING.BSD_MIT COPYING.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
