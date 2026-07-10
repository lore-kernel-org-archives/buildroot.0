Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF68C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 23:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B53D60A8E;
	Fri, 10 Jul 2026 23:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VsyRRyUOvnNo; Fri, 10 Jul 2026 23:00:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44E0460AD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783724433;
	bh=8UUpQMKCPMfn2T/omN6b4L4gRrzkJRnVCXl/4OPEr0U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pt9eVShKa0LxwMl1qM//OP/r53etMqJ9tcQ6K01BXEGuE3Pj2IAG79JOZfMrX1G2R
	 Q/at7BxxE66I0wD0go4COzef91VVNeUpOhlFkuqz7E5eb4xEKBPjb3M9H6XTI3bbdb
	 5XjAOTVTxmexFiENldBh7mVD2IhC+4Xjybz6HJZvJWauS9RT5h54DP+kOYAoAXHKHx
	 NmitgdOq7KG3vzm2rfg8L+4V2uVYOOmIs5v+lVJo4h+Zp3QmlWqbYlLqjnZQocQgLG
	 XO+Bflu0eFEvAT90xD+u1n5HeUH2e64yoyfggnebK8dkQzeJejSzKUM6SwYmcDV/Y2
	 L2ZrWgd0iS6Sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44E0460AD5;
	Fri, 10 Jul 2026 23:00:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A77F1A3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 23:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DADB607D9
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 23:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZkEuOBPalfPc for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 23:00:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F6E6606F8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F6E6606F8
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 23:00:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1EBD88717; Fri, 10 Jul 2026 22:59:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 Jul 2026 00:38:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 57795860f563b2e5cff37d1720a2bacf9c582336
X-Git-Newrev: 6597563da7bb359eac57c8fb70e4efc3d6ef4c02
X-Patchwork-Hint: ignore
Message-Id: <20260710225954.F1EBD88717@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnutls: add host support for pkcs11
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3185514852289891348=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3185514852289891348==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6597563da7bb359eac57c8fb70e4efc3d6ef4c02
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Future U-Boot 2026.07 will build mkeficapsule with pkcs11 support. [1]

This causes link errors with Buildroot, such as the following one:

   mkeficapsule.c:(.text.startup+0xcd3): undefined reference to `gnutls_pkcs11_init'

(Other symbols the linker complains about are: gnutls_pkcs11_add_provider,
gnutls_pkcs11_obj_list_import_url4, gnutls_x509_crt_import_pkcs11 and
gnutls_pkcs11_deinit.)

The following example commands can be used to reproduce the issue:

     make qemu_aarch64_ebbr_defconfig
     echo 'BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07-rc3"' >>.config
     echo 'BR2_TARGET_UBOOT_NEEDS_GNUTLS=y' >>.config
     echo '# BR2_DOWNLOAD_FORCE_CHECK_HASHES is not set' >>.config
     make olddefconfig
     make uboot

This commit adds the pkcs11 support for host-gnutls.

In Buildroot, since host-gnutls is currently only needed by uboot
(and other uboot derivatives such as uboot-tools) the pkcs11 support
is added unconditionally to host-gnutls.

Link: https://github.com/u-boot/u-boot/commit/0c716a157be460006a4b762625de329b5e36dbf9 [1]
Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/gnutls/gnutls.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 6411a7d621..ae1caaa221 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -43,7 +43,8 @@ GNUTLS_CONF_ENV = gl_cv_socket_ipv6=yes \
 	gl_cv_func_gettimeofday_clobber=no
 GNUTLS_INSTALL_STAGING = YES
 
-HOST_GNUTLS_DEPENDENCIES = host-pkgconf host-libtasn1 host-libunistring host-nettle
+HOST_GNUTLS_DEPENDENCIES = host-pkgconf host-libtasn1 host-libunistring \
+	host-nettle host-p11-kit
 HOST_GNUTLS_CONF_OPTS = \
 	--disable-doc \
 	--disable-libdane \
@@ -64,7 +65,7 @@ HOST_GNUTLS_CONF_OPTS = \
 	--disable-openssl-compatibility \
 	--without-brotli \
 	--without-idn \
-	--without-p11-kit \
+	--with-p11-kit \
 	--without-zlib \
 	--without-zstd
 

--===============3185514852289891348==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3185514852289891348==--
