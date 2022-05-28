Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621ACC433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 11:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AC0184C40;
	Sat, 28 May 2022 11:06:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pk40moUCYCng; Sat, 28 May 2022 11:06:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 145D7847EC;
	Sat, 28 May 2022 11:06:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 323C01BF37A
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 11:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B18A642624
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 11:05:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pyOn9tKR46w9 for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 11:05:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5FCB42638
 for <buildroot@buildroot.org>; Sat, 28 May 2022 11:05:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6E53585EB2; Sat, 28 May 2022 10:53:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 12:53:30 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: beca59fefc228fccd7d7fdc1b2ce6ec8944cdb46
X-Git-Newrev: 2987ca064becdfb1ca4aa3907f2e2feb6245a3e6
X-Patchwork-Hint: ignore
Message-Id: <20220528105354.6E53585EB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/gnutls: remove
 unused libregex dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=2987ca064becdfb1ca4aa3907f2e2feb6245a3e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The pcre/libregex dependency was removed in version 3.7.3 with upstream
commit 26578b7d02c269ff1d34ff782d84c7667734d03d, which removed the
bundled libopts. Remove the pcre dependency and the relevant CONF_OPTS
handling.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 00a046e455c88dd352c9bda3b93b8e6ed60d492c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/Config.in |  1 -
 package/gnutls/gnutls.mk | 11 +----------
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index d57bb8d135..28982b15a1 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -7,7 +7,6 @@ config BR2_PACKAGE_GNUTLS
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBTASN1
 	select BR2_PACKAGE_NETTLE
-	select BR2_PACKAGE_PCRE
 	help
 	  GnuTLS is a secure communications library implementing the SSL
 	  and TLS protocols and technologies around them.
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index b5503b1fc9..79e7d529b1 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -17,7 +17,7 @@ GNUTLS_LICENSE += , GPL-3.0+ (gnutls-openssl library)
 GNUTLS_LICENSE_FILES += doc/COPYING
 endif
 
-GNUTLS_DEPENDENCIES = host-pkgconf libtasn1 nettle pcre
+GNUTLS_DEPENDENCIES = host-pkgconf libtasn1 nettle
 GNUTLS_CPE_ID_VENDOR = gnu
 GNUTLS_CONF_OPTS = \
 	--disable-doc \
@@ -25,7 +25,6 @@ GNUTLS_CONF_OPTS = \
 	--disable-libdane \
 	--disable-rpath \
 	--disable-tests \
-	--enable-local-libopts \
 	--enable-openssl-compatibility \
 	--without-libcrypto-prefix \
 	--without-libdl-prefix \
@@ -48,14 +47,6 @@ GNUTLS_CONF_ENV = gl_cv_socket_ipv6=yes \
 	gl_cv_func_gettimeofday_clobber=no
 GNUTLS_INSTALL_STAGING = YES
 
-# gnutls needs libregex, but pcre can be used too
-# The check isn't cross-compile friendly
-GNUTLS_CONF_ENV += libopts_cv_with_libregex=yes
-GNUTLS_CONF_OPTS += \
-	--with-regex-header=pcreposix.h \
-	--with-libregex-cflags="`$(PKG_CONFIG_HOST_BINARY) libpcreposix --cflags`" \
-	--with-libregex-libs="`$(PKG_CONFIG_HOST_BINARY) libpcreposix --libs`"
-
 ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
 GNUTLS_CONF_OPTS += --enable-cryptodev
 GNUTLS_DEPENDENCIES += cryptodev-linux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
