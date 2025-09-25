Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECF9CAC5B9
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAEF441609;
	Thu, 25 Sep 2025 20:30:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RuKD3F-hudRM; Thu, 25 Sep 2025 20:30:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE1DF41775
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE1DF41775;
	Thu, 25 Sep 2025 20:30:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03FB0177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB731416A3
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLoJjmPx67XD for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:30:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31ABD41605
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31ABD41605
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FBFA86433; Thu, 25 Sep 2025 20:30:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 16:44:17 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: a663637bea23ca79631986a834a4a7c424efe9b9
X-Git-Newrev: b25b1e2a051f8013157f5fe6ae92382dd73ab664
X-Patchwork-Hint: ignore
Message-Id: <20250925203023.2FBFA86433@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/atop: security
 bump to version 2.11.1
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b25b1e2a051f8013157f5fe6ae92382dd73ab664
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

This bump includes the security fix for CVE-2025-31160.

Release notes:
https://www.atoptool.nl/downloadatop.php

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-31160

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Julien:
 - add "security" in commit log title
 - add link to CVE
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 45e7fe281160fe645e26ad58775aa5e384dbf222)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/atop/atop.hash | 2 +-
 package/atop/atop.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/atop/atop.hash b/package/atop/atop.hash
index 8774fb577d..8f0cb69581 100644
--- a/package/atop/atop.hash
+++ b/package/atop/atop.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  9b94c666602efff7bf402ecce706c347f38c39cb63498f9d39626861e5646e20  atop-2.11.0.tar.gz
+sha256  77650f79f9e388b6f5666dc113849894575a29bb4de21b8cd58767bf8a905154  atop-2.11.1.tar.gz
 
 # Hash for license file:
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index f7dfed5e8d..155dec6177 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATOP_VERSION = 2.11.0
+ATOP_VERSION = 2.11.1
 ATOP_SITE = http://www.atoptool.nl/download
 ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
