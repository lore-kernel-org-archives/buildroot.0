Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81ECE8537A
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 17:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ABC9610D5;
	Fri,  3 Apr 2026 17:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8zF3wbP2if6e; Fri,  3 Apr 2026 17:59:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7660A610E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775239171;
	bh=oRFhTVKxgWGlDSSpHinUjSWA7hmGNVfNsRQHbADwmBo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Tpmkcp0M6u0yBR7W3IICg8y6MKZCjD+xJWQ1vCMR7zT1Btc64XGUralr+Uobgpl9l
	 DtfWmuTzPsAstBtZHRhvGrBK5gI5Rq6ThRw8xMXEjxrDj7yh2aQSVM3d991LsOMGfg
	 DynpVNdsKeTP3p0wp4MHB4/O15iT4z/WgB6XftwAR11HlabnehUIt+kvoVeZ6EIeIS
	 NXovSyBQXaSuMY65rz6PZwx2mUrdAeJq5l4jtQnAYX1bwB/hGAOueLXw2RJ0rXU1Kj
	 lFyPyGhADeIHfM3y4BlCrMlyeG16IipZgRUaPmqfNvorbAShc1Tt4PaY30cXgFUVE3
	 eVsx85rx4l4xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7660A610E6;
	Fri,  3 Apr 2026 17:59:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D67C51A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC41540226
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hegkc0Wndduz for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 17:59:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A21640202
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A21640202
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:59:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A4A0801EC; Fri,  3 Apr 2026 17:59:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 19:57:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce8f905bac2184bdfc466b072d2e5cc5bbd1e149
X-Git-Newrev: 927227e1899e503e8bbc18f292e33bb56e48289f
X-Patchwork-Hint: ignore
Message-Id: <20260403175929.4A4A0801EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mongoose: bump to version 7.21
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/927227e1899e503e8bbc18f292e33bb56e48289f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/cesanta/mongoose/releases/tag/7.21

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mongoose/mongoose.hash | 4 ++--
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index 07c0fc68c1..556a438880 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ede2371ff4e41e95fd7b2de83a7df727388307a64d3706046ead320defe35e7e  mongoose-7.20.tar.gz
-sha256  9abc2509d90c01ff2a0c91abf73582cdbcf1d2dbcc0b7973097eced43cf4cdd4  LICENSE
+sha256  d4ddbd12c12f223abefcc0a74417a638ae5c118d7cf10ba546553c6b0e0b5ada  mongoose-7.21.tar.gz
+sha256  f0d9cfd6f7d92f6ec061a5fb2882f67d2521a151bf09a637c33ca6181834b048  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 44de3fa1e0..432c20a54c 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 7.20
+MONGOOSE_VERSION = 7.21
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
