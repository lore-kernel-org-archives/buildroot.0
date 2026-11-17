Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E94B606A88C
	for <buildroot@archiver.kernel.org>; Tue, 17 Nov 2026 08:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cMPr8qzj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=r1BgpiNe
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5024260774;
	Tue, 17 Nov 2026 08:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qeecxl5rf68M; Tue, 17 Nov 2026 08:38:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E576160828
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794904711;
	b=puSBzx95bxs713BpOl3fGD36e1fWNVlRNNdV+QAmqbRdVkHavIB/Gk5E7Z9SAoB41qiq
	 7synzuT6S50vuXcjLcAzH0ep11em3+KpLYB/SvxJlSO9eXHLL4IQLBXicX0hozy7KDFol
	 FVyh1sqnL6nrmq8x3L/XXCDT7AcdL4AQLX7BjFQzZeXZdhqVOW2nyrooD7HPbDfKyGLsW
	 4aiKRdm1kZoU8MfwCsk1st0rfMb9elZ10uywDkINfl3IW5cFWR9d5xO/Fom5ehvDMvg3S
	 UjCwkCR08lBcQWZmtyvzzVCi5domjq5Kx/DKE7cCBNnXK7y8mlE9sN0PWQYMQfHjl1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794904711;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=vFoU5Ju7V9iiBD6w16SuTl1klseQj6rUGDwFU1s5LqA=;
	b=XeblRRk71hdMwkvrdnOmSOFAXNN5/gKw4w6Ece6rLF5W9EqGStEoJ+W3DasWj9Z4ElAc
	 FYRVli7+NNbX+ACoCRMApTwzu7MErX5EZe/pN3T5dUU0JUwxGl6fP9bP/EtslesdYMb4k
	 B6xQUkw0R2fttb6EET+1y81DGVz0x7hXIaaTfzPJh1KmQZ3ozTXdHef6zVMr1aAi5xIXL
	 Ykqun4Mw3AnAosPkuXX8c6g7xdHb6GF5KMgyvH0H3VPPEpwgDtNXuyS99SoBzBdLps9OS
	 tbf/wqjX3KrbR+M9GLo8NRnxOXFMBK8yAYmhjbYnJC3wqHAerZNw6CPYeLsBee4XLeA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794904711;
	bh=vFoU5Ju7V9iiBD6w16SuTl1klseQj6rUGDwFU1s5LqA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cMPr8qzjHApSSArDSYVw+tYqKzABpsFx7tr+NoQ2Y67gP5Fy7YycQbyKSRSoUcUFd
	 z9NlZkSj5uc2l+2/rTpVOViHzdlpB8Y+r+Trdz/uftFMHjrwS9KbB8ZHtliIhw+jPW
	 3ly/GKWmxsJewjhyLzz64lBi9BR8VpeQsCH0sQZdbeDa9h3vkwObzx4F4vTG0Afnvb
	 GaL0Dc9LciqjY/yyDlGD6+uRu1LqCwUfVh4wB/ogn4cptd8UcsdA+n11dbqmJSmfuY
	 TETgmGsJZIlMu4eeKkhyhEEWiln5yVqnnnPQpN0IiAtXVq29YnRiydUiccgYe0Jhwl
	 YGlgoC8L1e3Pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E576160828;
	Tue, 17 Nov 2026 08:38:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 42EF1260
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 08:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20C904062A
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 08:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q2GcKEYqfS60 for <buildroot@buildroot.org>;
 Tue, 17 Nov 2026 08:38:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D167540638
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=r1BgpiNe
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D167540638
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 08:38:28 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-c50cc8e0f84so312456466b.1
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 00:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1794904706; x=1795509506; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6a+86DZQMME4Pj6vICoAdGWFMC1mWHdkUBPpZUqiEhY=;
 b=r1BgpiNeJvMc6N/sAeCRWACZ6FtSTda2acVHX6i/EcwZebYTt7hkN3RACu2MfC4rjs
 SPpt5dBf8/u3xzp8A+IBuY93Y5pqmmJ5hTbEd9WNZ7pM4RXZ/LWttyMMP1ybXeLGhaE5
 vgFZoalwJT3xtONILCMnB2lr/2e3UA+el3MaWfOlYlALKFFGhK/Ekdh/qPWnd5L1m7/B
 P7fYB3pSOItLsoIEZvjtpkLEh+MrtH4lz3XC2VVE2TGlra1jHZ+19nh2mRojM1ftXI/C
 wVqozbkLXAbwTXYAR5b1lFtL0Gft/wyGjtOtqgEgd9Ki4YOV2hKHBezc5dn0cJcA0xy5
 6LpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794904706; x=1795509506;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6a+86DZQMME4Pj6vICoAdGWFMC1mWHdkUBPpZUqiEhY=;
 b=vnCWoFKB70rOVjW2wtlXpu30MjcWeW5nTiJAeKwz7P7lswzYevUgvLFlmE/Fg2guJU
 z5JyIIeZnTnU8Ro/8sgptudDqqTgYLEKRnaOf9fIvy3cfOpqPT3MIu15+0CTn5akZqze
 Kg/7s9Uk4oVOnuDuuWwNzPgYWmzy37mco7Wj6lb1lAJ5G1g/pUBcCqJX3FxfmGylvJtk
 il4tIkiNMyjvkuJFuIhxbsF4O++BDqwW0XmtfrIH/3H+OWBWse/A7yPxtM96d92ofYLV
 ZN8KVun3YE8/KKVCSyNzDh5fwZXHifb61kyMJ2TnnB2ppEc4ZNhvlKK8GHT156ybomnQ
 FSsA==
