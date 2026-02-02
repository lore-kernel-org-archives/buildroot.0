Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BA5E7FDE0
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 22:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1295440A18;
	Mon,  2 Feb 2026 22:15:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0KFX47LSOPMj; Mon,  2 Feb 2026 22:15:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB09240870
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770070510;
	bh=nARlBglrJL6zJUUdcjwveA0Y7ZDAmtFBIKOWPypvfEM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XrjFwUPaAo8sQ3gRkm2XQcgWKCs7QyjsnzkIgnXAMzkFZBchWhxw2AXlxpHM4KKYZ
	 XC1mpNfhHE+4ryaoLB8qkAlN39pzmgo0wKEkU7j3ropfSX60Grix9Akw/dT65daYsV
	 innibAc8AtS2B5M8egNWhN/WbENBwcyKJUT0R1/kbAxeS09FnOUxove1441Ql9aziV
	 2+hgubgGs2fG75IX5P/L3Qx2HRL+bqjOjX22bXWgTFEidgzOm3E8jnqMpuPjl60sqJ
	 YYhhLPpX+ywyBP2bzaf+TTA2wIEqPCsNIpnm75HujSG14jNg+YBGQm76oRV/UOUUcd
	 iIqI3Q6/9wWUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB09240870;
	Mon,  2 Feb 2026 22:15:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E7ED9F4
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D561C607AB
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IprpC2Vqtblr for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 22:15:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD3BB6078E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD3BB6078E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:15:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 984CD864F0; Mon,  2 Feb 2026 22:15:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 23:14:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 656fc0f78e9f225136a0161998b328902ca514d2
X-Git-Newrev: bfa918c12a4fa098409c92f15ce62ce270ecf6b2
X-Patchwork-Hint: ignore
Message-Id: <20260202221504.984CD864F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uacme: bump version to 1.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=bfa918c12a4fa098409c92f15ce62ce270ecf6b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change log at
https://github.com/ndilieto/uacme/blob/upstream/1.8.0/ChangeLog

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uacme/uacme.hash | 2 +-
 package/uacme/uacme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uacme/uacme.hash b/package/uacme/uacme.hash
index 26b73ef950..c384d1ed03 100644
--- a/package/uacme/uacme.hash
+++ b/package/uacme/uacme.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d11a86ac2a0dbf285de27dff4193c65f7f3736da3d0480049af50d305940e0d6  uacme-1.7.6.tar.gz
+sha256  69170ef84891a0e3ccce50833ac90db75de26b2c8432050256c1bf4ec26c8ad7  uacme-1.8.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index fc5b97d23d..f358025c44 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UACME_VERSION = 1.7.6
+UACME_VERSION = 1.8.0
 # Released versions are on branch upstream/latest, tagged as
 # upstream/X.Y.Z Do not use vX.Y.Z tags from master, as they do not
 # include .tarball-version
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
