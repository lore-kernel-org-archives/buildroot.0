Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4384E606A329
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 21:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HWpDtHjB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=ZHWXP1b9
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C0714073D;
	Sat, 14 Nov 2026 21:04:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S043TZOfpAUZ; Sat, 14 Nov 2026 21:04:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9472D40750
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794690296;
	b=BToEANhLqyNOz1NdBs4mccx0DaiEzEEpOsDPyFjXC5A/kNoJbqTT88Kznk7KDpt5xV+h
	 ucSfO1OZgkEC7nB8iUIXg7/rgcD+BTDupCJOC2xn/lcuneGsTxVsiQn3TNApgmn4CYYG4
	 iORD4NM3xiZipGNNORzNm5CO+OrTzBPJixXel1SxtorhvoJWbmxhSh5SAjjUj02/0kLHa
	 nzwqITWeLRvvG1Cw2U11HjrqQU466xFrk+5+P9keg6A7jPG4udYndYiGcZ5mUz/KT/f9I
	 rb60bGCE1/vKPeUvAVRaCF9IOm9bC5fzgAw6qytI3hIgKAq/cGT41vrPhrgbJpTssOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794690296;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=3ydJJqjvnjpNwOGHwSp7TbcYgyF4omvR2mjeFrOOH0I=;
	b=eykviUM8FfZKpXFKstgfYjQo5y4d7uvbf8drVdHOJXqXLl0apAYYN0obVd/Wl4iw96A4
	 +l0WlzkuMJv47fKzK47a5wT0gdBKq6ZdGQD/pe7wWGL4nKaNepJwLQSTXiUzI8qfJJvt4
	 XLlZdaxY9ewBeZzyN9oGq+r252+MuwQ77W53+TuBMf4DzFliInlEhACI7pioLm3YIxsZn
	 GQvXPdgYY4DJNsfFlHNl6TKD1XPgksn/H1XqHN9zf4f1sTHu422YZ4/oZoIPiIbFJbIUr
	 iupQyxifEPwivfTcJ81bijLssb3ppfl6OjzMMdlPrYhu27WSfcAyfGygE8XLUUE+VEg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794690296;
	bh=3ydJJqjvnjpNwOGHwSp7TbcYgyF4omvR2mjeFrOOH0I=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HWpDtHjBt0KiNyuGeVtc62u/06D8R/p0jI8tW+AcwY9KiI4lbFtxLlRPDrXBuiRO1
	 NZEz7KVfQlNar4SOtXTbcirsPmlkcAN7TUIMuQ6CsZ8mmiuuh7NyEpHtTT+6+ccujh
	 RGsd+Rol+lcAnV4X6cDbwMfZNl5k800KQOcFq9fzGlPlN7y8BLzUH+lU+V2mEEF8mj
	 nOHJ8CD39gCGuagdHL6JGz5YmJra8jp71s0OewRsI15ndkW4CisXWUfGV51vhQaDv9
	 QuyCM5yRucmkKnAdfmpvPpfhva1s6S188g60swITEIuAotdFX9tAMry3Ev235WNRrm
	 knYO60YW15xVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9472D40750;
	Sat, 14 Nov 2026 21:04:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7154772D
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 21:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DA3C6062B
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 21:04:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kVX0KQ4tUc0o for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 21:04:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DCA26605F0
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.132
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.132;
 helo=smtpcmd04132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=ZHWXP1b9
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DCA26605F0
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 21:04:51 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id SKvZxXcqqtleFSKvZxL3kO; Sat, 14 Nov 2026 22:04:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1794690290; bh=/0YHlD6g2bxBwwytw1IFOA33v/XY38pQSWwH6mroAOs=;
 h=From:To:Subject:Date:MIME-Version;
 b=ZHWXP1b9rJaEUiSAxjq8RtrPGGDN+MGo2kcBjf4jGXsX6KoCKq8GFMsfU0isuj8eG
 DJ+6hJsWQxQyVBIK1d1ihV78qNnBBBaUcnN8DChju5UEW6VnEOt27WNqMUt+GAEsrK
 hdcJ61NFifHPpDbPuuLaWRSLFWOnZ43FQVSZNILNxAeuGFzT0itNKNIAXMbnL0n5/d
 QO1UzAMPKKbIAYL/ZCN5NhP+TvutTKQCj/soPNqOsOTrKhsuWbqyJRrxAIZ5x/TVah
 I0iqGKmc9HhOG6bBVChXeFKcAlUmyAhIz/VwoNXBCBjU/m56louIyqFLii8ED4BJAN
 qs75yrCwc205w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Marek Belisko <marek.belisko@open-nandra.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Claude Opus 5.5" <noreply@anthropic.com>
Date: Sat, 14 Nov 2026 22:04:48 +0100
Message-ID: <20261114210449.1550804-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFImFfR9Ywv1VYwl9ywaDwkJuX8y5l/9irJqyNx2iBal/a/nxK+rpb53OGBsldvmt7Gjb+rex77mJ1omh8XOr9x3n+YBpB2N31pse7J9Qlwyn7CE3SNy
 e/azBxG0ChMop7jfo3QOJl3kxwCfcUAz0pzPJEtbkd7ZFWv+yU2UCsMiIQ0znXBqAEjMyXtgrUIPk38O+G59+QaBrn6J4y43iK9LDtUOCQ0BscFxjfQc3NKl
 hIEv/beJDsM7JS3fHdRjVlb986RZJPrN/HtcSfgEuw0zijmv8DbGlQgupo4R7YPxIFoTvZawFAXHKtPFob6/SQ+i3A2VS1KXsa6yittaQH5ugW/lKsqgOhoR
 UwHdd59F
