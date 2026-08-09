Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178E1C5AC80
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 15:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD7F74051D;
	Sun,  9 Aug 2026 15:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oiIz95VjPw4s; Sun,  9 Aug 2026 15:34:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D526640539
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786289688;
	bh=Hs+ljkuSzlkg78n+Q7feVpewfzH23xRHk8YRpp30t4U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ABuHh+Dt+0kW/MrGTz+v7HQXkZLnO8sZ3AKd5u2xwOIt+/w1pnm+bDRCP3OM9HlFD
	 SoJxidf/E2JBxFzEjne9ua066sakNS0VkxV2oTcqnTj+Cef6Xnfj4LBBtF+tlBYV1J
	 cKfIJkOlsi1W7aN2goaJSOjTGAJVWOixPxZOkK7x3oPVJNU0sCGSuVTldprcWaztLZ
	 0i8wA+uNXMIJQV/s7btt9z2KL0DfLoCInr9H8Vrzwy73HWmHty9DHqPmnwvMDJN5dp
	 QQiiFKtjnf8w2fZqaYan8n1cClUfss5YryFqGaEKPM1BZFyowMtnI2onQG66Abz1FM
	 BrX1w5N3pnWOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D526640539;
	Sun,  9 Aug 2026 15:34:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0396228A
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 15:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDCC640539
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 15:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTgr2atsaAm6 for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 15:34:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 212A74051D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 212A74051D
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 15:34:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FAAA8D245; Sun,  9 Aug 2026 15:33:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Aug 2026 17:30:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 732a933e348440dee758c6fe90b384c8e3f7b052
X-Git-Newrev: fa32b20b10a5e1b69e7ee99f54ac9145f846d625
X-Patchwork-Hint: ignore
Message-Id: <20260809153358.7FAAA8D245@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uboot-tools: select p11-kit when
 building target mkeficapsule
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fa32b20b10a5e1b69e7ee99f54ac9145f846d625
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since upstream commit 0c716a157be460006a4b762625de329b5e36dbf9 (first
release: v2026.07) mkeficapsule supports PKCS#11 keys, and in turn
requires GnuTLS with PKCS#11 support.

Without it, building mkeficapsule for the target fails:

  HOSTLD  tools/mkeficapsule
/home/fiona/br-test-pkg/bootlin-armv5-uclibc/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/14.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: tools/mkeficapsule.o: in function `main':
mkeficapsule.c:(.text.startup+0x530): undefined reference to `gnutls_pkcs11_init'
/home/fiona/br-test-pkg/bootlin-armv5-uclibc/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/14.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: mkeficapsule.c:(.text.startup+0x544): undefined reference to `gnutls_pkcs11_add_provider'
/home/fiona/br-test-pkg/bootlin-armv5-uclibc/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/14.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: mkeficapsule.c:(.text.startup+0x5fc): undefined reference to `gnutls_pkcs11_obj_list_import_url4'
/home/fiona/br-test-pkg/bootlin-armv5-uclibc/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/14.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: mkeficapsule.c:(.text.startup+0x620): undefined reference to `gnutls_x509_crt_import_pkcs11'
/home/fiona/br-test-pkg/bootlin-armv5-uclibc/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/14.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: mkeficapsule.c:(.text.startup+0x1334): undefined reference to `gnutls_pkcs11_deinit'
collect2: error: ld returned 1 exit status

The error can be reproduced using "utils/test-pkg -c" with the
following config:

BR2_PACKAGE_UBOOT_TOOLS=y
BR2_PACKAGE_UBOOT_TOOLS_MKEFICAPSULE=y

For host-uboot-tools this was solved in Buildroot commit
6597563da7bb359eac57c8fb70e4efc3d6ef4c02 "package/gnutls: add host
support for pkcs11" by unconditionally enabling PKCS#11 support for
host-gnutls. For the target a more fine-grained approach is desirable,
so instead select BR2_PACKAGE_P11_KIT if
BR2_PACKAGE_UBOOT_TOOLS_MKEFICAPSULE=y and propagate dependencies.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/uboot-tools/Config.in | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index da6cd65252..b7fd6ff17d 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -68,17 +68,22 @@ config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
 
 config BR2_PACKAGE_UBOOT_TOOLS_MKEFICAPSULE
 	bool "mkeficapsule"
-	depends on !BR2_STATIC_LIBS # gnutls
+	depends on !BR2_STATIC_LIBS # gnutls, p11-kit
+	depends on BR2_TOOLCHAIN_HAS_THREADS # p11-kit
+	depends on BR2_USE_MMU # p11-kit
 	depends on BR2_USE_WCHAR # gnutls
 	select BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_P11_KIT
 	help
 	  Install the mkeficapsule tool on the target system
 
 	  The mkeficapsule tool from Das U-Boot bootloader, which allows
 	  generation of UEFI capsule binaries.
 
-comment "mkeficapsule support needs a toolchain w/ wchar, dynamic library"
-	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
+comment "mkeficapsule support needs a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_STATIC_LIBS
 
 config BR2_PACKAGE_UBOOT_TOOLS_MKENVIMAGE
 	bool "mkenvimage"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
