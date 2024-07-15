Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FE7C3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 12:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 428DB4043D;
	Mon, 15 Jul 2024 12:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p2lw4_wixy_B; Mon, 15 Jul 2024 12:41:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D29A4069A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D29A4069A;
	Mon, 15 Jul 2024 12:41:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBDBE1BF3B8
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 12:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B59460806
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 12:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fltpnvkt_GTd for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 12:40:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7372C6080B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7372C6080B
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 12:40:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5FF1086BA6; Mon, 15 Jul 2024 12:40:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 14:37:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0734f68612b39e5dc863cbc8262afbb6af07e93
X-Git-Newrev: 54c92715dd2293c8e649a619ddfaa6b036b4b3a4
X-Patchwork-Hint: ignore
Message-Id: <20240715124057.5FF1086BA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnupg2: add host variant
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=54c92715dd2293c8e649a619ddfaa6b036b4b3a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in.host        |  1 +
 package/gnupg2/Config.in.host | 13 +++++++++++++
 package/gnupg2/gnupg2.mk      | 16 ++++++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index 5843210d10..4340e6e8c9 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -43,6 +43,7 @@ menu "Host utilities"
 	source "package/genimage/Config.in.host"
 	source "package/genpart/Config.in.host"
 	source "package/gnupg/Config.in.host"
+	source "package/gnupg2/Config.in.host"
 	source "package/go/Config.in.host"
 	source "package/google-breakpad/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
diff --git a/package/gnupg2/Config.in.host b/package/gnupg2/Config.in.host
new file mode 100644
index 0000000000..c636cbee8b
--- /dev/null
+++ b/package/gnupg2/Config.in.host
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_HOST_GNUPG2
+	bool "host gnupg2"
+	depends on !BR2_PACKAGE_HOST_GNUPG
+	help
+	  GnuPG is the GNU project's complete and free implementation
+	  of the OpenPGP standard as defined by RFC4880. GnuPG allows
+	  to encrypt and sign your data and communication, features a
+	  versatile key management system as well as access modules
+	  for all kinds of public key directories. GnuPG, also known
+	  as GPG, is a command line tool with features for easy
+	  integration with other applications.
+
+	  http://gnupg.org/
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 39b0a066f6..d38aaeec1a 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -14,6 +14,8 @@ GNUPG2_CPE_ID_PRODUCT = gnupg
 GNUPG2_SELINUX_MODULES = gpg
 GNUPG2_DEPENDENCIES = zlib libgpg-error libgcrypt libassuan libksba libnpth \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) host-pkgconf
+HOST_GNUPG2_DEPENDENCIES = host-zlib host-libgpg-error host-libgcrypt host-libassuan \
+	host-libksba host-libnpth host-pkgconf
 
 GNUPG2_CONF_OPTS = \
 	--disable-rpath \
@@ -23,9 +25,22 @@ GNUPG2_CONF_OPTS = \
 	--with-ksba-prefix=$(STAGING_DIR)/usr \
 	--with-npth-prefix=$(STAGING_DIR)/usr
 
+HOST_GNUPG2_CONF_OPTS = \
+	--with-gpg-error-prefix=$(HOST_DIR) \
+	--with-libgcrypt-prefix=$(HOST_DIR) \
+	--with-libassuan-prefix=$(HOST_DIR) \
+	--with-ksba-prefix=$(HOST_DIR) \
+	--with-npth-prefix=$(HOST_DIR) \
+	--disable-bzip2 \
+	--disable-gnutls \
+	--disable-ccid-driver \
+	--without-readline \
+	--disable-sqlite
+
 # Force the path to "gpgrt-config" (from the libgpg-error package) to
 # avoid using the one on host, if present.
 GNUPG2_CONF_ENV += GPGRT_CONFIG=$(STAGING_DIR)/usr/bin/gpgrt-config
+HOST_GNUPG2_CONF_ENV += GPGRT_CONFIG=$(HOST_DIR)/bin/gpgrt-config
 
 ifneq ($(BR2_PACKAGE_GNUPG2_GPGV),y)
 define GNUPG2_REMOVE_GPGV
@@ -71,3 +86,4 @@ GNUPG2_CONF_OPTS += --disable-sqlite
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
