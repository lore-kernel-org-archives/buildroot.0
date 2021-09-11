Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0793DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:44:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A779B61050
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A779B61050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88AAB82640;
	Sat, 11 Sep 2021 20:44:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bSbW1iFAmdCc; Sat, 11 Sep 2021 20:44:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB3D980F57;
	Sat, 11 Sep 2021 20:44:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A32F91BF2CB
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB14D60617
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:43:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H7rpk6IH3yVC for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 20:43:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16D6B605E5
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 20:43:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 52EBC8918A; Sat, 11 Sep 2021 20:42:16 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 22:33:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e8804d4e433cad0c0509483e865afdba003b6fc
X-Git-Newrev: 429e247b869027f6ecd4efa0f31bccd2765e3875
X-Patchwork-Hint: ignore
Message-Id: <20210911204216.52EBC8918A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpm: bump version to 4.17.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=429e247b869027f6ecd4efa0f31bccd2765e3875
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bumping the version of the rpm package to v4.17. This new release
includes a series of key changes [1], notables includes:

 - Explicit requirement for lua v5.3+.
 - Berkeley DB database backend has been dropped.
 - beecrypt and NSS crypto backends have been dropped.

The argument `--with-external-db` was tied to Berkeley-related support,
which was removed in an older revision [2]. The argument
`--without-hackingdocs` was dropped in an older revision [3].

[1]: https://rpm.org/wiki/Releases/4.17.0
[2]: https://github.com/rpm-software-management/rpm/commit/e1d3811883dc9fe79fe7b5ff90f69b9998611128
[3]: https://github.com/rpm-software-management/rpm/commit/3017eae9a3952823f80932e84a7a1e81f983639a

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rpm/Config.in |  8 +++++---
 package/rpm/rpm.hash  |  4 ++--
 package/rpm/rpm.mk    | 25 ++++---------------------
 3 files changed, 11 insertions(+), 26 deletions(-)

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index ac979fdbad..9da8d51df0 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -1,5 +1,6 @@
-comment "rpm needs a toolchain w/ dynamic library and threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+comment "rpm needs a toolchain w/ dynamic library, threads and lua >= 5.3"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+		|| !BR2_PACKAGE_LUA_5_3
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	depends on BR2_USE_MMU
 
@@ -7,9 +8,10 @@ config BR2_PACKAGE_RPM
 	bool "rpm"
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on BR2_PACKAGE_LUA_5_3
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_BEECRYPT if !BR2_PACKAGE_LIBGCRYPT && !BR2_PACKAGE_LIBNSS && !BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_FILE
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_ZLIB
diff --git a/package/rpm/rpm.hash b/package/rpm/rpm.hash
index 9389f8290f..19b6dd9176 100644
--- a/package/rpm/rpm.hash
+++ b/package/rpm/rpm.hash
@@ -1,5 +1,5 @@
-# From https://rpm.org/wiki/Releases/4.16.1.3.html
-sha256  513dc7f972b6e7ccfc9fc7f9c01d5310cc56ee853892e4314fa2cad71478e21d  rpm-4.16.1.3.tar.bz2
+# From https://rpm.org/wiki/Releases/4.17.0.html
+sha256  2e0d220b24749b17810ed181ac1ed005a56bbb6bc8ac429c21f314068dc65e6a  rpm-4.17.0.tar.bz2
 
 # Hash for license file
 sha256  171d94d9f1641316bff7f157a903237dc69cdb5fca405fed8c832c76ed8370f9  COPYING
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index ae324fbeef..816deceff7 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RPM_VERSION_MAJOR = 4.16
-RPM_VERSION = $(RPM_VERSION_MAJOR).1.3
+RPM_VERSION_MAJOR = 4.17
+RPM_VERSION = $(RPM_VERSION_MAJOR).0
 RPM_SOURCE = rpm-$(RPM_VERSION).tar.bz2
 RPM_SITE = http://ftp.rpm.org/releases/rpm-$(RPM_VERSION_MAJOR).x
 RPM_DEPENDENCIES = \
@@ -13,6 +13,7 @@ RPM_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_BZIP2),bzip2) \
 	$(if $(BR2_PACKAGE_ELFUTILS),elfutils) \
 	file \
+	lua \
 	popt \
 	$(if $(BR2_PACKAGE_XZ),xz) \
 	zlib \
@@ -28,10 +29,7 @@ RPM_SELINUX_MODULES = rpm
 RPM_CONF_OPTS = \
 	--disable-python \
 	--disable-rpath \
-	--with-external-db \
-	--with-gnu-ld \
-	--without-hackingdocs \
-	--without-lua
+	--with-gnu-ld
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 RPM_DEPENDENCIES += acl
@@ -40,13 +38,6 @@ else
 RPM_CONF_OPTS += --without-acl
 endif
 
-ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
-RPM_DEPENDENCIES += berkeleydb
-RPM_CONF_OPTS += --enable-bdb
-else
-RPM_CONF_OPTS += --disable-bdb
-endif
-
 ifeq ($(BR2_PACKAGE_DBUS),y)
 RPM_DEPENDENCIES += dbus
 RPM_CONF_OPTS += --enable-plugins
@@ -64,14 +55,6 @@ endif
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 RPM_DEPENDENCIES += libgcrypt
 RPM_CONF_OPTS += --with-crypto=libgcrypt
-else ifeq ($(BR2_PACKAGE_LIBNSS),y)
-RPM_DEPENDENCIES += libnss
-RPM_CONF_OPTS += --with-crypto=nss
-RPM_CFLAGS += -I$(STAGING_DIR)/usr/include/nss -I$(STAGING_DIR)/usr/include/nspr
-else ifeq ($(BR2_PACKAGE_BEECRYPT),y)
-RPM_DEPENDENCIES += beecrypt
-RPM_CONF_OPTS += --with-crypto=beecrypt
-RPM_CFLAGS += -I$(STAGING_DIR)/usr/include/beecrypt
 else
 RPM_DEPENDENCIES += openssl
 RPM_CONF_OPTS += --with-crypto=openssl
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
