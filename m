Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C520CAC5A2
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 21:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D20E614DA;
	Tue, 17 Sep 2024 21:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0_Cv1AU755nS; Tue, 17 Sep 2024 21:09:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D6F761520
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D6F761520;
	Tue, 17 Sep 2024 21:09:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 146341BF5E6
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2998F60616
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kq8bPE9178SS for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 21:09:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B46FF6113E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B46FF6113E
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 21:09:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD3F182138; Tue, 17 Sep 2024 21:09:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 23:06:02 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 1c63395ec815d82d66f8146d6fff25c6211ca152
X-Git-Newrev: d1ee111aa4909c7c3b9fc98fdbccca339a056293
X-Patchwork-Hint: ignore
Message-Id: <20240917210908.AD3F182138@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/asterisk: update
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1ee111aa4909c7c3b9fc98fdbccca339a056293
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0" reduced the fuzz factor.

Due to this change, asterisk fails to build with output:

    Applying 0004-install-samples-need-the-data-files.patch using patch:
    patching file Makefile
    Hunk #1 FAILED at 779.
    1 out of 1 hunk FAILED -- saving rejects to file Makefile.rej

This commit rebase the package patches on the current package version.
Note: the patch 0005 is unchanged, as it is correct in its current
state.

Fixes:
- http://autobuild.buildroot.org/results/92d/92d58ecb67f11a6eb74695bc1efcc672f69a57a9

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a6fabd961058a77622a725e7d58ac3ffb05ce5b6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-sounds-do-not-download-and-check-sha1s.patch       | 10 ++++++----
 .../asterisk/0002-configure-fix-detection-of-libcrypt.patch | 13 +++++++------
 ...3-build-ensure-target-directory-for-modules-exists.patch | 10 ++++++----
 .../asterisk/0004-install-samples-need-the-data-files.patch | 12 +++++++-----
 4 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/package/asterisk/0001-sounds-do-not-download-and-check-sha1s.patch b/package/asterisk/0001-sounds-do-not-download-and-check-sha1s.patch
index 8412843d13..ce0bf2d330 100644
--- a/package/asterisk/0001-sounds-do-not-download-and-check-sha1s.patch
+++ b/package/asterisk/0001-sounds-do-not-download-and-check-sha1s.patch
@@ -1,4 +1,4 @@
-From 3e8a9e9a1c7eae515eb628778c3c8a04338b3bb3 Mon Sep 17 00:00:00 2001
+From 63f685e468bef94d8938b7a9c1a18c6c00840219 Mon Sep 17 00:00:00 2001
 From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Date: Tue, 27 Dec 2016 11:21:09 +0100
 Subject: [PATCH] sounds: do not download and check sha1s
@@ -20,16 +20,18 @@ However, that poses at least two problems:
 
 So we just do without the sha1 download and checks.
 
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+[Julien: rebase patch on tag 20.7.0]
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 ---
  sounds/Makefile | 10 ----------
  1 file changed, 10 deletions(-)
 
 diff --git a/sounds/Makefile b/sounds/Makefile
-index 84d0f45..7a80d56 100644
+index 288b8139a9..260434e504 100644
 --- a/sounds/Makefile
 +++ b/sounds/Makefile
-@@ -100,17 +100,7 @@ ifneq ($(SOUNDS_CACHE_DIR),)
+@@ -101,17 +101,7 @@ ifneq ($(SOUNDS_CACHE_DIR),)
  	  if test ! -f "$$(SOUNDS_CACHE_DIR)/$$@"; then \
  	    (cd "$$(SOUNDS_CACHE_DIR)"; $$(DOWNLOAD) $$(SOUNDS_URL)/$$@); \
  	  fi; \
@@ -48,5 +50,5 @@ index 84d0f45..7a80d56 100644
  else
  	$(CMD_PREFIX) \
 -- 
-2.7.4
+2.45.2
 
diff --git a/package/asterisk/0002-configure-fix-detection-of-libcrypt.patch b/package/asterisk/0002-configure-fix-detection-of-libcrypt.patch
index d82f5084ef..7a0de603e4 100644
--- a/package/asterisk/0002-configure-fix-detection-of-libcrypt.patch
+++ b/package/asterisk/0002-configure-fix-detection-of-libcrypt.patch
@@ -1,4 +1,4 @@
-From 8996503f6c55e55f326ab11c18278954ad7abaf3 Mon Sep 17 00:00:00 2001
+From e959097b00357a2fd5f140daf3114c2245cd6b95 Mon Sep 17 00:00:00 2001
 From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Date: Tue, 27 Dec 2016 11:21:57 +0100
 Subject: [PATCH] configure: fix detection of libcrypt
