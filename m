Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C252EE49A5
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 346EE41521;
	Mon, 21 Aug 2023 20:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 346EE41521
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u_wARSAMvvPU; Mon, 21 Aug 2023 20:23:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 625A04154F;
	Mon, 21 Aug 2023 20:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 625A04154F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 02A5B1BF279
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD19460FB9
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD19460FB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bIUd3bfK_UQL for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:22:34 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4F5D60709
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4F5D60709
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C510813F892;
 Mon, 21 Aug 2023 22:22:29 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Aug 2023 22:22:16 +0200
Message-ID: <20230821202217.474022-2-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821202217.474022-1-ju.o@free.fr>
References: <20230821202217.474022-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692649352;
 bh=oJz3yT6/ooDRBJESuokBZCywSHouX50pyyX6RM8MEoI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SA6aQ5TcH/wvyQdN1qOSBRtTXeSgTqsrmC+CzhHPkaSSD6dmCuPgdwA6al6YwI27P
 gfkxUl53Lly1KzwnelheALMasF2I8YiZJ34asF5hTTIHukS7FcbwuXGLAl6LE/AwAx
 63plC7E1SHBMPsxZG2zMXAh+Pbwy33jjEX+SHN1M42zzdo6GQC2WG6dLcy1Lt41DrN
 9HvPxo/V71bA5/+z1LOvU3hwkhbZRL8Soma+61xKDZh83yuaLxJ1wOJZaS0Aconm/a
 /Vuv+R8RUozh/8MzOkJESIPvMp4ph6ZsJuSYKrOF4Z36gsLkaiEesS/u/GCc7As1EI
 zpJHrwDy83gCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SA6aQ5Tc
Subject: [Buildroot] [PATCH next 2/2] package/libassuan: bump to version
 2.5.6
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

This commit also moves the archive SHA256 hash to the section of hashes
published upstream.

libassuan 2.5.6 updated its gpg-error.m4 macro files to detect
gpgrt-config. Its path needs to be forced in _CONF_ENV to make sure it
will work in all host environments. See the log entry of commit
d7f2d8403e "package/gnupg2: fix build failure when host provides an
old gpgrt-config" [3] for a complete explanation.

[1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libassuan.git;a=log;h=libassuan-2.5.6
[2] https://dev.gnupg.org/T6542
[3] https://git.buildroot.org/buildroot/commit/?id=d7f2d8403ec82f3b1772ec17bf1df8c42987a1f8

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch series tested on branch next at commit bfa4a7c woth commands:

    make check-package
    ...
    0 warnings generated

    utils/test-pkg -p libassuan
    ...
    6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

    # Note: libassuan is a dependency of gnupg2
    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_gnupg2
    ...
    OK
---
 package/libassuan/libassuan.hash | 6 +++---
 package/libassuan/libassuan.mk   | 6 +++++-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/libassuan/libassuan.hash b/package/libassuan/libassuan.hash
index c817a3af63..89e3fea956 100644
--- a/package/libassuan/libassuan.hash
+++ b/package/libassuan/libassuan.hash
@@ -1,8 +1,8 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  ec4f67c0117ccd17007c748a392ded96dc1b1ae9  libassuan-2.5.5.tar.bz2
+sha1  b1e8754dbf89b3a3eb175f5df75048dbca1fce57  libassuan-2.5.6.tar.bz2
+sha256  e9fd27218d5394904e4e39788f9b1742711c3e6b41689a31aa3380bd5aa4f426  libassuan-2.5.6.tar.bz2
 # Locally calculated after checking signature
-# https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.5.tar.bz2.sig
+# https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.6.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256  8e8c2fcc982f9ca67dcbb1d95e2dc746b1739a4668bc20b3a3c5be632edb34e4  libassuan-2.5.5.tar.bz2
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index 0f69d1ba6b..fb95a6fd67 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASSUAN_VERSION = 2.5.5
+LIBASSUAN_VERSION = 2.5.6
 LIBASSUAN_SITE = https://gnupg.org/ftp/gcrypt/libassuan
 LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION).tar.bz2
 LIBASSUAN_LICENSE = LGPL-2.1+ (library), GPL-3.0 (tests, doc)
@@ -15,4 +15,8 @@ LIBASSUAN_CONF_OPTS = \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr
 LIBASSUAN_CONFIG_SCRIPTS = libassuan-config
 
+# Force the path to "gpgrt-config" (from the libgpg-error package) to
+# avoid using the one on host, if present.
+LIBASSUAN_CONF_ENV += GPGRT_CONFIG=$(STAGING_DIR)/usr/bin/gpgrt-config
+
 $(eval $(autotools-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
