Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDF3C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2625B85813;
	Sun, 12 Dec 2021 14:14:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZZSDu7GiGgqe; Sun, 12 Dec 2021 14:14:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 377968580C;
	Sun, 12 Dec 2021 14:14:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69D6E1BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5A1285751
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:12:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zV8GRmM5tJhh for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:12:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81FAC85749
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:12:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9E97C82D86; Sun, 12 Dec 2021 14:06:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 14:47:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b35ad822f156d52e097e6bf9f1c0cd2ddfe43fab
X-Git-Newrev: 083f4e73a040a8927a820ba33d00aa14e71d8204
X-Patchwork-Hint: ignore
Message-Id: <20211212140652.9E97C82D86@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swupdate: bump to version 2021.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=083f4e73a040a8927a820ba33d00aa14e71d8204
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new optional dependencies.

Add new env variables for dependencies.

Don't disable mbedtls if openssl is selected as swupdate configuration
will select which gets used.

License update details

LICENSES/BSD-2-Clause.txt removed:
https://github.com/sbabic/swupdate/commit/c1cc280425b9f0bf22187d991dd5414dde257813

LICENSES/CC-BY-ND-4.0.txt -> LICENSES/CC-BY-SA-4.0.txt:
https://github.com/sbabic/swupdate/commit/3612a85f3664356b8d52f9c36974f58d879052ee

LICENSES/LicenseRef-OpenSSL-Exception.txt removed:
https://github.com/sbabic/swupdate/commit/b6c0adbc545675babf0a324e3410407f9d985b1e

LICENSES/OFL-1.1.txt added:
https://github.com/sbabic/swupdate/commit/1b41348e8cc77d30c46eb9cd4ac8051aced2f2ea

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/swupdate/swupdate.hash |  7 +++----
 package/swupdate/swupdate.mk   | 41 +++++++++++++++++++++++++++--------------
 2 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 8bfbc7c8b9..e431ecf40b 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,13 +1,12 @@
 # Locally calculated
-sha256  5afe78ae94e869bcb911d8592251641cdab80096d8e5149d483054ea49f9aab8  swupdate-2021.04.tar.gz
+sha256  4d078e57bb91e17025ee8cb1bb54c25532e8d2dbe329bba6a7a0328ac34a07e3  swupdate-2021.11.tar.gz
 sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
-sha256  3139f288c2e4cbe4a8c0e8c13c82661f3c798d446e1fbbc27a48a69aa7b4ec0d  LICENSES/BSD-2-Clause.txt
 sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
-sha256  6e4efcb1952c7976d3fae93b802c591384c4f50949225a802adf41bc266fa3e6  LICENSES/CC-BY-ND-4.0.txt
+sha256  cde7883b9050a1104f4ac19a1572aafd6e5d7323b68351aaf51fbf4beba54966  LICENSES/CC-BY-SA-4.0.txt
 sha256  5d51b52a40391a26cbb2accf5dc5d1c165de49a022d9d5efb50b22204d2682ec  LICENSES/GPL-2.0-only.txt
 sha256  43fd695e9b198a9a4997cc2d02e10d26cae937e2c4930b9eff9c6d349c85cd32  LICENSES/GPL-2.0-or-later.txt
 sha256  492e801f1b0632185431472f148885a4fe8e990b10da57b4986a8bcf140a5374  LICENSES/ISC.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
-sha256  43492b377cf2fb67942d1dd231146bd4e6578646ad13ef289297c9dd75cbc478  LICENSES/LicenseRef-OpenSSL-Exception.txt
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSES/MIT.txt
+sha256  8f2368a292194be10b1223a8875815240a9208bb30785cb13d8849eb6a750fe9  LICENSES/OFL-1.1.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 5ed2ca55d2..e16060f5cb 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,20 +4,19 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2021.04
+SWUPDATE_VERSION = 2021.11
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
-SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+ with OpenSSL exception, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-2-Clause, BSD-3-Clause, CC0-1.0, CC-BY-ND-4.0
+SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
 SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
-	LICENSES/BSD-2-Clause.txt \
 	LICENSES/BSD-3-Clause.txt \
 	LICENSES/CC0-1.0.txt \