Subject: [Buildroot] [PATCH 1/2] package/libblockdev: bump to version 3.6.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release notes:
https://github.com/storaged-project/libblockdev/releases/tag/3.6.0

The crypto plugin now uses libdevmapper directly, so add lvm2 to the
dependencies of the crypto plugin (it was previously only pulled in
indirectly through cryptsetup).

Refresh patch 0001 so it applies without fuzz.

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...ide-replacement-function-for-strerror_l.patch | 16 ++++++++--------
 package/libblockdev/Config.in                    |  1 +
 package/libblockdev/libblockdev.hash             |  2 +-
 package/libblockdev/libblockdev.mk               |  4 ++--
 4 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
index dbbe3e5c4a..d350609373 100644
--- a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
+++ b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
@@ -1,4 +1,4 @@
-From 3d198be196bdc59ba332b87d8c2959de0b9160d2 Mon Sep 17 00:00:00 2001
+From 3cddbb1e225b4361fdec9c79799bdc35270c1f7a Mon Sep 17 00:00:00 2001
 From: Giulio Benetti <giulio.benetti@benettiengineering.com>
 Date: Sat, 20 Jan 2024 13:29:28 +0100
 Subject: [PATCH] Provide replacement function for strerror_l()
@@ -11,7 +11,7 @@ Upstream: N/A since it's due uclibc only
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-[Giulio: ported to version 3.0, 3.1 and 3.5]
+[Giulio: ported to version 3.0, 3.1, 3.5 and 3.6]
 ---
  configure.ac          | 2 ++
  src/utils/dev_utils.c | 1 +
@@ -20,7 +20,7 @@ Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
  4 files changed, 8 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index e5d65d8b..507fa854 100644
+index c129e1a..6a48df1 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -123,6 +123,8 @@ AC_CHECK_HEADERS([dlfcn.h string.h unistd.h sys/fcntl.h sys/ioctl.h linux/random
@@ -33,11 +33,11 @@ index e5d65d8b..507fa854 100644
      AS_HELP_STRING([--with-escrow], [support escrow @<:@default=yes@:>@]),
      [],
 diff --git a/src/utils/dev_utils.c b/src/utils/dev_utils.c
-index 89a54b4c..b4be5b44 100644
+index 8587bed..619cc30 100644
 --- a/src/utils/dev_utils.c
 +++ b/src/utils/dev_utils.c
-@@ -23,6 +23,7 @@
- #include <errno.h>
+@@ -24,6 +24,7 @@
+ #include <stdlib.h>
  
  #include "dev_utils.h"
 +#include "utils.h"
@@ -45,7 +45,7 @@ index 89a54b4c..b4be5b44 100644
  /**
   * bd_utils_dev_utils_error_quark: (skip)
 diff --git a/src/utils/module.c b/src/utils/module.c
-index 11e139f8..c8b124e0 100644
+index f36579e..edeaaf0 100644
 --- a/src/utils/module.c
 +++ b/src/utils/module.c
 @@ -28,6 +28,7 @@
@@ -57,7 +57,7 @@ index 11e139f8..c8b124e0 100644
  
  /**
 diff --git a/src/utils/utils.h b/src/utils/utils.h
-index 801a8b6e..b2bdf0d0 100644
+index 801a8b6..b2bdf0d 100644
 --- a/src/utils/utils.h
 +++ b/src/utils/utils.h
 @@ -9,6 +9,10 @@
diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index e9e9faaa05..beebf523da 100644
--- a/package/libblockdev/Config.in
+++ b/package/libblockdev/Config.in
@@ -28,6 +28,7 @@ config BR2_PACKAGE_LIBBLOCKDEV_CRYPTO
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup -> json-c
 	select BR2_PACKAGE_CRYPTSETUP
 	select BR2_PACKAGE_KEYUTILS
+	select BR2_PACKAGE_LVM2 # devmapper
 
 config BR2_PACKAGE_LIBBLOCKDEV_FS
 	bool "filesystem"
diff --git a/package/libblockdev/libblockdev.hash b/package/libblockdev/libblockdev.hash
index e76e02a756..22cb9f271a 100644
--- a/package/libblockdev/libblockdev.hash
+++ b/package/libblockdev/libblockdev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bccd30e6b5d11504de60d9889ff6a2a25b07a4ec8f04070f2387e168301b3e3a  libblockdev-3.5.0.tar.gz
+sha256  9c21338257746cd00c25fcf5975716d016b6d43bfde20ee21f254cbf7d0d2742  libblockdev-3.6.0.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index 89a398c6e5..b439ecd266 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLOCKDEV_VERSION = 3.5.0
+LIBBLOCKDEV_VERSION = 3.6.0
 LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)
 LIBBLOCKDEV_LICENSE = LGPL-2.1
 LIBBLOCKDEV_LICENSE_FILES = LICENSE
@@ -27,7 +27,7 @@ LIBBLOCKDEV_CONF_OPTS = \
 	--without-tools
 
 ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_CRYPTO),y)
-LIBBLOCKDEV_DEPENDENCIES += cryptsetup keyutils
+LIBBLOCKDEV_DEPENDENCIES += cryptsetup keyutils lvm2
 LIBBLOCKDEV_CONF_OPTS += --with-crypto
 else
 LIBBLOCKDEV_CONF_OPTS += --without-crypto
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
