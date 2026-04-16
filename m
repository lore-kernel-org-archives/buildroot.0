Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54269F8D771
	for <buildroot@archiver.kernel.org>; Thu, 16 Apr 2026 19:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A2D280F93;
	Thu, 16 Apr 2026 19:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f7AKYklN4vFn; Thu, 16 Apr 2026 19:28:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F6C280F95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776367698;
	bh=FdkSx7Bu69vMQMexXJp71f879JZDUVAL3izCnFTyTMU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KuEPKO38vHDuRlqnhwyXY2xTzcqLBkt7vTLqBZEpxXJREWd36OiyWCK1FQ2qyPNJh
	 vF6oqrcFCSjPhaLVabezFcUuSBgcYOEdb5X/l/p1Zigy4a/Y0V2tvtkuh8MQx3XPjK
	 GhWxnAvrAo3l3ZWxtjtEAcPK0aKJD2LlMm0JoyZjDEJ1yOplQW2nvZaJ9w/UZPBkFH
	 Edd0pMLUaBE775gLNd7NtFOxAIHrYPa6ODD4BpFMUItIvw5HzBGpmmkXWxIBC6V6F7
	 lwyH9aSgxHDcS+l+ZLbmTrS1ND0b24jLRTCehdjD8julO0IPfRH911xKyNa5llSmCX
	 7hBhCy0DbVxxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F6C280F95;
	Thu, 16 Apr 2026 19:28:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E4164259
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 19:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D55BB608D4
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 19:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8KUFpw2L01kB for <buildroot@buildroot.org>;
 Thu, 16 Apr 2026 19:28:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40D5860871
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40D5860871
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 19:28:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD6B681659; Thu, 16 Apr 2026 19:28:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 16 Apr 2026 21:22:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e786e873ac759b5804059e8ae750e51c3a006ca
X-Git-Newrev: 3f9bcf42c31bb0d089ae0e70642242cf572ba5b6
X-Patchwork-Hint: ignore
Message-Id: <20260416192814.BD6B681659@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libexif: security bump to version
 0.6.26
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3f9bcf42c31bb0d089ae0e70642242cf572ba5b6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
