Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1BDCD98DA
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 19:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 125724080E;
	Mon, 15 Jun 2026 19:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cw6mdPVD2hwO; Mon, 15 Jun 2026 19:49:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FDE5407DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781552962;
	bh=x9YshpGx0nBpj3qH0mXK9GHwOXTQuApC3Ldb5e8BtpE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rzl4EJh4DwieSYCgQB4GkVyQv5WLow1WIVhCB5XbtcGRNsZoLMAato6nak/Gr9t0H
	 vvtO3pf9KqogGuBqZrlr/znvyrIoVHYRTfS6RIB5XTExU9gRDYiKsNvD95VeaNy6dX
	 RRP2lzFOlbcE+IvyE3lgmL5HZ6fOMBKzh7q7EH+LEDFZApnAu21LLIP9NhyovJDkUs
	 vcs7nqcjldwiGTUpgtI9uhkJko7kcNx3gaLVyrQh9VSVIw0IDlhe1QPEx2zmHukyXx
	 aqP0M2UJ6SsQ8s23axEQqOD28oi4EzTTeBBGVGc+Q5nH74kTbDacVytmR4dAuaBurV
	 4JOOMyRWeQA1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FDE5407DB;
	Mon, 15 Jun 2026 19:49:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16925169
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 19:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14CC8607AD
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 19:49:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOvw6pG82aj0 for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 19:49:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A41B6074C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A41B6074C
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 19:49:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 460CD7FD46; Mon, 15 Jun 2026 19:48:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 21:49:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4834f18c693dd6167d314affea13d0f4ac8fd965
X-Git-Newrev: 0c6595aaac7288335e8d8bcccc383a8a12f635f7
X-Patchwork-Hint: ignore
Message-Id: <20260615194858.460CD7FD46@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swupdate: security bump to version
 2026.05
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0c6595aaac7288335e8d8bcccc383a8a12f635f7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes:
* CVE-2023-7216 [1]
  A path traversal vulnerability was found in the CPIO utility. This
  issue could allow a remote unauthenticated attacker to trick a user into
  opening a specially crafted archive. During the extraction process, the
  archiver could follow symlinks outside of the intended directory, which
  could be utilized to run arbitrary commands on the target system.
* CVE-2026-28525 [2]
  SWUpdate contains an integer underflow vulnerability in the multipart
  upload parser in mongoose_multipart.c that allows unauthenticated
  attackers to cause a denial of service by sending a crafted HTTP POST
  request to /upload with a malformed multipart boundary and controlled
  TCP stream timing. Attackers can trigger an integer underflow in the
  mg_http_multipart_continue_wait_for_chunk() function when the buffer
  length falls within a specific range, causing an out-of-bounds heap read
  that writes data beyond the allocated receive buffer to a local IPC
  socket.

For full release notes, see:
https://github.com/sbabic/swupdate/releases/tag/2026.05

Remove patch that has been merged upstream for this release.

[1] https://github.com/advisories/GHSA-v9vx-4mxw-76j2
[2] https://github.com/advisories/GHSA-hggv-rg65-qf4h

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 ...-fix-no-crypto-configuration-link-failure.patch | 67 ----------------------
 package/swupdate/swupdate.hash                     |  2 +-
 package/swupdate/swupdate.mk                       |  2 +-
 3 files changed, 2 insertions(+), 69 deletions(-)

diff --git a/package/swupdate/0001-build-fix-no-crypto-configuration-link-failure.patch b/package/swupdate/0001-build-fix-no-crypto-configuration-link-failure.patch
deleted file mode 100644
index 15f33aa3ab..0000000000
--- a/package/swupdate/0001-build-fix-no-crypto-configuration-link-failure.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 4e7c2f6c4b978efae69d777705de84411a01c147 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Tue, 24 Mar 2026 14:23:58 -0600
-Subject: [PATCH] build: fix no-crypto configuration link failure
-
-When no crypto backend is selected, the crypto directory contributes
-no objects, so this kbuild variant does not generate
-crypto/built-in.o.
-
-The top-level build still linked that file unconditionally, causing
-the final link to fail.
-
-Introduce a hidden SWUPDATE_CRYPTO helper selected by the Kconfig
-options that actually populate crypto/, and only descend into the
-crypto directory when that helper is enabled.
-
-Upstream: https://github.com/sbabic/swupdate/commit/10334fb21796b75f3a1208a3d5a98a307712218b
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- Makefile       | 3 ++-
- crypto/Kconfig | 5 +++++
- 2 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index aa9604aa..759fd191 100644
---- a/Makefile
-+++ b/Makefile
-@@ -369,7 +369,8 @@ include $(srctree)/Makefile.flags
- # This allow a user to issue only 'make' to build a kernel including modules
- # Defaults to vmlinux, but the arch makefile usually adds further targets
- 
--objs-y		:= core handlers crypto bootloader suricatta
-+objs-y		:= core handlers bootloader suricatta
-+objs-$(CONFIG_SWUPDATE_CRYPTO) += crypto
- libs-y		:= corelib mongoose parser fs containers
- bindings-y	:= bindings
- tools-y		:= tools
-diff --git a/crypto/Kconfig b/crypto/Kconfig
-index 4b9db821..cc953542 100644
---- a/crypto/Kconfig
-+++ b/crypto/Kconfig
-@@ -23,9 +23,13 @@ menu "Crypto libraries"
- 		depends on HAVE_GPGME
- endmenu
- 
-+config SWUPDATE_CRYPTO
-+	bool
-+
- config HASH_VERIFY
- 	bool "Allow to add sha256 hash to each image"
- 	depends on SSL_IMPL_OPENSSL || SSL_IMPL_WOLFSSL || SSL_IMPL_MBEDTLS
-+	select SWUPDATE_CRYPTO
- 	help
- 	  Allow to add a sha256 hash to an artifact.
- 	  This is automatically set in case of Signed Image
-@@ -83,6 +87,7 @@ menu "Encryption"
- config ENCRYPTED_IMAGES
- 	bool "Images can be encrypted with a symmetric key"
- 	depends on SSL_IMPL_OPENSSL || SSL_IMPL_WOLFSSL || SSL_IMPL_MBEDTLS
-+	select SWUPDATE_CRYPTO
- comment "Image encryption needs an SSL implementation"
- 	depends on !SSL_IMPL_OPENSSL && !SSL_IMPL_WOLFSSL && !SSL_IMPL_MBEDTLS
- 
--- 
-2.47.3
-
diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index b3f43648f8..06583ade35 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  8517f3730eeb66e20e651b881dd4b9c10ca9ae05e3883db59b5df18ab1eaa533  swupdate-2025.12.tar.gz
+sha256  fd70cdfc7224b4209f5f657c3d6052688412325ea5d4e9e792575fa22eb65cef  swupdate-2026.05.tar.gz
 sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
 sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index b2778d2aec..983cd6eccc 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2025.12
+SWUPDATE_VERSION = 2026.05
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
 SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
