Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3206CD43370
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79229826DE;
	Fri, 12 Dec 2025 07:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SA8mUZpFYdZ1; Fri, 12 Dec 2025 07:55:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39410826FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526149;
	bh=Gw1acaja8iL8h+Rp45w/bvSjM5VtUf5NG0h52OzNq3g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oT2B9o2m7prxFevM8EX4Qfc4kc+ZLnTq+SI+8kbZRMpwy2XnesHwDyD17qGTPfzDu
	 /+oTyOkNhB0BElKDLJfMhLEIM1mSQ5P83PHXp5502v3QchhCXqC4HlfW9lEzpn/Cey
	 pISp5GWsSHyduL/OoGv88B50FHTyPm3vWyKD8II+SCTguTVowiQqPNA6jxJ84efQwZ
	 LfbO4r8Rm4L2AGapdt85qX7xdVbj3X1Bq8ZgRJ/L89rrnuHJxNFecZReeBRpoV8fW9
	 uUjvH/et2vwYg26l1edSYptzTI82LZWY7UrAnbIJGQsVtvHG2szDCZ+9rNh5TA8j2J
	 l/oDc7U4DO6Sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39410826FF;
	Fri, 12 Dec 2025 07:55:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 05C082E9
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DF5241148
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D0m82sT-N8yM for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48EEA41071
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48EEA41071
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41AE786C93; Fri, 12 Dec 2025 07:55:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Nov 2025 12:34:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ddb75786ea22632663204c03cdf5b7057afc580
X-Git-Newrev: b7d5ff9d51507dcef721ff3d5db862f8715d3351
X-Patchwork-Hint: ignore
Message-Id: <20251212075534.41AE786C93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: add support for binutils
 2.45.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7d5ff9d51507dcef721ff3d5db862f8715d3351
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We bring patches 0001 and 0002 that we carry for binutils 2.44. Patch
0002 requires a small update as a nearby configure option has been
removed between 2.44 and 2.45. Patch 0003 that we have for binutils
2.44 is not needed as it is part of the 2.45 release.

Changes in 2.45:

* New versioned release of libsframe: libsframe.so.2.  This release introduces
  versioned symbols with version node name LIBSFRAME_2.0.  Some new symbols
  have been added to support the new flag SFRAME_F_FDE_FUNC_START_PCREL and
  retrieving flags from SFrame decoder and encoder objects:
    - Addition of sframe_decoder_get_flags,
      sframe_decoder_get_offsetof_fde_start_addr, sframe_encoder_get_flags,
      sframe_encoder_get_offsetof_fde_start_addr.
  This release also includes backward-incompatible ABI changes:
    - Removal of sframe_get_funcdesc_with_addr.
    - Change in the behavior of sframe_decoder_get_funcdesc_v2,
      sframe_encoder_add_funcdesc_v2 and sframe_encoder_write.

* On s390 64-bit (s390x), gas, ld, objdump, and readelf now support generating
  and processing SFrame V2 stack trace information (.sframe).  The assembler
  generates SFrame info from CFI directives with option "--gsframe".  The
  linker generates SFrame info for the linker-generated .plt section and merges
  all .sframe sections.  Both objdump and readelf dump SFrame info with option
  "--sframe[=<section-name>]".

* For SFrame stack trace format, the function start address in each SFrame
  FDE has a changed encoding:  The 32-bit signed integer now holds the offset
  of the start PC of the associated function from the sfde_func_start_address
  field itself (instead of the earlier where it was the offset from the start
  of the SFrame section itself).  All SFrame sections generated by gas and ld
  now default to this new encoding, setting the (new)
  SFRAME_F_FDE_FUNC_START_PCREL flag.

  Relocatable SFrame links are now fixed.

* Readelf now recognizes RISC-V GNU_PROPERTY_RISCV_FEATURE_1_CFI_SS and
  GNU_PROPERTY_RISCV_FEATURE_1_CFI_LP_UNLABELED for zicfiss and zicfilp
  extensions.

* For RISC-V dis-assembler, the definition of mapping symbol $x is changed,
  so the file needs to be rebuilt since 2.45 once used .option arch directives.

* The LoongArch disassembler now properly accepts multiple disassembly
  options given by -M, such as "-M no-aliases,numeric".  (Previously only the
  first option took effect.)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Julien: fix BR2_BINUTILS_VERSION_2_45_X prompt to 2.45.1]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/binutils/2.45.1/0001-sh-conf.patch         |  50 ++++
 .../2.45.1/0002-poison-system-directories.patch    | 310 +++++++++++++++++++++
 package/binutils/Config.in.host                    |   4 +
 package/binutils/binutils.hash                     |   1 +
 4 files changed, 365 insertions(+)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
