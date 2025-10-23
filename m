Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75512CCD193
	for <buildroot@archiver.kernel.org>; Thu, 23 Oct 2025 19:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20C8D84A06;
	Thu, 23 Oct 2025 19:57:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IhjP0Hxnq5ax; Thu, 23 Oct 2025 19:57:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07E4B84A13
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07E4B84A13;
	Thu, 23 Oct 2025 19:57:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 491EC43F
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 19:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B65E40FD7
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 19:57:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AIKZmQ8B7qBc for <buildroot@buildroot.org>;
 Thu, 23 Oct 2025 19:56:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EC5740925
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EC5740925
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 19:56:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89DA6877AB; Thu, 23 Oct 2025 19:56:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Oct 2025 21:39:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dea4f02bbb24b2125df6f4aa7a4b301a2316ef06
X-Git-Newrev: 7d95c34d64505214d56e452abc1f3502323266af
X-Patchwork-Hint: ignore
Message-Id: <20251023195659.89DA6877AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dante: security bump version to
 1.4.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d95c34d64505214d56e452abc1f3502323266af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: http://www.inet.no/dante/announce-1.4.4

Fixes CVE-2024-54662: https://www.inet.no/dante/advisory-2024-12-16.txt

Needed for bump of libminiupnpc to version 2.3.3.

Updated license hash due to copyright year bump:
https://github.com/notpeter/dante/commit/53727f08eec6cae55c4ed6efb88c3d688839f2cb
(commit taken from unofficial mirror)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dante/dante.hash | 4 ++--
 package/dante/dante.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dante/dante.hash b/package/dante/dante.hash
index a76018fdb6..c9d86608d9 100644
--- a/package/dante/dante.hash
+++ b/package/dante/dante.hash
@@ -1,5 +1,5 @@
 # From https://www.inet.no/dante/download.html
-sha256  418a065fe1a4b8ace8fbf77c2da269a98f376e7115902e76cda7e741e4846a5d  dante-1.4.3.tar.gz
+sha256  1973c7732f1f9f0a4c0ccf2c1ce462c7c25060b25643ea90f9b98f53a813faec  dante-1.4.4.tar.gz
 
 # Hash for license file
-sha256  05e2db26147a8575005f090aada119ea6cb40a4382164929d647f00abef3bdfd  LICENSE
+sha256  49034b51407f6e51a07aed87c3c00c0889294348cd5e99d78d6b6f62746ff3fc  LICENSE
diff --git a/package/dante/dante.mk b/package/dante/dante.mk
index bae46c5a71..2f4e75d1e5 100644
--- a/package/dante/dante.mk
+++ b/package/dante/dante.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DANTE_VERSION = 1.4.3
+DANTE_VERSION = 1.4.4
 DANTE_SITE = http://www.inet.no/dante/files
 DANTE_LICENSE = BSD-3-Clause
 DANTE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
