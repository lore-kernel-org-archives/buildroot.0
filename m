Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD07AC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6638582B9F;
	Mon, 20 Feb 2023 23:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6638582B9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j8sqm-jK5Xcy; Mon, 20 Feb 2023 23:15:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE44D8301F;
	Mon, 20 Feb 2023 23:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE44D8301F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F05F61BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A05C6137B
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A05C6137B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TvajwobTfwQk for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FE566108B
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FE566108B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D44781979; Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 22 Dec 2022 08:37:52 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d18176396a4b835615b71f254e1c00add265f4ce
X-Git-Newrev: 3b91fd750180dd4689cafc72b28696c239821f9a
X-Patchwork-Hint: ignore
Message-Id: <20230220205214.1D44781979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libcurl: security bump
 version to 7.87.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3b91fd750180dd4689cafc72b28696c239821f9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes the following security issues:

- CVE-2022-43551: Another HSTS bypass via IDN
  https://curl.se/docs/CVE-2022-43551.html

- CVE-2022-43552: HTTP Proxy deny use-after-free
  https://curl.se/docs/CVE-2022-43552.html

Changelog: https://curl.se/changes.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index c0e2378cac..230ec8d704 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-7.84.0.tar.xz.asc
+# https://curl.se/download/curl-7.87.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  2d61116e5f485581f6d59865377df4463f2e788677ac43222b496d4e49fb627b  curl-7.86.0.tar.xz
+sha256  ee5f1a1955b0ed413435ef79db28b834ea5f0fb7c8cfb1ce47175cc3bee08fff  curl-7.87.0.tar.xz
 sha256  321b1a09ebc30410f2e837c072e5521cf7095b757193af4a7dae1086e36ed31a  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 8de4358107..994b685d34 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.86.0
+LIBCURL_VERSION = 7.87.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
