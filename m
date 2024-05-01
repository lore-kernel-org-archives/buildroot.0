Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58D8C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9534180B9B;
	Wed,  1 May 2024 19:58:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bskpZecsYu3j; Wed,  1 May 2024 19:58:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 363E882101
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 363E882101;
	Wed,  1 May 2024 19:58:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 372AC1BF2C9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3103340079
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:58:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j9C-rJbmJDJ3 for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:58:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4038040806
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4038040806
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:58:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B4DD86486; Wed,  1 May 2024 19:58:24 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 21:57:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7fa0159a5055363d002089f0c451a84594732cf2
X-Git-Newrev: 83339a69e4ce03fccbd4d6bebd6a606f3e330085
X-Patchwork-Hint: ignore
Message-Id: <20240501195824.2B4DD86486@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: add local patches to fix
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=83339a69e4ce03fccbd4d6bebd6a606f3e330085
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These backported patches fix Nios2 linker bug 27597 that affects packages
gdal, kf5-kcoreaddons, libgeos, libcamera, pistache.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...s-assertion-fail-in-nios2_elf32_install_i.patch | 125 +++++++++++++++++++++
 ...s-assertion-fail-in-nios2_elf32_install_i.patch | 125 +++++++++++++++++++++
 ...s-assertion-fail-in-nios2_elf32_install_i.patch | 125 +++++++++++++++++++++
 3 files changed, 375 insertions(+)

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
diff --git a/package/binutils/2.42/0003-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch b/package/binutils/2.42/0003-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch
new file mode 100644
index 0000000000..4753ae13c4
--- /dev/null
+++ b/package/binutils/2.42/0003-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
