Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4A4C4708E
	for <buildroot@archiver.kernel.org>; Tue,  3 Jan 2023 19:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C21ED40185;
	Tue,  3 Jan 2023 19:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C21ED40185
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BkKZB7qbEqO7; Tue,  3 Jan 2023 19:37:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E92D4400DD;
	Tue,  3 Jan 2023 19:37:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E92D4400DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D1AC41BF834
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 19:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA81360784
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 19:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA81360784
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4RAA9LcCMSm5 for <buildroot@lists.busybox.net>;
 Tue,  3 Jan 2023 19:37:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C40CE605DB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C40CE605DB
 for <buildroot@buildroot.org>; Tue,  3 Jan 2023 19:37:13 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.231.8])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 19D7D13F8AA;
 Tue,  3 Jan 2023 20:37:09 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  3 Jan 2023 20:36:49 +0100
Message-Id: <20230103193649.7488-5-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103193649.7488-1-ju.o@free.fr>
References: <20230103193649.7488-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672774631;
 bh=YP8Jd47MG4QVJNGIPGgZrUTx38gtu6afNKyHz4xAOJQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pqbJRkJS+xvjQiqWorj+BA+58fp8REjLKlAbX0Ll2gUvxqNweDxLWlz1gN9YeDkGm
 bkdV6HNJOtoiWv8fCoEZdzAjs7rzyJ3j0pRwFop9BhDNlYNSGvKiWseuJQ2qYpI2sp
 2TI66u1tMhXiQ54koavkTLHtmG3G8GJJTXQNRcA1Kxh9qhal1G+TqYEZocs1lFpXQK
 z2ynCrKjbhZWTgQD1ZOGZ3eVbaskA+OxdXs9NUr8ShWOyuHsNHdPT6giGjsMjVztIL
 fnO+eSGChoOZbgnQr+cSEHCgUHois+f6x2o4Zisvcwv5r4PdEVkth31FzEvJ23wyMQ
 86BDsYaAti1zw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pqbJRkJS
Subject: [Buildroot] [PATCH 5/5] package/gnupg2: bump to version 2.4.0
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

See announce:
https://lists.gnupg.org/pipermail/gnupg-announce/2022q4/000477.html

This commit also drop a patch which is now included in the new version.
See:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commitdiff;h=7011286ce6e1fb56c2989fdafbd11b931c489faa

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gnupg2/0001-ks_ldap_free_state.patch | 21 --------------------
 package/gnupg2/gnupg2.hash                   | 10 +++++-----
 package/gnupg2/gnupg2.mk                     |  8 +++++++-
 3 files changed, 12 insertions(+), 27 deletions(-)
 delete mode 100644 package/gnupg2/0001-ks_ldap_free_state.patch

diff --git a/package/gnupg2/0001-ks_ldap_free_state.patch b/package/gnupg2/0001-ks_ldap_free_state.patch
deleted file mode 100644
index fa55d27c04..0000000000
--- a/package/gnupg2/0001-ks_ldap_free_state.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-
-Fix undefined reference to `ks_ldap_free_state' if OpenLDAP is not
-installed
-
-Backported from: 7011286ce6e1fb56c2989fdafbd11b931c489faa
-
-Signed-off-by: Michael Fischer <mf@go-sys.de>
-
---- a/dirmngr/server.c
-+++ b/dirmngr/server.c
-@@ -3137,8 +3137,10 @@ start_command_handler (assuan_fd_t fd, unsigned int session_id)
-                ctrl->refcount);
-   else
-     {
-+#if USE_LDAP
-       ks_ldap_free_state (ctrl->ks_get_state);
-       ctrl->ks_get_state = NULL;
-+#endif
-       release_ctrl_ocsp_certs (ctrl);
-       xfree (ctrl->server_local);
-       dirmngr_deinit_default_ctrl (ctrl);
diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index f9c071ad45..c642862fe2 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,7 +1,7 @@
-# From  https://lists.gnupg.org/pipermail/gnupg-announce/2022q4/000476.html
-sha1  1f31b7b4c9c9adad97f94ea3acf1aa64c0424bcc  gnupg-2.3.8.tar.bz2
+# From  https://lists.gnupg.org/pipermail/gnupg-announce/2022q4/000477.html
+sha1  63dde155a8df0d5e1987efa5fc17438beca83ac1  gnupg-2.4.0.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.3.8.tar.bz2.sig
-# using key 6DAA6E64A76D2840571B4902528897B826403ADA and AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD
-sha256  540b7a40e57da261fb10ef521a282e0021532a80fd023e75fb71757e8a4969ed  gnupg-2.3.8.tar.bz2
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.4.0.tar.bz2.sig
+# using key 6DAA6E64A76D2840571B4902528897B826403ADA
+sha256  1d79158dd01d992431dd2e3facb89fdac97127f89784ea2cb610c600fb0c1483  gnupg-2.4.0.tar.bz2
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 9dc29ca99e..64deab09c1 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.3.8
+GNUPG2_VERSION = 2.4.0
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
@@ -15,6 +15,12 @@ GNUPG2_SELINUX_MODULES = gpg
 GNUPG2_DEPENDENCIES = zlib libgpg-error libgcrypt libassuan libksba libnpth \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) host-pkgconf
 
+# The configure script fails to find "gpgrt-config" in the prefix
+# passed to --with-libgpg-error-prefix. This ultimately fail while
+# detecting libgpg-error, which is mandatory. Adding the staging bin
+# dir resolve this issue.
+GNUPG2_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(BR_PATH)
+
 GNUPG2_CONF_OPTS = \
 	--disable-rpath \
 	--with-libgpg-error-prefix=$(STAGING_DIR)/usr \
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
