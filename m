Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABCEC54E71
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 20:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBFF960787;
	Tue, 20 May 2025 20:57:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9IKsCbLJwlU3; Tue, 20 May 2025 20:57:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E44C6078C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E44C6078C;
	Tue, 20 May 2025 20:57:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 64A3CD4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 20:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56D1A40140
 for <buildroot@buildroot.org>; Tue, 20 May 2025 20:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JDQsWRDK135n for <buildroot@buildroot.org>;
 Tue, 20 May 2025 20:57:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 755454013F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 755454013F
 for <buildroot@buildroot.org>; Tue, 20 May 2025 20:57:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E402874F5; Tue, 20 May 2025 20:57:22 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 20 May 2025 22:50:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37a715969f778322861a577ab345d364b2df8d97
X-Git-Newrev: e5b4518319201d2391411e290c61672590f72d98
X-Patchwork-Hint: ignore
Message-Id: <20250520205722.6E402874F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/casync-nano: bump to version 1.1.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e5b4518319201d2391411e290c61672590f72d98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build issues when building against LibreSSL in particular:
https://github.com/florolf/casync-nano/releases/tag/v1.1.2

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/casync-nano/casync-nano.hash | 2 +-
 package/casync-nano/casync-nano.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/casync-nano/casync-nano.hash b/package/casync-nano/casync-nano.hash
index 1697fa93ef..e2aee71c20 100644
--- a/package/casync-nano/casync-nano.hash
+++ b/package/casync-nano/casync-nano.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  29ed8a767304e7e3032e66feea3d2dada7cc7db73344231a54bf080cc6e65ecf  casync-nano-1.1.1.tar.gz
+sha256  1a8ce3247985e05fbb08097966ff11fc2abd0a1f18fb7178e7397c2455b9500f  casync-nano-1.1.2.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/casync-nano/casync-nano.mk b/package/casync-nano/casync-nano.mk
index e492627fa3..fc3a80e4f4 100644
--- a/package/casync-nano/casync-nano.mk
+++ b/package/casync-nano/casync-nano.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CASYNC_NANO_VERSION = 1.1.1
+CASYNC_NANO_VERSION = 1.1.2
 CASYNC_NANO_SITE = $(call github,florolf,casync-nano,v$(CASYNC_NANO_VERSION))
 CASYNC_NANO_LICENSE = LGPL-2.1
 CASYNC_NANO_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
