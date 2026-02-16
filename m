Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CCEE83837
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 21:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05C1E60E24;
	Mon, 16 Feb 2026 21:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eP96SNqfmY-8; Mon, 16 Feb 2026 21:45:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96F6960E18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771278314;
	bh=4Yz+JrVanXLs788hfjA/pwYJxGWZ+QDpUjySuBYNHvs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e4Tl9WqYdWxDV1oq6Kjok+ZE+MBYAkaZHNJ4CwfJIRpYiOgleZstx/bg47gdLZiVZ
	 YzHtGOsxpHs8MNZdR4MZGOhgHwGtFoOfQ+0SUVQBgsWUgrWFcdyOQ9R5SideHSz0hy
	 n5oy12hus3RzTyDj/rUXOQtdfNmGUNh8fQF2yLZUMSLkP4P3+9sDSGo+vdFUuCHiQt
	 lZqRCFeJuc6fTMonoOVbxoQK/hy+FNetRaYknsriJygHOLhXUToA3Al2OMy4h+C5OW
	 XqI/tSkfvulFoEcdrvlwji3hELYFozyJcz59t4jZHqy6XfSMzEDGzmNfs3pSvd94k9
	 WHmXhiKKb0+5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96F6960E18;
	Mon, 16 Feb 2026 21:45:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EBA4F1EB
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 21:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCC7D40C81
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 21:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ysRPDwnh_oRC for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 21:45:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06F5C40C84
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06F5C40C84
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 21:45:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E880F83ACB; Mon, 16 Feb 2026 21:45:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 16 Feb 2026 22:41:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13034387c4ce31eff70dbef5578635a6aa3d4110
X-Git-Newrev: 50d1dec604c21c04bd518109fff0c67e8f7f029b
X-Patchwork-Hint: ignore
Message-Id: <20260216214511.E880F83ACB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: bump version to 3.120.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/50d1dec604c21c04bd518109fff0c67e8f7f029b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/471dd263e131d2f14b3c047bc2f3f5315db9a015/doc/rst/releases/nss_3_120_1.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: fix release notes url in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index dd0724f8c7..f3805fe6b7 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_120_RTM/src/SHA256SUMS
-sha256  7ce5f5b3a172a41539ffc118d8ef4834974d0a6a782743e4a05a4e208dd6d22f  nss-3.120.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_120_1_RTM/src/SHA256SUMS
+sha256  a98f002d20bfe719f50f81824a64c9e6f067f4da3c6a1f0455e97e6d79240512  nss-3.120.1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 5883663873..b1e10749c4 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.120
+LIBNSS_VERSION = 3.120.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
