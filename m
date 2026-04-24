Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626BEFED3F2
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6EBC84E05;
	Fri, 24 Apr 2026 16:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eM8IUC4FfCBY; Fri, 24 Apr 2026 16:26:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ED6484E00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777047970;
	bh=Y+vXyOXWPyHPkh/TeXHwFDRA1P1I0bbVon9V4KdYZYQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l7oYW3YQaAaIW2VbtTjoVAA9mRz0KxagqnBfIrFLJ/7SswpP8TN7fQPa0nvF+6Hth
	 sVzjA5jEk1nqDVQdtx/X8O8vClhu2lkhT0X1UCcX8isi4ffJeNP+CDyTauq3oWvvRg
	 41eSM4r3w/a+u9pDtpGLAAz/3D/cRuRdzVk4wtGHNBBnFsamhneVQEWahRRXprx1Aw
	 VfYwoALkVrjc6rarI8URMzNv/8vfpEBbhLwH11G8a4PrAkuDoMR+CWnhdxbG/2uL4x
	 eZvu+bv3kuno6lGALsBjiepTGs72pA6tPUXmweqweCpQyn6z9WF3tb9gdJ5I8JiiXv
	 PIJhX7wNVvbmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ED6484E00;
	Fri, 24 Apr 2026 16:26:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EDEF194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39EC342958
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K16ZVi8GZOou for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:25:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B769D4282D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B769D4282D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F81782AE9; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:20:57 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 346c22c8b672e8314c147d28f9aaac5d07b73f8c
X-Git-Newrev: a049435db8e89228d4e5c49f62f3257402e81c9f
X-Patchwork-Hint: ignore
Message-Id: <20260424162539.6F81782AE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libexif: security
 bump to version 0.6.26
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a049435db8e89228d4e5c49f62f3257402e81c9f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/libexif/libexif/blob/v0.6.26/NEWS

* Security issues fixed:
  * CVE-2026-40386: An unsigned integer underflow in Fuji and Olympus
    makernote handling
  * CVE-2026-40385: An unsigned integer overflow on 32bit systems in
    Nikon makernote handling
  * CVE-2026-32775: A buffer overwrite via integer underflow in makernote
    handling

Switched to xz tarball and tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3f9bcf42c31bb0d089ae0e70642242cf572ba5b6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libexif/libexif.hash | 3 ++-
 package/libexif/libexif.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libexif/libexif.hash b/package/libexif/libexif.hash
index 9e95e27f3e..5949bfb36c 100644
--- a/package/libexif/libexif.hash
+++ b/package/libexif/libexif.hash
@@ -1,3 +1,4 @@
+# From https://github.com/libexif/libexif/releases/tag/v0.6.26
+sha256  4a055ed6575e61ca46c3172be3c753cc16c9becd0f99ec71d58dd0e471476c0c  libexif-0.6.26.tar.xz
 # Locally computed:
-sha256  7c9eba99aed3e6594d8c3e85861f1c6aaf450c218621528bc989d3b3e7a26307  libexif-0.6.25.tar.bz2
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
index 0e50d78fbe..f434f9a922 100644
--- a/package/libexif/libexif.mk
+++ b/package/libexif/libexif.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBEXIF_VERSION = 0.6.25
-LIBEXIF_SOURCE = libexif-$(LIBEXIF_VERSION).tar.bz2
+LIBEXIF_VERSION = 0.6.26
+LIBEXIF_SOURCE = libexif-$(LIBEXIF_VERSION).tar.xz
 LIBEXIF_SITE = \
 	https://github.com/libexif/libexif/releases/download/v$(LIBEXIF_VERSION)
 LIBEXIF_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
