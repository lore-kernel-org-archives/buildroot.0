Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692F6E7E369
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D58E60F76;
	Fri,  3 Apr 2026 10:27:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TtD6-2EUBCMU; Fri,  3 Apr 2026 10:27:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B38A608D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212039;
	bh=0u+4BazrakkOYIp7qnxQLqWFM5m8zbY0LorP5DqGW6g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=o26jrnKApJNWbxCPIG8QOggg9AIDX2fKlZhlXT6apYDpzz941t9YUDhRWJ/cvSYAc
	 DSmoSuBZ5dvziz3fMVakGk6Tjj30RBmAg45B+Xb9BNbLhZPJT4JNXH4afhwyzzST3q
	 TF9Fa7lHWUROmIqGmj6cpLYHD4cYsKOzrux/KXHVdN8bnLb3KSbJH5/8SZeABPQPxq
	 UXi+qB/5/7Po+5AcxhV7MAR8J5aB92E6JX/wRRCJlrztXZi6KSuqGaaCKoGtfz1zti
	 szl99fWYVPGyaTGoE7fFUg7LmlV/l1VIaFAZXQXXd1pbGpnjXBuAwlwHGMOCiAZ7tr
	 yHejyE0ueobCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B38A608D8;
	Fri,  3 Apr 2026 10:27:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AE982CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55A6C40263
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W7CG3KCMMvUc for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:26:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 870A640266
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 870A640266
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:26:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 120707FFA9; Fri,  3 Apr 2026 10:26:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 12:21:48 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f6a408fd8f94e24c724a78e55cfb3acef7851dff
X-Git-Newrev: 6e84b56f4dc2821893af41a6cf9a1fdd33e52b10
X-Patchwork-Hint: ignore
Message-Id: <20260403102657.120707FFA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libpng: security
 bump to version 1.6.56
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6e84b56f4dc2821893af41a6cf9a1fdd33e52b10
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following security vulnerabilities:

CVE-2026-33416 (high):
Use-after-free via pointer aliasing in `png_set_tRNS` and `png_set_PLTE`.

CVE-2026-33636 (high):
Out-of-bounds read/write in the palette expansion on ARM Neon.

For more details, see the advisories:
https://github.com/pnggroup/libpng/security/advisories/GHSA-m4pc-p4q3-4c7j
https://github.com/pnggroup/libpng/security/advisories/GHSA-wjr5-c57x-95m2

Release notes:
https://github.com/pnggroup/libpng/blob/v1.6.56/ANNOUNCE

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 22e4440eaed6330401ac4c87b2eee7e0f0d19ba9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libpng/libpng.hash | 6 +++---
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 7901f82c3a..ae28eee087 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.55/
-sha1  13f7bedf27009e59961f823cc779a5f9f5341a91  libpng-1.6.55.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.56/
+sha1  71eb3636e60b6ea66f2f670cdf1f7160b7a1fa8b  libpng-1.6.56.tar.xz
 # Locally computed:
-sha256  d925722864837ad5ae2a82070d4b2e0603dc72af44bd457c3962298258b8e82d  libpng-1.6.55.tar.xz
+sha256  f7d8bf1601b7804f583a254ab343a6549ca6cf27d255c302c47af2d9d36a6f18  libpng-1.6.56.tar.xz
 sha256  bdb0a645ea18c60507d0368379b1ac5474b92255fcc2d115e07486a7672ba526  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index e79e259536..25687ca927 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.55
+LIBPNG_VERSION = 1.6.56
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
