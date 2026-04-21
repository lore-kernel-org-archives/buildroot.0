Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0FAF94CAA
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 20:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1631B4128E;
	Tue, 21 Apr 2026 20:31:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OISVF6RVt2t4; Tue, 21 Apr 2026 20:31:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 278CF41FB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776803468;
	bh=nXIR42fcK68YRWBtK1gkKv+Vs0vAbZ5v8lUclFoUqp4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q6IGp+Yf33TjyBjUyJuEHzkKcyBiDJv1Snq4Acg4NbxbBwHfj9Fv2C3yVOhywM8JL
	 GTdt2LD9HCdQDnsa6kFBg4g+pGcWrAIVixxaabqc24pJbY56Y6+MMIRydTmGK0A60C
	 iVi9/Ttldfrb8Sqdy3iECwBf5pOW5pVyiEqTSYjdXuyeMY81EstPt0ifDsigQenPxL
	 1nepIP0250ISD7ml7Hf6m1mIDj5Lr42NS+wm0x3yfDl8JA7MYbsFab7YiHT8Ofb1Cv
	 +nJujCXunIhS+lyAEj8cmhe+H6nwhdWUSBra2GNYRnVeX0C9UtB6gMCKxfivX6KkjI
	 R+7Yb52tiBy/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 278CF41FB7;
	Tue, 21 Apr 2026 20:31:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44EEA183
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 20:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B3C2838D3
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 20:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sDgC3bz51kVr for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 20:31:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5DEA8387D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5DEA8387D
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 20:31:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B6C4821D7; Tue, 21 Apr 2026 20:31:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Apr 2026 22:26:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92746d0dea25125bbda6359dcbeb2f90b192eeef
X-Git-Newrev: 80898249b7e06d409a8a9cd433d687ce24c5224f
X-Patchwork-Hint: ignore
Message-Id: <20260421203103.5B6C4821D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libspdm: security bump version to
 3.8.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/80898249b7e06d409a8a9cd433d687ce24c5224f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/DMTF/libspdm/releases/tag/3.8.2

This release brings a fix for the security issues described in
https://github.com/DMTF/libspdm/security/advisories/GHSA-j54w-759w-xj3m
https://github.com/DMTF/libspdm/security/advisories/GHSA-m4wc-xmvg-369f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libspdm/libspdm.hash | 2 +-
 package/libspdm/libspdm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libspdm/libspdm.hash b/package/libspdm/libspdm.hash
index 1c7b6b3158..0e281a5471 100644
--- a/package/libspdm/libspdm.hash
+++ b/package/libspdm/libspdm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2184a586bfe030218c6f336750d0fb0c3747fcfb0ed8af9a921bccb567029671  libspdm-3.8.1.tar.gz
+sha256  8d53d5072540ff86ffe496d83b83f49c82792883738bd23ae6ad41fe7c773edf  libspdm-3.8.2.tar.gz
 sha256  8c891ecf439cca84ceab33fc819c029a72c198f31818aa53a3788a0553841d6e  LICENSE.md
diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
index f76262c77b..fc3eea424e 100644
--- a/package/libspdm/libspdm.mk
+++ b/package/libspdm/libspdm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSPDM_VERSION = 3.8.1
+LIBSPDM_VERSION = 3.8.2
 LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
 LIBSPDM_LICENSE = BSD-3-Clause
 LIBSPDM_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
