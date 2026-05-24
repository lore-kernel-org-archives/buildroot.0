Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3907CD5BB1
	for <buildroot@archiver.kernel.org>; Sun, 24 May 2026 11:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 540C4411B3;
	Sun, 24 May 2026 11:16:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gE_ng1wbPIj1; Sun, 24 May 2026 11:16:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C6DE411BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779621412;
	bh=+tpxdlzgVIHC1lJ+5pu1GT4lWQKcv1dsPzvpg492Kn0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HjPF1PldBTs7djR5Fx/lsjD0s/kw8SOy06ZeuNrfqw/SFRIJpRE2U325QxqUVI1at
	 izd8JXmgI0zTZf5jlg/544BHJa/C4iSCnvXvTHLcGALEif5VL44zmX6HOztLWVzuCu
	 cL3Eh4uboYHyhGV/SG6Jaf2zFxTgfkJ0mi7lQKY6M8N0etxcQKficm2bNiVTHmTtTR
	 SbhYecwe3ZA9b+G6BPN85fae66YR4QYeywCEV6C+REHeh/fOtubtSKD3zQ+AyQkjZV
	 lklHCEY7vX3pM26tqUAvXOL6sbzf4Duf+QjleE/gcB52sb+nIujfGctFKMeAmCTUeb
	 W3j0Cgn07xWNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C6DE411BB;
	Sun, 24 May 2026 11:16:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E8F8263
 for <buildroot@buildroot.org>; Sun, 24 May 2026 11:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0724D403B4
 for <buildroot@buildroot.org>; Sun, 24 May 2026 11:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id su2SvYdQi9_I for <buildroot@buildroot.org>;
 Sun, 24 May 2026 11:16:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D827740384
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D827740384
 for <buildroot@buildroot.org>; Sun, 24 May 2026 11:16:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CDCAD86D5E; Sun, 24 May 2026 11:16:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 May 2026 13:07:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2888204be6be098b5cac562e7f09f4d38da65c14
X-Git-Newrev: 7418ff13895be20ccdd6ad6d460e6dbf73727637
X-Patchwork-Hint: ignore
Message-Id: <20260524111639.CDCAD86D5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/putty: security bump version to
 0.84
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7418ff13895be20ccdd6ad6d460e6dbf73727637
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.tartarus.org/pipermail/putty-announce/2026/000042.html

Updated license hash due to copyright year bump in upstream commit
995b63a82bac4f6985958cb92943e807a9f35736. A link to this commit can not
be provided due to the shutdown of the upstream gitweb interface:
https://git.tartarus.org/?p=simon/putty.git

Switched URLs to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/putty/Config.in  |  2 +-
 package/putty/putty.hash | 10 +++++-----
 package/putty/putty.mk   |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/putty/Config.in b/package/putty/Config.in
index f89283b99a..f0484ec20f 100644
--- a/package/putty/Config.in
+++ b/package/putty/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_PUTTY
 	  and puttygen are built; enable GTK2 or GTK3 for the
 	  graphical client.
 
-	  http://www.chiark.greenend.org.uk/~sgtatham/putty/
+	  https://www.chiark.greenend.org.uk/~sgtatham/putty/
 
 comment "putty needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
diff --git a/package/putty/putty.hash b/package/putty/putty.hash
index 33a9666bc2..362467e2d7 100644
--- a/package/putty/putty.hash
+++ b/package/putty/putty.hash
@@ -1,7 +1,7 @@
-# Hashes from: http://the.earth.li/~sgtatham/putty/0.83/{sha1,sha256,sha512}sums
-sha1  f9fd9ab5e3849bf8c22b218cdb7697dcdd1d8c9e  putty-0.83.tar.gz
-sha256  718777c13d63d0dff91fe03162bc2a05b4dfc8b0827634cd60b51cefdff631c6  putty-0.83.tar.gz
-sha512  4781616b7e9c5a779a54e6a8486513e0aa947d4a36e9dbfd4ffc0d32981a5ad4868cddbde0363467236ed67c43f990408a9326d10354954be716a270d587c0a6  putty-0.83.tar.gz
+# Hashes from: https://the.earth.li/~sgtatham/putty/0.84/{sha1,sha256,sha512}sums
+sha1  d3ed01106667b42de322b266266e0d21b70adf12  putty-0.84.tar.gz
+sha256  06057862ae198f1dbd219d0c7493080d59f606194bb5056c549e342aa01b69fe  putty-0.84.tar.gz
+sha512  647c84490c01f8c0f9cf02f565081d80ea2ea4fb90207cfb2fbe13ba5e8c3cea7c4807504363d3d3a851df5edb6087c3b39084820bf20e818dd551db54af0765  putty-0.84.tar.gz
 
 # Locally calculated
-sha256  c18aac5045fd30bff639b07884be44cb8c68eef16efe8c5e18deda1f58cacdfb  LICENCE
+sha256  3b02f87e0063430289d9681727a98818c844fc8a4d79b24b76047fa061e77f13  LICENCE
diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index 9071fea208..82b16b250c 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PUTTY_VERSION = 0.83
-PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
+PUTTY_VERSION = 0.84
+PUTTY_SITE = https://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
 PUTTY_LICENSE = MIT
 PUTTY_LICENSE_FILES = LICENCE
 PUTTY_CPE_ID_VENDOR = putty
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
