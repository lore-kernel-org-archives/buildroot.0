Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC5DCCF9E8
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 17:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E5F78436C;
	Wed, 25 Sep 2024 17:38:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ooXkADc8HRQp; Wed, 25 Sep 2024 17:38:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB48C8450D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB48C8450D;
	Wed, 25 Sep 2024 17:38:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F3AB11BF97D
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 17:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2EAA611C9
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 17:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t3a51WaMa-KS for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 17:38:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDF7660B1A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDF7660B1A
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 17:38:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5082844B3; Wed, 25 Sep 2024 17:38:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 25 Sep 2024 19:33:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a5cef5339bd26f9d161d080d352d4adfe7627434
X-Git-Newrev: 1f6075c6346caed8afc4c9264b55bbe7b317f78e
X-Patchwork-Hint: ignore
Message-Id: <20240925173814.E5082844B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gawk: bump to version 5.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f6075c6346caed8afc4c9264b55bbe7b317f78e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gawk/Config.in | 2 +-
 package/gawk/gawk.hash | 4 ++--
 package/gawk/gawk.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gawk/Config.in b/package/gawk/Config.in
index e9cf4c5ff7..86eba0b7b4 100644
--- a/package/gawk/Config.in
+++ b/package/gawk/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_GAWK
 	  rather than procedural. Allows for simple data-reformatting
 	  jobs with just a few lines of code.
 
-	  http://www.gnu.org/software/gawk/
+	  https://www.gnu.org/software/gawk/
 
 comment "gawk needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
diff --git a/package/gawk/gawk.hash b/package/gawk/gawk.hash
index 3ff0a90030..b029ab330d 100644
--- a/package/gawk/gawk.hash
+++ b/package/gawk/gawk.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/gawk/gawk-5.3.0.tar.xz.sig
+# https://ftp.gnu.org/gnu/gawk/gawk-5.3.1.tar.xz.sig
 # Primary key fingerprint: D196 7C63 7887 1317 7D86  1ED7 DF59 7815 937E C0D2
-sha256  ca9c16d3d11d0ff8c69d79dc0b47267e1329a69b39b799895604ed447d3ca90b  gawk-5.3.0.tar.xz
+sha256  694db764812a6236423d4ff40ceb7b6c4c441301b72ad502bb5c27e00cd56f78  gawk-5.3.1.tar.xz
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index ff1b9920af..fbb620be7d 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GAWK_VERSION = 5.3.0
+GAWK_VERSION = 5.3.1
 GAWK_SOURCE = gawk-$(GAWK_VERSION).tar.xz
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
