Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BED9106ACE4
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 20:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4703540763;
	Thu, 12 Mar 2026 20:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SLywJNnmAB0m; Thu, 12 Mar 2026 20:06:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2EE1407CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773345973;
	bh=7A5pEt2tHjQsLWnU2HmGgRVn+88QS2CoVkEitaXbO8c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZM8uXtlZNhe92fC/BjQRbgfK0I+F+4A6ckbCqzV0eWd13z9NQH6DmC+VKrDY7L4Av
	 YuhHzKq/XXm9jTqj4X8xziHcHSOjtWbWTH9N+/o3FJN+xujv9PbJJHXmIBzAcLCxJr
	 GFMGn8nS2d7ABFnB+PlCBU8UDo4gXC34R64z+YMmuS3W2qVPl8FXBzQ9G4jyDeo8Zy
	 zMV7RdsUlOCXYqrJp2RmBWI8FuiTJLd/qnpSGBJAcYHYTfJd+MAsam38aeOFsG84nV
	 egNaSyJjiQiaZ9tYpvZ+QgnT35eBz1T4lsc6P4Jb03nKNkZzZUm1vWi64fipsl8XdX
	 j5Wt9J5o9ecVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2EE1407CC;
	Thu, 12 Mar 2026 20:06:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F1391787
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 20:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3A20407CC
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 20:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ioj9lhDq-NWm for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 20:06:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09D1C40763
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09D1C40763
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 20:06:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15B1A874D0; Thu, 12 Mar 2026 20:06:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Mar 2026 21:02:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bcabcf7f9c7d5f8c9aca6368f363cfb636c4e8b3
X-Git-Newrev: 3a5e071e4f9f8477b43b27ca43a596e74c11b4e6
X-Patchwork-Hint: ignore
Message-Id: <20260312200611.15B1A874D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: security bump to version
 8.19.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3a5e071e4f9f8477b43b27ca43a596e74c11b4e6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
index 7ebf26c3b1..3d00a4a33a 100644
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
