Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA02ECCF2D1
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA22381DF4;
	Mon, 19 Jan 2026 10:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8SyvgSvXGVo4; Mon, 19 Jan 2026 10:01:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4B2681E1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816861;
	bh=GAQNVSqDVjWnogBxFvqMc4/aFT3AidvzKhRiOrkvQJ8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XOLPcJ7dOl1rycF5lLF7Zo+uEL7naPSVNkdso8T19eDAJQz27kgxThfgdHpPQRWr/
	 UDKgPe0rV4IZC0M6bK8KpWrFCyS7VlfOVf2UPAppv+I0lKnVCWE3bzNtdNjf8dpyfc
	 4d0bX7ZfEHcGoFcGKuhWMH4VG0KSGHvTQw94oSVbhT4DR3Upe/jSUx9XSK1e+Z3ynX
	 wyMGV9QI5k43/I13T3utWuM4vPeR9RqhZQ6dIuE15zbtL9y18xFkI3YCEUndbwbSWC
	 tRUmmJDN28D+5CH7dmh0vKO0sjGHGcKe3ICLs1yyrGttDY+37c5/X0pkTQvp6vmyx0
	 1d1eujjgmbBHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4B2681E1F;
	Mon, 19 Jan 2026 10:01:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 108E32CE
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F399440D00
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DyEpuZHov0XN for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:00:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1204740CFD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1204740CFD
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10DB4885CF; Mon, 19 Jan 2026 10:00:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:33:53 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: beb6064cd54fec71d90d7bad2e12a6b2ce6fe2d3
X-Git-Newrev: 29d7905db43f1a0cf86c6e1f321047b767be7dcf
X-Patchwork-Hint: ignore
Message-Id: <20260119100041.10DB4885CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libcurl: security
 bump to version 8.18.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=29d7905db43f1a0cf86c6e1f321047b767be7dcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

https://curl.se/ch/8.18.0.html

Fixes CVE-2025-13034, CVE-2025-14017, CVE-2025-14524, CVE-2025-14819,
CVE-2025-15079 & CVE-2025-15224: https://curl.se/docs/vuln-8.17.0.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 39aaf317d5f6f511faa3459ca54e021f72b5d0f2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 786d030171..de3f2402e9 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.17.0.tar.xz.asc
+# https://curl.se/download/curl-8.18.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  955f6e729ad6b3566260e8fef68620e76ba3c31acf0a18524416a185acf77992  curl-8.17.0.tar.xz
+sha256  40df79166e74aa20149365e11ee4c798a46ad57c34e4f68fd13100e2c9a91946  curl-8.18.0.tar.xz
 sha256  e18f1989333b70044b2adfb7dc2f905d0119dbdcac3bc9f4bc9d540e3a29de5b  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 6924631735..e1e5a7facb 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.17.0
+LIBCURL_VERSION = 8.18.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