@@ -15,17 +15,18 @@ and thus concludes that crypt is missing when it was successfully found.
 Fix that by also storing the result of either check in the 'CRYPT'
 scheme.
 
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+[Julien: rebase patch on tag 20.7.0]
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 ---
- configure    | 2 ++
  configure.ac | 2 ++
- 2 files changed, 4 insertions(+)
+ 1 file changed, 2 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 121dd93..d459ff5 100644
+index 639bcd9df3..16f4297634 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2406,10 +2406,12 @@ AC_CHECK_FUNC([crypt], [SYSCRYPT=true], [SYSCRYPT=""])
+@@ -2694,10 +2694,12 @@ AC_CHECK_FUNC([crypt], [SYSCRYPT=true], [SYSCRYPT=""])
  if test "x$LIBCRYPT_LIB" != "x" ; then
      CRYPT_LIB="$LIBCRYPT_LIB"
      CRYPT_INCLUDE="$LIBCRYPT_INCLUDE"
@@ -39,5 +40,5 @@ index 121dd93..d459ff5 100644
  fi
  
 -- 
-2.7.4
+2.45.2
 
diff --git a/package/asterisk/0003-build-ensure-target-directory-for-modules-exists.patch b/package/asterisk/0003-build-ensure-target-directory-for-modules-exists.patch
index 20cfc93892..3080ef991b 100644
--- a/package/asterisk/0003-build-ensure-target-directory-for-modules-exists.patch
+++ b/package/asterisk/0003-build-ensure-target-directory-for-modules-exists.patch
@@ -1,4 +1,4 @@
-From 933b2554a40f932571bdbdbb5217cda3e35fd61f Mon Sep 17 00:00:00 2001
+From 93edc41d3ae60e6ee9b9bbb7cdcc592133521fa3 Mon Sep 17 00:00:00 2001
 From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Date: Mon, 27 Nov 2017 12:52:52 +0100
 Subject: [PATCH] build: ensure target directory for modules exists
@@ -9,16 +9,18 @@ modules fails because the target directory does not exist yet.
 We fix that by instructing $(INSTALL) to create the destination directory
 first.
 
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+[Julien: rebase patch on tag 20.7.0]
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 ---
  Makefile.moddir_rules | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.moddir_rules b/Makefile.moddir_rules
-index 59190bece9..b73153a9a5 100644
+index 795b32c716..7d5e5d241a 100644
 --- a/Makefile.moddir_rules
 +++ b/Makefile.moddir_rules
-@@ -110,7 +110,7 @@ clean::
+@@ -106,7 +106,7 @@ clean::
  
  install:: all
  	@echo "Installing modules from `basename $(CURDIR)`..."
@@ -28,5 +30,5 @@ index 59190bece9..b73153a9a5 100644
  	@if [ -f .moduleinfo ] ; then \
  		declare -A DISABLED_MODS ;\
 -- 
-2.11.0
+2.45.2
 
diff --git a/package/asterisk/0004-install-samples-need-the-data-files.patch b/package/asterisk/0004-install-samples-need-the-data-files.patch
index a9560e82e0..d863f63709 100644
--- a/package/asterisk/0004-install-samples-need-the-data-files.patch
+++ b/package/asterisk/0004-install-samples-need-the-data-files.patch
@@ -1,4 +1,4 @@
-From 05680ea9899c2246c23d11860c2c8e10aa8f80c7 Mon Sep 17 00:00:00 2001
+From d347deb0376a3254d7cd8bbfe46dd645d1bf1061 Mon Sep 17 00:00:00 2001
 From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Date: Fri, 1 Dec 2017 11:08:16 +0100
 Subject: [PATCH] install: samples need the data files
@@ -12,24 +12,26 @@ installed at the time we try to generate the voicemail data.
 
 Ensure the needed dependency.
 
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+[Julien: rebase patch on tag 20.7.0]
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index f29c07f680..b58f707b61 100644
+index 7ef73342cc..bb60f5e380 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -779,7 +779,7 @@ adsi:
+@@ -819,7 +819,7 @@ adsi:
  		$(INSTALL) -m 644 "$$x" "$(DESTDIR)$(ASTETCDIR)/`$(BASENAME) $$x`" ; \
  	done
  
 -samples: adsi
 +samples: adsi datafiles
  	@echo Installing other config files...
- 	$(call INSTALL_CONFIGS,samples,.sample)
+ 	$(call INSTALL_CONFIGS,configs/samples,.sample)
  	$(INSTALL) -d "$(DESTDIR)$(ASTSPOOLDIR)/voicemail/default/1234/INBOX"
 -- 
-2.11.0
+2.45.2
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
