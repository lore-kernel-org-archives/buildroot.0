Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA47C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:03:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85A87610CC
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:03:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85A87610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63342423F3;
	Wed,  4 Aug 2021 00:03:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b92n8bZaX27r; Wed,  4 Aug 2021 00:03:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83E6D423EF;
	Wed,  4 Aug 2021 00:03:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 142601BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1ED5640481
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I6SxmAAR6qyf for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70A4D40699
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C2DC187B09; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 3 Jul 2021 22:32:33 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1b4aa6442abc299d19829670eaf69420f5e119cf
X-Git-Newrev: 91aa6efa8588bf7617cc4a640eb55052b524ceb7
X-Patchwork-Hint: ignore
Message-Id: <20210803210958.C2DC187B09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/tpm2-tools: security
 bump to version 4.3.2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=91aa6efa8588bf7617cc4a640eb55052b524ceb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Fix CVE-2021-3565: A flaw was found in tpm2-tools in versions before
  5.1.1 and before 4.3.2. tpm2_import used a fixed AES key for the inner
  wrapper, potentially allowing a MITM attacker to unwrap the inner
  portion and reveal the key being imported. The highest threat from
  this vulnerability is to data confidentiality.
- LICENSE moved in doc directory since
  https://github.com/tpm2-software/tpm2-tools/commit/23aa5dca660f596b2ad89542d5100bd4ef0c871a
  and hash updated due to the following line added with
  https://github.com/tpm2-software/tpm2-tools/commit/305011b2a7d091740fa01dbfbd27a48a76f670f7
  Copyright 2019      Fraunhofer SIT sponsored by Infineon Technologies AG
- libuuid and wchar (for mbstate_t) are mandatory since version 4.2 and
  https://github.com/tpm2-software/tpm2-tools/commit/eca77c1419617a8e2d6d8008bac716878b0c27ca

https://github.com/tpm2-software/tpm2-tools/blob/4.3.2/doc/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tpm2-tools/Config.in       | 7 +++++--
 package/tpm2-tools/tpm2-tools.hash | 4 ++--
 package/tpm2-tools/tpm2-tools.mk   | 6 +++---
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
index 35ca63bf64..cbdfeb6801 100644
--- a/package/tpm2-tools/Config.in
+++ b/package/tpm2-tools/Config.in
@@ -1,9 +1,12 @@
 config BR2_PACKAGE_TPM2_TOOLS
 	bool "tpm2-tools"
 	depends on !BR2_STATIC_LIBS # tpm2-tss
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_TPM2_TSS
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  TPM (Trusted Platform Module) 2.0 CLI tools based on system
 	  API of TPM2-TSS. These tools can be used to manage keys,
@@ -18,5 +21,5 @@ config BR2_PACKAGE_TPM2_TOOLS
 
 	  https://github.com/tpm2-software/tpm2-tools
 
-comment "tpm2-tools needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "tpm2-tools needs a toolchain w/ dynamic library, wchar"
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
diff --git a/package/tpm2-tools/tpm2-tools.hash b/package/tpm2-tools/tpm2-tools.hash
index dd55834825..bfb7e9b220 100644
--- a/package/tpm2-tools/tpm2-tools.hash
+++ b/package/tpm2-tools/tpm2-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  175472b63d1e047c2ad38314d06c36bd734ae37e0c6abfa2a804c0d6eb3f2936  tpm2-tools-4.1.2.tar.gz
-sha256  e10dce74279166bf7bc463eb6e462c2025bceb3e50cadfe865d92c1c3dc0bb21  LICENSE
+sha256  e2802d4093a24b2c65b1f913d0f4c68eadde9b8fd8a9b7a3b17a6e50765e8350  tpm2-tools-4.3.2.tar.gz
+sha256  f6995d52c8b8e4d2c3bace7fc9c330a77a90d808166fbad4d7ead7e8ba2fc66c  doc/LICENSE
diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index 83be53d54b..e83db416aa 100644
--- a/package/tpm2-tools/tpm2-tools.mk
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-TPM2_TOOLS_VERSION = 4.1.2
+TPM2_TOOLS_VERSION = 4.3.2
 TPM2_TOOLS_SITE = https://github.com/tpm2-software/tpm2-tools/releases/download/$(TPM2_TOOLS_VERSION)
 TPM2_TOOLS_LICENSE = BSD-3-Clause
-TPM2_TOOLS_LICENSE_FILES = LICENSE
-TPM2_TOOLS_DEPENDENCIES = libcurl openssl tpm2-tss host-pkgconf
+TPM2_TOOLS_LICENSE_FILES = doc/LICENSE
+TPM2_TOOLS_DEPENDENCIES = libcurl openssl tpm2-tss host-pkgconf util-linux
 
 # -fstack-protector-all and FORTIFY_SOURCE=2 is used by
 # default. Disable that so the BR2_SSP_* / BR2_FORTIFY_SOURCE_* options
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
