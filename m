Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FD9D0D152
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 373AA409FF;
	Wed,  7 Jan 2026 17:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ymo5N_vccu0b; Wed,  7 Jan 2026 17:47:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4538240A0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808034;
	bh=EMsJX+Tenax4tH1UuH+7p+BVquPUig9opnu5k8AZmnM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OJBuFGoCaZvb7XWLwlZTXS78p2rxzE2F3HsQ9SZW+mhxh8FpsMfMKmakwe1RcgHJL
	 zs4A+pL4riaQr9a+bmmUf+cgJsnajAiaXeMRes6xj4XB1bscirvUCvIplHQ0WasAPl
	 f98e1ahC0IKeeesyaHnVUcB5vSPRMnEIR1zkLWZW+HlZV49NDRjhCdBDdXV0zKqldO
	 zJq7ziX0m2mfR9VrtQXthAGh6v/nkqKno0N2IcL8CFm3PndbJsMTR2OPjepw9cQdwX
	 VneNVIG/ao/hR07oVi9lOFE548kK1K4ymdFmy8draEMpMgL/gPVI+vnCTlnWmc+eD2
	 kicGx/vlRid/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4538240A0B;
	Wed,  7 Jan 2026 17:47:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10D32A58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88C8580ADD
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id btdlB4ne5beE for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B83F80A87
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B83F80A87
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A8DD883AA; Wed,  7 Jan 2026 17:46:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:16:46 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ddf4033924cd923afc89230d21d19eca55652e5b
X-Git-Newrev: 3941e168b2c755e2dbfddd081cd2a7a4d1cb8b5c
X-Patchwork-Hint: ignore
Message-Id: <20260107174640.9A8DD883AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cryptsetup: bump
 version to 2.8.0
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3941e168b2c755e2dbfddd081cd2a7a4d1cb8b5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

For release note, see:
https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.0/docs/v2.8.0-ReleaseNotes

Rearrange license files according to upstream.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien:
 - add link to release note in commit log
 - reindent _LICENSE_FILES
 - fix COPYING.* file path in .hash file
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a717d998038262fbbdc80ef2cbb3e7ed78ea1c66)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cryptsetup/cryptsetup.hash |  9 ++++++---
 package/cryptsetup/cryptsetup.mk   | 13 +++++++++----
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index e46cfbdf29..f456451765 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,4 +1,7 @@
-# From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.7/sha256sums.asc
-sha256  d2be4395b8f503b0ebf4b2d81db90c35a97050a358ee21fe62a0dfb66e5d5522  cryptsetup-2.7.5.tar.xz
+# From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.8/sha256sums.asc
+sha256  cc9e2d37c25a871cea37520b28d532207b0c1670fb10fc54d68071f63f5243a2  cryptsetup-2.8.0.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
-sha256  8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  COPYING.LGPL
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  docs/licenses/COPYING.Apache-2.0
+sha256  28a9529c7d0bb4dc51f4bf5c116a3d16ef247a052f7591466768ddf563fd1cf5  docs/licenses/COPYING.CC-BY-SA-4.0
+sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  docs/licenses/COPYING.GPL-2.0-or-later-WITH-cryptsetup-OpenSSL-exception
+sha256  8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  docs/licenses/COPYING.LGPL-2.1-or-later-WITH-cryptsetup-OpenSSL-exception
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 52f79e177f..6d2536957d 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CRYPTSETUP_VERSION_MAJOR = 2.7
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).5
+CRYPTSETUP_VERSION_MAJOR = 2.8
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).0
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
@@ -13,8 +13,13 @@ CRYPTSETUP_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs,util-linux) \
 	$(TARGET_NLS_DEPENDENCIES)
-CRYPTSETUP_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
-CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
+CRYPTSETUP_LICENSE = Apache-2.0, CC-BY-SA-4.0, GPL-2.0+ (programs), LGPL-2.1+ (library)
+CRYPTSETUP_LICENSE_FILES = \
+	COPYING \
+	docs/licenses/COPYING.Apache-2.0 \
+	docs/licenses/COPYING.CC-BY-SA-4.0 \
+	docs/licenses/COPYING.GPL-2.0-or-later-WITH-cryptsetup-OpenSSL-exception \
+	docs/licenses/COPYING.LGPL-2.1-or-later-WITH-cryptsetup-OpenSSL-exception
 CRYPTSETUP_CPE_ID_VALID = YES
 CRYPTSETUP_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
