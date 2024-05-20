Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74991C04FFE
	for <buildroot@archiver.kernel.org>; Mon, 20 May 2024 09:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0A894052F;
	Mon, 20 May 2024 09:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HpeYTM1e5isu; Mon, 20 May 2024 09:07:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74FA340521
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74FA340521;
	Mon, 20 May 2024 09:07:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB7D31BF3B5
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 09:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A891E60626
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 09:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ND3jMX-hY11B for <buildroot@lists.busybox.net>;
 Mon, 20 May 2024 09:07:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 871356061A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 871356061A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 871356061A
 for <buildroot@buildroot.org>; Mon, 20 May 2024 09:07:49 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 48483B0053E;
 Mon, 20 May 2024 11:07:45 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 20 May 2024 11:07:39 +0200
Message-ID: <20240520090739.67311-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1716196066;
 bh=gNEbQbvz47qkb8HVZgbakYDVR4XevhHgu5FSwprweDo=;
 h=From:To:Cc:Subject:Date:From;
 b=uUiUuPbV8p2jbmJo7Tvx+VuPVq/iGoU1ZW8Ef4WLyGA9hNQniwyrAaAdC9x8dEEol
 Bza5T95z5mcXavghLxtNZyluUxPXfzl4V68MsvqPgiWcbsr0E4SkdV+hUtUv98LfsF
 qpSlglkFrZZ1fL8jcw4bS5FVFewicLJgydGYk4CaS4Fj14935J5dkfYEipWDN1rvxF
 CB/XFxgGLcZDzhCLQWnYq16UuwrRHUFrrxu0aOyfpYvLP/7rad/s+jSG4J2w7t1oB1
 gYe9/s8P6c0GETSXXpe/Jl+fglZOVUz/smHYOZNogal4Hs7Y5MwiGtMeOD5ZDx/TYm
 jU+R4XJpmmcjg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uUiUuPbV
Subject: [Buildroot] [PATCH 1/1] package/mokutil: bump to version 0.7.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release note, see:
https://github.com/lcp/mokutil/releases/tag/0.7.2

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Note:
mokutil is currently failing to build (with and without this patch).
The build failure is unrelated to this version bump.
The following patch is also needed to fix the issue:
https://patchwork.ozlabs.org/project/buildroot/patch/20240517205315.850877-1-fontaine.fabrice@gmail.com/
---
 package/mokutil/mokutil.hash | 2 +-
 package/mokutil/mokutil.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mokutil/mokutil.hash b/package/mokutil/mokutil.hash
index 86555e6f4db..4eb8414d1b6 100644
--- a/package/mokutil/mokutil.hash
+++ b/package/mokutil/mokutil.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1c0bcba3d2f4ab98235b1edb5eb71b40508f79d93d3e28b1a04b7fbd4a2c1457  mokutil-0.7.1.tar.gz
+sha256  839d677c4fc9805f1565703ca32863e4652692c53da66a88ae9b9e30676f9e17  mokutil-0.7.2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/mokutil/mokutil.mk b/package/mokutil/mokutil.mk
index 6e83d9f1383..4f56f255880 100644
--- a/package/mokutil/mokutil.mk
+++ b/package/mokutil/mokutil.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOKUTIL_VERSION = 0.7.1
+MOKUTIL_VERSION = 0.7.2
 MOKUTIL_SITE = $(call github,lcp,mokutil,$(MOKUTIL_VERSION))
 MOKUTIL_LICENSE = GPL-3.0+
 MOKUTIL_LICENSE_FILES = COPYING
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
