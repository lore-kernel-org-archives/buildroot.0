Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE5CC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 13:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBA3D822AE;
	Sat,  4 Nov 2023 13:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBA3D822AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Jo5ojXQ52Ra; Sat,  4 Nov 2023 13:55:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0181B822AC;
	Sat,  4 Nov 2023 13:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0181B822AC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C8F51BF30C
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 13:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5198882280
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 13:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5198882280
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RQ3N1xPeaCbI for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 13:55:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5835D82264
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 13:55:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5835D82264
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 408BE8627E; Sat,  4 Nov 2023 13:55:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 14:43:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ac1a76fcf255a9b8d2ce15514595e02275efc8e
X-Git-Newrev: e1ca2601cab69052c0f49936b403b57586953280
X-Patchwork-Hint: ignore
Message-Id: <20231104135546.408BE8627E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgsm: bump to version 1.0.22
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e1ca2601cab69052c0f49936b403b57586953280
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Refresh patch

Thu Aug  4 18:47:10 2022	Jutta Degener (jutta@pobox.com)

	* Release 1.0 Patchlevel 22
	Remove unused, and occasionally out of date, VERSION variable
	from Makefile.

Sun Jul 31 16:17:59 2022	Jutta Degener (jutta@pobox.com)

	* Release 1.0 Patchlevel 21
	Use $(LN), not ln, in the Makefile rules for the installed binary
 	of untoast and tcat.
	(Thanks to Carlo Cabrera for pointing that out!)

Mon Jul  4 10:34:18 2022

	* Release 1.0 Patchlevel 20
	Use $(RMFLAGS) with the rms in the Makefile; add -f to $(RMFLAGS) to
        avoid spurious error messages during build.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../libgsm/0001-misc-fixes-from-archlinux.patch    | 82 ++--------------------
 package/libgsm/libgsm.hash                         |  2 +-
 package/libgsm/libgsm.mk                           |  2 +-
 3 files changed, 6 insertions(+), 80 deletions(-)

diff --git a/package/libgsm/0001-misc-fixes-from-archlinux.patch b/package/libgsm/0001-misc-fixes-from-archlinux.patch
index 86f4d42b66..11c529b509 100644
--- a/package/libgsm/0001-misc-fixes-from-archlinux.patch
+++ b/package/libgsm/0001-misc-fixes-from-archlinux.patch
@@ -9,6 +9,8 @@ Patch from:
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Refresh for 1.0.17
+[Fabrice: refresh for 1.0.22]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  Makefile | 84 ++++++++++++++++++++++++++++++++--------------------------------
  1 file changed, 42 insertions(+), 42 deletions(-)
@@ -26,7 +28,7 @@ index d5c0c90..ef61bd5 100644
  
  LD 		= $(CC)
  
-@@ -96,11 +96,11 @@ TOAST_INSTALL_MAN = $(TOAST_INSTALL_ROOT)/man/man1
+@@ -96,7 +96,7 @@ TOAST_INSTALL_MAN = $(TOAST_INSTALL_ROOT)/man/man1
  #  Other tools
  
  SHELL		= /bin/sh
@@ -34,12 +36,7 @@ index d5c0c90..ef61bd5 100644
 +LN		= ln -s -f
  BASENAME 	= basename
  AR		= ar
- ARFLAGS		= cr
--RMFLAGS		=
-+RMFLAGS		= -f
- FIND		= find
- COMPRESS 	= compress
- COMPRESSFLAGS 	= 
+ ARFLAGS	= cr
 @@ -139,7 +139,7 @@ LFLAGS	= $(LDFLAGS) $(LDINC)
  
  # Targets
@@ -100,77 +97,6 @@ index d5c0c90..ef61bd5 100644
  
  
  # The local bin and lib directories
