Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC70EC43334
	for <buildroot@archiver.kernel.org>; Sat,  2 Jul 2022 07:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 452B1846DA;
	Sat,  2 Jul 2022 07:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 452B1846DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AANROqo3zdQM; Sat,  2 Jul 2022 07:56:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3071B83F24;
	Sat,  2 Jul 2022 07:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3071B83F24
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E27A1BF870
 for <buildroot@lists.busybox.net>; Sat,  2 Jul 2022 07:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66BC8401FB
 for <buildroot@lists.busybox.net>; Sat,  2 Jul 2022 07:56:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66BC8401FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IV5b4qogC5I4 for <buildroot@lists.busybox.net>;
 Sat,  2 Jul 2022 07:56:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59B4A400F2
 for <buildroot@buildroot.org>; Sat,  2 Jul 2022 07:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59B4A400F2
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D51EC85FBE; Sat,  2 Jul 2022 07:43:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 2 Jul 2022 09:52:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da7b674d91e541fdde64cff9181d328562720026
X-Git-Newrev: b034109dd60a429690acf9c5501c6658c53eae13
X-Patchwork-Hint: ignore
Message-Id: <20220702074332.D51EC85FBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: security bump to version
 7.84.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b034109dd60a429690acf9c5501c6658c53eae13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2022-32205: Set-Cookie denial of service
  https://curl.se/docs/CVE-2022-32205.html

- CVE-2022-32206: HTTP compression denial of service
  https://curl.se/docs/CVE-2022-32206.html

- CVE-2022-32207: Unpreserved file permissions
  https://curl.se/docs/CVE-2022-32207.html

- CVE-2022-32208: FTP-KRB bad message verification
  https://curl.se/docs/CVE-2022-32208.html

Changelog: https://curl.se/changes.html

Upstream removed configure option --enable-hidden-symbols:
https://github.com/curl/curl/commit/0c2d3118aa2bc040411203d33ab6034067fd9d62

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Peter: mark as security bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 8672380f09..672591e470 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-7.83.1.tar.xz.asc
+# https://curl.se/download/curl-7.84.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  2cb9c2356e7263a1272fd1435ef7cdebf2cd21400ec287b068396deb705c22c4  curl-7.83.1.tar.xz
+sha256  2d118b43f547bfe5bae806d8d47b4e596ea5b25a6c1f080aef49fbcd817c5db8  curl-7.84.0.tar.xz
 sha256  321b1a09ebc30410f2e837c072e5521cf7095b757193af4a7dae1086e36ed31a  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 11f1e4de59..e241bd1c88 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.83.1
+LIBCURL_VERSION = 7.84.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
@@ -23,7 +23,7 @@ LIBCURL_INSTALL_STAGING = YES
 # Likewise, there is no compiler on the target, so libcurl-option (to
 # generate C code) isn't very useful
 LIBCURL_CONF_OPTS = --disable-manual --disable-ntlm-wb \
-	--enable-hidden-symbols --with-random=/dev/urandom --disable-curldebug \
+	--with-random=/dev/urandom --disable-curldebug \
 	--disable-libcurl-option --disable-ldap --disable-ldaps
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
