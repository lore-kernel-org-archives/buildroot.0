Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428A0F483EA
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BCE56083A;
	Mon, 23 Mar 2026 19:47:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PjQAxOISYiw4; Mon, 23 Mar 2026 19:47:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 310A76083C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295244;
	bh=bvVh2r2zvLLkLEr860P+7I1raOUyneUprt68hdpLC/E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f/5nGWMdUzNsPnk2GVGYFcePo7Uy8wUQOZjiYE9b+HPt/SFs0s0F9wU4Cb0A4zM8Y
	 Zx32xLINNWDX62Iv6VWJh9W+B0faFuy0J3+BdKDa+aTlACTEG9GylmAQrLUVEloxkz
	 MK9q/DbQIM2XWGRl/LLIglT82ZiFEBiTUpWU3ZshpVAQQg3LyHFZWX2JgZDB27aDar
	 2lRvE9GeP2zBUpFt0rgwCxKkJE0OfnMc3htHq0fu490lnkOu/GP3yyx2o94C/GX0W6
	 +6iPhOdb7HVNhA5sp8aZVsQyVZdXk/I9YNiJw2NzVRYaySV9AKCwN1U6wTaeLDxhEV
	 Vd16PlhAuKfPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 310A76083C;
	Mon, 23 Mar 2026 19:47:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33796353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B828640B7F
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SKtblrU72d8H for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A74D4062A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A74D4062A
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 338C484BCC; Mon, 23 Mar 2026 19:47:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:52:02 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ea0d7ef922616a689c79d4d56890b921ddfcbfb3
X-Git-Newrev: 47eeee8a3a4bd0f05a7b11857a46277e62ec0d85
X-Patchwork-Hint: ignore
Message-Id: <20260323194714.338C484BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libcurl: security
 bump to version 8.19.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/47eeee8a3a4bd0f05a7b11857a46277e62ec0d85
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://curl.se/ch/8.19.0.html
https://curl.se/docs/security.html

Fixes the following CVEs:

CVE-2026-3805: use after free in SMB connection reuse
CVE-2026-3784: wrong proxy connection reuse with credentials
CVE-2026-3783: token leak with redirect and netrc
CVE-2026-1965: bad reuse of HTTP Negotiate connection

Switch to sha256 tarball hash provided by upstream.

Updated license hash due to copyright year bump:
https://github.com/curl/curl/commit/e83c82f05f9b714086e62db9fe2ea9be522239bc

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add back pgp signature info in hash file]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3a5e071e4f9f8477b43b27ca43a596e74c11b4e6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libcurl/libcurl.hash | 10 ++++++----
 package/libcurl/libcurl.mk   |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index de3f2402e9..ad34083745 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,7 @@
-# Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.18.0.tar.xz.asc
+# From https://github.com/curl/curl/releases/tag/curl-8_19_0
+# after checking pgp signature:
+# https://curl.se/download/curl-8.19.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  40df79166e74aa20149365e11ee4c798a46ad57c34e4f68fd13100e2c9a91946  curl-8.18.0.tar.xz
-sha256  e18f1989333b70044b2adfb7dc2f905d0119dbdcac3bc9f4bc9d540e3a29de5b  COPYING
+sha256  4eb41489790d19e190d7ac7e18e82857cdd68af8f4e66b292ced562d333f11df  curl-8.19.0.tar.xz
+# Locally computed
+sha256  82f2f4427d6545ee5aaac4f0b80428da6cc8ba41c2cf5da3a03680ec327b9681  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index d9a712bcb6..2fddfcb379 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.18.0
+LIBCURL_VERSION = 8.19.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
