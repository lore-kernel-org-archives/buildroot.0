Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81468CD3436
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 12:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF5758232E;
	Wed,  6 May 2026 12:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4l-T7yu9AEYx; Wed,  6 May 2026 12:45:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFCF88231F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778071505;
	bh=TecAFiTtsIlB5W/OTNSGaqXdCZBYJ9LJAhWpDegGgzo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=otFT0ejgN2vKbXgtXd9GaNHyAZZ1Zb+2FM2K2NQWD90RPMIbXvfEbmLX+7pDPPRP/
	 hBo4oZD5TchLEZ4FGhIOhXyV6A+UJJQMQlOeM2VLV3PJjRvO3Vf6IRmQ9kzEA05Ff0
	 /MO5cgF8r8+C3iSN3w5gR63BU/g8KLhwQiHHrXzslNeKl/NwS8nCzTlf5J9YwoccmA
	 zhQjkYvPzKtBJpzkBhcfA7baRl0u0arKuaVjmMzEH6e+BNHLvO8VcZnNfyaUBwx48L
	 xzCcazsy3meF1u1zTxBC5fWdUUW0EBdKE3/hMBgI9dAp0QpfaU7dfj1cGhUW+VjaaT
	 VghzS3n+MoMiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFCF88231F;
	Wed,  6 May 2026 12:45:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A840D280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 12:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E3C460DE1
 for <buildroot@buildroot.org>; Wed,  6 May 2026 12:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mUcqghGaztXR for <buildroot@buildroot.org>;
 Wed,  6 May 2026 12:45:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB28E605C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB28E605C4
 for <buildroot@buildroot.org>; Wed,  6 May 2026 12:45:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6742847BA; Wed,  6 May 2026 12:45:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 May 2026 14:41:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4cdad9ceee3e3826eee788635ee5fb05f77d3bef
X-Git-Newrev: e6309f2b587389e1599799680cd3957cc347b6ea
X-Patchwork-Hint: ignore
Message-Id: <20260506124501.A6742847BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencsd: bump to version 1.8.1
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e6309f2b587389e1599799680cd3957cc347b6ea
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log since 1.6.1, see:
https://github.com/Linaro/OpenCSD/blob/v1.8.1/README.md?plain=1#L365

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/opencsd/opencsd.hash | 2 +-
 package/opencsd/opencsd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opencsd/opencsd.hash b/package/opencsd/opencsd.hash
index 52d07fefc4..8cccb03cc9 100644
--- a/package/opencsd/opencsd.hash
+++ b/package/opencsd/opencsd.hash
@@ -1,3 +1,3 @@
 # Locally Computed:
-sha256  e940e7ddd4e3c723c8dbe614e0728e20cb19729d44bb55cdb016abd6ad221bfd  opencsd-1.6.1.tar.gz
+sha256  2133692c37f05c01354959d9da6f57797d58b2d1346693fd9477f1332eaa4223  opencsd-1.8.1.tar.gz
 sha256  980eef4b0744e63834e3ec0d50c2a4ff6d81d7ec62dd8ba8c66acae0ec5a2e88  LICENSE
diff --git a/package/opencsd/opencsd.mk b/package/opencsd/opencsd.mk
index a7a24587ee..350dec73ce 100644
--- a/package/opencsd/opencsd.mk
+++ b/package/opencsd/opencsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCSD_VERSION = 1.6.1
+OPENCSD_VERSION = 1.8.1
 OPENCSD_SITE = $(call github,Linaro,OpenCSD,v$(OPENCSD_VERSION))
 OPENCSD_LICENSE = BSD-3-Clause
 OPENCSD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
