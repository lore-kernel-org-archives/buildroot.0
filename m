Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019D5CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 18:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BF0841871;
	Fri, 13 Oct 2023 18:49:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BF0841871
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xoONZZMICRPq; Fri, 13 Oct 2023 18:49:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B057640286;
	Fri, 13 Oct 2023 18:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B057640286
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0EFA21BF2BA
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3000B6F652
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:45:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3000B6F652
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KIhIzUZgqtpi for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 18:45:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EB296F64E
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 18:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EB296F64E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2106684C4D; Fri, 13 Oct 2023 18:45:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 20:13:02 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 93800e3256640daf1f7571a0c80af481614edf9a
X-Git-Newrev: f9d1275643b7b179342e2bdd86f7bce7a10a97ee
X-Patchwork-Hint: ignore
Message-Id: <20231013184521.2106684C4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/libcurl: security
 bump to 8.4.0
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
Content-Type: multipart/mixed; boundary="===============4648123618434382248=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4648123618434382248==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f9d1275643b7b179342e2bdd86f7bce7a10a97ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fixes following two vulnerabilities:

* CVE-2023-38545: SOCKS5 heap buffer overflow
  https://curl.se/docs/CVE-2023-38545.html
* CVE-2023-38546: cookie injection with none file
  https://curl.se/docs/CVE-2023-38546.html

Signed-off-by: Jan Čermák <sairon@sairon.cz>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 30dd60ba7eb3e6da4f0ae91b3b08f8aa8fb8d786)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 371d20a632..ecd5d63909 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.3.0.tar.xz.asc
+# https://curl.se/download/curl-8.4.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  376d627767d6c4f05105ab6d497b0d9aba7111770dd9d995225478209c37ea63  curl-8.3.0.tar.xz
+sha256  16c62a9c4af0f703d28bda6d7bbf37ba47055ad3414d70dec63e2e6336f2a82d  curl-8.4.0.tar.xz
 sha256  b1d7feb949ea5023552029fbe0bf5db4f23c2f85e9b8e51e18536f0ecbf9c524  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index dd4cf43c6a..bd331a55aa 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.3.0
+LIBCURL_VERSION = 8.4.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \

--===============4648123618434382248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4648123618434382248==--
