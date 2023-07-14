Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92374EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 09:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F0D084170;
	Fri, 14 Jul 2023 09:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F0D084170
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N3ePfm7XsRhn; Fri, 14 Jul 2023 09:08:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44DE484152;
	Fri, 14 Jul 2023 09:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44DE484152
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0BEA31BF97C
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 09:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E686C613FE
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 09:08:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E686C613FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yDXGKyIcNLvx for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 09:08:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BE51613F7
Received: from smtpfb2-g21.free.fr (smtpfb2-g21.free.fr [212.27.42.10])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BE51613F7
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 09:08:12 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtpfb2-g21.free.fr (Postfix) with ESMTP id 23BA94D2F1
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 11:08:11 +0200 (CEST)
Received: from mail.qult.net (unknown [78.193.33.39])
 by smtp6-g21.free.fr (Postfix) with ESMTPS id 0789C78037F
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 11:08:06 +0200 (CEST)
Received: from zenon.in.qult.net ([192.168.64.1])
 by mail.qult.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1qKEmT-00031N-OE
 for buildroot@buildroot.org; Fri, 14 Jul 2023 11:08:05 +0200
Received: from ig by zenon.in.qult.net with local (Exim 4.96)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1qKEmT-00GjIg-06 for buildroot@buildroot.org;
 Fri, 14 Jul 2023 11:08:05 +0200
Date: Fri, 14 Jul 2023 11:08:04 +0200
From: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
To: buildroot@buildroot.org
Message-ID: <20230714090804.kaid6vdlxiubf632@zenon.in.qult.net>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [PATCH] package/elfutils: enable building with
 musl-based toolchains
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Select BR2_PACKAGE_ARGP_STANDALONE as soon as the toolchain is not
glibc-based and add argp-standalone to build dependencies in that
case.

Signed-off-by: Ignacy Gaw=EAdzki <ignacy.gawedzki@green-communications.fr>
---
 package/elfutils/Config.in   | 9 +++------
 package/elfutils/elfutils.mk | 5 ++++-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index 5f45de14ab..c355048c6d 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -1,17 +1,14 @@
-comment "elfutils needs a uClibc or glibc toolchain w/ wchar, dynamic libr=
ary, threads"
+comment "elfutils needs a toolchain w/ wchar, dynamic library, threads"
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
+		|| !BR2_TOOLCHAIN_HAS_THREADS
 =

 config BR2_PACKAGE_ELFUTILS
 	bool "elfutils"
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# Only glibc and uClibc implement the myriad of required GNUisms
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
+	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Libraries/utilities to handle ELF objects (drop in
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 8116ae5972..c2ae94d1c1 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -61,8 +61,11 @@ HOST_ELFUTILS_CONF_OPTS +=3D --disable-libdebuginfod --d=
isable-debuginfod
 ELFUTILS_CONF_ENV +=3D \
 	LDFLAGS=3D"$(ELFUTILS_LDFLAGS)"
 =

-ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
 ELFUTILS_DEPENDENCIES +=3D argp-standalone
+endif
+
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 ELFUTILS_CONF_OPTS +=3D --disable-symbol-versioning
 endif
 =

-- =

2.39.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
