Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F394C52D6F
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 22:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F5FA608A0;
	Tue,  6 Aug 2024 22:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ldNd5XVULlEC; Tue,  6 Aug 2024 22:45:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C4C9606F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C4C9606F1;
	Tue,  6 Aug 2024 22:45:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 986761BF302
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85DDE40457
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sXBfEIT_nKBw for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 22:45:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D59840343
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D59840343
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 22:45:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9437684341; Tue,  6 Aug 2024 22:45:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 00:12:04 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 50b13c9f865ab820cb6166a220f4eb524bdf5125
X-Git-Newrev: 9a118c766437a2419fdc267fcf871d18369eb4fa
X-Patchwork-Hint: ignore
Message-Id: <20240806224505.9437684341@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/gpm: update the
 patches to be applied with fuzz 0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a118c766437a2419fdc267fcf871d18369eb4fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

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
(cherry picked from commit d47ae17adfca2f07a6a575d84e1137d87afd961c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                          |  1 -
 ...rc-Makefile.in-Really-install-unversioned-solibrary.patch | 12 +++++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 1faaba7431..9eba20f24e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -699,7 +699,6 @@ package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch lib_patch.
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
