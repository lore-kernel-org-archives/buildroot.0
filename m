Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9B0CDB479
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 22:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35F9060C21;
	Wed, 24 Jun 2026 22:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kxrt0FEa9BWh; Wed, 24 Jun 2026 22:06:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 558D360E1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782338814;
	bh=wboi3RNMcGbnZDsiYbLvn6jf96odqP8mUxlwJc/Dl9I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mItkr1cKPyhKkoxn8HJELJ7qin93+CH3JFVz0n3ayfHMNTz0VHmq6W4MFHzjz825c
	 j/1IcSsckRGtCHyFoco0E4kOLQ/6Y04VvEKqO/8JD+tSVDr6EKWNOmr4QGiljc562X
	 VrJz5yQiBCMVo/xWRHsZRBD3zUnMydAtnkLT+wNkgdav77WEkhPtK7Eopce0aWTbnG
	 TOL61mQrwLM7dBss4+hCSzm5FerCKIPyTNfcYpSsDu9dPNrV+j9XHNIadzqLmrTTUM
	 qfVb6AEmA2KfVJfc3dkEJ99fZT6yr3zTHzv8oVthzr62+cS64HjqzhQrcMm/TO9Qls
	 MOohJljFBSsKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 558D360E1D;
	Wed, 24 Jun 2026 22:06:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A501367
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 22:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E44A40C99
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 22:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYOLWBh7h-03 for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 22:06:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 910A940C92
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 910A940C92
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 22:06:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63DE984925; Wed, 24 Jun 2026 22:06:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 23:52:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be2789d08432da951c0ebfb23b034072601bc8fe
X-Git-Newrev: c384895981eb7d98a8ba5067566601772db0258b
X-Patchwork-Hint: ignore
Message-Id: <20260624220626.63DE984925@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libarchive: security bump version
 to 3.8.8
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c384895981eb7d98a8ba5067566601772db0258b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/libarchive/libarchive/releases/tag/v3.8.8
"Libarchive 3.8.8 is a security, bugfix and minor feature release."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/libarchive/libarchive.hash | 6 +++---
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index 665259f2b6..dccb2cc4a7 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,6 +1,6 @@
-# From https://github.com/libarchive/libarchive/releases/tag/v3.8.7
+# From https://github.com/libarchive/libarchive/releases/tag/v3.8.8
 # After verifying the pgp signature from:
-# https://www.libarchive.de/downloads/libarchive-3.8.7.tar.xz.asc
-sha256  d3a8ba457ae25c27c84fd2830a2efdcc5b1d40bf585d4eb0d35f47e99e5d4774  libarchive-3.8.7.tar.xz
+# https://www.libarchive.de/downloads/libarchive-3.8.8.tar.xz.asc
+sha256  3873a88801da067d0528a989af06877710529d50ee8fe6f3970cbb4302efb918  libarchive-3.8.8.tar.xz
 # Locally computed:
 sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index f11f5d8f6f..23cb82f7b5 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.8.7
+LIBARCHIVE_VERSION = 3.8.8
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
