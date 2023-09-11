Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A82CA0EC0
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 21:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B04CE40922;
	Mon, 11 Sep 2023 21:09:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B04CE40922
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id olUahDLf-xQn; Mon, 11 Sep 2023 21:09:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4432E40971;
	Mon, 11 Sep 2023 21:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4432E40971
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A8951BF32E
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 21:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E57D940272
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 21:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E57D940272
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gnKYFZ24Y9b3 for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 21:09:29 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4530400F2
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 21:09:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4530400F2
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40061928e5aso56325395e9.3
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 14:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694466566; x=1695071366;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9PLgJMmPUd3pX76/FPSEY558olR7zEDg/IvGdt1E0Fg=;
 b=BGHLT7FdACTppip+gQFtRIRjkXTInx4ocuxXZyP3/3nkGIt0KMTm4o1oxwcqSdByCk
 7S3Ci8lcNMTGvRakq6i/3RjzJqWgfSND5wHY65MiXmiQiZTuRbnesYfZ1sGiyFISkmoD
 7bhXp+f8wOgt8nQ9JUiV3W3pDyAvGtFs896YrOwb2ycuErBBIrZ8GNzRDzThjRbDgkVI
 uejvxMvhkeCacUPGfWYqE2FtLrETS0Zq/wVbsjxCQQ7hXS59O2s8cjHAZ0wN58lqEwiQ
 elQj/yZDr+Kz461yZsi7j2vI7xv499qr9qngworO8B9X1pJXS6Cj0dSkjyB3XHOGIzCF
 JWWg==
X-Gm-Message-State: AOJu0Yy8vvIuP4RE7YUCEDQkkofTrbEdm8ByqOjUWZh6Y3JySythto4E
 RJtbz88ZdMeE3jfPqSvnvm9Jszy43No=
X-Google-Smtp-Source: AGHT+IHE9CqrgzALuxeZu1Gy4YPdszVDdmlzqWEe/RnJ/hH+YGRhNOxNFvib7gf0WtjoK6PYdvp+uA==
X-Received: by 2002:a7b:cd17:0:b0:3f6:58ad:ed85 with SMTP id
 f23-20020a7bcd17000000b003f658aded85mr8922880wmj.10.1694466566258; 
 Mon, 11 Sep 2023 14:09:26 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a05600c45cc00b00403b63e87f2sm2430678wmo.32.2023.09.11.14.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 14:09:25 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 23:09:16 +0200
Message-ID: <20230911210917.1114974-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694466566; x=1695071366; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9PLgJMmPUd3pX76/FPSEY558olR7zEDg/IvGdt1E0Fg=;
 b=MAi0JmqHS87faTiDTzQE5Wsu/nrBsjl4AIgTsUcx5F3wukWws2ynQmvgtaAiFDVEtW
 haAuAmkcpaqcpVMGV7H1oKuUPzZwPBVYtdSK4LvraXk38ZOCpT0xKsRcjNylHjAnuej8
 H1q4ySBcgfO0aKhjLEVfll6yqPX5tR89gjjlR73KBLR+XhFoeIdd2w2GzdTHcuhHNBMi
 bWSCVqwTWkp0HNROj56HipqSeCGX6RidfqMdvAS622tp6m9ZEmaEr+WhBsUBVl4zKj/0
 ijjUnSVEojxrDCEvl0vidxQiJDrDO8iUalL+JzxXI1vvsDor2uSAJ9cd3G5UZZURJ9ZB
 DXdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=MAi0JmqH
Subject: [Buildroot] [PATCH 1/2] package/{glibc, localedef}: bump to version
 2.38-13-g92201f16cbcfd9eafe314ef6654be2ea7ba25675
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable mathvec explicitely on aarch64(be) since it's now enabled by
default [1]. aarch64 mathvec requires at gcc-10 but Buildroot already
provide gcc-11 as minimum version.

Don't use --enable-fortify-source for now in order to keep original
behavior while doing the glibc version bump (and because some
architecture doesn't support well fortiry-source, i.e Microblaze).
Postpone this change to a follow up commit.

Keep the "deprecated" libcrypt enabled just in case if some
application are not yet ready to use an alternative such as libxcrypt.

Security related changes:

  CVE-2023-25139: When the printf family of functions is called with a
  format specifier that uses an <apostrophe> (enable grouping) and a
  minimum width specifier, the resulting output could be larger than
  reasonably expected by a caller that computed a tight bound on the
  buffer size.  The resulting larger than expected output could result
  in a buffer overflow in the printf family of functions.

See:
https://lists.gnu.org/archive/html/info-gnu/2023-07/msg00010.html

Runtime tested with Qemu on Gitlab-ci:
https://gitlab.com/kubu93/buildroot/-/pipelines/998435203
https://gitlab.com/buildroot.org/toolchains-builder/-/pipelines/998926028

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=cd94326a1326c4e3f1ee7a8d0a161cc0bdcaf07e

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/glibc/glibc.hash                      |  2 +-
 package/glibc/glibc.mk                        |  4 +++-
 ...ACK-only-build-and-install-localedef.patch | 12 +++++++-----
 ...y-on-GCC-to-4.8-and-binutils-to-2.24.patch | 19 +++++++++++--------
 package/localedef/localedef.mk                |  2 +-
 5 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 453aadae11..4d2e9fbbd2 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  0f8bfad0b853a0c6e1dd1c3254a30b58d4c7050870fe2b0da90ad40f4d450ce2  glibc-2.37-2-g9f8513dc64119a424b312db97cef5d87d376defa.tar.gz
+sha256  06d73b1804767f83885ab03641e2a7bf8d73f0a6cf8caee4032d8d1cc2e76cce  glibc-2.38-13-g92201f16cbcfd9eafe314ef6654be2ea7ba25675.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 79e6c76cb4..844bed5051 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.37-2-g9f8513dc64119a424b312db97cef5d87d376defa
+GLIBC_VERSION = 2.38-13-g92201f16cbcfd9eafe314ef6654be2ea7ba25675
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
@@ -148,6 +148,8 @@ define GLIBC_CONFIGURE_CMDS
 		--disable-werror \
 		--without-gd \
 		--with-headers=$(STAGING_DIR)/usr/include \
+		$(if $(BR2_aarch64)$(BR2_aarch64_be),--enable-mathvec) \
+		--enable-crypt \
 		$(GLIBC_CONF_OPTS))
 	$(GLIBC_ADD_MISSING_STUB_H)
 endef
