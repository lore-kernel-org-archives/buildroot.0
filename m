Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3CD10F3DF2
	for <buildroot@archiver.kernel.org>; Sat, 28 Mar 2026 18:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92D5F4117E;
	Sat, 28 Mar 2026 18:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hu2-u_alHyct; Sat, 28 Mar 2026 18:23:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BACE4117C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774722190;
	bh=hyw+58LAJ/fEeoXlzYXhrif+PEsrbg+h/Yrqgi2ftkA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dBt4nrZx2vc1LdXUpbxpTT6dpY4AAEcpsqnQDaiMoPnC0meTI62BYdHhPOYmTYHrQ
	 RU6qsxooUdnwoXOxSmm3oDnR1rnTitWv5hKcr1Ls98hwkWGjdqVsyLZ2My0TBEdMLD
	 5HTSF0+3baGJelwtgMkHjW97opOSLB2g3RlHiTEs/bO0SFq/bFnB9UdCNLsEc02g+q
	 2K1jXrIrILWpkaTRjGsu2ihSDvcDW6x6tI3B5+SElSgyJzl3N0ovDFjmkZPyiKpbdq
	 uEiMiq1dmRjHvBv16aitS35xQTHE3LAsk7nIlhZ9CsI7CdI8bS7LLCOo/5Os8mBDZf
	 Get5VQ/6xiLrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BACE4117C;
	Sat, 28 Mar 2026 18:23:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3840510F
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 18:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D438401E9
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 18:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dblWMBmTBhuT for <buildroot@buildroot.org>;
 Sat, 28 Mar 2026 18:23:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EFC940120
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EFC940120
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 18:23:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 684E37FCF9; Sat, 28 Mar 2026 18:23:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Mar 2026 19:18:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d848e83a32faf8a99a8ae26e85de9f32f215d02e
X-Git-Newrev: 62c7bd4887ca462378e4ff0dc509a20d2e8c1c46
X-Patchwork-Hint: ignore
Message-Id: <20260328182306.684E37FCF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fwupd-efi: bump version to 1.8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/62c7bd4887ca462378e4ff0dc509a20d2e8c1c46
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/fwupd/fwupd-efi/releases/tag/1.8

Added TARGET_LD to _MESON_EXTRA_BINARIES due to upstream commit
https://github.com/fwupd/fwupd-efi/commit/a7ac71e3b391e040d9ca0d58d2d186be5b60b631
which causes a misdetection of the linker used.

Build log without specifying TARGET_LD:

  Program ld.bfd found: YES (/usr/bin/ld.bfd)
  [...]
  /usr/bin/ld.bfd: cannot represent machine `aarch64'

Build log with specifying TARGET_LD:

  Program ld.bfd found: YES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fwupd-efi/fwupd-efi.hash | 2 +-
 package/fwupd-efi/fwupd-efi.mk   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/fwupd-efi/fwupd-efi.hash b/package/fwupd-efi/fwupd-efi.hash
index 42f9eb83ff..8bca799e68 100644
--- a/package/fwupd-efi/fwupd-efi.hash
+++ b/package/fwupd-efi/fwupd-efi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  96d4fc45467159b2664ce86ee7d5030e265fdb4d4a4d774080654d2f5b1561ff  fwupd-efi-1.7.tar.gz
+sha256  c9f1f9b9b967ea50eb0b478f0d7693d6673d4cd76c8e7eb80c55fc44ec928925  fwupd-efi-1.8.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/fwupd-efi/fwupd-efi.mk b/package/fwupd-efi/fwupd-efi.mk
index fbff5a9043..cc44ec7e48 100644
--- a/package/fwupd-efi/fwupd-efi.mk
+++ b/package/fwupd-efi/fwupd-efi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FWUPD_EFI_VERSION = 1.7
+FWUPD_EFI_VERSION = 1.8
 FWUPD_EFI_SITE = $(call github,fwupd,fwupd-efi,$(FWUPD_EFI_VERSION))
 FWUPD_EFI_LICENSE = LGPL-2.1+
 FWUPD_EFI_LICENSE_FILES = COPYING
@@ -22,6 +22,8 @@ FWUPD_EFI_CONF_OPTS = \
 	-Defi_sbat_distro_url=https://gitlab.com/buildroot.org/buildroot/-/tree/master/package/fwupd-efi \
 	-Dgenpeimg=disabled \
 	-Dpython="$(HOST_DIR)/bin/python3"
-FWUPD_EFI_MESON_EXTRA_BINARIES = objcopy='$(TARGET_OBJCOPY)'
+FWUPD_EFI_MESON_EXTRA_BINARIES = \
+	ld.bfd='$(TARGET_LD)' \
+	objcopy='$(TARGET_OBJCOPY)'
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
