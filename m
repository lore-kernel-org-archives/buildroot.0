Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0F2C52D7D
	for <buildroot@archiver.kernel.org>; Fri, 16 Aug 2024 01:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9517940CF3;
	Fri, 16 Aug 2024 01:39:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uy4Tfk203e3g; Fri, 16 Aug 2024 01:39:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5D3040CFF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5D3040CFF;
	Fri, 16 Aug 2024 01:39:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A87941BF33B
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 01:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92D26400D3
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 01:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rohYojirAa2q for <buildroot@lists.busybox.net>;
 Fri, 16 Aug 2024 01:39:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 18C9440022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18C9440022
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18C9440022
 for <buildroot@buildroot.org>; Fri, 16 Aug 2024 01:39:33 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0B4393535C0F; Fri, 16 Aug 2024 03:39:30 +0200 (CEST)
Date: Fri, 16 Aug 2024 03:39:29 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zr6t0edkFUlZULGn@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723772370; bh=dM4y+Abfkk/oP1+Vq4kk7r+gJVTSWo9yczoHHFuxUXg=;
 h=Date:From:To:Subject:From;
 b=e5TbHjFmENIuzOF5rzYWMWJkhumPIlOtSaVlXwuvRX0q063ei8ibMRHUiLilwIKMp
 LRYpC3uTXslpwdAFha0hqH7UzgsfOgHPr6GIzaWjqc7jeVELQSE0M8rlcRjFlGtrel
 qiOaD2jdUmr4XhjgmgLofIT7jznGpa10068FcaBAYh9KKQuoNRixj2r7gUFM/iZJm6
 IqLykrF6DoxYCxJbIGXhflodNr7/70PGy/o4ro8D7JJpxRgmMdFCzBI80ZD9j1obS9
 8kqRxQDOzbAymrh2hhS2fQHebSFgZfP9xQUbqOXSp0PK4laBv1fEKKTCLWkeNEVJWO
 uP67LehUZ+OdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=e5TbHjFm
Subject: [Buildroot] [PATCH next v3] package/bind: update to 9.18.28
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bind 9.16.x is EOL since April 2024.
See here for what version should be used in production:
https://kb.isc.org/docs/aa-01540

Remove patch 0001 as CC_FOR_BUILD is used in upstream code
to compile host utility gen.

Use BIND_AUTORECONF = YES to avoid a Debian 12 libtool bug.
Otherwise rndc linking fails. See here for a bug report to
bind9 project:
https://gitlab.isc.org/isc-projects/bind9/-/issues/4840

See here for a changelog:
https://downloads.isc.org/isc/bind9/9.18.28/doc/arm/html/notes.html

COPYRIGHT file has been updated, following Copyright holders were
added:
Copyright Joyent, Inc. and other Node contributors. All rights reserved.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
./utils/test-pkg -a -p bind
                             arm-aarch64 [ 1/41]: OK
                   bootlin-aarch64-glibc [ 2/41]: OK
               bootlin-arcle-hs38-uclibc [ 3/41]: OK
                    bootlin-armv5-uclibc [ 4/41]: OK
                     bootlin-armv7-glibc [ 5/41]: OK
                   bootlin-armv7m-uclibc [ 6/41]: SKIPPED
                      bootlin-armv7-musl [ 7/41]: OK
                bootlin-m68k-5208-uclibc [ 8/41]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/41]: OK
             bootlin-microblazeel-uclibc [10/41]: OK
                bootlin-mipsel32r6-glibc [11/41]: OK
                   bootlin-mipsel-uclibc [12/41]: OK
                     bootlin-nios2-glibc [13/41]: OK
                 bootlin-openrisc-uclibc [14/41]: OK
        bootlin-powerpc64le-power8-glibc [15/41]: OK
           bootlin-powerpc-e500mc-uclibc [16/41]: OK
                   bootlin-riscv32-glibc [17/41]: OK
                   bootlin-riscv64-glibc [18/41]: OK
                    bootlin-riscv64-musl [19/41]: OK
                 bootlin-s390x-z13-glibc [20/41]: OK
                      bootlin-sh4-uclibc [21/41]: OK
                   bootlin-sparc64-glibc [22/41]: OK
                    bootlin-sparc-uclibc [23/41]: SKIPPED
                    bootlin-x86-64-glibc [24/41]: OK
                     bootlin-x86-64-musl [25/41]: OK
                   bootlin-x86-64-uclibc [26/41]: OK
                   bootlin-x86-i686-musl [27/41]: OK
                   bootlin-xtensa-uclibc [28/41]: OK
                            br-arm-basic [29/41]: OK
                    br-arm-full-nothread [30/41]: SKIPPED
                      br-arm-full-static [31/41]: SKIPPED
                   br-i386-pentium4-full [32/41]: OK
                      br-mips64-n64-full [33/41]: OK
                 br-mips64r6-el-hf-glibc [34/41]: OK
               br-powerpc-603e-basic-cpp [35/41]: OK
               br-powerpc64-power7-glibc [36/41]: OK
                       linaro-aarch64-be [37/41]: OK
                          linaro-aarch64 [38/41]: OK
                              linaro-arm [39/41]: OK
                         sourcery-mips64 [40/41]: OK
                           sourcery-mips [41/41]: OK
