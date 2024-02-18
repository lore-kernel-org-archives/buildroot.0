Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6312C48BF6
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 18:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DB1A82051;
	Sun, 18 Feb 2024 18:46:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sd3HXCxtDzBI; Sun, 18 Feb 2024 18:46:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E18E9820A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E18E9820A9;
	Sun, 18 Feb 2024 18:46:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 279251BF41F
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 18:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83809405DF
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 18:45:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 845LKuBIimFw for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 18:45:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.117;
 helo=smtpcmd11117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3493A405BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3493A405BD
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3493A405BD
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 18:45:40 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id bmASrFAK1ce1vbmATrHZIY; Sun, 18 Feb 2024 19:45:38 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 18 Feb 2024 19:45:29 +0100
Message-Id: <20240218184536.1922309-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240218184536.1922309-1-giulio.benetti@benettiengineering.com>
References: <20240218184536.1922309-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKoj9QbZm3o7ZFS7LiFVcAudpdw8zZ6vQIcsYnRdNqyQbLvWRBkN//Z/eq2ZkLkNfCHbYPDazvD1l/kMetz7vXWet7y5HRSCPBnXW3iHjTgxjyqE8kQE
 N0xCdAQQjuIKkbxDT/2oeiB21wdFvZrfdYSgioVqTe5psCLKt4YIh1bpd5uKjPf7HvEDQ9pfTxORNmxC/VxYrQEgQvNXoGHeyB3Rv4UzHEOqVMaatSS7btsV
 qsUW+cduvxAEmBR9/TX6KOw9DWxami75tIa8yLv0ajYZaNyL30a5xpOc1I5bnM/Azx645VCo6H9soR/0tKbtqz9J97wXLgqU2rp/UUrga2ZhQ/sFMz2gTOtN
 uTK7vKwz1ypQNSd1qiMBHqSaynGNIxmbZqBXIM6/MqUfu9zCC1BjoM2Oujy1S7gKDC5Atb8Rei0fm2hzhUaGoHmd5V/E920QC4vd0U5l+bGJXjABnNogbEtc
 k8t+3czUijbBeyCwjUIuS85cWc2cv42rFaKcx3Hu+rdWIyZ99e8PbVFz0A5x3kzv83gYITzhDapFANCd7VsQcbzd56rBlsZ7JaitX7F667zEACTt2kfvyRVX
 PAA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708281938; bh=C2OSljav9qv45yZoaia/5ZC+6Du5cmlm9gE1Ek47UrQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=Q71Brdq5+8pJ7DnEqBRlAkm7Q1hgwHJydtlPcKujgU04NXMk8lT5hQ8wB0lUucM27
 BBMJWeDj19a2BaSktRb3RJ+LgdZiOr+hW49P0f3RTP/sLNpNHN3NlP2LJgiUZp55PY
 gn37bknWI5fld7wOJUDwFSbKceg3P6AHx1soKmWj1S5zjd0BT2yQYYGav3MCn+G4zV
 AOKp28kDW58WmXVGgtLhXFI32Ntpdw5uLu649XNGraItCSI4PyQtBNoKQNiDBOkNo9
 WdEsAiD8SSpavCYR7YhJUQDYJI7E1uwwS5g8Yc/bC76zMfyPmIqtQ6tL7e1QCsekUN
 ajqfLD5MXUCdA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Q71Brdq5
Subject: [Buildroot] [PATCH 1/8] package/binutils: add local patches to fix
 Nios2 bug 27597
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Pierre Ducroquet <pinaraf@pinaraf.info>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dominik Michael Rauh <dmrauh@posteo.de>, Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

These backported patches fix Nios2 linker bug 27597 that affects packages
gdal, kf5-kcoreaddons, libgeos, libcamera, pistache.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...ertion-fail-in-nios2_elf32_install_i.patch | 125 ++++++++++++++++++
 ...ertion-fail-in-nios2_elf32_install_i.patch | 125 ++++++++++++++++++
 ...ertion-fail-in-nios2_elf32_install_i.patch | 125 ++++++++++++++++++
 3 files changed, 375 insertions(+)
 create mode 100644 package/binutils/2.39/0004-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch
 create mode 100644 package/binutils/2.40/0003-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch
 create mode 100644 package/binutils/2.41/0003-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch

