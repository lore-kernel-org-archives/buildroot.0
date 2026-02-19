Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC81DE9A055
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 740E381315;
	Thu, 19 Feb 2026 17:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wiZPQ4UCgEg6; Thu, 19 Feb 2026 17:24:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9648081432
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521887;
	bh=ntVW1IdrBHdxYrhi+eacve1VO1n5288pPZrEP7v3pc0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pxEHZiX4gzgaqfcMcXM+LFJnmskkLH+8QPpqWGBshCMbrU0yRyIIAfi8i8J9HGynn
	 Dq6E1jkT82LCuHwMcEO+5CSZgdPEbSEMHY1P/cHR57BcsLsWQ1AiDgypWn7w5vnjYf
	 3fhIAuOgfwapn3bGfHSFvXov45zCqiU4QhXiF8ilNVjYD0bVQXa+Qe/Bvt4htCIGTA
	 UiIruVw6O4FJtcB5hlC7xTozp9UCxNxWfCAujIQXt4i6QxeJSwrD58aNtKbpDrzkAd
	 jpwtgPxHrhgVVEmB8g+gSv7k/tljtgZUosr4pXN/flJv5+NSmMP3OYb+2zujpyRc92
	 MGwTOl2q3GlAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9648081432;
	Thu, 19 Feb 2026 17:24:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8346E1CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7940540CFB
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUwRFbv4bX97 for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7663D40D04
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7663D40D04
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7460384046; Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 19 Feb 2026 10:17:53 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: dfd467c970ad59b580f6fab8474a3dfc75575484
X-Git-Newrev: b84518c52c58149e9ca082f58e355264cca54ce3
X-Patchwork-Hint: ignore
Message-Id: <20260219172414.7460384046@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/vim: bump package
 to version 9.1.1989
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b84518c52c58149e9ca082f58e355264cca54ce3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Changelog:
https://github.com/vim/vim/compare/v9.1.1684...v9.1.1989

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a7f1ab80cd65616f437ed12b700a4bc2a32e50c8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index ae909aaeac..95c44234fe 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  4fe4cb284007e26255267338dde1ceac6f8326f78123ae8c96a36ee15a1ea7ba  vim-9.1.1684.tar.gz
+sha256  e150b40bcf593c10afb39378f2594203d94e5d6110ffe242a0b6bedd258d757f  vim-9.1.1989.tar.gz
 sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
 sha256  ee1d0885bbc4a95a24e49873a075391bdf26b69d13758e30f3d9271f8f42bd2d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 852d5ed959..41b290ab9f 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.1.1684
+VIM_VERSION = 9.1.1989
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
