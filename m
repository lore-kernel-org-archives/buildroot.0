Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C2EE9536D
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 10:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E83AD40575;
	Wed,  4 Feb 2026 10:26:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nscNiVhQVL2z; Wed,  4 Feb 2026 10:26:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E55B84057C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770200791;
	bh=SH0CzhjnyTInw+kKRiZGkzaPoCrZgfSKJl78k1nM11o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ccnLNIfmd089qnOdjgmNTdEVpVrTftMqVyxqgMfwZ3wOJzpGE4UYjP9sryrXV+/Tp
	 fza2gStbDyOFb5D2Dc3G9/Ni2be/aV2WwenpRitxAWYIGWveJTcVKquDhRrC/zR74A
	 XZxUlFhTS4oanojLXtpLdJi+CPW+5MM57SLVH12x+yUhUaUwPirYiG0W+3G1cFOYQu
	 P2QU4egHkYPLsqswVePI304MPml4pX+FkyaDR/50Ponk5mZZXs/MtmsWxR2dM6qNzj
	 f8zY0Czl7LN1JEVtmUz/8osYEr+aoAp0b8LT6YciIa4G65fAkneNihe+Oo9Q/TZK96
	 jAHB1vZKdJe1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E55B84057C;
	Wed,  4 Feb 2026 10:26:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 089E6F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFD66400F6
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:26:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yftYyALX-t-Y for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 10:26:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB7514005C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB7514005C
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:26:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A9848685A; Wed,  4 Feb 2026 10:26:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 11:22:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 166bfd3e6690979ba6b044809a86651f6eb3f440
X-Git-Newrev: fefc82a35bc99b24c2f4923ecbd41fb5997d37b1
X-Patchwork-Hint: ignore
Message-Id: <20260204102627.8A9848685A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wine: bump to version 11.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fefc82a35bc99b24c2f4923ecbd41fb5997d37b1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release notes, see:
https://gitlab.winehq.org/wine/wine/-/releases/wine-11.0

The --without-osmesa configure option was removed upstream, in
commit [1]. This commit removes the options from _CONF_OPTS.

Also, since upstream commit [2], the /usr/bin/wine program became
a "tool". It needs to be enabled when cross-compiling. As suggested
in [3], this commit adds --enable-tools in WINE_CONF_OPTS.

This commit also updates the LICENSE file hash, after year
update in [4].

[1] https://gitlab.winehq.org/wine/wine/-/commit/370e7d9a50593077e958f3efcc70254990bfe6f3
[2] https://gitlab.winehq.org/wine/wine/-/commit/6d28db86c9c2559e67a4820175416aff20f7abec
[3] https://bugs.winehq.org/show_bug.cgi?id=57847
[4] https://gitlab.winehq.org/wine/wine/-/commit/ab59cc16c56fa7400c2076990b53ea95f6889902

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/wine/wine.hash | 8 ++++----
 package/wine/wine.mk   | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index eb0d45ca0a..65cab0ed5f 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,8 +1,8 @@
 # From:
-# https://dl.winehq.org/wine/source/10.0/sha512sums.asc
-sha512  effb41c5641993e2e52eaa825cc19b7d9846e084992c5a5b066ead2339b24384d320898a9cee347a9a87106bcb3b0f54c8cd2c8d4de3a887a658052ddd5168d6  wine-10.0.tar.xz
+# https://dl.winehq.org/wine/source/11.0/sha512sums.asc
+sha512  a2c3db14f8cf0d19927466805c8f17c68ee7e93d1196d1162dd2279af497c21ec611a63f7a9de59953bbdfdb44c87d7bf55373c6533224a5d54e434c29428d1b  wine-11.0.tar.xz
 # Locally calculated after checking pgp signature
-sha256  c5e0b3f5f7efafb30e9cd4d9c624b85c583171d33549d933cd3402f341ac3601  wine-10.0.tar.xz
+sha256  c07a6857933c1fc60dff5448d79f39c92481c1e9db5aa628db9d0358446e0701  wine-11.0.tar.xz
 # Locally calculated
 sha256  e237fa56668030e928551ddd60f05df5fe957f75eab874bbd017e085ed722e7c  COPYING.LIB
-sha256  51433d87540ee2f30e3cff986e00e1477880002bf993106a13775ed60d4e0af4  LICENSE
+sha256  ae025f125a5d639f0f7abe5146efa1e3d7453cc10b744b2910806fa3f46626ef  LICENSE
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 380f729585..4f0e229e9a 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -10,9 +10,9 @@
 # development version, unless it is absolutely needed (for example:
 # incompatibility with another library and no maintenance stable
 # version is available).
-WINE_VERSION = 10.0
+WINE_VERSION = 11.0
 WINE_SOURCE = wine-$(WINE_VERSION).tar.xz
-WINE_SITE = https://dl.winehq.org/wine/source/10.0
+WINE_SITE = https://dl.winehq.org/wine/source/11.0
 WINE_LICENSE = LGPL-2.1+
 WINE_LICENSE_FILES = COPYING.LIB LICENSE
 WINE_CPE_ID_VENDOR = winehq
@@ -25,6 +25,7 @@ WINE_CONF_OPTS = \
 	--with-wine-tools=../host-wine-$(WINE_VERSION) \
 	--disable-tests \
 	--disable-win64 \
+	--enable-tools \
 	--without-capi \
 	--without-coreaudio \
 	--without-gettext \
@@ -33,8 +34,7 @@ WINE_CONF_OPTS = \
 	--without-mingw \
 	--without-opencl \
 	--without-oss \
-	--without-vulkan \
-	--without-osmesa  # BR2_PACKAGE_MESA3D_OSMESA_GALLIUM removed in mesa 25.1
+	--without-vulkan
 
 # Wine uses a wrapper around gcc, and uses the value of --host to
 # construct the filename of the gcc to call.  But for external
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
