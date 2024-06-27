Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C4FC3064D
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 15:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B788416B4;
	Thu, 27 Jun 2024 15:45:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OS81r0KWZxbF; Thu, 27 Jun 2024 15:45:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14B46416B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14B46416B6;
	Thu, 27 Jun 2024 15:45:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AAFEA1BF3CE
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 15:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A31DF84168
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 15:45:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ANwPzrUM_a1 for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 15:45:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCF9084167
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCF9084167
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 15:45:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9A5A8353A; Thu, 27 Jun 2024 15:45:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 17:36:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a6fabd961058a77622a725e7d58ac3ffb05ce5b6
X-Git-Newrev: 15e5c5109a01e8c1a5130ed758db938ccda2d14c
X-Patchwork-Hint: ignore
Message-Id: <20240627154530.B9A5A8353A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgsm: update patches to be
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=15e5c5109a01e8c1a5130ed758db938ccda2d14c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0" reduced the fuzz factor.

Due to this change, libgsm fails to build with output:

    Applying 0001-misc-fixes-from-archlinux.patch using patch:
    patching file Makefile
    Hunk #2 FAILED at 96.
    Hunk #7 FAILED at 424.
    2 out of 8 hunks FAILED -- saving rejects to file Makefile.rej

This commit refreshes the package patch on the current package version.

Fixes:
- http://autobuild.buildroot.org/results/b27/b271ade6069fd25c1877e1e74648d92e88c459c4

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                 |  2 +-
 ...x.patch => 0001-Misc-fixes-from-Archlinux.patch} | 21 ++++++++++++---------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b28846cd55..313201b0e6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -834,7 +834,7 @@ package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch lib_pat
 package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch lib_patch.Upstream
 package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch lib_patch.Upstream
 package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch lib_patch.Upstream
-package/libgsm/0001-misc-fixes-from-archlinux.patch lib_patch.Upstream
+package/libgsm/0001-Misc-fixes-from-Archlinux.patch lib_patch.Upstream
 package/libgtk2/0001-reduce-dependencies.patch lib_patch.Upstream
 package/libgtk3/0001-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch lib_patch.Upstream
 package/libhdhomerun/0001-dont-strip.patch lib_patch.Upstream
diff --git a/package/libgsm/0001-misc-fixes-from-archlinux.patch b/package/libgsm/0001-Misc-fixes-from-Archlinux.patch
similarity index 88%
rename from package/libgsm/0001-misc-fixes-from-archlinux.patch
rename to package/libgsm/0001-Misc-fixes-from-Archlinux.patch
index 11c529b509..6702a920af 100644
--- a/package/libgsm/0001-misc-fixes-from-archlinux.patch
+++ b/package/libgsm/0001-Misc-fixes-from-Archlinux.patch
@@ -1,4 +1,4 @@
-From e8f43832d401ad1e071e6860b2bf4a1e796d4356 Mon Sep 17 00:00:00 2001
+From ef88ee98855008cd8c8de807a12917a556e2ce7d Mon Sep 17 00:00:00 2001
 From: Adam Duskett <aduskett@gmail.com>
 Date: Fri, 28 Jul 2017 08:18:22 -0400
 Subject: [PATCH] Misc fixes from Archlinux
@@ -11,12 +11,15 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Refresh for 1.0.17
 [Fabrice: refresh for 1.0.22]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+[Julien: regenerate with git format-patch for 1.0.22,
+as Fabrice refresh is incomplete for applying with fuzz 0]
 ---
- Makefile | 84 ++++++++++++++++++++++++++++++++--------------------------------
- 1 file changed, 42 insertions(+), 42 deletions(-)
+ Makefile | 49 ++++++++++++++++++++++++-------------------------
+ 1 file changed, 24 insertions(+), 25 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index d5c0c90..ef61bd5 100644
+index 2ad5e5d..2cb0b06 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -44,7 +44,7 @@ WAV49	= -DWAV49
@@ -36,7 +39,7 @@ index d5c0c90..ef61bd5 100644
 +LN		= ln -s -f
  BASENAME 	= basename
  AR		= ar
- ARFLAGS	= cr
+ ARFLAGS		= cr
 @@ -139,7 +139,7 @@ LFLAGS	= $(LDFLAGS) $(LDINC)
  
  # Targets
@@ -97,16 +100,16 @@ index d5c0c90..ef61bd5 100644
  
  
  # The local bin and lib directories
-@@ -425,7 +425,7 @@ semi-clean:
+@@ -425,7 +424,7 @@ semi-clean:
  			-print | xargs rm $(RMFLAGS)
  
  clean:	semi-clean
 -		-rm $(RMFLAGS) $(LIBGSM) $(ADDTST)/add		\
 +		-rm $(RMFLAGS) $(LIBGSMSO)* $(ADDTST)/add		\
  			$(TOAST) $(TCAT) $(UNTOAST)	\
- 			$(ROOT)/gsm-1.0.tar.Z
+ 			$(ROOT)/gsm-1.0.tar.gz
  
-@@ -473,22 +473,22 @@ $(ADDTST)/add:	$(ADDTST)/add_test.o
+@@ -473,22 +472,22 @@ $(ADDTST)/add:	$(ADDTST)/add_test.o
  $(TST)/test-result:	$(TST)/lin2cod $(TST)/cod2lin $(TOAST) $(TST)/run
  			( cd $(TST); ./run ) 
  
@@ -140,5 +143,5 @@ index d5c0c90..ef61bd5 100644
 -				$(TST)/cod2lin.o $(LIBGSM) $(LDLIB)
 +				$(TST)/cod2lin.o $(LIBGSMSO) $(LDLIB)
 -- 
-2.13.3
+2.45.2
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
