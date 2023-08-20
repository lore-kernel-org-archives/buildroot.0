Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA63EE4996
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 20:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4892A60BE9;
	Sun, 20 Aug 2023 20:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4892A60BE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aMHID6LGo97T; Sun, 20 Aug 2023 20:48:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B37A760B32;
	Sun, 20 Aug 2023 20:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B37A760B32
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C814D1BF2F7
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 20:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA7DB402EB
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 20:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA7DB402EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GFBElniezQQ5 for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 20:48:17 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EBE304032C
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 20:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBE304032C
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B918A13F81D;
 Sun, 20 Aug 2023 22:48:12 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 22:48:06 +0200
Message-ID: <20230820204806.326553-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692564493;
 bh=IsMBLlNABoTxv2eGmImNe2y2F6ZFcSbxDiGYTYu459M=;
 h=From:To:Cc:Subject:Date:From;
 b=hq5pn/4zFBsboSME13TwXJoCVN7fQbH/OZNzz7wMfuDksPJnnASvbaC+wkwIv9AY7
 H0uZIgLCD0RmOs63Tps+oOMcRGPYXvY34Rj71/VrZfK0s/Mrd5Pqbg4WxGxqrFUB9T
 uSWUd/aAMCTgICN5QHK5tKWGYyLBy1Q4DHlkNyhtCgiysd9iQYbt5DX9eok0O8EjwN
 oigt4T67RnEcCWMBhqd/2LWJpoEEEX7lFT17bEz0es8Cy6mrmSdr7bcnP1pidTDHIU
 EmlMAalBtiwjA7WN6MxHdVoPtbIt0oxqgMgThlv+5HdUPbjdqFg5CGTfgWsQcidg3x
 Rh/N5SkLfda6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hq5pn/4z
Subject: [Buildroot] [PATCH next 1/1] package/libksba: bump to version 1.6.4
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see [1] and [2].

This commit also change the comment in hash file to add a link to the
integrity check procedure. It also includes SHA1 hash published
upstream.

The AUTHORS file hash is updated. It was reformatted, in upstream
commit [3].

libksba 1.6.4 updated its gpg-error.m4 macro files to detect
gpgrt-config. Its path needs to be forced in _CONF_ENV to make sure it
will work in all host environments. See the log entry of commit
d7f2d8403e "package/gnupg2: fix build failure when host provides an
old gpgrt-config" [4] for a complete explanation.

[1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libksba.git;a=log;h=libksba-1.6.4
[2] https://dev.gnupg.org/T6543
[3] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libksba.git;a=commitdiff;h=557999424ebd13e70d6fc17e648a5dd2a06f440b
[4] https://git.buildroot.org/buildroot/commit/?id=d7f2d8403ec82f3b1772ec17bf1df8c42987a1f8

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libksba/libksba.hash | 7 ++++---
 package/libksba/libksba.mk   | 6 +++++-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/libksba/libksba.hash b/package/libksba/libksba.hash
index 5c6c5eda7a..08b599dc0f 100644
--- a/package/libksba/libksba.hash
+++ b/package/libksba/libksba.hash
@@ -1,8 +1,9 @@
-# Locally calculated after checking pgp signature
-sha256  3f72c68db30971ebbf14367527719423f0a4d5f8103fc9f4a1c01a9fa440de5c  libksba-1.6.3.tar.bz2
+# From https://www.gnupg.org/download/integrity_check.html
+sha1  258c31c72adda2ef547d94038b7e0fd7bd93d03c  libksba-1.6.4.tar.bz2
+sha256  bbb43f032b9164d86c781ffe42213a83bf4f2fee91455edfa4654521b8b03b6b  libksba-1.6.4.tar.bz2
 
 # Hash for license files:
-sha256  8f1b87e551d97b2b23b6d3403a5d598c63ea89824cb8ee351f631f6cab2beaa5  AUTHORS
+sha256  f9c59ea5a5e1dfdeebcd134e6a594c21eb088cc95f6653ee99ff2e187c105380  AUTHORS
 sha256  6197b98c6bf69838c624809c509d84333de1bc847155168c0e84527446a27076  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  0abbff814cd00e2b0b6d08395af2b419c1a92026c4b4adacbb65ccda45fa58cf  COPYING.GPLv3
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index b7c0508df8..6780d0d81b 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKSBA_VERSION = 1.6.3
+LIBKSBA_VERSION = 1.6.4
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = https://gnupg.org/ftp/gcrypt/libksba
 LIBKSBA_LICENSE = LGPL-3.0+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
@@ -14,4 +14,8 @@ LIBKSBA_INSTALL_STAGING = YES
 LIBKSBA_DEPENDENCIES = libgpg-error
 LIBKSBA_CONF_OPTS = --with-gpg-error-prefix=$(STAGING_DIR)/usr
 
+# Force the path to "gpgrt-config" (from the libgpg-error package) to
+# avoid using the one on host, if present.
+LIBKSBA_CONF_ENV += GPGRT_CONFIG=$(STAGING_DIR)/usr/bin/gpgrt-config
+
 $(eval $(autotools-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
