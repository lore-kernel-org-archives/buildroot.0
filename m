Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2EFC3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCFF782070;
	Tue,  2 Jul 2024 07:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q9Y6xlcb2uiB; Tue,  2 Jul 2024 07:48:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3484582077
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3484582077;
	Tue,  2 Jul 2024 07:48:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 074DF1BF365
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3CCC81415
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:48:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eXnruECFojCi for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:48:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB1488122B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB1488122B
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:48:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4A4A83A7D; Tue,  2 Jul 2024 07:48:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jul 2024 09:06:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f33b2227416ccefe7aff4f612644cd932af1f110
X-Git-Newrev: d47ae17adfca2f07a6a575d84e1137d87afd961c
X-Patchwork-Hint: ignore
Message-Id: <20240702074809.D4A4A83A7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gpm: update the patches to be
 applied with fuzz 0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d47ae17adfca2f07a6a575d84e1137d87afd961c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, gpm fails to build with output:

    Applying 0003-src-Makefile.in-Really-install-unversioned-solibrary.patch using patch:
    patching file src/Makefile.in
    Hunk #1 FAILED at 115.
    1 out of 1 hunk FAILED -- saving rejects to file src/Makefile.in.rej

This commit refreshes the package patch on the current package version.

While we're at it, change to use a proper Upstream: tag and remove from
.checkpackageignore.

Fixes: 8f88a644ed7d6c9ea55fd4fbe9d7f37055920016
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore                                          |  1 -
 ...rc-Makefile.in-Really-install-unversioned-solibrary.patch | 12 +++++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 949b7467cf..8fc0f4e798 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -694,7 +694,6 @@ package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch lib_patch.
 package/gobject-introspection/0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch lib_patch.Upstream
 package/gpm/0001-Added-musl-support-to-libgpm-and-the-daemon.patch lib_patch.Upstream
 package/gpm/0002-Install-unversioned-solibrary.patch lib_patch.Upstream
-package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch lib_patch.Upstream
 package/gpm/0004-Use-sigemptyset-API-instead-of-__sigemptyset.patch lib_patch.Upstream
 package/gpm/0005-fix-building-w-newer-glibc.patch lib_patch.Upstream
 package/gpm/0006-src-headers-daemon.h-avoid-redefinition-of-last_sele.patch lib_patch.Upstream
diff --git a/package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch b/package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch
index 2591801976..3806fe7e89 100644
--- a/package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch
+++ b/package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch
@@ -1,4 +1,4 @@
-From 445be05fba32c512fd87a0c98b4e9936629ef95e Mon Sep 17 00:00:00 2001
+From 5b83edaa20f6ecf97d16e323be1ed555d8fa2c01 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Sat, 20 Feb 2016 17:59:52 +0100
 Subject: [PATCH] src/Makefile.in: Really install unversioned solibrary
@@ -7,25 +7,27 @@ This commit is a follow-up to
 https://github.com/telmich/gpm/commit/06b00d53d8bd513ad5d262dc94a016c6fbf2d3aa
 which created libgpm.so but failed to include it in the install target.
 
-Patch sent upstream: https://github.com/telmich/gpm/pull/11
+Upstream: https://github.com/telmich/gpm/pull/11
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  src/Makefile.in | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/Makefile.in b/src/Makefile.in
-index 7e9e2ef..bca226f 100644
+index b63e4f4489bd..a1838c300312 100644
 --- a/src/Makefile.in
 +++ b/src/Makefile.in
 @@ -115,6 +115,7 @@ install:	check
  	if test "x@SHLIB@" != "x" ; then \
- 		$(INSTALL_DATA) -m 755 lib/libgpm.so.@abi_full@ $(libdir)/libgpm.so.@abi_full@	;	\
+ 		$(INSTALL_DATA) -m 644 lib/libgpm.so.@abi_full@ $(libdir)/libgpm.so.@abi_full@	;	\
  		cd $(libdir) && $(LN_S) -f libgpm.so.@abi_full@ libgpm.so.@abi_lev@ 					;	\
 +		cd $(libdir) && $(LN_S) -f libgpm.so.@abi_full@ libgpm.so 					;	\
        echo "WARNING: We installed a lib, you should now call ldconfig" 						; 	\
        echo "f.i.: ldconfig -n -l $(libdir)/libgpm.so.@abi_full@" 								;	\
        echo "Or to update everything just type ldconfig"											;	\
 -- 
-2.7.0
+2.43.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
