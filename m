Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC74C4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 15:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EDE085166;
	Thu,  2 Nov 2023 15:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EDE085166
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lMC-hGNpJhM1; Thu,  2 Nov 2023 15:52:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D57F85163;
	Thu,  2 Nov 2023 15:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D57F85163
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F1D631BF20D
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 15:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAB914F055
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 15:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAB914F055
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nB_v6om8i8tY for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 15:52:48 +0000 (UTC)
X-Greylist: delayed 2399 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 02 Nov 2023 15:52:48 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E3F94EC28
Received: from 17.mo582.mail-out.ovh.net (17.mo582.mail-out.ovh.net
 [46.105.36.150])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E3F94EC28
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 15:52:48 +0000 (UTC)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.1.232])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 3579128944
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 14:36:11 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-gf2r6 (unknown [10.111.172.140])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C926D1FEAC;
 Thu,  2 Nov 2023 14:36:10 +0000 (UTC)
Received: from etictelecom.com ([37.59.142.110])
 by ghost-submission-6684bf9d7b-gf2r6 with ESMTPSA
 id QXibJdqzQ2W59gAAU7/XOA
 (envelope-from <hmaied.benabdellatif@etictelecom.com>);
 Thu, 02 Nov 2023 14:36:10 +0000
X-OVh-ClientIp: 81.1.9.132
From: hmaied.benabdellatif@etictelecom.com
To: buildroot@buildroot.org
Date: Thu,  2 Nov 2023 15:36:08 +0100
Message-Id: <20231102143608.3231106-1-hmaied.benabdellatif@etictelecom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12959952355145554458
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddtiedgieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhephhhmrghivggurdgsvghnrggsuggvlhhlrghtihhfsegvthhitghtvghlvggtohhmrdgtohhmnecuggftrfgrthhtvghrnhepgeehjeejhffftddtueeghfehtedukeeuhffhtdefjeefvdfgkedvgedugeejvddvnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghuihhlughrohhothdrohhrghdpohhpvghnlhgurghprdhorhhgnecukfhppeduvdejrddtrddtrddupdekuddruddrledrudefvddpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehhmhgrihgvugdrsggvnhgrsgguvghllhgrthhifhesvghtihgtthgvlhgvtghomhdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheekvddpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004c7b1e229-c1d6-46ce-8002-acfba91c3010,
 DB3DD9773B1B5AC5924DFC571EAE0C5A33AF0CD1)
 smtp.auth=hmaied.benabdellatif@etictelecom.com
Subject: [Buildroot] [PATCH 1/1] package/openldap: bump version to 2.5.16
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
Cc: Hmaied Ben Abdellatif <hmaied.benabdellatif@etictelecom.com>,
 David Bender <codehero@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Hmaied Ben Abdellatif <hmaied.benabdellatif@etictelecom.com>

Signed-off-by: Hmaied Ben Abdellatif <hmaied.benabdellatif@etictelecom.com>
---
 ...fix-bignum.patch => 0001-fix-bignum.patch} |  7 +-
 package/openldap/0001-fix_cross_strip.patch   | 74 -------------------
 ...fix-libtool-static-behavior-to-match.patch | 56 --------------
 package/openldap/openldap.hash                |  6 +-
 package/openldap/openldap.mk                  |  2 +-
 5 files changed, 5 insertions(+), 140 deletions(-)
 rename package/openldap/{0002-fix-bignum.patch => 0001-fix-bignum.patch} (84%)
 delete mode 100644 package/openldap/0001-fix_cross_strip.patch
 delete mode 100644 package/openldap/0004-revert-ITS-3977-fix-libtool-static-behavior-to-match.patch

diff --git a/package/openldap/0002-fix-bignum.patch b/package/openldap/0001-fix-bignum.patch
similarity index 84%
rename from package/openldap/0002-fix-bignum.patch
rename to package/openldap/0001-fix-bignum.patch
index 159ea8e228..ec38ee3df0 100644
--- a/package/openldap/0002-fix-bignum.patch
+++ b/package/openldap/0001-fix-bignum.patch
@@ -24,10 +24,9 @@ diff -durN openldap-2.4.40.orig/configure openldap-2.4.40/configure
  		ol_with_mp=bignum
  
  $as_echo "#define USE_MP_BIGNUM 1" >>confdefs.h
