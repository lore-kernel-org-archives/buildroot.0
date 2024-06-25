Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A18C2BBCA
	for <buildroot@archiver.kernel.org>; Tue, 25 Jun 2024 17:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44DA5400B8;
	Tue, 25 Jun 2024 17:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FUPVWXlpG5WM; Tue, 25 Jun 2024 17:31:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD91B4059F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD91B4059F;
	Tue, 25 Jun 2024 17:31:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE5B21BF426
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 17:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D91384059F
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 17:31:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QtLJqE4eF5X4 for <buildroot@lists.busybox.net>;
 Tue, 25 Jun 2024 17:31:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B454B400B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B454B400B8
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 17:31:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A86E982BD0; Tue, 25 Jun 2024 17:31:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jun 2024 19:27:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f88a644ed7d6c9ea55fd4fbe9d7f37055920016
X-Git-Newrev: 410921cceb745dcdd824a7287ada12ac74d9c6dd
X-Patchwork-Hint: ignore
Message-Id: <20240625173142.A86E982BD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/riscv-isa-sim: update the patch to
 be applied with fuzz 0
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

commit: https://git.buildroot.net/buildroot/commit/?id=410921cceb745dcdd824a7287ada12ac74d9c6dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0" reduced the fuzz factor.

Due to this change, host-riscv-isa-sim fail to build with output:

    Applying 0001-riscv-disable-precompiled-headers.patch using patch:
    patching file riscv/riscv.mk.in
    Hunk #1 FAILED at 35.
    1 out of 1 hunk FAILED -- saving rejects to file riscv/riscv.mk.in.rej

This commit rebased the package patch on the package version, bumped in
commit 853b7661bf "package/riscv-isa-sim: bump to git version
00dfa28cd7".

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-riscv-disable-precompiled-headers.patch             | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/riscv-isa-sim/0001-riscv-disable-precompiled-headers.patch b/package/riscv-isa-sim/0001-riscv-disable-precompiled-headers.patch
index 461f34e3a1..9ce32e3b76 100644
--- a/package/riscv-isa-sim/0001-riscv-disable-precompiled-headers.patch
+++ b/package/riscv-isa-sim/0001-riscv-disable-precompiled-headers.patch
@@ -1,4 +1,4 @@
-From 980d5143089bf32ef8a6dfdf1bb9e9fe92fa7bf5 Mon Sep 17 00:00:00 2001
+From 12e0257495de41202827fabd5935f2e5a92ae8a6 Mon Sep 17 00:00:00 2001
 From: Julien Olivain <ju.o@free.fr>
 Date: Sun, 9 Jan 2022 13:38:48 +0100
 Subject: [PATCH] riscv: disable precompiled headers
@@ -16,12 +16,12 @@ Signed-off-by: Julien Olivain <ju.o@free.fr>
  1 file changed, 3 deletions(-)
 
 diff --git a/riscv/riscv.mk.in b/riscv/riscv.mk.in
-index 2347ce6..4f56eaf 100644
+index 469c48dc..c61cadaf 100644
 --- a/riscv/riscv.mk.in
 +++ b/riscv/riscv.mk.in
-@@ -35,9 +35,6 @@ riscv_hdrs = \
- 
- riscv_install_hdrs = mmio_plugin.h
+@@ -45,9 +45,6 @@ riscv_install_hdrs = \
+ 	triggers.h \
+ 	vector_unit.h \
  
 -riscv_precompiled_hdrs = \
 -	insn_template.h \
@@ -30,5 +30,5 @@ index 2347ce6..4f56eaf 100644
  	processor.cc \
  	execute.cc \
 -- 
-2.34.1
+2.45.2
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