X-Gm-Message-State: APuU4Z9nHE63OinCTLtQstai+CgA7SuuP93CZNFeEwJiah6LsJolUAu5
 0LwaGALpAZECBJyyHnhA0OYOrfct8TTVnpZmkRlujEwEGCHVc2R7h/750yPmMw==
X-Gm-Gg: AYBFou1ooa7kXdRG6vV4D2tdds09ee5iLqyVgkl/hAN7kCk4WQ4U3D/J1Ot+pBMP5zg
 LyqNxJdOdvlPup7BXoT+QBCtraSlyie/gd2HLSgSZjMUm2nXRF27dOD5ypAFvlNVb9MEVkcZW2W
 k2K59zyXhd21bXT+WPE9waYmYbFh7ZY1zvvAiQseg4sgX1Jv0XRXyb485Pgt3Rq2GNILR3g7DCy
 occPHJCZKo6Nq07mLKlkNFA3//FNNO9obogSTsUxARFLJlafZfcmhqvSQVaXHFkOp6DO/RE+xGS
 Fd8f9r4zZHP8ri0M+vb9A/7jk3oYVMOBx+CbdzVKvbW7w/1fZDh0vp1/kC589cVeHw3GpNZ6GTK
 gdCDbkGS91aNATCIQ2LtT1lZ3KUC27bnVBtjRkmXcjDdbB/R5UHViMDohcBajIZzU/8gKxOZpTL
 wobij9A6L3fhKcr/PzO7SXsPR8yrT8JWkvh6ZfQ7Ep6mzfhReAwgOhrRiPI4vCsm1MW4Z7mzZbb
 GqLdkkXf+wV3I7blVMlmCSAKhFuAYcg2rngRyH3ZRxHpQ0RoIu7x57stC/jUj3DxBg8choHuI05
 BvaUX/F99G02CjRmwHAEHC4LUL1XIWzJnrWTT34lr0dMWobGqN8a5aINkBUlfY0xd879QlXcFuB
 J1DneglsL
X-Received: by 2002:a17:907:3e0d:b0:c4d:8e7:29b9 with SMTP id
 a640c23a62f3a-c50961d1c5bmr1193429766b.5.1794904706422; 
 Tue, 17 Nov 2026 00:38:26 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c50d71c2393sm244659766b.54.2026.11.17.00.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2026 00:38:25 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Nov 2026 09:38:25 +0100
Message-Id: <20261117083825.2359598-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/openntpd: bump to version 7.9p1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release notes:
https://ftp.openbsd.org/pub/OpenBSD/OpenNTPD/ChangeLog

