Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B52F46C54
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 15:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5985440856;
	Mon,  6 Apr 2026 15:57:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oCY1SyEnQGOV; Mon,  6 Apr 2026 15:57:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 804E840879
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775491036;
	bh=V9WNrl8/6xeqsQa9kIHpz/z9n7/IH77fx7QqvTYMV1c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TraXcVQfZ5zI3hqQdT69kp0Svuh/Z9DbWvVAHClG535fcHRFKqYSqtj5yb/xx1pLk
	 FjBIHyNQocaLKRp9N/ZL/vhb8+moK0VDYXDprRs3GKTpP74aAuii5eyEmQOffGYE55
	 2yb54hhspJZtUJNg2SOmUeO5wSFUlDk2Ug7+9vkxXlQYqQrTzd966fW7CLsSBDsXOX
	 0mBcIKnOT24qT2oNK7TUBVkXVCljlV6Lr19ngBNYv+S2tMFKLw3eGFwDYGzmBR4y2D
	 g0MJbjpniBZeennlmhauD559z3Frrf7vJyR2bA6PAtt3eyXyw3yI/wtWnovG1Btf25
	 bUJu8maRe3CbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 804E840879;
	Mon,  6 Apr 2026 15:57:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 36306345
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 15:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C59B4091D
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 15:57:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GMJnyENPxzRi for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 15:57:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5486C40879
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5486C40879
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 15:57:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD413804EF; Mon,  6 Apr 2026 15:57:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Apr 2026 17:42:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ce17bc7d6fb37a2b1c91895808636f53fc0f18d
X-Git-Newrev: 5bd1973ef0376ac60ca5f04ef994eaf912b5162d
X-Patchwork-Hint: ignore
Message-Id: <20260406155712.BD413804EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sord: bump version to 0.16.22
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5bd1973ef0376ac60ca5f04ef994eaf912b5162d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gitlab.com/drobilla/sord/-/blob/v0.16.22/NEWS

Added dependency to zix due to upstream commit:
https://gitlab.com/drobilla/sord/-/commit/ec186c111b2079aa2bb52f44b01b874e46ba4577
added in version 0.16.16.

Updated license hash due to upstream commits
https://gitlab.com/drobilla/sord/-/commit/53f071a571899faf27dd730ea24838c16887836c
https://gitlab.com/drobilla/sord/-/commit/5edcf18adfbc4240040c667c00884cbd049e3a84
https://gitlab.com/drobilla/sord/-/commit/fb728f8a6fb0e0410f15fa7a57f9ab7833db17ac

Package switched from pcre to pcre2 in version 0.16.16:
https://gitlab.com/drobilla/sord/-/commit/67bcd63bda9d7b095489a09b9880aa730ddb5488

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sord/Config.in | 1 +
 package/sord/sord.hash | 6 +++---
 package/sord/sord.mk   | 8 ++++----
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/sord/Config.in b/package/sord/Config.in
index 91dfb41d0b..f4877e43d7 100644
--- a/package/sord/Config.in
+++ b/package/sord/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SORD
 	bool "sord"
 	select BR2_PACKAGE_SERD
+	select BR2_PACKAGE_ZIX
 	help
 	  Sord is a lightweight C library for storing RDF data in
 	  memory.
diff --git a/package/sord/sord.hash b/package/sord/sord.hash
index ec5c88a43c..7ab940bae3 100644
--- a/package/sord/sord.hash
+++ b/package/sord/sord.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking signature
-# https://download.drobilla.net/sord-0.16.12.tar.xz.sig
-sha256  fde269893cb24b2ab7b75708d7a349c6e760c47a0d967aeca5b1c651294ff9f2  sord-0.16.12.tar.xz
-sha256  e06562d6bcf0341b2ac2ad0f0ca36801d2ebf388d5ef297011625e4c36e963f0  COPYING
+# https://download.drobilla.net/sord-0.16.22.tar.xz.sig
+sha256  bb23b34b216579136795d518cffa73d91cf205594ce9accebfd408afb839173f  sord-0.16.22.tar.xz
+sha256  ae223adebe7cc1ee0716e0f926d1ecc8e42c6e4da7e1d7418c9c07fae244bbde  COPYING
diff --git a/package/sord/sord.mk b/package/sord/sord.mk
index 9fcf98858a..630be1c1c5 100644
--- a/package/sord/sord.mk
+++ b/package/sord/sord.mk
@@ -4,16 +4,16 @@
 #
 ################################################################################
 
-SORD_VERSION = 0.16.12
+SORD_VERSION = 0.16.22
 SORD_SITE = https://download.drobilla.net
 SORD_SOURCE = sord-$(SORD_VERSION).tar.xz
 SORD_LICENSE = ISC
 SORD_LICENSE_FILES = COPYING
-SORD_DEPENDENCIES = host-pkgconf serd
+SORD_DEPENDENCIES = host-pkgconf serd zix
 SORD_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
-SORD_DEPENDENCIES += pcre
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+SORD_DEPENDENCIES += pcre2
 endif
 
 SORD_CONF_OPTS += -Ddocs=disabled -Dtests=disabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
