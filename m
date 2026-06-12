Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9D9CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 16:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6271C839E7;
	Fri, 12 Jun 2026 16:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IwSikzWrz7Mr; Fri, 12 Jun 2026 16:35:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 930AC839DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781282123;
	bh=sr6e85i8yJ2PRQ0GAHLwRiEF41M/qHcZG3Xrlt0y6z0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HrM3NrnCfDtGaf6ISA+FX8la7SdydSY6Rb2DiGws6JVzRoTewQFuONp8uUOMMndnj
	 c7a9TH5HLRmPtK0yFZPvwlC71CgUDy39tcCJ9rc+vuX96q00M941Ch8vyxN9wo6h8i
	 FHG2Mj1k+zNe+nx8VkFA4g3f6ZD6B0egMXazh/PieKLh9INBlgEhaIHP+FtI4EQgGM
	 HeMHZe2P5ZRnt+dyeK5L2ccnq7j9LkMTk5i/gxXlZRnU2Dg6mp8EQkPDj/y1TlErmO
	 OYoBgtQE/UA4tNf9LKkRVvxcFpS25ORJtn91rl4hORyRpitrNYCSljF281CFGKsT/7
	 P30E3zGReT/ZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 930AC839DB;
	Fri, 12 Jun 2026 16:35:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BD76212F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2D1341998
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 96smb9WUbD6O for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 16:35:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1C7A4062B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1C7A4062B
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:35:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74C028811C; Fri, 12 Jun 2026 16:35:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jun 2026 18:34:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1deac1ac39e79eb8f37dc276710c70d135cf4d31
X-Git-Newrev: 8e5477637d8df63036439159956131bd5def4eaa
X-Patchwork-Hint: ignore
Message-Id: <20260612163502.74C028811C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libavif: bump to version 1.4.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8e5477637d8df63036439159956131bd5def4eaa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The most interesting changes are fixes for a memory leak, and for a
couple of crashes. Otherwise, it is an incremental update. Release
notes:

  https://github.com/AOMediaCodec/libavif/releases/tag/v1.4.2

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libavif/libavif.hash | 2 +-
 package/libavif/libavif.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libavif/libavif.hash b/package/libavif/libavif.hash
index 4f9d899d27..8a37e5ba19 100644
--- a/package/libavif/libavif.hash
+++ b/package/libavif/libavif.hash
@@ -1,3 +1,3 @@
-sha256  d4aea31a4becb3273ba7968221be2e48148ba05eb8a68d14e671963e17785648  libavif-1.4.1.tar.gz
+sha256  2b645287340ba5a631d268b551dc2d72bd73ac33335962dd36dcdb6d8366921d  libavif-1.4.2.tar.gz
 
 sha256  165abf92cc04b39e80d29cadea7a6a7e8fddf59407d4ad2616507a7ebe8216f9  LICENSE
diff --git a/package/libavif/libavif.mk b/package/libavif/libavif.mk
index 8bd130fd65..7f178d0ff4 100644
--- a/package/libavif/libavif.mk
+++ b/package/libavif/libavif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBAVIF_VERSION = 1.4.1
+LIBAVIF_VERSION = 1.4.2
 LIBAVIF_SITE = $(call github,AOMediaCodec,libavif,v$(LIBAVIF_VERSION))
 LIBAVIF_LICENSE = BSD-2-Clause, IJG, Apache-2.0
 LIBAVIF_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
