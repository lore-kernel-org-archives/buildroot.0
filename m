Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808DAC43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 19:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2110840535;
	Sat,  4 Jul 2026 19:17:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XUIOG79vXs6v; Sat,  4 Jul 2026 19:17:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52AD24051D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783192650;
	bh=onxomc+H9ZXQITakUfqDg2195cYiZXvCxqvDqtYxyvk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VfE5qCFMrVAZC5FEkR7x6YTmsZP8PTXNVIZYSd9SslUCtJom0FYhVoYLWrLY7sanv
	 Fi5C9XJnJwnhwhRFXHWTFSMyrw1x6jslVX8Jbe7FvR8uYrnCxgZjEqNk68M9iglq4d
	 h7MrSDOMD0ZAN8vpj5vSxiOuEmyYlPZyC2qpk+mCpcZ5khk0nKSGCRBWBhPHj5CIFF
	 0UIRmZDb8gLCo9fI3j8P9i/nMC6J/L04GthSjOYxm0yDDCCLb1Zg1uRUX14xzgw8hm
	 two0MPhjUR9biMciBybfBkD+ls0Ce00RzlYohSNYVyXZFOFWrylKYbf6ZH/vTZ6Van
	 MgV3+zNlGAniw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52AD24051D;
	Sat,  4 Jul 2026 19:17:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 843FD363
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 19:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 760A140504
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 19:17:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MGSa96cF912b for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 19:17:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CD9F404F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CD9F404F2
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 19:17:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 926F587669; Sat,  4 Jul 2026 19:16:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Jul 2026 21:12:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48f8ab703c44c2739d112bd9046749b9e2f2d732
X-Git-Newrev: a7a90c3274d4d5c14f99ecc72ad3a984f513c136
X-Patchwork-Hint: ignore
Message-Id: <20260704191657.926F587669@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liblo: bump to version 0.36
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a7a90c3274d4d5c14f99ecc72ad3a984f513c136
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release Notes:
https://sourceforge.net/p/liblo/git/ci/master/tree/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/liblo/liblo.hash | 8 ++++----
 package/liblo/liblo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/liblo/liblo.hash b/package/liblo/liblo.hash
index 8a317cff73..fcbbaf2c47 100644
--- a/package/liblo/liblo.hash
+++ b/package/liblo/liblo.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/liblo/files/liblo/0.35/
-md5  fbe37b3e35f9dcdc4f90acfe513cc679  liblo-0.35.tar.gz
-sha1  1a17c007d9cc5e7a3333420c5d11479ffe0cbe0b  liblo-0.35.tar.gz
+# From http://sourceforge.net/projects/liblo/files/liblo/0.36/
+md5  bc160dfb3d114beba548e30da4db9317  liblo-0.36.tar.gz
+sha1  9874d287d040e6fa838f795afc22bbb9753dfecd  liblo-0.36.tar.gz
 
 # Locally computed
-sha256  9acc4f7e5a24f33472e9acd7e409b7bd6810a46f0a1f3cfeecea22d60f3aae13  liblo-0.35.tar.gz
+sha256  c08d14832e8dcf8f06840405824a4f9611a0cb3daed0198946326c740941c8b6  liblo-0.36.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
index 2717022d58..17c40cbf6d 100644
--- a/package/liblo/liblo.mk
+++ b/package/liblo/liblo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLO_VERSION = 0.35
+LIBLO_VERSION = 0.36
 LIBLO_SITE = http://downloads.sourceforge.net/project/liblo/liblo/$(LIBLO_VERSION)
 
 LIBLO_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
