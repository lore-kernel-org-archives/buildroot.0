Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E272C25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 06:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 150CA60874;
	Mon, 27 May 2024 06:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zituzWcEHQxx; Mon, 27 May 2024 06:03:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC8D6608B2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC8D6608B2;
	Mon, 27 May 2024 06:03:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 205FB1D187A
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 06:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5E35401F1
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 06:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKihmlAKmTCK for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 06:03:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28EED405D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28EED405D7
 for <buildroot@buildroot.org>; Mon, 27 May 2024 06:03:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2535187634; Mon, 27 May 2024 06:03:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 May 2024 07:59:56 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 40205fa62b4fa578b9158810c0681f665142fb2f
X-Git-Newrev: 944a5d556af613792a2edd3491a9a4747f6dbc5d
X-Patchwork-Hint: ignore
Message-Id: <20240527060333.2535187634@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/liburiparser:
 security bump to version 0.9.8
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=944a5d556af613792a2edd3491a9a4747f6dbc5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

- Fixed: [CVE-2024-34402]
    Protect against integer overflow in ComposeQueryEngine
- Fixed: [CVE-2024-34403]
    Protect against integer overflow in ComposeQueryMallocExMm

https://github.com/uriparser/uriparser/blob/uriparser-0.9.8/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6fe29e41ccd6682bca48b0d9d206ae3a631339f0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/liburiparser/liburiparser.hash | 2 +-
 package/liburiparser/liburiparser.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
index 73b4ec6867..f2e3317897 100644
--- a/package/liburiparser/liburiparser.hash
+++ b/package/liburiparser/liburiparser.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1ddae35cb3cc2c36e8199829d46f1c7f8b222e74a723fdae67ec8561e1ac5a39  uriparser-0.9.7.tar.xz
+sha256  1d71c054837ea32a31e462bce5a1af272379ecf511e33448e88100b87ff73b2e  uriparser-0.9.8.tar.xz
 sha256  287f09e6546a9610f949f89e8fb937cacfeabd7bfaa8c8a0c18312193bf04ad3  COPYING
diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
index 6d25b1d9bb..b0ba8c387b 100644
--- a/package/liburiparser/liburiparser.mk
+++ b/package/liburiparser/liburiparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURIPARSER_VERSION = 0.9.7
+LIBURIPARSER_VERSION = 0.9.8
 LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.xz
 LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
 LIBURIPARSER_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