This version includes upstream commit 8e4fdc1c2794 ("fix incompatible
check for libc compat"), which fixes the static build with GCC >= 14:
the configure check for __progname failed, so compat/progname.c
defined its own __progname, clashing with the one from the static C
library:

  libc.a(__uClibc_main.os):(.data.rel.local.__progname+0x0): multiple definition of `__progname'; ../compat/.libs/libcompat.a(progname.o):(.bss+0x0): first defined here

Other changes:

- Pass --disable-hardening: configure now adds its own hardening
  flags (stack protector, -z relro/now, _FORTIFY_SOURCE), which
  Buildroot already handles through its own options.

- The drift file is now stored in $(localstatedir) rather than
  $(localstatedir)/db, and the control socket in $(runstatedir).
  Pass --localstatedir=/var/db and --runstatedir=/var/run to keep
  them in /var/db/ntpd.drift and /var/run/ntpd.sock, as before.

- Add a patch, submitted upstream, fixing the libtls detection with
  static libraries. Otherwise, HTTPS constraints are silently disabled
  when building statically with LibreSSL.

- COPYING: some authors were added to the copyright notice, the
  license itself is unchanged.

Fixes:
https://autobuild.buildroot.org/results/85353661e0790e50707239d33f71a1b77741091f

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Note: for the maintenance branches, the __progname fix is backported in
"package/openntpd: fix static build with uClibc-ng and GCC >= 14":
https://patchwork.buildroot.org/project/buildroot/patch/20261111140114.1786053-1-yegorslists@googlemail.com/
If that patch is applied to master first, this bump needs to remove
package/openntpd/0001-fix-incompatible-check-for-libc-compat.patch.

 ...btls-detection-with-static-libraries.patch | 38 +++++++++++++++++++
 package/openntpd/openntpd.hash                |  4 +-
 package/openntpd/openntpd.mk                  | 13 ++++++-
 3 files changed, 51 insertions(+), 4 deletions(-)
 create mode 100644 package/openntpd/0001-configure-fix-libtls-detection-with-static-libraries.patch

diff --git a/package/openntpd/0001-configure-fix-libtls-detection-with-static-libraries.patch b/package/openntpd/0001-configure-fix-libtls-detection-with-static-libraries.patch
new file mode 100644
index 0000000000..0c171e371b
--- /dev/null
+++ b/package/openntpd/0001-configure-fix-libtls-detection-with-static-libraries.patch
@@ -0,0 +1,38 @@
+From 18308d6b893d4d845ab65108aa19fd67a8793f63 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Tue, 17 Nov 2026 09:24:31 +0100
+Subject: [PATCH] configure: fix libtls detection with static libraries
+
+Commit 0d0290c ("we shouldn't need -lssl/crypto explicitly defined
+here") only links the libtls check against -ltls. This works with a
+shared libtls, but a static libtls also needs -lssl and -lcrypto, so
+the check fails and HTTPS constraints are silently disabled:
+
+  tls_config.c:(.text+0xa94): undefined reference to `SSLv23_method'
+
+If linking with -ltls alone fails, retry with -ltls -lssl -lcrypto.
+
+Assisted-by: Claude:claude-opus-5-5
+Upstream: https://github.com/openntpd-portable/openntpd-portable/pull/93
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ configure.ac | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 2f38e74..115f784 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -68,6 +68,12 @@ AM_CONDITIONAL([HAVE_CLOCK_GETTIME], [test "x$ac_cv_func_clock_gettime" = xyes])
+ saved_LIBS="$LIBS"
+ LIBS="$LIBS -ltls"
+ AC_CHECK_FUNCS([tls_config_set_ca_mem])
++if test "x$ac_cv_func_tls_config_set_ca_mem" = xno; then
++	# a static libtls needs its dependencies to be listed explicitly
++	AS_UNSET([ac_cv_func_tls_config_set_ca_mem])
++	LIBS="$saved_LIBS -ltls -lssl -lcrypto"
++	AC_CHECK_FUNCS([tls_config_set_ca_mem])
++fi
+ if test "x$ac_cv_func_tls_config_set_ca_mem" = xno; then
+ 	LIBS="$saved_LIBS"
+ fi
diff --git a/package/openntpd/openntpd.hash b/package/openntpd/openntpd.hash
index 2ef8a619eb..73e52b4f8b 100644
--- a/package/openntpd/openntpd.hash
+++ b/package/openntpd/openntpd.hash
@@ -1,5 +1,5 @@
 # from http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD/SHA256
-sha256  8582db838a399153d4a17f2a76518b638cc3020f58028575bf54127518f55a46  openntpd-6.8p1.tar.gz
+sha256  091eeb3f4e358e28c3ab2ea58f93d7a0b5758a20d7c8a0418e162e9b2c27addc  openntpd-7.9p1.tar.gz
 
 # Locally computed
-sha256  6c1822ee950652c12bb3773849db18794f62c63452a70d018edf23e8cba71839  COPYING
+sha256  4117c5052e0b60267b7371281b8fb553eb25de0e92fa25118145cde4a3ce1cfe  COPYING
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index f9409cd90c..ce5a71806e 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -4,15 +4,24 @@
 #
 ################################################################################
 
-OPENNTPD_VERSION = 6.8p1
+OPENNTPD_VERSION = 7.9p1
 OPENNTPD_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
 OPENNTPD_LICENSE = MIT-like, BSD-2-Clause, BSD-3-Clause
 OPENNTPD_LICENSE_FILES = COPYING
 OPENNTPD_CPE_ID_VENDOR = openntpd
 OPENNTPD_DEPENDENCIES = host-bison
-# Need to autoreconf for our libtool patch to apply properly
+# 0001 patches configure.ac, and we need to autoreconf for our
+# libtool patch to apply properly
 OPENNTPD_AUTORECONF = YES
 
+# Buildroot handles the hardening flags (SSP, RELRO, FORTIFY_SOURCE).
+# Keep the drift file in /var/db and the control socket in /var/run,
+# as with previous versions.
+OPENNTPD_CONF_OPTS = \
+	--disable-hardening \
+	--localstatedir=/var/db \
+	--runstatedir=/var/run
+
 # Openntpd searches for tls_config_set_ca_mem which is only available
 # in LibreSSL
 ifeq ($(BR2_PACKAGE_LIBRESSL),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