-diff -durN openldap-2.4.40.orig/configure.in openldap-2.4.40/configure.in
---- openldap-2.4.40.orig/configure.in	2014-09-19 03:48:49.000000000 +0200
-+++ openldap-2.4.40/configure.in	2015-01-25 18:44:37.628676446 +0100
-@@ -2383,7 +2383,7 @@
+--- openldap-2.5.15.orig/configure.ac	2023-10-23 11:03:46.292215101 +0200
++++ openldap-2.5.16/configure.ac	2023-10-23 11:05:07.245355497 +0200
+@@ -2323,7 +2323,7 @@
  	AC_CHECK_HEADERS(openssl/crypto.h)
  	if test "$ac_cv_header_openssl_bn_h" = "yes" &&
  		test "$ac_cv_header_openssl_crypto_h" = "yes" &&
diff --git a/package/openldap/0001-fix_cross_strip.patch b/package/openldap/0001-fix_cross_strip.patch
deleted file mode 100644
index d9d6f9d505..0000000000
--- a/package/openldap/0001-fix_cross_strip.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-Fix stripping when cross-compiling
-
-Probably-Signed-off-by: Dave Bender <bender@benegon.com>
-[yann.morin.1998@free.fr: patch was made by Dave, but he
- forgot his SoB line, so I added it]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -rupN openldap-2.4.40/build/shtool openldap-2.4.40-br/build/shtool
---- openldap-2.4.40/build/shtool	2014-09-18 21:48:49.000000000 -0400
-+++ openldap-2.4.40-br/build/shtool	2015-01-21 13:21:35.689829372 -0500
-@@ -981,7 +981,7 @@ install )
-             if [ ".$opt_t" = .yes ]; then
-                 echo "strip $dsttmp" 1>&2
-             fi
--            strip $dsttmp || shtool_exit $?
-+            $STRIP $dsttmp || shtool_exit $?
-         fi
-         if [ ".$opt_o" != . ]; then
-             if [ ".$opt_t" = .yes ]; then
-diff -rupN openldap-2.4.40/build/top.mk openldap-2.4.40-br/build/top.mk
---- openldap-2.4.40/build/top.mk	2014-09-18 21:48:49.000000000 -0400
-+++ openldap-2.4.40-br/build/top.mk	2015-01-21 13:23:41.027810097 -0500
-@@ -59,7 +59,7 @@ INSTALL_PROGRAM = $(INSTALL)
- INSTALL_DATA = $(INSTALL) -m 644
- INSTALL_SCRIPT = $(INSTALL)
- 
--STRIP = -s
-+STRIP_OPTS = -s
- 
- LINT = lint
- 5LINT = 5lint
-diff -rupN openldap-2.4.40/clients/tools/Makefile.in openldap-2.4.40-br/clients/tools/Makefile.in
---- openldap-2.4.40/clients/tools/Makefile.in	2014-09-18 21:48:49.000000000 -0400
-+++ openldap-2.4.40-br/clients/tools/Makefile.in	2015-01-21 13:23:35.827727946 -0500
-@@ -120,7 +120,7 @@ install-local:	FORCE
- 	-$(MKDIR) $(DESTDIR)$(bindir)
- 	@(								\
- 	    for prg in $(PROGRAMS); do					\
--		$(LTINSTALL) $(INSTALLFLAGS) $(STRIP) -m 755 $$prg$(EXEEXT)	\
-+		$(LTINSTALL) $(INSTALLFLAGS) $(STRIP_OPTS) -m 755 $$prg$(EXEEXT)	\
- 		    $(DESTDIR)$(bindir);				\
- 	    done							\
- 	)
-diff -rupN openldap-2.4.40/configure.in openldap-2.4.40-br/configure.in
---- openldap-2.4.40/configure.in	2014-09-18 21:48:49.000000000 -0400
-+++ openldap-2.4.40-br/configure.in	2015-01-16 15:50:48.874816786 -0500
-@@ -668,6 +668,15 @@ if test -z "${AR}"; then
- 	fi
- fi
- 
-+if test -z "${STRIP}"; then
-+	AC_CHECK_PROGS(STRIP,strip,missing)
-+
-+	if test "${STRIP}" = "missing" ; then
-+		AC_MSG_ERROR([Unable to locate strip(1) or suitable replacement.  Check PATH or set STRIP.])
-+	fi
-+fi
-+
-+
- AC_LIBTOOL_WIN32_DLL
- AC_LIBTOOL_DLOPEN
- AC_PROG_LIBTOOL
-diff -rupN openldap-2.4.40/servers/slapd/Makefile.in openldap-2.4.40-br/servers/slapd/Makefile.in
---- openldap-2.4.40/servers/slapd/Makefile.in	2015-01-16 15:04:52.507473256 -0500
-+++ openldap-2.4.40-br/servers/slapd/Makefile.in	2015-01-16 15:05:02.299627229 -0500
-@@ -378,7 +378,7 @@ install-local-srv: install-slapd install
- install-slapd: FORCE
- 	-$(MKDIR) $(DESTDIR)$(libexecdir)
- 	-$(MKDIR) $(DESTDIR)$(localstatedir)/run
--	$(LTINSTALL) $(INSTALLFLAGS) $(STRIP) -m 755 \
-+	$(LTINSTALL) $(INSTALLFLAGS) $(STRIP_OPTS) -m 755 \
- 		slapd$(EXEEXT) $(DESTDIR)$(libexecdir)
- 	@for i in $(SUBDIRS); do \
- 	    if test -d $$i && test -f $$i/Makefile ; then \
diff --git a/package/openldap/0004-revert-ITS-3977-fix-libtool-static-behavior-to-match.patch b/package/openldap/0004-revert-ITS-3977-fix-libtool-static-behavior-to-match.patch
deleted file mode 100644
index 3a901c910d..0000000000
--- a/package/openldap/0004-revert-ITS-3977-fix-libtool-static-behavior-to-match.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 88a0442a0f01076914af80db40571fd52914ffa3 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 28 Mar 2019 23:52:38 +0100
-Subject: [PATCH] revert ITS#3977, fix libtool -static behavior to match docs
-
-Revert
-https://github.com/openldap/openldap/commit/7b6a088a2590fdad10286d10050b769e48554e13
-as this patch does not work with our buildroot patches
-
-Fixes:
- - http://autobuild.buildroot.org/results/ab4f85fd21cacfaef6b0b43a38da6a4a1d32ecb6
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: Not upstreamable]
----
- build/ltmain.sh | 9 ++-------
- 1 file changed, 2 insertions(+), 7 deletions(-)
-
-diff --git a/build/ltmain.sh b/build/ltmain.sh
-index 1d079b91e..996dc7dad 100755
---- a/build/ltmain.sh
-+++ b/build/ltmain.sh
-@@ -1190,15 +1190,14 @@ EOF
- 	  if test -n "$link_static_flag"; then
- 	    dlopen_self=$dlopen_self_static
- 	  fi
--	  prefer_static_libs=yes
- 	else
- 	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
- 	    dlopen_self=$dlopen_self_static
- 	  fi
--	  prefer_static_libs=built
- 	fi
- 	build_libtool_libs=no
- 	build_old_libs=yes
-+	prefer_static_libs=yes
- 	break
- 	;;
-       esac
-@@ -2602,12 +2601,8 @@ EOF
- 	fi
- 
- 	link_static=no # Whether the deplib will be linked statically
--	use_static_libs=$prefer_static_libs
--	if test "$use_static_libs" = built && test "$installed" = yes ; then
--	  use_static_libs=no
--	fi
- 	if test -n "$library_names" &&
--	   { test "$use_static_libs" = no || test -z "$old_library"; }; then
-+	   { test "$prefer_static_libs" = no || test -z "$old_library"; }; then
- 	  if test "$installed" = no; then
- 	    notinst_deplibs="$notinst_deplibs $lib"
- 	    need_relink=yes
--- 
-2.14.1
-
diff --git a/package/openldap/openldap.hash b/package/openldap/openldap.hash
index 71092c93d0..5b865d1455 100644
--- a/package/openldap/openldap.hash
+++ b/package/openldap/openldap.hash
@@ -1,7 +1,3 @@
-# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.59.md5
-md5  6036a03b3a67b4a1fe1246e0a2c7265a  openldap-2.4.59.tgz
-# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.59.sha1
-sha1  b154d06bbf40fafafb34fffc4b116946d931efef  openldap-2.4.59.tgz
 # Locally computed
-sha256  99f37d6747d88206c470067eda624d5e48c1011e943ec0ab217bae8712e22f34  openldap-2.4.59.tgz
+sha512  ed0c3732c096807006a13df7484c889ccc6943ced3e50c0d01034e6c6823c0996ae1fda0348677243934fbe8715a467abc46f01dee87b7571f5392b0570eb04a   openldap-2.5.16.tgz
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index b5373544ab..9cebff99dc 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLDAP_VERSION = 2.4.59
+OPENLDAP_VERSION = 2.5.16
 OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
 OPENLDAP_SITE = https://www.openldap.org/software/download/OpenLDAP/openldap-release
 OPENLDAP_LICENSE = OpenLDAP Public License
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
