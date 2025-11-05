Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A03CCCF9F8
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 11:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D563B81DFB;
	Wed,  5 Nov 2025 11:32:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g-6jzLWdD2co; Wed,  5 Nov 2025 11:32:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC28783FFA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC28783FFA;
	Wed,  5 Nov 2025 11:32:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 28743462
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 11:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A4A781DFB
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 11:32:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8_A8ZLrEPLwB for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 11:32:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 66B848409B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66B848409B
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66B848409B
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 11:32:30 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.21.139]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MiJZO-1vusBg44uM-00owEG; Wed, 05
 Nov 2025 12:32:27 +0100
To: buildroot@buildroot.org
Cc: Abelino Romo <abelino.romo@gmail.com>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Wed,  5 Nov 2025 12:32:08 +0100
Message-ID: <20251105113208.3223645-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:zzccEdUhMaqiL7d8qNbR1hqiyHGidaLPHLuk3QB2ve+Oq1lHi+l
 OpkgIOVAnNcWjZm3w2DHm7GPUg46Z8vZfdL9NdfpfkUcUV+rteykMtvN2jm9crnkFq9PG+Y
 l+D0or/yMcnDF2GYklBq3wUIpqsZ2BL+X1tkejwcm5fS0D77ADGS8/WfU/wm/blTX+Tx8eX
 B/4BwfyIx0ud+vKt9wn9Q==
UI-OutboundReport: notjunk:1;M01:P0:j0ZWOblF3w0=;t2ItgGZ9JNXAqQU+PHRK1nnIXAv
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1762342347; x=1762947147; i=fiona.klute@gmx.de;
 bh=RTriBtxt2SerOHbk7cl4yDiW1s8pCVLJ9nNfDo5bHSM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=TtPuuyVT8BuK8g5/kzRoT7w1heVw00pzx7O7/TJfdgEOH1qGq75Wd6EPLrzxLrUJ
 OTD9n8T9r2Stbm3vhbeZiww/ybETJ3JW715/hNwt5o6uQ3rYi6SX0SbhPX5Y88Ovh
 aLiuO6WDWGW5OVOn55IrM64YFOrwxUZlYWktBFgBQNMIfiNXf6IPk/D8Eg4IhVW/A
 k8yeqzjgRHKxBaXiw+a4P8+Xkr4aOlTPm80eZUtv35bo69/GkjjoHCGjGRJWOeFvp
 yhto634QsvYRnMWyPTYPsRb8IeJwUvaOk6Ej/OpdZYyQjrMcQkGgwb0lEVZbNjiYJ
 nw9etvL3KbDBe3a7UQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=TtPuuyVT
Subject: [Buildroot] [PATCH v4 1/1] package/tpm2-tss: bump version to 4.1.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Abelino Romo <abelino.romo@gmail.com>

On v3.2.2, testing with an Infineon SLB9673 resulted in the following
error when attempting to read from a previously written NV index.
Upgrading to the latest release, v4.1.3, resolves the issue:

```shell
~# tpm2_nvread 0x1900001
WARN: Reading full size of the NV index
ERROR:esys:../tpm2-tss-3.2.2/src/tss2-esys/esys_iutil.c:1096:esys_GetResourceObject() Error: Esys handle does not exist (70018).
ERROR: Esys_SequenceComplete(0x70018) - esapi:The ESYS_TR resource object is bad
ERROR: Failed to get shandle
ERROR: Failed to read NVRAM area at index 0x1900001
ERROR: Unable to run tpm2_nvread
```

Between v3.2.2 and v4.1.3, the most notable update is v4.1.0 [1], which
includes a fix for CVE-2024-29040, along with 40+ bug fixes and 10+ new
features. Bumping to v4.1.3 adds access to these improvements and
addresses the NV index read issue.

[1] https://github.com/tpm2-software/tpm2-tss/releases/tag/4.1.0

Signed-off-by: Abelino Romo <abelino.romo@gmail.com>
[Fiona: rebase for package/tpm2-tss changes]
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
This patch has been pending for almost a year now. I've just tested &
rebased the patch (needed because of the CVE ignore added in the
meantime). It is from a 2 patch series that also added tpm2-tss-engine
(for OpenSSL). I can't comment on that part so I left it out, see:
https://patchwork.ozlabs.org/project/buildroot/list/?series=434746

 .checkpackageignore                           |  1 -
 ...01-Temporary-fix-for-build-without-C.patch | 44 -------------------
 package/tpm2-tss/Config.in                    |  2 +
 package/tpm2-tss/tpm2-tss.hash                |  2 +-
 package/tpm2-tss/tpm2-tss.mk                  | 13 ++----
 5 files changed, 6 insertions(+), 56 deletions(-)
 delete mode 100644 package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index efe5d54711..6fbc66b15d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1045,7 +1045,6 @@ package/tinyalsa/0001-include-time.h-before-asound.h.patch lib_patch.Upstream
 package/tinycompress/0001-wave-add-time.h-missing-header-inclusion.patch lib_patch.Upstream
 package/tinydtls/0001-sha2-sha2.c-fix-build-on-big-endian.patch lib_patch.Upstream
 package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch lib_patch.Upstream