-@@ -351,53 +350,54 @@ toastuninstall:
- 		fi
- 
- $(TOAST_INSTALL_BIN)/toast:	$(TOAST)
--		-rm $@
-+		-rm $(RMFLAGS) $@
- 		cp $(TOAST) $@
- 		chmod 755 $@
- 
- $(TOAST_INSTALL_BIN)/untoast:	$(TOAST_INSTALL_BIN)/toast
--		-rm $@
--		ln $? $@
-+		-rm $(RMFLAGS) $@
-+		$(LN) toast $@
- 
- $(TOAST_INSTALL_BIN)/tcat:	$(TOAST_INSTALL_BIN)/toast
--		-rm $@
--		ln $? $@
-+		-rm $(RMFLAGS) $@
-+		$(LN) toast $@
- 
- $(TOAST_INSTALL_MAN)/toast.1:	$(MAN)/toast.1
--		-rm $@
-+		-rm $(RMFLAGS) $@
- 		cp $? $@
- 		chmod 444 $@
- 
- $(GSM_INSTALL_MAN)/gsm.3:	$(MAN)/gsm.3
--		-rm $@
-+		-rm $(RMFLAGS) $@
- 		cp $? $@
- 		chmod 444 $@
- 
- $(GSM_INSTALL_MAN)/gsm_option.3:	$(MAN)/gsm_option.3
--		-rm $@
-+		-rm $(RMFLAGS) $@
- 		cp $? $@
- 		chmod 444 $@
- 
- $(GSM_INSTALL_MAN)/gsm_explode.3:	$(MAN)/gsm_explode.3
--		-rm $@
-+		-rm $(RMFLAGS) $@
- 		cp $? $@
- 		chmod 444 $@
- 
- $(GSM_INSTALL_MAN)/gsm_print.3:	$(MAN)/gsm_print.3
--		-rm $@
-+		-rm $(RMFLAGS) $@
- 		cp $? $@
- 		chmod 444 $@
- 
- $(GSM_INSTALL_INC)/gsm.h:	$(INC)/gsm.h
--		-rm $@
--		cp $? $@
--		chmod 444 $@
--
--$(GSM_INSTALL_LIB)/libgsm.a:	$(LIBGSM)
--		-rm $@
-+		-rm $(RMFLAGS) $@
- 		cp $? $@
- 		chmod 444 $@
- 
-+$(GSM_INSTALL_LIB)/libgsm.so:	$(LIBGSMSO)
-+		-rm $(RMFLAGS) $@ $@.1 $@.1.0.13
-+		cp $?.1.0.13 $@.1.0.13
-+		chmod 755 $@.1.0.13
-+		$(LN) libgsm.so.1.0.13 $@
-+		$(LN) libgsm.so.1.0.13 $@.1
- 
- # Distribution
- 
 @@ -425,7 +425,7 @@ semi-clean:
  			-print | xargs rm $(RMFLAGS)
  
diff --git a/package/libgsm/libgsm.hash b/package/libgsm/libgsm.hash
index 88d2573f56..b3a4702152 100644
--- a/package/libgsm/libgsm.hash
+++ b/package/libgsm/libgsm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4903652f68a8c04d0041f0d19b1eb713ddcd2aa011c5e595b3b8bca2755270f6  gsm-1.0.19.tar.gz
+sha256  f0072e91f6bb85a878b2f6dbf4a0b7c850c4deb8049d554c65340b3bf69df0ac  gsm-1.0.22.tar.gz
 sha256  81c68a3374937ed9b5e4929c709e81a2c4b35b5d1f450ecf8c473e2daea46ff6  COPYRIGHT
diff --git a/package/libgsm/libgsm.mk b/package/libgsm/libgsm.mk
index e3ebee4b11..1c7b860ece 100644
--- a/package/libgsm/libgsm.mk
+++ b/package/libgsm/libgsm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGSM_VERSION = 1.0.19
+LIBGSM_VERSION = 1.0.22
 LIBGSM_SOURCE = gsm-$(LIBGSM_VERSION).tar.gz
 LIBGSM_SITE = http://www.quut.com/gsm
 LIBGSM_LICENSE = gsm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
