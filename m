Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7C6FF8875
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 20:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09AD1616E1;
	Wed, 29 Apr 2026 20:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qzdCHQwSFuAv; Wed, 29 Apr 2026 20:01:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC112616D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777492865;
	bh=qQzVVKvG/PaZ6PwZTbsPlpIv5Hfbsjaotl8h3EPtRvE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dHXN5qJu4+QnLWHTeECLIy1BonOwwvKILzlN39zbEhDtGOLzhdKF2h2BC8V+Jv5XN
	 Mgst1Q4SmpNKoSWEXKtc8/hRAj0dMGOeNBk/KrEiucNn4rtNmQQ7GjAM6qaImyVqPv
	 Dya6TEZXndM3xKMHNu8IR882ld6nLF8PPvm4boNjq2h+8BMQgWbgIZbtM4z+XpuuiJ
	 L6hXbD9wmCqC9P96eFIPlo6fGMa1KcDO0Fz5vomp2wMR5DUqRzUZ935tlbq9pNAOGL
	 /Hx1S8ZkIKuX1gL8rORIZGqqCjNBx0t4cCnzLKa220g/4mMwkdSR8omQSrtpuIX65X
	 c2oGXTxiVyDdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC112616D5;
	Wed, 29 Apr 2026 20:01:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E781818E
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDCAF40AB2
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 64gnSz5HvMwq for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 20:00:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA47E425FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA47E425FF
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:00:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5116F83B4F; Wed, 29 Apr 2026 20:00:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 29 Apr 2026 21:54:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c33cdc2ca9cc85dddd6eea62eac4fca858b9e93e
X-Git-Newrev: f7bf9b2ba46e87f74218a8bdaa329bf972e194a5
X-Patchwork-Hint: ignore
Message-Id: <20260429200059.5116F83B4F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ed: bump to version 1.22.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f7bf9b2ba46e87f74218a8bdaa329bf972e194a5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changes in 1.22.5 (released 2026-02-06):
- Fix sizeof usage in set_active_node: Use 'sizeof active_list[0]'
  instead of 'sizeof (line_node **)'
- Improve error message: Change "Is a directory" to "Invalid filename"
  in may_access_filename function

Changes in 1.22.4 (released 2026-01-03):
- Skip check of ISO-8859-1 names on UTF-8-only systems in test suite

https://lists.gnu.org/archive/html/bug-ed/2026-02/msg00000.html

Tested Using:
- utils/test-pkg -a -p ed

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ed/ed.hash | 4 ++--
 package/ed/ed.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ed/ed.hash b/package/ed/ed.hash
index 605c4854f7..39a6ff5f22 100644
--- a/package/ed/ed.hash
+++ b/package/ed/ed.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/bug-ed/2025-12/msg00000.html
-sha256  47a55ddfc52d4a1ff6f7559fbd00cf948a16b6cf151ec520392761aeae4e97be  ed-1.22.3.tar.lz
+# From https://lists.gnu.org/archive/html/bug-ed/2026-02/msg00000.html
+sha256  56e107ddc2f29dad6690376c15bf9751509e1ee3b8241710e44edbe5c3a158cc  ed-1.22.5.tar.lz
 # Locally calculated
 sha256  022e9c2e9cc1aac3622313df6f971fbb39c1d1b0cb45324c16b8a1fe231c5ea6  COPYING
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 3042b3c370..6e1d5a3d05 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ED_VERSION = 1.22.3
+ED_VERSION = 1.22.5
 ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_SOURCE = ed-$(ED_VERSION).tar.lz
 ED_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
