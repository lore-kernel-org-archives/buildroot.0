Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91952CD3424
	for <buildroot@archiver.kernel.org>; Sat,  2 May 2026 09:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DA2882D57;
	Sat,  2 May 2026 09:55:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31BeF-t4q_vp; Sat,  2 May 2026 09:55:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50784826C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777715721;
	bh=rAG+X0AML9tK8grB6w0YOikh1kWIM+/R+EJpXIq6JUE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OWsNMRPHq1q3QRZcgK2ruCx13UzQB3tHd5OL9vIJlH5zGI3RYEhpXB9ItpAoJP8+K
	 uUdYDx+U+7DnrjgnE5YExPQ/m+QjDKFJUrUwT13Ii9HEHUgUfTfe43T8aUTgLTr+21
	 TB8JJO3U4j73sUDnxBEwMNutnhm/tfWuFhEJcQ7LDArISmA/ng329GFZGHPUmFqKCV
	 eztE/jFcmdvt9cTM9CVM/045j/lvHd9OPgtgkTWgunc2nttyFPLa69qhxOHo4f8SUS
	 TFRF9sfkM1Ua4KO7WoCXMF9a82f9ziMax6nH6KJqZCl0j0mBmR19swI4kBtysh/O9Q
	 PnFfmAx1lg+9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50784826C0;
	Sat,  2 May 2026 09:55:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F17924E
 for <buildroot@buildroot.org>; Sat,  2 May 2026 09:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2558040784
 for <buildroot@buildroot.org>; Sat,  2 May 2026 09:55:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vOIyrC9EhlHV for <buildroot@buildroot.org>;
 Sat,  2 May 2026 09:55:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CBF84077F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CBF84077F
 for <buildroot@buildroot.org>; Sat,  2 May 2026 09:55:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11AE87FB68; Sat,  2 May 2026 09:55:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 May 2026 11:51:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f6d37ab9a322562dfdc49a391c6e218f44fb54c
X-Git-Newrev: 8940fae6070eb064042b9e54b862523cc1b8d6bc
X-Patchwork-Hint: ignore
Message-Id: <20260502095519.11AE87FB68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: security bump to version
 8.20.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8940fae6070eb064042b9e54b862523cc1b8d6bc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://curl.se/ch/8.20.0.html
https://curl.se/docs/security.html

Fixes the following CVEs:
https://curl.se/docs/CVE-2026-7168.html
https://curl.se/docs/CVE-2026-7009.html
https://curl.se/docs/CVE-2026-6429.html
https://curl.se/docs/CVE-2026-6276.html
https://curl.se/docs/CVE-2026-6253.html
https://curl.se/docs/CVE-2026-5773.html
https://curl.se/docs/CVE-2026-5545.html
https://curl.se/docs/CVE-2026-4873.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libcurl/libcurl.hash | 6 +++---
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index ad34083745..549527b1af 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,7 +1,7 @@
-# From https://github.com/curl/curl/releases/tag/curl-8_19_0
+# From https://github.com/curl/curl/releases/tag/curl-8_20_0
 # after checking pgp signature:
-# https://curl.se/download/curl-8.19.0.tar.xz.asc
+# https://curl.se/download/curl-8.20.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  4eb41489790d19e190d7ac7e18e82857cdd68af8f4e66b292ced562d333f11df  curl-8.19.0.tar.xz
+sha256  63fe2dc148ba0ceae89922ef838f7e5c946272c2e78b7c59fab4b79d3ce2b896  curl-8.20.0.tar.xz
 # Locally computed
 sha256  82f2f4427d6545ee5aaac4f0b80428da6cc8ba41c2cf5da3a03680ec327b9681  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 3d00a4a33a..94d7ec677c 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.19.0
+LIBCURL_VERSION = 8.20.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
