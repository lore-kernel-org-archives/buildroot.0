Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E98FD9E12
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D71460774;
	Thu, 26 Feb 2026 20:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4uvEKZHfRe_3; Thu, 26 Feb 2026 20:45:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10FD960726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138736;
	bh=2Oz46xLowO0yYD6Ch5qny9S9dF4rjixeXj3GjQtUjL0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W4DH7YMkwO12SPE3e7z1ac5dOh/Gc+lMhDdATFj4kHNuSvINmv5KN5VE7FWD25oiN
	 d6xC7V4izHcr+PX4zr98/0vAojelTSM9CzzSYK+0mqBpwdk8ZInkvn6TyzmvXsAG12
	 J4kJkfHG/KfvGPugG3d+JnaJdTcnHxoEPZAPfVZX28cF7TQfJUhLamOR/hwduHflol
	 74PuGMrL2t1BhznAzUQPH60+1zZVKG4aFSs0385GMywgDuiL0V9wkgPU16gDCrnLEj
	 M9qr62CZr0/t9JSfk1RtkdKmwTB0fHA5z04EYXhS3Bxn4Soo+K6MzI+pfXY8Z7bUOh
	 MqENcNBBPlceQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10FD960726;
	Thu, 26 Feb 2026 20:45:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 434DB23D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FCCD81191
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ZdZCACY5Ncv for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:45:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3A6481195
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3A6481195
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:45:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C996787558; Thu, 26 Feb 2026 20:45:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 10:25:30 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 2d9a63218deace52df6473ffb971c83b7d333e85
X-Git-Newrev: ede94f1b9a7671cc60c3c88de78f0a08c6c76805
X-Patchwork-Hint: ignore
Message-Id: <20260226204529.C996787558@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libzlib: security
 bump version to 1.3.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ede94f1b9a7671cc60c3c88de78f0a08c6c76805
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

https://github.com/madler/zlib/releases/tag/v1.3.2
https://github.com/madler/zlib/blob/v1.3.2/ChangeLog
https://7asecurity.com/blog/2026/02/zlib-7asecurity-audit/

Updated license hash due to copyright year bumps:
https://github.com/madler/zlib/commit/570720b0c24f9686c33f35a1b3165c1f568b96be
https://github.com/madler/zlib/commit/9e35567064baded660f61732b247ef5abc809014

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 06b964b362b1b30cc346145c38e2a4aad78d0eec)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libzlib/libzlib.hash | 4 ++--
 package/libzlib/libzlib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libzlib/libzlib.hash b/package/libzlib/libzlib.hash
index cbd9313870..bc8b046426 100644
--- a/package/libzlib/libzlib.hash
+++ b/package/libzlib/libzlib.hash
@@ -1,4 +1,4 @@
 # From http://www.zlib.net/
-sha256  38ef96b8dfe510d42707d9c781877914792541133e1870841463bfa73f883e32  zlib-1.3.1.tar.xz
+sha256  d7a0654783a4da529d1bb793b7ad9c3318020af77667bcae35f95d0e42a792f3  zlib-1.3.2.tar.xz
 # License files, locally calculated
-sha256  845efc77857d485d91fb3e0b884aaa929368c717ae8186b66fe1ed2495753243  LICENSE
+sha256  e32ff4e00d9d94930537635291da39e7e612703334bf6fde8c7f1686fe8a45a2  LICENSE
diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index bc5092d9a9..c73328deee 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZLIB_VERSION = 1.3.1
+LIBZLIB_VERSION = 1.3.2
 LIBZLIB_SOURCE = zlib-$(LIBZLIB_VERSION).tar.xz
 LIBZLIB_SITE = https://www.zlib.net
 LIBZLIB_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
