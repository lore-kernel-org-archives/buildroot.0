Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168A1C61DFD
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 19:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9BE26066A;
	Mon, 31 Aug 2026 19:35:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vYnwNdJLkq_v; Mon, 31 Aug 2026 19:35:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788204926;
	bh=9bxEsoR7nIS5RX/2VA7rRSAx44O3ZBmEgeE//C6Ipik=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VTNZlsYBpnF/G5pUWrIt74PXhtux2MV9DuxzcvplXkdldy2dvoVeKuQJrpkXgpzy9
	 Dsr/aSKMI7+r032bgiCtBhRnQjuBSWCfx2f7vC7DiHnUCF2R6GemFkkmOtv208HG2n
	 9JD++SRu2pTzcCyiFEeBIAVBKW0zxb9uUqwfi5sBxi0ICvHGlB+Iq9KGKtrO5hdciz
	 68fhSw0iULD/Y06z5aVwiHEhSNPPyu5CwltxnD9PaGiggzBKNhSBSJ/ep0c6/ca0Dm
	 e4EuMIMXAILcbRYCtN3jXKfEMIWhQLXdgXNsNVYhQKOw5nF+Ke68XTUz6RaOfz04tE
	 YpisKQtXr1nuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F288D60677;
	Mon, 31 Aug 2026 19:35:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB413127
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 19:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD1034055F
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 19:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YglAAAhAcJan for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 19:35:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1742A403E1
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 19:35:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 697D193462; Mon, 31 Aug 2026 19:34:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 31 Aug 2026 21:30:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 913512e3028159aefb4b26062ee11b960e6e24a2
X-Git-Newrev: 3577d1442efc8b6cdc396008bf867845319d508a
X-Patchwork-Hint: ignore
Message-Id: <20260831193425.697D193462@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/proftpd: security bump version to
 1.3.9d
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3577d1442efc8b6cdc396008bf867845319d508a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/proftpd/proftpd/blob/v1.3.9d/NEWS

Version 1.3.9b fixes CVE-2026-44331.

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/proftpd/proftpd.hash | 3 ++-
 package/proftpd/proftpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/proftpd/proftpd.hash b/package/proftpd/proftpd.hash
index 9ec632884c..1c81240d81 100644
--- a/package/proftpd/proftpd.hash
+++ b/package/proftpd/proftpd.hash
@@ -1,3 +1,4 @@
+# From https://github.com/proftpd/proftpd/releases/download/v1.3.9d/proftpd-1.3.9d.tar.gz.sha256
+sha256  68b094b1c57c775ad00ef469e9a87783dbbf31a85f98f48faf60becc2e84e4ec  proftpd-1.3.9d.tar.gz
 # Locally calculated
-sha256  bc3c7c47033ecff29f010efc18315d5906eb942d2e673ebce0138a96f11af0b4  proftpd-1.3.9a.tar.gz
 sha256  391a473d755c29b5326fb726326ff3c37e42512f53a8f5789fc310232150bf80  COPYING
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index ba026f5dd1..e3216ed802 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROFTPD_VERSION = 1.3.9a
+PROFTPD_VERSION = 1.3.9d
 PROFTPD_SITE = https://github.com/proftpd/proftpd/archive/v$(PROFTPD_VERSION)
 PROFTPD_LICENSE = GPL-2.0+
 PROFTPD_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
