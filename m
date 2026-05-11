Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248FCCD484E
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 19:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFE2360681;
	Mon, 11 May 2026 19:19:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZmqODNfQDIPW; Mon, 11 May 2026 19:19:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B686060679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778527163;
	bh=v1kCd/vJHn87BVttbFFH2unCMyejAHS9k7II0BTWdBQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QeAIIXcUXwMhStBhmMifXqtkXLJa03FWd+Zz9m2ojWyid8sIKY5cTkbXSufYmhoTo
	 Z9mk1miVMhRGRJNFas3byM7B1FbXtaVwpPirNjNZMMG3blHyIQbFXnOl2KlG/zRQ70
	 0AiMXtha8I5OXj8z4+sPqt+RSJ2ucBDuHqdNHyRn+MU4FeMPKLThZQdwSNpkBieIpH
	 4197Ggadk8foqaYcgyNKNYpW5YnC+0Yh41gEcvwDUrdUl0OquAC0yecrUTba91bSql
	 v7qcX3RQJ2yZSzgBqb1c1g/faLdnDGZLiCfZWq1WjLNmU4+Xp05FlwsIZQhSH19/s/
	 x6tPANU/0welA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B686060679;
	Mon, 11 May 2026 19:19:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 275A6173
 for <buildroot@buildroot.org>; Mon, 11 May 2026 19:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D65080DD9
 for <buildroot@buildroot.org>; Mon, 11 May 2026 19:19:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zboH7LrEL_QK for <buildroot@buildroot.org>;
 Mon, 11 May 2026 19:19:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B24980D8B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B24980D8B
 for <buildroot@buildroot.org>; Mon, 11 May 2026 19:19:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4EC9885E19; Mon, 11 May 2026 19:19:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 11 May 2026 21:16:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6be9c7e9cfa90ff465fca6de4c2802149dcf722d
X-Git-Newrev: 3563ae95863b52e51837779f3bd8bbb92c20dcba
X-Patchwork-Hint: ignore
Message-Id: <20260511191918.4EC9885E19@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dash: bump to version 0.5.13.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3563ae95863b52e51837779f3bd8bbb92c20dcba
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log, see:
https://git.kernel.org/pub/scm/utils/dash/dash.git/log/?h=6a1533f24b646364ad514c542292b5c85b2adabf

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dash/dash.hash | 6 +++---
 package/dash/dash.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dash/dash.hash b/package/dash/dash.hash
index 95e6b440c0..3f7a9a0b32 100644
--- a/package/dash/dash.hash
+++ b/package/dash/dash.hash
@@ -1,5 +1,5 @@
-# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.3.tar.gz.sha512sum
-sha512  4f463ea9d9bd72cb9852578a43ce04a211e2e775782f4cb6b2af328d51f80fcf9cff3255c519f60027f7b0d8b9d3c9ebed100925bf6324bbef81381ebd3c77ae  dash-0.5.13.3.tar.gz
+# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.4.tar.gz.sha512sum
+sha512  383d0ea8316fea3ce523dc535173a94a22e58bfaec2dec3309d3496a864e5e67711965563db82e7e181f8d7b67a25033107b4c9453c3d6b3820c6586d1f99675 dash-0.5.13.4.tar.gz
 # Locally calculated
-sha256  a83727c1299ac4c3d9d43979393b3a4eb00275d5636ae02526e7979d51d6fbd1  dash-0.5.13.3.tar.gz
+sha256  d10dfd41cda59165560db39ca915c2c4a7636fff04281d8d2df77ad92c753e2b  dash-0.5.13.4.tar.gz
 sha256  254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72  COPYING
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 8c9224782c..2b33433813 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DASH_VERSION = 0.5.13.3
+DASH_VERSION = 0.5.13.4
 DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
