Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFF8C369C2
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 16:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08CF480AAF;
	Fri, 25 Apr 2025 16:42:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hKnXYPyGR7jA; Fri, 25 Apr 2025 16:42:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D11B80AF0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D11B80AF0;
	Fri, 25 Apr 2025 16:42:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EB265159
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D145D4038D
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:42:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JjFHVG0tne1R for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 16:42:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0BC9F4034E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BC9F4034E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0BC9F4034E
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:42:00 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id AA956B00583;
 Fri, 25 Apr 2025 18:41:56 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 25 Apr 2025 18:41:46 +0200
Message-ID: <20250425164146.1723966-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745599319;
 bh=+8Kb8onO5r8RncDHjMFAo2yB7quuqDuFYSIo30/njpE=;
 h=From:To:Cc:Subject:Date:From;
 b=DVdbGQqeBi7be3cEZ128q7+Fann7rj8WeYlxAAUugX7LZ97HNOnnLzKJNoNMdJ5sa
 setQabaTxZ7yvzlWw+8pvJK+/3BLuCB8O4M9GCIiPLzjniOVxG30N0CIrA5+IZbOxa
 po/peEO6p06Z8wtH/u200tNvl9ocLnJXUafk80vxRB8AjwDla0CslfoKR7XzcgIVCC
 awdvC4c51Q/81AaeAplbXE6faMcSiezr+qbOpwGTIMFzukcRUTsDF7CpyYBy8fUkgR
 cyON5P5TTcnel7EOoFybqFZhBbba2yc8d1zSGteHzgzJLo2cfR+r60He9xtqMy0N2D
 5iPeII9T8wPAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DVdbGQqe
Subject: [Buildroot] [PATCH 1/1] package/libdmtx: bump to version 0.7.8
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see:
https://github.com/dmtx/libdmtx/compare/v0.7.7...v0.7.8

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/pipelines/1786739544
---
 package/libdmtx/libdmtx.hash | 2 +-
 package/libdmtx/libdmtx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libdmtx/libdmtx.hash b/package/libdmtx/libdmtx.hash
index 8b176d737a..5ae4557db0 100644
--- a/package/libdmtx/libdmtx.hash
+++ b/package/libdmtx/libdmtx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7aa62adcefdd6e24bdabeb82b3ce41a8d35f4a0c95ab0c4438206aecafd6e1a1  libdmtx-0.7.7.tar.gz
+sha256  2394bf1d1d693a5a4ca3cfcc1bb28a4d878bdb831ea9ca8f3d5c995d274bdc39  libdmtx-0.7.8.tar.gz
 sha256  fcc277b7302645322c63de22b9b0bdae2df3dfa7d6cbc0d5bed7a4d3f1a9af79  LICENSE
diff --git a/package/libdmtx/libdmtx.mk b/package/libdmtx/libdmtx.mk
index 00d37fb94e..dd691a4af5 100644
--- a/package/libdmtx/libdmtx.mk
+++ b/package/libdmtx/libdmtx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDMTX_VERSION = 0.7.7
+LIBDMTX_VERSION = 0.7.8
 LIBDMTX_SITE = $(call github,dmtx,libdmtx,v$(LIBDMTX_VERSION))
 LIBDMTX_LICENSE = BSD-2-Clause or Special Permission
 LIBDMTX_LICENSE_FILES = LICENSE
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
