Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257D5E92734
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 14:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06C2760AF9;
	Mon, 29 Dec 2025 14:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 55-QACj3SjrL; Mon, 29 Dec 2025 14:55:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5CAE60823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767020143;
	bh=KxWAdgrA+3tS/U+dLEDZaTn3rceaazKYV5WKUafN7X0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=luYyv5ERpQPK3kkgDMrwPkgFY9+47W0FrZctCVYt+L8PwOTUqSVDqm7S7e5Q2y/1B
	 W+fVfN3EA8w8pKyZLXzJjHuNOL04uingetdlgvI44bkduKxiTcdmFXvDl1xbJ+wELp
	 Mkam2aeZxFqVM0jh/0bxxZnKGEeyES4zUdfPvUF7tjdba+7u9M1QcQpomRBJSg1xdu
	 b2EofhF+B2RQFgbfpygVYtZtfK9bZXh1wwDT2v4rUELCzlx2RnPb2hWmKF+PpimP+7
	 9hw0v7DlHOQfX5xrHvKzPTFl/9unpv79P7D/cbCoN+iYx2udonqW/KNQv0sYClLuhZ
	 OfGyCVrtZrYqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5CAE60823;
	Mon, 29 Dec 2025 14:55:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D26BF177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B858360823
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1t-EZGJv3wB for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 14:55:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06AD1607DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06AD1607DB
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:55:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB25487B52; Mon, 29 Dec 2025 14:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 15:42:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 259073938b149383c4c1e66bfe62e0616a0e8855
X-Git-Newrev: bfca06b350fa3c0a48af38f89ccfc04c70c3f946
X-Patchwork-Hint: ignore
Message-Id: <20251229145541.EB25487B52@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpg123: bump version to 1.33.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=bfca06b350fa3c0a48af38f89ccfc04c70c3f946
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://www.mpg123.org/cgi-bin/news.cgi

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mpg123/mpg123.hash | 6 +++---
 package/mpg123/mpg123.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index 2fc0061476..eed62fa538 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/mpg123/files/mpg123/1.33.3/
-sha1  41dd15e29668a8e1372d31f327c8962a8ef6b595  mpg123-1.33.3.tar.bz2
+# From https://sourceforge.net/projects/mpg123/files/mpg123/1.33.4/
+sha1  30cf7f77bd1704448db89af6a6d75904572c4dcb  mpg123-1.33.4.tar.bz2
 # Locally calculated
-sha256  6a0c6472dd156e213c2068f40115ebbb73978c2d873e66bae2a250e2d2198d26  mpg123-1.33.3.tar.bz2
+sha256  3ae8c9ff80a97bfc0e22e89fbcd74687eca4fc1db315b12607f27f01cb5a47d9  mpg123-1.33.4.tar.bz2
 # License file
 sha256  c22482728a634a8dfdb4ff72a96d4c1ed64cd8f3e79335c401751ac591609366  COPYING
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 5e55d33b72..2f04e0f979 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.33.3
+MPG123_VERSION = 1.33.4
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = https://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
