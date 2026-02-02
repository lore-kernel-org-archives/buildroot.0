Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A23EE7FDD0
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 21:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69B3C605E5;
	Mon,  2 Feb 2026 21:10:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 37_InIR4QRs7; Mon,  2 Feb 2026 21:10:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A6FB60735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770066618;
	bh=fzZXUNHQ+2xV9Ttw5qlmpduzvSeURfIo2LhqBHNviNM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bJpnfacXnZyyQdIcfGDpkOs9i74E7/nxD3KYnwtS+btdJTas9exseGls0BTSzXkQU
	 BKWSteJosK3wizjosyNGRRkZF5uWGEkXgfPD/lzKASnqwVzwhs5DqFAjvlJtuNWIuW
	 56258XfQkLKp8ymBA+X95x+iX2uCPPG3HLLNCkZSGn5z2R7PQkDqpRKwAKvJhGiSyD
	 yKPs9WnZwF910hwIUn3uABMW6wqCtJumhekoUJd7dzFN3tzIJpoRnnBKVLp+Fyig9T
	 8cUBpUh5HtsN+X3s2GNetS6bV5S6NWdt950qed2uqrcQiVJPBNU+b/F5RBwdbH/v6S
	 a4dknpzqg03/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A6FB60735;
	Mon,  2 Feb 2026 21:10:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F8CD149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31A8D40265
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:10:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzHx8Li2EbvI for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 21:10:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D20B400A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D20B400A7
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:10:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45159864B0; Mon,  2 Feb 2026 21:10:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 21:59:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b27ee684b1aa9e799bad6dee449d2c56739ba48c
X-Git-Newrev: 1b3bdcf75ecefb98a3d2c9203c7c8ad45a620029
X-Patchwork-Hint: ignore
Message-Id: <20260202211016.45159864B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ell: bump version to 0.81
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b3bdcf75ecefb98a3d2c9203c7c8ad45a620029
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog?h=0.81

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index 418d1a9a2a..034ab74c4b 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
-sha256  28dabdb1966fd2e47363c44e041de507e9420411b846947efa01b4cb0cda0d6b  ell-0.79.tar.xz
+sha256  672ca1e44dc0ddce1665941754b4e2b3b9203481d7d7a60e0b5f39829d73fa14  ell-0.81.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index a0ae7a68c8..db9dc80366 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.79
+ELL_VERSION = 0.81
 ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
 ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
