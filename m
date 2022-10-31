Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3E2C38A02
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 09:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D1048124D;
	Mon, 31 Oct 2022 09:57:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D1048124D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YYIoBAhq1qQX; Mon, 31 Oct 2022 09:57:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10345812F0;
	Mon, 31 Oct 2022 09:57:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10345812F0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F38151BF95D
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDC374034A
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDC374034A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mvguq6rK5Wb8 for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 09:57:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFE524033A
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 09:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFE524033A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A98E987844; Mon, 31 Oct 2022 09:57:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 10:50:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68df37aeb47671bc5931d5539e1f5bc04777fab9
X-Git-Newrev: 5a172ef532b6e27eab501af6ae82b26ab912e48a
X-Patchwork-Hint: ignore
Message-Id: <20221031095715.A98E987844@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flac: bump version to 1.4.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a172ef532b6e27eab501af6ae82b26ab912e48a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://xiph.org/flac/changelog.html

Switched _SITE to https and update project URL.

Upstream removed the dependency to host-nasm:
https://github.com/xiph/flac/commit/75ef7958df603ca6de29fa00e82615e0da017903#diff-49473dca262eeab3b4a43002adb08b4db31020d190caaad1594b47f1d5daa810L474

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/flac/Config.in |  2 +-
 package/flac/flac.hash |  4 ++--
 package/flac/flac.mk   | 11 ++---------
 3 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/package/flac/Config.in b/package/flac/Config.in
index 267acb7f34..62aca290fe 100644
--- a/package/flac/Config.in
+++ b/package/flac/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_FLAC
 	help
 	  FLAC is an Open Source lossless audio codec.
 
-	  http://flac.sourceforge.net/
+	  https://xiph.org/flac/
 
 comment "flac needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/flac/flac.hash b/package/flac/flac.hash
index 1f7763fd6e..b993ebd759 100644
--- a/package/flac/flac.hash
+++ b/package/flac/flac.hash
@@ -1,5 +1,5 @@
-# From http://downloads.xiph.org/releases/flac/SHA256SUMS.txt
-sha256  af41c0733c93c237c3e52f64dd87e3b0d9af38259f1c7d11e8cbf583c48c2506  flac-1.4.0.tar.xz
+# From https://ftp.osuosl.org/pub/xiph/releases/flac/SHA256SUMS.txt
+sha256  e322d58a1f48d23d9dd38f432672865f6f79e73a6f9cc5a5f57fcaa83eb5a8e4  flac-1.4.2.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LGPL
diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index 91d5840d72..ebb4778521 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FLAC_VERSION = 1.4.0
-FLAC_SITE = http://downloads.xiph.org/releases/flac
+FLAC_VERSION = 1.4.2
+FLAC_SITE = https://ftp.osuosl.org/pub/xiph/releases/flac
 FLAC_SOURCE = flac-$(FLAC_VERSION).tar.xz
 FLAC_INSTALL_STAGING = YES
 FLAC_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
@@ -27,11 +27,4 @@ else
 FLAC_CONF_OPTS += --disable-ogg
 endif
 
-ifeq ($(BR2_X86_CPU_HAS_SSE),y)
-FLAC_DEPENDENCIES += host-nasm
-FLAC_CONF_OPTS += --enable-sse
-else
-FLAC_CONF_OPTS += --disable-sse
-endif
-
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
