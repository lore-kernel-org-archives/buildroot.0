Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E31C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 21:59:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A52AE6159A
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 21:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A52AE6159A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85577405C4;
	Mon,  4 Oct 2021 21:59:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fNVh3-k8kV5h; Mon,  4 Oct 2021 21:59:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D99CC405BC;
	Mon,  4 Oct 2021 21:59:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 88FB11BF20F
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 21:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FE0F400F3
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 21:57:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KbIV2iEbIdEs for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 21:57:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7087B402AF
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 21:57:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 45F0A8F2BA; Mon,  4 Oct 2021 21:54:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Oct 2021 23:44:03 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 5387888188fd87d7459cd571a9e671223add7545
X-Git-Newrev: 61c7c12ac3116e920c72c7fb356e27be6868bc3c
X-Patchwork-Hint: ignore
Message-Id: <20211004215448.45F0A8F2BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/lynx: add
 security patch for CVE-2021-38165
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

commit: https://git.buildroot.net/buildroot/commit/?id=61c7c12ac3116e920c72c7fb356e27be6868bc3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Lynx through 2.8.9 mishandles the userinfo subcomponent of a URI, which
allows remote attackers to discover cleartext credentials because they may
appear in SNI data.

https://lists.nongnu.org/archive/html/lynx-dev/2021-08/msg00002.html

Upstream unfortunately does not provide a public VCS (only source
snapshots), so fetch the security patch from Debian.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 5bb9d79f276551c8fb7a774d8c7bd0f47a9e9809)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lynx/lynx.hash | 1 +
 package/lynx/lynx.mk   | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/lynx/lynx.hash b/package/lynx/lynx.hash
index 76d7614a7c..62e2555a99 100644
--- a/package/lynx/lynx.hash
+++ b/package/lynx/lynx.hash
@@ -1,3 +1,4 @@
 # Locally calculated:
 sha256  387f193d7792f9cfada14c60b0e5c0bff18f227d9257a39483e14fa1aaf79595  lynx2.8.9rel.1.tar.bz2
+sha256  b2207e757dbbefc34a20a32b1b4a216b4a4316e1dc812bceca4ac6294871119a  90_CVE-2021-38165.patch
 sha256  8406a30ff3134ec23cf752d1ceda92ddaabbe41b4f2dc07ea3cfa139de12d6d6  COPYING
diff --git a/package/lynx/lynx.mk b/package/lynx/lynx.mk
index d115682d64..44d52d90a5 100644
--- a/package/lynx/lynx.mk
+++ b/package/lynx/lynx.mk
@@ -7,6 +7,10 @@
 LYNX_VERSION = 2.8.9rel.1
 LYNX_SOURCE = lynx$(LYNX_VERSION).tar.bz2
 LYNX_SITE = ftp://ftp.invisible-island.net/lynx/tarballs
+LYNX_PATCH = \
+	https://salsa.debian.org/lynx-team/lynx/-/raw/debian/2.9.0dev.6-3_deb11u1/debian/patches/90_CVE-2021-38165.patch
+# 90_CVE-2021-38165.patch
+LYNX_IGNORE_CVES += CVE-2021-38165
 LYNX_LICENSE = GPL-2.0
 LYNX_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