-	LICENSES/CC-BY-ND-4.0.txt \
+	LICENSES/CC-BY-SA-4.0.txt \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-2.0-or-later.txt \
 	LICENSES/ISC.txt \
 	LICENSES/LGPL-2.1-or-later.txt \
-	LICENSES/LicenseRef-OpenSSL-Exception.txt \
-	LICENSES/MIT.txt
+	LICENSES/MIT.txt \
+	LICENSES/OFL-1.1.txt
 
 # swupdate uses $CROSS-cc instead of $CROSS-gcc, which is not
 # available in all external toolchains, and use CC for linking. Ensure
@@ -28,6 +27,9 @@ SWUPDATE_MAKE_ENV = CC="$(TARGET_CC)" LD="$(TARGET_CC)" SKIP_STRIP=y
 
 ifeq ($(BR2_PACKAGE_E2FSPROGS),y)
 SWUPDATE_DEPENDENCIES += e2fsprogs
+SWUPDATE_MAKE_ENV += HAVE_LIBEXT2FS=y
+else
+SWUPDATE_MAKE_ENV += HAVE_LIBEXT2FS=n
 endif
 
 ifeq ($(BR2_PACKAGE_EFIBOOTMGR),y)
@@ -72,6 +74,13 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBCURL=n
 endif
 
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBFDISK),y)
+SWUPDATE_DEPENDENCIES += util-linux
+SWUPDATE_MAKE_ENV += HAVE_LIBFDISK=y
+else
+SWUPDATE_MAKE_ENV += HAVE_LIBFDISK=n
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGPIOD),y)
 SWUPDATE_DEPENDENCIES += libgpiod
 SWUPDATE_MAKE_ENV += HAVE_LIBGPIOD=y
@@ -104,6 +113,13 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LUA=n
 endif
 
+ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+SWUPDATE_DEPENDENCIES += mbedtls
+SWUPDATE_MAKE_ENV += HAVE_MBEDTLS=y
+else
+SWUPDATE_MAKE_ENV += HAVE_MBEDTLS=n
+endif
+
 ifeq ($(BR2_PACKAGE_MTD),y)
 SWUPDATE_DEPENDENCIES += mtd
 SWUPDATE_MAKE_ENV += HAVE_LIBMTD=y
@@ -113,21 +129,13 @@ SWUPDATE_MAKE_ENV += HAVE_LIBMTD=n
 SWUPDATE_MAKE_ENV += HAVE_LIBUBI=n
 endif
 
-# OpenSSL or mbedTLS
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SWUPDATE_DEPENDENCIES += openssl
 SWUPDATE_MAKE_ENV += HAVE_LIBSSL=y
 SWUPDATE_MAKE_ENV += HAVE_LIBCRYPTO=y
-SWUPDATE_MAKE_ENV += HAVE_MBEDTLS=n
 else
 SWUPDATE_MAKE_ENV += HAVE_LIBSSL=n
 SWUPDATE_MAKE_ENV += HAVE_LIBCRYPTO=n
-ifeq ($(BR2_PACKAGE_MBEDTLS),y)
-SWUPDATE_DEPENDENCIES += mbedtls
-SWUPDATE_MAKE_ENV += HAVE_MBEDTLS=y
-else
-SWUPDATE_MAKE_ENV += HAVE_MBEDTLS=n
-endif
 endif
 
 ifeq ($(BR2_PACKAGE_P11_KIT),y)
@@ -139,10 +147,12 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 SWUPDATE_DEPENDENCIES += systemd
+SWUPDATE_MAKE_ENV += HAVE_LIBSYSTEMD=y
 define SWUPDATE_SET_SYSTEMD
 	$(call KCONFIG_ENABLE_OPT,CONFIG_SYSTEMD)
 endef
 else
+SWUPDATE_MAKE_ENV += HAVE_LIBSYSTEMD=n
 define SWUPDATE_SET_SYSTEMD
 	$(call KCONFIG_DISABLE_OPT,CONFIG_SYSTEMD)
 endef
@@ -185,6 +195,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBRSYNC),y)
 SWUPDATE_DEPENDENCIES += librsync
+SWUPDATE_MAKE_ENV += HAVE_LIBRSYNC=y
+else
+SWUPDATE_MAKE_ENV += HAVE_LIBRSYNC=n
 endif
 
 ifeq ($(BR2_PACKAGE_SWUPDATE_WEBSERVER),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