41 builds, 5 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 .checkpackageignore           |  1 -
 package/bind/0001-cross.patch | 34 ----------------------------------
 package/bind/bind.hash        |  8 ++++----
 package/bind/bind.mk          |  9 +++++----
 4 files changed, 9 insertions(+), 43 deletions(-)
 delete mode 100644 package/bind/0001-cross.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 81e48bf859..31e05843e1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -338,7 +338,6 @@ package/benejson/0001-c-std.patch lib_patch.Upstream
 package/benejson/0002-Use-print-as-a-function-for-Py3-compatibility.patch lib_patch.Upstream
 package/berkeleydb/0001-cwd-db_config.patch lib_patch.Upstream
 package/berkeleydb/0002-atomic_compare_exchange.patch lib_patch.Upstream
-package/bind/0001-cross.patch lib_patch.Upstream
 package/bind/S81named Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/bird/0001-configure.ac-fix-build-with-autoconf-2.70.patch lib_patch.Upstream
 package/bmx7/0001-Fix-schedule.c-378-36-error-SIOCGSTAMP-undeclared.patch lib_patch.Upstream
diff --git a/package/bind/0001-cross.patch b/package/bind/0001-cross.patch
deleted file mode 100644
index f39be2f837..0000000000
--- a/package/bind/0001-cross.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 505cc9fcadda5607dc4c5bacb03928c0b35162a8 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Wed, 4 Nov 2020 17:51:38 +0100
-Subject: [PATCH] Use host compiler to build 'gen' since it's run when
- building.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-[Fabrice: updated for 9.11.10]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
----
- lib/dns/Makefile.in | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/lib/dns/Makefile.in b/lib/dns/Makefile.in
-index 8fc4e94f26..4ac92857e0 100644
---- a/lib/dns/Makefile.in
-+++ b/lib/dns/Makefile.in
-@@ -184,10 +184,8 @@ code.h:	gen
- 	./gen -s ${srcdir} > code.h || { rm -f $@ ; exit 1; }
- 
- gen: gen.c
--	${BUILD_CC} ${BUILD_CFLAGS} -I${top_srcdir}/lib/isc/include \
--	${LFS_CFLAGS} ${LFS_LDFLAGS} \
--	${BUILD_CPPFLAGS} ${BUILD_LDFLAGS} -o $@ ${srcdir}/gen.c \
--	${BUILD_LIBS} ${LFS_LIBS}
-+	${HOSTCC} ${HOST_CFLAGS} -I${top_srcdir}/lib/isc/include \
-+	${HOST_LDFLAGS} -o $@ ${srcdir}/gen.c
- 
- timestamp: include libdns.@A@
- 	touch timestamp
--- 
-2.29.1
-
diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 482b046c8d..feb3430a73 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.16.48/bind-9.16.48.tar.xz.asc
-# with key AADBBA5074F1402F7B69D56BC5B4EE931A9F9DFD
-sha256  8d3814582348f90dead1ad410b1019094cd399d3d83930abebb2b3b1eb0b2bbb  bind-9.16.48.tar.xz
-sha256  13491a682dc0f5ee2273cebd3949e2be62f9470fe659419a03a308d4f444773b  COPYRIGHT
+# Verified from https://ftp.isc.org/isc/bind9/9.18.28/bind-9.18.28.tar.xz.asc
+# with key 706B6C28620E76F91D11F7DF510A642A06C52CEC
+sha256  e7cce9a165f7b619eefc4832f0a8dc16b005d29e3890aed6008c506ea286a5e7  bind-9.18.28.tar.xz
+sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 0d81ffabd6..217c9916fd 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.16.48
+BIND_VERSION = 9.18.28
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
@@ -24,13 +24,14 @@ BIND_TARGET_SERVER_SBIN += lwresd named named-checkconf named-checkzone
 BIND_TARGET_SERVER_SBIN += named-compilezone rndc rndc-confgen dnssec-dsfromkey
 BIND_TARGET_SERVER_SBIN += dnssec-keyfromlabel dnssec-signzone tsig-keygen
 BIND_TARGET_TOOLS_BIN = dig host nslookup nsupdate
-BIND_CONF_ENV = \
-	BUILD_CC="$(TARGET_CC)" \
-	LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
+# avoid potential Debian 12 libtool 2.4.7 bug
+# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=929396
+BIND_AUTORECONF = YES
 BIND_CONF_OPTS = \
 	--without-cmocka \
 	--without-lmdb \
 	--enable-epoll \
+	--disable-doh \
 	--disable-backtrace \
 	--with-openssl=$(STAGING_DIR)/usr
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