diff --git a/package/binutils/2.39/0004-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch b/package/binutils/2.39/0004-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch
new file mode 100644
index 0000000000..4753ae13c4
--- /dev/null
+++ b/package/binutils/2.39/0004-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch
@@ -0,0 +1,125 @@
+From 900c0f0aa3d78cd9e67ccd26fbc86224cef4c5b1 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 16 Feb 2024 22:33:29 +1030
+Subject: [PATCH] PR27597, nios: assertion fail in nios2_elf32_install_imm16
+
+The assertion in nios2_elf32_install_imm16 triggers when the PLT is
+twice the maximum allowable size for a branch from PLTn to reach
+.PLTresolve, and on no other call to nios2_elf32_install_imm16.  That
+makes the assertion completely useless.  We can handle a PIC PLT
+exceeding 0x8000 in size by bouncing branches that won't reach through
+previous branches.
+
+	PR 27597
+	* elf32-nios2.c (nios2_elf32_install_imm16): Delete BFD_ASSERT.
+	(nios2_build_one_stub): Don't bother masking value passed to
+	nios2_elf32_install_imm16.
+	(nios2_elf32_finish_dynamic_symbol): Likewise.  Handle overflow
+	of PLTn branch to .PLTresolve by bouncing through prior branches.
+
+Upstream: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=900c0f0aa3d78cd9e67ccd26fbc86224cef4c5b1
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-nios2.c | 40 ++++++++++++++++++++++++----------------
+ 1 file changed, 24 insertions(+), 16 deletions(-)
+
+diff --git a/bfd/elf32-nios2.c b/bfd/elf32-nios2.c
+index bebf4239958..7f61e2f8507 100644
+--- a/bfd/elf32-nios2.c
++++ b/bfd/elf32-nios2.c
+@@ -1878,8 +1878,6 @@ nios2_elf32_install_imm16 (asection *sec, bfd_vma offset, bfd_vma value)
+ {
+   bfd_vma word = bfd_get_32 (sec->owner, sec->contents + offset);
+ 
+-  BFD_ASSERT (value <= 0xffff || ((bfd_signed_vma) value) >= -0xffff);
+-
+   bfd_put_32 (sec->owner, word | ((value & 0xffff) << 6),
+ 	      sec->contents + offset);
+ }
+@@ -2518,7 +2516,7 @@ nios2_build_one_stub (struct bfd_hash_entry *gen_entry, void *in_arg ATTRIBUTE_U
+       nios2_elf32_install_imm16 (stub_sec, hsh->stub_offset,
+ 				 hiadj (sym_value));
+       nios2_elf32_install_imm16 (stub_sec, hsh->stub_offset + 4,
+-				 (sym_value & 0xffff));
++				 sym_value);
+       stub_sec->size += 12;
+       break;
+     default:
+@@ -4986,16 +4984,28 @@ nios2_elf32_finish_dynamic_symbol (bfd *output_bfd,
+       /* Emit the PLT entry.  */
+       if (bfd_link_pic (info))
+ 	{
++	  bfd_vma br_offset;
++
+ 	  nios2_elf32_install_data (splt, nios2_so_plt_entry, h->plt.offset,
+ 				    3);
+ 	  plt_index = (h->plt.offset - 24) / 12;
+ 	  got_offset = (plt_index + 3) * 4;
+ 	  nios2_elf32_install_imm16 (splt, h->plt.offset,
+-				     hiadj(plt_index * 4));
++				     hiadj (plt_index * 4));
+ 	  nios2_elf32_install_imm16 (splt, h->plt.offset + 4,
+-				     (plt_index * 4) & 0xffff);
+-	  nios2_elf32_install_imm16 (splt, h->plt.offset + 8,
+-				     0xfff4 - h->plt.offset);
++				     plt_index * 4);
++	  br_offset = -(h->plt.offset + 12);
++	  /* If this plt entry is too far away from the start of .plt
++	     for the "br" to reach .PLTresolve, bounce through one or
++	     more of the previous "br" instructions.  */
++	  if (br_offset < (bfd_vma) -32768)
++	    {
++	      br_offset += 32768 / 12 * 12 - 4;
++	      while (br_offset < (bfd_vma) -32768)
++		br_offset += 32768 / 12 * 12;
++	    }
++	  nios2_elf32_install_imm16 (splt, h->plt.offset + 8, br_offset);
++
+ 	  got_address = (sgotplt->output_section->vma + sgotplt->output_offset
+ 			 + got_offset);
+ 
+@@ -5014,9 +5024,8 @@ nios2_elf32_finish_dynamic_symbol (bfd *output_bfd,
+ 	  nios2_elf32_install_data (splt, nios2_plt_entry, h->plt.offset, 3);
+ 	  got_address = (sgotplt->output_section->vma + sgotplt->output_offset
+ 			 + got_offset);
+-	  nios2_elf32_install_imm16 (splt, h->plt.offset, hiadj(got_address));
+-	  nios2_elf32_install_imm16 (splt, h->plt.offset + 4,
+-				     got_address & 0xffff);
++	  nios2_elf32_install_imm16 (splt, h->plt.offset, hiadj (got_address));
++	  nios2_elf32_install_imm16 (splt, h->plt.offset + 4, got_address);
+ 
+ 	  /* Fill in the entry in the global offset table.  */
+ 	  bfd_put_32 (output_bfd,
+@@ -5217,8 +5226,8 @@ nios2_elf32_finish_dynamic_sections (bfd *output_bfd,
+ 	      BFD_ASSERT ((got_pcrel & 0xf) == 0);
+ 	      nios2_elf32_install_data (splt, nios2_so_plt0_entry, 0, 6);
+ 	      nios2_elf32_install_imm16 (splt, 4, hiadj (got_pcrel));
+-	      nios2_elf32_install_imm16 (splt, 12, got_pcrel & 0xffff);
+-	      nios2_elf32_install_imm16 (splt, 16, (got_pcrel + 4) & 0xffff);
++	      nios2_elf32_install_imm16 (splt, 12, got_pcrel);
++	      nios2_elf32_install_imm16 (splt, 16, got_pcrel + 4);
+ 	    }
+ 	  else
+ 	    {
+@@ -5240,14 +5249,13 @@ nios2_elf32_finish_dynamic_sections (bfd *output_bfd,
+ 
+ 	      nios2_elf32_install_data (splt, nios2_plt0_entry, res_size, 7);
+ 	      nios2_elf32_install_imm16 (splt, res_size, hiadj (res_start));
+-	      nios2_elf32_install_imm16 (splt, res_size + 4,
+-					 res_start & 0xffff);
++	      nios2_elf32_install_imm16 (splt, res_size + 4, res_start);
+ 	      nios2_elf32_install_imm16 (splt, res_size + 12,
+ 					 hiadj (got_address));
+ 	      nios2_elf32_install_imm16 (splt, res_size + 16,
+-					 (got_address + 4) & 0xffff);
++					 got_address + 4);
+ 	      nios2_elf32_install_imm16 (splt, res_size + 20,
+-					 (got_address + 8) & 0xffff);
++					 got_address + 8);
+ 	    }
+ 	}
+     }
+-- 
+2.34.1
+
diff --git a/package/binutils/2.40/0003-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch b/package/binutils/2.40/0003-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch
new file mode 100644
index 0000000000..4753ae13c4
--- /dev/null
+++ b/package/binutils/2.40/0003-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch
@@ -0,0 +1,125 @@
+From 900c0f0aa3d78cd9e67ccd26fbc86224cef4c5b1 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 16 Feb 2024 22:33:29 +1030
+Subject: [PATCH] PR27597, nios: assertion fail in nios2_elf32_install_imm16
+
+The assertion in nios2_elf32_install_imm16 triggers when the PLT is
+twice the maximum allowable size for a branch from PLTn to reach
+.PLTresolve, and on no other call to nios2_elf32_install_imm16.  That
+makes the assertion completely useless.  We can handle a PIC PLT
+exceeding 0x8000 in size by bouncing branches that won't reach through
+previous branches.
+
+	PR 27597
+	* elf32-nios2.c (nios2_elf32_install_imm16): Delete BFD_ASSERT.
+	(nios2_build_one_stub): Don't bother masking value passed to
+	nios2_elf32_install_imm16.
+	(nios2_elf32_finish_dynamic_symbol): Likewise.  Handle overflow
+	of PLTn branch to .PLTresolve by bouncing through prior branches.
+
+Upstream: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=900c0f0aa3d78cd9e67ccd26fbc86224cef4c5b1
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-nios2.c | 40 ++++++++++++++++++++++++----------------
+ 1 file changed, 24 insertions(+), 16 deletions(-)
+
+diff --git a/bfd/elf32-nios2.c b/bfd/elf32-nios2.c
+index bebf4239958..7f61e2f8507 100644
+--- a/bfd/elf32-nios2.c
++++ b/bfd/elf32-nios2.c
+@@ -1878,8 +1878,6 @@ nios2_elf32_install_imm16 (asection *sec, bfd_vma offset, bfd_vma value)
+ {
+   bfd_vma word = bfd_get_32 (sec->owner, sec->contents + offset);
+ 
+-  BFD_ASSERT (value <= 0xffff || ((bfd_signed_vma) value) >= -0xffff);
+-
+   bfd_put_32 (sec->owner, word | ((value & 0xffff) << 6),
+ 	      sec->contents + offset);
+ }
+@@ -2518,7 +2516,7 @@ nios2_build_one_stub (struct bfd_hash_entry *gen_entry, void *in_arg ATTRIBUTE_U
+       nios2_elf32_install_imm16 (stub_sec, hsh->stub_offset,
+ 				 hiadj (sym_value));
+       nios2_elf32_install_imm16 (stub_sec, hsh->stub_offset + 4,
+-				 (sym_value & 0xffff));
++				 sym_value);
+       stub_sec->size += 12;
+       break;
+     default:
+@@ -4986,16 +4984,28 @@ nios2_elf32_finish_dynamic_symbol (bfd *output_bfd,
+       /* Emit the PLT entry.  */
+       if (bfd_link_pic (info))
+ 	{
++	  bfd_vma br_offset;
++
+ 	  nios2_elf32_install_data (splt, nios2_so_plt_entry, h->plt.offset,
+ 				    3);
+ 	  plt_index = (h->plt.offset - 24) / 12;
+ 	  got_offset = (plt_index + 3) * 4;
+ 	  nios2_elf32_install_imm16 (splt, h->plt.offset,
+-				     hiadj(plt_index * 4));
++				     hiadj (plt_index * 4));
+ 	  nios2_elf32_install_imm16 (splt, h->plt.offset + 4,
+-				     (plt_index * 4) & 0xffff);
+-	  nios2_elf32_install_imm16 (splt, h->plt.offset + 8,
+-				     0xfff4 - h->plt.offset);
++				     plt_index * 4);
++	  br_offset = -(h->plt.offset + 12);
++	  /* If this plt entry is too far away from the start of .plt
++	     for the "br" to reach .PLTresolve, bounce through one or
++	     more of the previous "br" instructions.  */
++	  if (br_offset < (bfd_vma) -32768)
++	    {
++	      br_offset += 32768 / 12 * 12 - 4;
++	      while (br_offset < (bfd_vma) -32768)
++		br_offset += 32768 / 12 * 12;
++	    }
++	  nios2_elf32_install_imm16 (splt, h->plt.offset + 8, br_offset);
++
+ 	  got_address = (sgotplt->output_section->vma + sgotplt->output_offset
+ 			 + got_offset);
+ 
+@@ -5014,9 +5024,8 @@ nios2_elf32_finish_dynamic_symbol (bfd *output_bfd,
+ 	  nios2_elf32_install_data (splt, nios2_plt_entry, h->plt.offset, 3);
+ 	  got_address = (sgotplt->output_section->vma + sgotplt->output_offset
+ 			 + got_offset);
+-	  nios2_elf32_install_imm16 (splt, h->plt.offset, hiadj(got_address));
+-	  nios2_elf32_install_imm16 (splt, h->plt.offset + 4,
+-				     got_address & 0xffff);
++	  nios2_elf32_install_imm16 (splt, h->plt.offset, hiadj (got_address));
++	  nios2_elf32_install_imm16 (splt, h->plt.offset + 4, got_address);
+ 
+ 	  /* Fill in the entry in the global offset table.  */
+ 	  bfd_put_32 (output_bfd,
+@@ -5217,8 +5226,8 @@ nios2_elf32_finish_dynamic_sections (bfd *output_bfd,
+ 	      BFD_ASSERT ((got_pcrel & 0xf) == 0);
+ 	      nios2_elf32_install_data (splt, nios2_so_plt0_entry, 0, 6);
+ 	      nios2_elf32_install_imm16 (splt, 4, hiadj (got_pcrel));
+-	      nios2_elf32_install_imm16 (splt, 12, got_pcrel & 0xffff);
+-	      nios2_elf32_install_imm16 (splt, 16, (got_pcrel + 4) & 0xffff);
++	      nios2_elf32_install_imm16 (splt, 12, got_pcrel);
++	      nios2_elf32_install_imm16 (splt, 16, got_pcrel + 4);
+ 	    }
+ 	  else
+ 	    {
+@@ -5240,14 +5249,13 @@ nios2_elf32_finish_dynamic_sections (bfd *output_bfd,
+ 
+ 	      nios2_elf32_install_data (splt, nios2_plt0_entry, res_size, 7);
+ 	      nios2_elf32_install_imm16 (splt, res_size, hiadj (res_start));
+-	      nios2_elf32_install_imm16 (splt, res_size + 4,
+-					 res_start & 0xffff);
++	      nios2_elf32_install_imm16 (splt, res_size + 4, res_start);
+ 	      nios2_elf32_install_imm16 (splt, res_size + 12,
+ 					 hiadj (got_address));
+ 	      nios2_elf32_install_imm16 (splt, res_size + 16,
+-					 (got_address + 4) & 0xffff);
++					 got_address + 4);
+ 	      nios2_elf32_install_imm16 (splt, res_size + 20,
+-					 (got_address + 8) & 0xffff);
++					 got_address + 8);
+ 	    }
+ 	}
+     }
+-- 
+2.34.1
+
diff --git a/package/binutils/2.41/0003-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch b/package/binutils/2.41/0003-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch
new file mode 100644
index 0000000000..4753ae13c4
--- /dev/null
+++ b/package/binutils/2.41/0003-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch
@@ -0,0 +1,125 @@
+From 900c0f0aa3d78cd9e67ccd26fbc86224cef4c5b1 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 16 Feb 2024 22:33:29 +1030
+Subject: [PATCH] PR27597, nios: assertion fail in nios2_elf32_install_imm16
+
+The assertion in nios2_elf32_install_imm16 triggers when the PLT is
+twice the maximum allowable size for a branch from PLTn to reach
+.PLTresolve, and on no other call to nios2_elf32_install_imm16.  That
+makes the assertion completely useless.  We can handle a PIC PLT
+exceeding 0x8000 in size by bouncing branches that won't reach through
+previous branches.
+
+	PR 27597
+	* elf32-nios2.c (nios2_elf32_install_imm16): Delete BFD_ASSERT.
+	(nios2_build_one_stub): Don't bother masking value passed to
+	nios2_elf32_install_imm16.
+	(nios2_elf32_finish_dynamic_symbol): Likewise.  Handle overflow
+	of PLTn branch to .PLTresolve by bouncing through prior branches.
+
+Upstream: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=900c0f0aa3d78cd9e67ccd26fbc86224cef4c5b1
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-nios2.c | 40 ++++++++++++++++++++++++----------------
+ 1 file changed, 24 insertions(+), 16 deletions(-)
+
+diff --git a/bfd/elf32-nios2.c b/bfd/elf32-nios2.c
+index bebf4239958..7f61e2f8507 100644
+--- a/bfd/elf32-nios2.c
++++ b/bfd/elf32-nios2.c
+@@ -1878,8 +1878,6 @@ nios2_elf32_install_imm16 (asection *sec, bfd_vma offset, bfd_vma value)
+ {
+   bfd_vma word = bfd_get_32 (sec->owner, sec->contents + offset);
+ 
+-  BFD_ASSERT (value <= 0xffff || ((bfd_signed_vma) value) >= -0xffff);
+-
+   bfd_put_32 (sec->owner, word | ((value & 0xffff) << 6),
+ 	      sec->contents + offset);
+ }
+@@ -2518,7 +2516,7 @@ nios2_build_one_stub (struct bfd_hash_entry *gen_entry, void *in_arg ATTRIBUTE_U
+       nios2_elf32_install_imm16 (stub_sec, hsh->stub_offset,
+ 				 hiadj (sym_value));
+       nios2_elf32_install_imm16 (stub_sec, hsh->stub_offset + 4,
+-				 (sym_value & 0xffff));
++				 sym_value);
+       stub_sec->size += 12;
+       break;
+     default:
+@@ -4986,16 +4984,28 @@ nios2_elf32_finish_dynamic_symbol (bfd *output_bfd,
+       /* Emit the PLT entry.  */
+       if (bfd_link_pic (info))
+ 	{
++	  bfd_vma br_offset;
++
+ 	  nios2_elf32_install_data (splt, nios2_so_plt_entry, h->plt.offset,
+ 				    3);
+ 	  plt_index = (h->plt.offset - 24) / 12;
+ 	  got_offset = (plt_index + 3) * 4;
+ 	  nios2_elf32_install_imm16 (splt, h->plt.offset,
+-				     hiadj(plt_index * 4));
++				     hiadj (plt_index * 4));
+ 	  nios2_elf32_install_imm16 (splt, h->plt.offset + 4,
+-				     (plt_index * 4) & 0xffff);
+-	  nios2_elf32_install_imm16 (splt, h->plt.offset + 8,
+-				     0xfff4 - h->plt.offset);
++				     plt_index * 4);
++	  br_offset = -(h->plt.offset + 12);
++	  /* If this plt entry is too far away from the start of .plt
++	     for the "br" to reach .PLTresolve, bounce through one or
++	     more of the previous "br" instructions.  */
++	  if (br_offset < (bfd_vma) -32768)
++	    {
++	      br_offset += 32768 / 12 * 12 - 4;
++	      while (br_offset < (bfd_vma) -32768)
++		br_offset += 32768 / 12 * 12;
++	    }
++	  nios2_elf32_install_imm16 (splt, h->plt.offset + 8, br_offset);
++
+ 	  got_address = (sgotplt->output_section->vma + sgotplt->output_offset
+ 			 + got_offset);
+ 
+@@ -5014,9 +5024,8 @@ nios2_elf32_finish_dynamic_symbol (bfd *output_bfd,
+ 	  nios2_elf32_install_data (splt, nios2_plt_entry, h->plt.offset, 3);
+ 	  got_address = (sgotplt->output_section->vma + sgotplt->output_offset
+ 			 + got_offset);
+-	  nios2_elf32_install_imm16 (splt, h->plt.offset, hiadj(got_address));
+-	  nios2_elf32_install_imm16 (splt, h->plt.offset + 4,
+-				     got_address & 0xffff);
++	  nios2_elf32_install_imm16 (splt, h->plt.offset, hiadj (got_address));
++	  nios2_elf32_install_imm16 (splt, h->plt.offset + 4, got_address);
+ 
+ 	  /* Fill in the entry in the global offset table.  */
+ 	  bfd_put_32 (output_bfd,
+@@ -5217,8 +5226,8 @@ nios2_elf32_finish_dynamic_sections (bfd *output_bfd,
+ 	      BFD_ASSERT ((got_pcrel & 0xf) == 0);
+ 	      nios2_elf32_install_data (splt, nios2_so_plt0_entry, 0, 6);
+ 	      nios2_elf32_install_imm16 (splt, 4, hiadj (got_pcrel));
+-	      nios2_elf32_install_imm16 (splt, 12, got_pcrel & 0xffff);
+-	      nios2_elf32_install_imm16 (splt, 16, (got_pcrel + 4) & 0xffff);
++	      nios2_elf32_install_imm16 (splt, 12, got_pcrel);
++	      nios2_elf32_install_imm16 (splt, 16, got_pcrel + 4);
+ 	    }
+ 	  else
+ 	    {
+@@ -5240,14 +5249,13 @@ nios2_elf32_finish_dynamic_sections (bfd *output_bfd,
+ 
+ 	      nios2_elf32_install_data (splt, nios2_plt0_entry, res_size, 7);
+ 	      nios2_elf32_install_imm16 (splt, res_size, hiadj (res_start));
+-	      nios2_elf32_install_imm16 (splt, res_size + 4,
+-					 res_start & 0xffff);
++	      nios2_elf32_install_imm16 (splt, res_size + 4, res_start);
+ 	      nios2_elf32_install_imm16 (splt, res_size + 12,
+ 					 hiadj (got_address));
+ 	      nios2_elf32_install_imm16 (splt, res_size + 16,
+-					 (got_address + 4) & 0xffff);
++					 got_address + 4);
+ 	      nios2_elf32_install_imm16 (splt, res_size + 20,
+-					 (got_address + 8) & 0xffff);
++					 got_address + 8);
+ 	    }
+ 	}
+     }
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