diff --git a/package/localedef/0001-HACK-only-build-and-install-localedef.patch b/package/localedef/0001-HACK-only-build-and-install-localedef.patch
index b289000c8a..49bbfd227c 100644
--- a/package/localedef/0001-HACK-only-build-and-install-localedef.patch
+++ b/package/localedef/0001-HACK-only-build-and-install-localedef.patch
@@ -1,4 +1,4 @@
-From 442e9a3f262c49cf61f9e7bdf12882f0a427666b Mon Sep 17 00:00:00 2001
+From bd5a87ea4a0cc0ba393a16bbeb166903e4085e8b Mon Sep 17 00:00:00 2001
 From: Michael Olbrich <m.olbrich@pengutronix.de>
 Date: Mon, 21 May 2018 16:45:02 +0200
 Subject: [PATCH] HACK: only build and install localedef
@@ -7,16 +7,18 @@ Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
 
 Upstream: https://git.pengutronix.de/cgit/ptxdist/plain/patches/localedef-glibc-2.27/0001-HACK-only-build-and-install-localedef.patch?id=47116f66f411d4dadfce42c2fdd6d41b351ccfd4
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[Romain: rebase on 2.38]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
  Rules           | 14 ++++++++++----
  locale/Makefile |  6 +++---
  2 files changed, 13 insertions(+), 7 deletions(-)
 
 diff --git a/Rules b/Rules
-index b1137afe71..2aeac31922 100644
+index 279ae490ac..1321956be6 100644
 --- a/Rules
 +++ b/Rules
-@@ -216,10 +216,16 @@ binaries-shared-notests = $(filter-out $(binaries-pie) $(binaries-static), \
+@@ -221,10 +221,16 @@ binaries-shared-notests = $(filter-out $(binaries-pie) $(binaries-static), \
  				       $(binaries-all-notests))
  
  ifneq "$(strip $(binaries-shared-notests))" ""
@@ -38,7 +40,7 @@ index b1137afe71..2aeac31922 100644
  
  ifneq "$(strip $(binaries-shared-tests))" ""
 diff --git a/locale/Makefile b/locale/Makefile
-index b7c60681fa..de4cf4003f 100644
+index d7036b0855..68afdddc7f 100644
 --- a/locale/Makefile
 +++ b/locale/Makefile
 @@ -33,15 +33,15 @@ categories	= ctype messages monetary numeric time paper name \
@@ -61,5 +63,5 @@ index b7c60681fa..de4cf4003f 100644
  
  libBrokenLocale-routines = broken_cur_max
 -- 
-2.33.0
+2.41.0
 
diff --git a/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch b/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
index 94fccfa856..70d2b34bc1 100644
--- a/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
+++ b/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
@@ -1,4 +1,4 @@
-From 85412262460f6ba9f6e2cf8da74fc1904c54c854 Mon Sep 17 00:00:00 2001
+From add730a680075ed611797b9ea771bf977667a7de Mon Sep 17 00:00:00 2001
 From: Matt Weber <matthew.weber@rockwellcollins.com>
 Date: Thu, 6 Feb 2020 14:36:21 -0600
 Subject: [PATCH] relax dependency on GCC to 4.8 and binutils to 2.24
@@ -26,15 +26,17 @@ GCC 6.2+
 Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 [yann.morin.1998@free.fr: update for 2.37]
 Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+[Romain: rebase on 2.38]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
- configure | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
+ configure | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 9619c10991..0c481d2339 100755
+index 4ef387146d..4c6f91117d 100755
 --- a/configure
 +++ b/configure
-@@ -4178,7 +4178,7 @@ $as_echo_n "checking version of $LD... " >&6; }
+@@ -5293,7 +5293,7 @@ printf %s "checking version of $LD... " >&6; }
    ac_prog_version=`$LD --version 2>&1 | sed -n 's/^.*GNU ld.* \([0-9][0-9]*\.[0-9.]*\).*$/\1/p'`
    case $ac_prog_version in
      '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
@@ -43,8 +45,8 @@ index 9619c10991..0c481d2339 100755
         ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
      *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
  
-@@ -4589,7 +4589,7 @@ int
- main ()
+@@ -5735,7 +5735,7 @@ int
+ main (void)
  {
  
 -#if !defined __GNUC__ || __GNUC__ < 6 || (__GNUC__ == 6 && __GNUC_MINOR__ < 2)
@@ -53,4 +55,5 @@ index 9619c10991..0c481d2339 100755
  #endif
    ;
 -- 
-2.33.0
+2.41.0
+
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 6f8b170516..650b319a25 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.37-2-g9f8513dc64119a424b312db97cef5d87d376defa
+LOCALEDEF_VERSION = 2.38-13-g92201f16cbcfd9eafe314ef6654be2ea7ba25675
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
