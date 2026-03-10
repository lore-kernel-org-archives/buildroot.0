Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43656FD88C9
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 22:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B38482861;
	Tue, 10 Mar 2026 22:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZbnRiHTaovw8; Tue, 10 Mar 2026 22:44:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F5A4827B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773182665;
	bh=dSig5lcSFVZVXZ7Bl91OyJrLiNKnS8eYUSFCBSeuUtA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f/mKUBwHcMC0YeR3cFgfcf8HnNnz+1DVtUW0QVx+XajUsmTgqFT5V4p1V35NN7cMQ
	 PP4swwuqWxtHlXnfFQLbSsZzIRGL9/KBxENDnTSHlI1wbkBoyMpVB+mYvVlDx6LGat
	 khEIOA5/wbboGOUqq0cRzI9RwizCsAllaWF49P1OUncBM2EppHMMXtfHN7yFfJVCxX
	 gYdNZNk/Anv0suLnfbu+RcdeAB+ZPcvL+eLFpYaqy6o20I19+X0hJx/KMFMBMf7I4A
	 6WkH40Ize2/RQP8johezjA5QELP4BMMV35VY5WbU2MRlC4llJXDG0iC0mI3bPEJsDL
	 PoilkgwAHnuyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F5A4827B5;
	Tue, 10 Mar 2026 22:44:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DDFBF33A
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3AE040C92
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:44:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kb98ZQdLjeKk for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 22:44:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1782340BD9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1782340BD9
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:44:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D2EA869CA; Tue, 10 Mar 2026 22:44:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 10 Mar 2026 23:20:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e5b7c4907f4c07be3723391990a0358557d447a
X-Git-Newrev: a5f5c08dcd34452023cbf79ea30071828fb66c1a
X-Patchwork-Hint: ignore
Message-Id: <20260310224423.3D2EA869CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: improve U-Boot OP-TEE TEE
 format options help text
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a5f5c08dcd34452023cbf79ea30071828fb66c1a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

OP-TEE generates a few binaries that can be used by u-boot on some
platforms (Rockchip, Texas Instruments K3) using TEE variable.

Add a link to the OP-TEE documentation were we can find easily the
desciption for each TEE format that can be used by u-boot.

For convenience, copy tee.elf and tee.bin description in each option
choice help text.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/uboot/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 47ce24ee76..17b7f95f50 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -295,15 +295,23 @@ choice
 	  Since this version, the TEE in binary format must be used as
 	  it contains important meta-data.
 
+	  https://optee.readthedocs.io/en/4.9.0/architecture/porting_guidelines.html#binaries
+
 config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_ELF
 	bool "tee.elf"
 	help
+	  The main OP-TEE ELF file. All other OP-TEE binaries are
+	  created with this as input.
+
 	  ELF format may be used only for OP-TEE versions before
 	  3.8.0.
 
 config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_BIN
 	bool "tee.bin"
 	help
+	  The original OP-TEE binary with a header (v1) and combined
+	  init, paged, and unpaged parts.
+
 	  Binary format must be used for OP-TEE versions since 3.8.0.
 
 endchoice
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
