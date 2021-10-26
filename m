Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A645C43217
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:41:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD6FA61106
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD6FA61106
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFAD360A3B;
	Tue, 26 Oct 2021 19:41:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t2XTIZCO4-St; Tue, 26 Oct 2021 19:41:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 167F3607AE;
	Tue, 26 Oct 2021 19:41:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C8F91BF3CD
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C38674055A
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:38:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z7AnBzX_zhne for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:38:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E6604053F
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:38:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1F3A788ED9; Tue, 26 Oct 2021 19:34:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 21:34:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c12e8a15f53909726006ecbae3f4190a2c4a4182
X-Git-Newrev: f0f5c90244cf4b6feed603821b45f25a54cf3f12
X-Patchwork-Hint: ignore
Message-Id: <20211026193445.1F3A788ED9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strongswan: add botan optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=f0f5c90244cf4b6feed603821b45f25a54cf3f12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

botan is an optional dependency since version 5.7.0 and
https://github.com/strongswan/strongswan/commit/af26cc4d8542fb6aaea9bfc5aaae1b139faee94a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/strongswan/Config.in     | 17 +++++++++++++++++
 package/strongswan/strongswan.mk |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 23334470fd..430625a102 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -31,6 +31,23 @@ choice
 	prompt "Cryptographic backend"
 	default BR2_PACKAGE_STRONGSWAN_GMP
 
+config BR2_PACKAGE_STRONGSWAN_BOTAN
+	bool "botan"
+	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+	select BR2_PACKAGE_BOTAN
+
+comment "botan backend needs a toolchain w/ C++, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
+
+comment "botan backend needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
 config BR2_PACKAGE_STRONGSWAN_OPENSSL
 	bool "OpenSSL"
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 850bb7326e..2891e5aa5e 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -18,6 +18,7 @@ STRONGSWAN_CONF_OPTS += \
 	--enable-pkcs11=yes \
 	--enable-kernel-netlink=yes \
 	--enable-socket-default=yes \
+	--enable-botan=$(if $(BR2_PACKAGE_STRONGSWAN_BOTAN),yes,no) \
 	--enable-openssl=$(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),yes,no) \
 	--enable-gcrypt=$(if $(BR2_PACKAGE_STRONGSWAN_GCRYPT),yes,no) \
 	--enable-gmp=$(if $(BR2_PACKAGE_STRONGSWAN_GMP),yes,no) \
@@ -66,6 +67,7 @@ STRONGSWAN_CONF_ENV += LIBS='-latomic'
 endif
 
 STRONGSWAN_DEPENDENCIES += \
+	$(if $(BR2_PACKAGE_STRONGSWAN_BOTAN),botan) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_GCRYPT),libgcrypt) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_GMP),gmp) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
