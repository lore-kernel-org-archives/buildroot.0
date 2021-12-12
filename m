Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51104C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14AE542050;
	Sun, 12 Dec 2021 12:22:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id scGTWBTp4qnQ; Sun, 12 Dec 2021 12:22:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 810374204B;
	Sun, 12 Dec 2021 12:22:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F7FF1BF973
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C79D429A3
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LK8Oy34MvoII for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:22:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 557C341E40
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:22:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9E61582B71; Sun, 12 Dec 2021 12:17:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 13:21:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca39eb212e32ca209cb3d6011847f9c94641fa73
X-Git-Newrev: 8edd281c39202db33c8e3039e0500df55fcf34be
X-Patchwork-Hint: ignore
Message-Id: <20211212121714.9E61582B71@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/midori: use official tarball
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

commit: https://git.buildroot.net/buildroot/commit/?id=8edd281c39202db33c8e3039e0500df55fcf34be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/midori/midori.hash | 2 +-
 package/midori/midori.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/midori/midori.hash b/package/midori/midori.hash
index d0be396a5a..f14ec6d929 100644
--- a/package/midori/midori.hash
+++ b/package/midori/midori.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  913a7cba95ddcc3dc5f6b12d861e765d6fa990fe7d4efc3768d3a3567ea460db  midori-9.0.tar.gz
+sha256  5e0a531455c47b0ff7589940aa2b0d9c16f59c99ba933e5fcdcab68114262016  midori-v9.0.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 693507dbb3..aeafa9bfdc 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 MIDORI_VERSION = 9.0
-MIDORI_SITE = $(call github,midori-browser,core,v$(MIDORI_VERSION))
+MIDORI_SOURCE = midori-v$(MIDORI_VERSION).tar.gz
+MIDORI_SITE = https://github.com/midori-browser/core/releases/download/v$(MIDORI_VERSION)
 MIDORI_LICENSE = LGPL-2.1+
 MIDORI_LICENSE_FILES = COPYING
 MIDORI_CPE_ID_VENDOR = midori-browser
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