-package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch lib_patch.Upstream
 package/transmission/S92transmission Shellcheck lib_sysv.ConsecutiveEmptyLines lib_sysv.Indent lib_sysv.Variables
 package/triggerhappy/S10triggerhappy Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/trinity/0001-Fix-build-with-GCC-10.patch lib_patch.Upstream
diff --git a/package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch b/package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch
deleted file mode 100644
index 812c753ffb..0000000000
--- a/package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 7dc753ad27a8cd14c9b00be94ca89b847cf05ce9 Mon Sep 17 00:00:00 2001
-From: Carlos Santos <unixmania@gmail.com>
-Date: Mon, 23 Dec 2019 08:02:19 -0300
-Subject: [PATCH] Temporary fix for build without C++
-
-C++ is required only for the fuzzing tests but AC_PROG_CXX is included
-by configure.ac even when fuzzing is not enabled (which we don't do on
-Buildroot).
-
-The patch applied upstream had issues and was reverted[1]. Use a local
-patch to solve the problem temporaryly.
-
-Fixes:
-    http://autobuild.buildroot.net/results/13f5e37b47b255da4158bec34e5459136f7e60d4
-    http://autobuild.buildroot.net/results/1c26db2509c79e00c0de1165945277eaa57b149f
-    http://autobuild.buildroot.net/results/b7b6b7b7aca79e847b442cbd2305427d91fe5d70
-    http://autobuild.buildroot.net/results/1cd5a82a0e799aa5027e2e2c03b246332cc3a15d
-    http://autobuild.buildroot.net/results/d7ec878907f714377c83e9a496e97cbf9382d787
-    http://autobuild.buildroot.net/results/1c7f0c1b3ce4871cd87bd6059b1f0a6dc4e74a9c
-    http://autobuild.buildroot.net/results/196b81d580325607c8da90beeb79e1f6b8ab8b47
-    http://autobuild.buildroot.net/results/f90f7b4ac710b56686635f8ae27059c11b963e47
-
-1. https://github.com/tpm2-software/tpm2-tss/commit/60c26e4c4faba6ba12469485653e17092b510840
-
-Signed-off-by: Carlos Santos <unixmania@gmail.com>
----
- configure.ac | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index ff59dd7c..3e4028fb 100755
---- a/configure.ac
-+++ b/configure.ac
-@@ -26,7 +26,6 @@ AX_IS_RELEASE(dash-version)
- AX_CHECK_ENABLE_DEBUG([info])
- 
- AC_PROG_CC
--AC_PROG_CXX
- AC_PROG_LN_S
- AC_USE_SYSTEM_EXTENSIONS
- LT_INIT()
--- 
-2.26.2
-
diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
index 857987ae36..d87c1e0d8d 100644
--- a/package/tpm2-tss/Config.in
+++ b/package/tpm2-tss/Config.in
@@ -39,6 +39,8 @@ config BR2_PACKAGE_TPM2_TSS_FAPI
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  This option allows to enable Feature API (FAPI).  Feature
 	  API (FAPI) as described in the "TSS 2.0 Feature API
diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
index c9fa4e6ae0..891c1285b0 100644
--- a/package/tpm2-tss/tpm2-tss.hash
+++ b/package/tpm2-tss/tpm2-tss.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ba9e52117f254f357ff502e7d60fce652b3bfb26327d236bbf5ab634235e40f1  tpm2-tss-3.2.2.tar.gz
+sha256  37f1580200ab78305d1fc872d89241aaee0c93cbe85bc559bf332737a60d3be8  tpm2-tss-4.1.3.tar.gz
 sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 81a1a0e59b..08ff401328 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TSS_VERSION = 3.2.2
+TPM2_TSS_VERSION = 4.1.3
 TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
 TPM2_TSS_LICENSE = BSD-2-Clause
 TPM2_TSS_LICENSE_FILES = LICENSE
@@ -13,13 +13,6 @@ TPM2_TSS_CPE_ID_PRODUCT = tpm2_software_stack
 TPM2_TSS_INSTALL_STAGING = YES
 TPM2_TSS_DEPENDENCIES = openssl host-pkgconf
 
-# 0001-configure-Only-use-CXX-when-fuzzing.patch
-TPM2_TSS_AUTORECONF = YES
-
-# Fixed in upstream commit
-# https://github.com/tpm2-software/tpm2-tss/commit/7ab42953216adec046d000a5e3085f3ee5e9cabf
-TPM2_TSS_IGNORE_CVES += CVE-2023-22745
-
 # systemd-sysusers and systemd-tmpfiles are only used at install time
 # to trigger the creation of users and tmpfiles, which we do not care
 # about at build time. groupadd, useradd, and setfacl are used in the
@@ -40,10 +33,10 @@ TPM2_TSS_CONF_OPTS = \
 TPM2_TSS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
 
 ifeq ($(BR2_PACKAGE_TPM2_TSS_FAPI),y)
-TPM2_TSS_DEPENDENCIES += json-c libcurl
+TPM2_TSS_DEPENDENCIES += json-c libcurl util-linux
 TPM2_TSS_CONF_OPTS += --enable-fapi
 else
-TPM2_TSS_CONF_OPTS += --disable-fapi
+TPM2_TSS_CONF_OPTS += --disable-fapi --disable-policy
 endif
 
 define TPM2_TSS_USERS
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
