Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A27C5CFDB
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21C5360A6D;
	Fri, 14 Aug 2026 13:21:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dhp2iwWvNvuc; Fri, 14 Aug 2026 13:21:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A01860AA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713696;
	bh=3Z4BsRomxx8P56BHPIz9ERlWqrnb7mkDTQrArkcDReU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d35+VLJ9rfnijKbaZPZjEhoQRMCMGIJ6SRcOvtdz0CWOlBBhVDq6VXSiDc06++7Z5
	 AbOs7snWgI1PquYFDolJDPWjGoH/xcgS4cKM/9DQm5NeObul3yRDrbFeel7VnW0feS
	 tDqNjVYAjI5I+8HyouvE7a9JE8RjYubEgOqc2V4FC9ibwFKBJ8/XHoVGiNs8MEU5dE
	 WBi1zBPw30NgF82c8Kuu1dG9/oRo0v4qNG1VM55Z9Fubpa/Akac3uLanLVMNrX3JhE
	 fwm5NgTyKLtLZWEbsMlIcL/ZlXxg5qfgBb972+iXkLu9wMk1smbuISRW/ma/wUvT2d
	 l2tlnA8/sfGrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A01860AA5;
	Fri, 14 Aug 2026 13:21:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 22572139D
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CE984011F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JmitJSfZ_kGZ for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50845400E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50845400E3
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 481BD8D66F; Fri, 14 Aug 2026 13:20:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 16:03:39 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: ac7852ed489824251293d4eb3916b517389d403a
X-Git-Newrev: 8809bcb3beb48174e443828738d20632773e8489
X-Patchwork-Hint: ignore
Message-Id: <20260814132035.481BD8D66F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/glibc: fix
 license information
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8809bcb3beb48174e443828738d20632773e8489
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

The COPYINGv3 license file was added with upstream commit
e067e53080386e93dcf8b07e25fb6656f2c8941e, it applies to scripts used
during build.

LGPL-3.0+ applies to sysdeps/htl/raise.c, which is used for the Hurd
platform. Buildroot builds only Linux, so the file should not be
compiled, but it is part of the downloaded (and possibly shared, if
"make legal-info" is used) archive. The same applies to the manual.

Checked against the copyright file of the Debian "libc6" package (as
of 2.42-17 and 2.43-2), note that Debian excludes the manual.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 45b24c43a0ea7122a222f659b27ef2e0baadb4c7)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/glibc/glibc.hash |  2 ++
 package/glibc/glibc.mk   | 10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index d9aaceea30..237b56ee48 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -4,4 +4,6 @@ sha256  6c6ec86c66f0484c6916e849e20433ebc67869649c72a772cdf1bb6ca408d516  glibc-
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
 sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LESSERv2
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYINGv3
 sha256  b22a69aa3f80a5201818c66cb0df0f25f9fa13cf5861b0093a058dbd12d50dce  LICENSES
+sha256  297ad42928811894f3abc955526431b1e7856e6766eecb7de2a5a0aa2915e5cf  manual/fdl-1.3.texi
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 375429cfd4..29b0639cb1 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -11,8 +11,14 @@ GLIBC_VERSION = 2.43-49-g8017bcfc4d9bd16083cb7f3d8eda7d07b4593b09
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
-GLIBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)
-GLIBC_LICENSE_FILES = COPYINGv2 COPYING.LESSERv2 LICENSES
+GLIBC_LICENSE = \
+	GPL-2.0+ (programs), \
+	LGPL-2.1+, BSD-2-Clause, BSD-3-Clause, BSL-1.0, FSFAP, ISC, other permissive licenses, public domain (library), \
+	LGPL-3.0+ (sysdeps/htl/raise.c, for Hurd only), \
+	GPL-3.0+ (scripts/move-if-change), \
+	GPL-3.0+ WITH Texinfo-exception (manual/texinfo.tex), \
+	GFDL-1.3-or-later (manual)
+GLIBC_LICENSE_FILES = COPYINGv2 COPYING.LESSERv2 COPYINGv3 LICENSES manual/fdl-1.3.texi
 GLIBC_CPE_ID_VENDOR = gnu
 
 # Extract the base version (e.g. 2.38) from GLIBC_VERSION in order to
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
