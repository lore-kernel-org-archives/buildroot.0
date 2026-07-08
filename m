Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21730C44501
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E54016074D;
	Fri, 10 Jul 2026 13:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KEIi-TjXwbYo; Fri, 10 Jul 2026 13:43:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01416606B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783690991;
	bh=SMZPaewP5KXslCBD7WL6Ubox97vpF+R7/+rK/uGPF5s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KLDjUbT7ECMdfLpy5FL+7BHtAeCqA17OEAP6tBHrXG4hLb7gwrkO2kQjndCwPtcWj
	 A1u+r5TP3xo19VCF/quBLLz2dlpn4ox/v7mRPGUZgeQZ5NULDpCrdshHRSp+U3AEyC
	 D1gop0WcILtHlQj+ESpBJkJmY9hO6xCQwONwjWMG6Ol2FfUIFpqPPKA+Ea+8QyMAyT
	 YZgPL9F2U4l7AKmAFtG3lRqKVEV0yEpV5b1z6BMS5N+H6pBCNW8ZLwqaGKrDkEZZb7
	 qaC7Zt+zt95JzOFfTL9pK7lI1cijdHJ4/3sg2sAtAGFSpg2tlZ62l6fSHdIVO7en23
	 Ova57CmjfXIiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01416606B4;
	Fri, 10 Jul 2026 13:43:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FC71FD1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62229810B6
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OrdrO7LYAzp6 for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9542810B4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9542810B4
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE5718867A; Fri, 10 Jul 2026 13:42:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 14:57:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 901687d392e06b0142586f69b5dc8faef35dd3a2
X-Git-Newrev: 6a15fd3a1e3a5ecf94e2637c851d1c26030761c8
X-Patchwork-Hint: ignore
Message-Id: <20260710134217.DE5718867A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/tiff: security
 bump version to 4.7.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6a15fd3a1e3a5ecf94e2637c851d1c26030761c8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://gitlab.com/libtiff/libtiff/-/releases/v4.7.2

Fixes CVE-2026-36849: https://seclists.org/oss-sec/2026/q2/952

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 85a98f81488914ddbdb2be56c7f44a6c37c6a513)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/tiff/tiff.hash | 4 ++--
 package/tiff/tiff.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
index ff0b698345..5c9031bfb4 100644
--- a/package/tiff/tiff.hash
+++ b/package/tiff/tiff.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking pgp signature
-# https://download.osgeo.org/libtiff/tiff-4.7.1.tar.xz.sig
+# https://download.osgeo.org/libtiff/tiff-4.7.2.tar.xz.sig
 # with key: B1FA7D81EEB8E66399178B9733EBBFC47B3DD87D
-sha256  b92017489bdc1db3a4c97191aa4b75366673cb746de0dce5d7a749d5954681ba  tiff-4.7.1.tar.xz
+sha256  4996f0c4f93094719b1ca5c6279b20e588773ba8a247533e486416fb662ddb88  tiff-4.7.2.tar.xz
 sha256  0e27c2382d7b8147972bbb746e04059a1152c8d0fda9d03ef1399d1a433c4ade  LICENSE.md
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index e64a6baf83..b1efa5be5a 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIFF_VERSION = 4.7.1
+TIFF_VERSION = 4.7.2
 TIFF_SOURCE = tiff-$(TIFF_VERSION).tar.xz
 TIFF_SITE = https://download.osgeo.org/libtiff
 TIFF_LICENSE = tiff license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
