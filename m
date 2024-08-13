Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BFCC531DC
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 03:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5307340423;
	Tue, 13 Aug 2024 03:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gvKFBAuLFh4i; Tue, 13 Aug 2024 03:10:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72AFE40363
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72AFE40363;
	Tue, 13 Aug 2024 03:10:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 565031BF319
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 03:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4178180EB6
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 03:10:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id crTvKE0pqQch for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 03:10:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 89ACA80EA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89ACA80EA4
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89ACA80EA4
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 03:10:26 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id DFD6335211BD; Tue, 13 Aug 2024 05:10:23 +0200 (CEST)
Date: Tue, 13 Aug 2024 05:10:23 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZrrOn5qI/Wr44k8F@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723518624; bh=PGaHUSR1aqmU79BZ65FaYCQ6OiPQwCTjMKfJ08Low5g=;
 h=Date:From:To:Subject:From;
 b=bbeYYE+jDcvKOp6P/2Ckei9tP5+MFlAYIMP/BhR/CJ36ORrXcmzfwJhAWd6vXJ0bW
 lFKhGfUIoOs3CzNIRB6LxJBx09JwmXD9Ym9rTtXAGC5noVG2VjErIZTqjqOAgBPBFP
 pm3tXb+rV+P3tuNZlzLPPFjZq9Lt9rYO2PuSZgs7JkAiiDz89s1vbUdx6P4NNDyiAd
 MEekchXcwv6Gi/Wi79dmp0ksZ4Js93vbAIEybIIO9goG7KLOJeXJhwBcC5TpYrvm+z
 NLqn71+CLsCQOxoKBG/pJmPtXa7Za3an/wvoo82Zk4gfF2ES8uLaekE3eO+G6Q1ep/
 +ePn5NE84CzQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=bbeYYE+j
Subject: [Buildroot] [PATCH v2 next] package/bind: update to 9.18.28
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

Add new patch 0001 to fix a rndc linking error.

See here for a changelog:
https://downloads.isc.org/isc/bind9/9.18.28/doc/arm/html/notes.html

COPYRIGHT file has been updated, following Copyright holders were
added:
Copyright Joyent, Inc. and other Node contributors. All rights reserved.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2:
 - add patch to fix a linking error reported by Thomas P.
---
 .checkpackageignore                           |  1 -
 package/bind/0001-cross.patch                 | 34 -------------------
 ...1-rndc-add-missing-libns-CFLAGS-LIBS.patch | 34 +++++++++++++++++++
 package/bind/bind.hash                        |  8 ++---
 package/bind/bind.mk                          |  5 ++-
 5 files changed, 42 insertions(+), 40 deletions(-)
 delete mode 100644 package/bind/0001-cross.patch
 create mode 100644 package/bind/0001-rndc-add-missing-libns-CFLAGS-LIBS.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 8fe4a16eb8..4f78f7d4aa 100644
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
diff --git a/package/bind/0001-rndc-add-missing-libns-CFLAGS-LIBS.patch b/package/bind/0001-rndc-add-missing-libns-CFLAGS-LIBS.patch
new file mode 100644
index 0000000000..ef7f5ff0dc
--- /dev/null
+++ b/package/bind/0001-rndc-add-missing-libns-CFLAGS-LIBS.patch
@@ -0,0 +1,34 @@
+From 1a7d7caa699a18d28db09af7329b8c145ec86d63 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Sun, 11 Aug 2024 11:13:08 +0200
+Subject: [PATCH] rndc: add missing libns CFLAGS/LIBS
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://gitlab.isc.org/isc-projects/bind9/-/issues/4840
+---
+ bin/rndc/Makefile.am | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/bin/rndc/Makefile.am b/bin/rndc/Makefile.am
+index a668522bc2..77071e7569 100644
+--- a/bin/rndc/Makefile.am
++++ b/bin/rndc/Makefile.am
+@@ -2,6 +2,7 @@ include $(top_srcdir)/Makefile.top
+ 
+ AM_CPPFLAGS +=			\
+ 	$(LIBISC_CFLAGS)	\
++	$(LIBNS_CFLAGS)		\
+ 	$(LIBDNS_CFLAGS)	\
+ 	$(LIBISCCFG_CFLAGS)	\
+ 	$(LIBISCCC_CFLAGS)	\
+@@ -20,6 +21,7 @@ rndc_SOURCES =	\
+ 
+ rndc_LDADD =			\
+ 	$(LIBISC_LIBS)		\
++	$(LIBNS_LIBS)		\
+ 	$(LIBDNS_LIBS)		\
+ 	$(LIBISCCC_LIBS)	\
+ 	$(LIBISCCFG_LIBS)	\
+-- 
+2.39.2
+
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
index 0d81ffabd6..61aa557f0b 100644
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
@@ -24,6 +24,8 @@ BIND_TARGET_SERVER_SBIN += lwresd named named-checkconf named-checkzone
 BIND_TARGET_SERVER_SBIN += named-compilezone rndc rndc-confgen dnssec-dsfromkey
 BIND_TARGET_SERVER_SBIN += dnssec-keyfromlabel dnssec-signzone tsig-keygen
 BIND_TARGET_TOOLS_BIN = dig host nslookup nsupdate
+# 0001-rndc-add-missing-libns-CFLAGS-LIBS.patch
+BIND_AUTORECONF = YES
 BIND_CONF_ENV = \
 	BUILD_CC="$(TARGET_CC)" \
 	LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
@@ -31,6 +33,7 @@ BIND_CONF_OPTS = \
 	--without-cmocka \
 	--without-lmdb \
 	--enable-epoll \
+	--disable-doh \
 	--disable-backtrace \
 	--with-openssl=$(STAGING_DIR)/usr
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
