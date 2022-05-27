Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BE1C433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 19:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64BE042901;
	Fri, 27 May 2022 19:12:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dCa5YQkxBCJb; Fri, 27 May 2022 19:12:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 117A242650;
	Fri, 27 May 2022 19:12:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5531B1BF296
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 19:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70262429B0
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 19:11:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mtFrQy-w30HS for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 19:11:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 675B4429B2
 for <buildroot@buildroot.org>; Fri, 27 May 2022 19:11:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8BDBA866BE; Fri, 27 May 2022 19:00:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 21:04:18 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 92cf4afd253c81ce8ebf15af78cf84d7d8572b91
X-Git-Newrev: 3923a5b2ec04ed451917ec9ac2cb0a4abed7014a
X-Patchwork-Hint: ignore
Message-Id: <20220527190009.8BDBA866BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libcurl: security
 bump version to 7.83.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3923a5b2ec04ed451917ec9ac2cb0a4abed7014a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Changelog: https://curl.se/changes.html#7_83_0
Release notes: https://curl.se/news.html

Fixes the following CVEs:
CVE-2022-22576: OAUTH2 bearer bypass in connection re-use
CVE-2022-27774: Credential leak on redirect
CVE-2022-27775: Bad local IPv6 connection reuse
CVE-2022-27776: Auth/cookie leak on redirect

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b0b25f145469a14e3d85becf19aaca0a40fd4e25)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 4be245041c..64a1129a90 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-7.82.0.tar.xz.asc
+# https://curl.se/download/curl-7.83.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c  curl-7.82.0.tar.xz
+sha256  bbff0e6b5047e773f3c3b084d80546cc1be4e354c09e419c2d0ef6116253511a  curl-7.83.0.tar.xz
 sha256  321b1a09ebc30410f2e837c072e5521cf7095b757193af4a7dae1086e36ed31a  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 97857954db..ea8529c914 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.82.0
+LIBCURL_VERSION = 7.83.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
