Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37B1D30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B830A80D41;
	Tue, 13 Jan 2026 20:59:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6lkltGKbJ3SR; Tue, 13 Jan 2026 20:59:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E439F80DD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337969;
	bh=dxcgbYSpRBhVD6YNO+qdOkC2i6/toANMQTLlywUEBDI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VLNtGyw10FAvqQoEWa+GRVGhH0zIMCWAM3srzeivf+Zln+RqCgqtdzuRgqMwJ7qxq
	 vlSfLKAmMjAneVXAA+GsI+/4cSdDFTmMpzMO5tIUawExgtTjCQ0H5XOUWTR0PsRcct
	 42oNmr2liIkPQXkhhB6q7sdJbhcDOjZDkk6Jr/LD3dSBHZIp3oOuxQXl32bPLSs9IX
	 RjWb2u2UMAuE3HzsHaTydsLfof5F8GAHqqLno3IgOXrXoBhwpRGPO9H+vxvK1FOaO8
	 D6BpcLM8PCEF9Xir7i5/h8O+eZi2EoIiZvelS5j7Rsr50PjVxC92I/nYRDFk91u1sW
	 wAus+rfm3ucCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E439F80DD9;
	Tue, 13 Jan 2026 20:59:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CB711CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EEF9407C6
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aq-sbC59lAjK for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5916A40785
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5916A40785
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5788C88573; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59754eb13f563b4bf59cbacbb6510ec604845b5c
X-Git-Newrev: cd738f876cb7a6b426607136cc1180c70d49b931
X-Patchwork-Hint: ignore
Message-Id: <20260113205846.5788C88573@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_viewres: bump version
 to 1.0.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd738f876cb7a6b426607136cc1180c70d49b931
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2025-May/003604.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_viewres/xapp_viewres.hash | 6 +++---
 package/x11r7/xapp_viewres/xapp_viewres.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_viewres/xapp_viewres.hash b/package/x11r7/xapp_viewres/xapp_viewres.hash
index a662f4ef2e..a5ff6a7a4b 100644
--- a/package/x11r7/xapp_viewres/xapp_viewres.hash
+++ b/package/x11r7/xapp_viewres/xapp_viewres.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003219.html
-sha256  b15a62085b1a10f55ae1cf17b7ded75b72b21be240c68071685db377c4afc628  viewres-1.0.7.tar.xz
-sha512  75878faee001163891adf8472c79b31273f794e23dd775c80b33acdd1ce76df708eb27a49c20f79b7101ad676e1d50d9c857c2e2e0930c6209eeb7af8a11397c  viewres-1.0.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-May/003604.html
+sha256  4b221c2b103390b166633612b9abf8036cbbe90605dbd8a37cf2a377fa2b6cd2  viewres-1.0.8.tar.xz
+sha512  3cd5dc23ab1b3289eb1433cf7373cc4edab84ef39166013056d4ffad90bb4f926e7471f7691a4c6bcb81cf6bfd203478a0ae2fb53300e838b1c5d1cc82ff8da0  viewres-1.0.8.tar.xz
 # Locally computed
 sha256  aefb540c54bc95c68702cd2ae668c559e63cc1a84f55ae5c0e78547e7d75d2d5  COPYING
diff --git a/package/x11r7/xapp_viewres/xapp_viewres.mk b/package/x11r7/xapp_viewres/xapp_viewres.mk
index 49933d7af6..98198ec325 100644
--- a/package/x11r7/xapp_viewres/xapp_viewres.mk
+++ b/package/x11r7/xapp_viewres/xapp_viewres.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_VIEWRES_VERSION = 1.0.7
+XAPP_VIEWRES_VERSION = 1.0.8
 XAPP_VIEWRES_SOURCE = viewres-$(XAPP_VIEWRES_VERSION).tar.xz
 XAPP_VIEWRES_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_VIEWRES_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
