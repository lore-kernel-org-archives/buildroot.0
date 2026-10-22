Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B26B606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hYE+n2f+
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F376680DBA;
	Fri, 23 Oct 2026 12:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dfT-cW5rIAyO; Fri, 23 Oct 2026 12:32:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7FE16816FB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758764;
	b=rRrgQd4y8QxqToKHqJP1TE5qb2nsoMb38q5+4nkXaFcoomapnLtUV3qSGYdaMTK8iKDV
	 tQBV9ha3AJ2WkPdXKSAO7lIpuFnQIC9PVMLEnIlG4MHSzxpy7Vk772CHSyDjm5gKgrkYd
	 vU3Z/bdbuqXjCRPQa9rv+9J8eDx6dNlECIPgfV908DJkUdoedk1eMbee1PVojEZUNneBD
	 WbaQ42vJ67GOPGC2nYflIx3yuuSpGmFb1NZpK04VFK8sDm/2r09ixOSTU6wTP/cUU7bO7
	 kJ80o5+6PV+5tEhTMGhE+zOm61y//EHUC6sBvpJOys88yPL3UjEKHfF0D5Msc/rg7Mg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758764;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=7R5rq3t2/pzBlFGA8Y0nObUKmliPWM2yVy6nrLS3gu4=;
	b=IeNrtswfglYS30VNXXaLcDelxDjvD80rFw/esd8+YcLo3jZAP2vplWPscBQOyXSWghHr
	 un2Z4bhAae/iBIHwphVPbJX3T4vDWIZpNOJGB48gnDbISy+c9wuPBawMSJWRi6gHcCRo2
	 ysPdQk15sThnSJKpoZ6xic7YlCvwzp8WvWGPE5fVtA+880LCsiM/J/IGRlL/KqI1ppibl
	 /3Y0D11Iw/3WEycxlAoNgpC1k1G5ERr417SmGhpF3Ikf2M9DqkZTpIJZPxXxogZ1h3zcM
	 0rjB07qGzndCo5WbzOlO+JaCItQ6qpNz0BEyZEnpW7SlEiYZcZZ4i1VVLkBxWsn329A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758764;
	bh=7R5rq3t2/pzBlFGA8Y0nObUKmliPWM2yVy6nrLS3gu4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hYE+n2f+6ARD45A3Pd+Npb7W4DQ6mw2e93LW2lZ0fsdY7o1MBpCFnazzNROQW/r0G
	 sfXILbqLpjMsWlewV44MqEFGFumTshZlXTo8WYf4/dRKysmAnSK3HPF2foQDKi0fOD
	 cL5ZXCeeLlYZ+SeaS+bdOTcrYdahvfoNTvGUEPlfl6OjwH+NS+pTfotw81ytlvZhd5
	 sExPn05VHET49TKM1ksyYrHQGPqixq+9kg2DrsVQFIfl84IZEo3EXeEd//c718/Of9
	 ZQ39uvxb0r1ytSd+JNn84bXPrda/qI2JF2faQFfZ5J9aF9FWwEVI7UeI8N9C/PFWkM
	 drnR3cAgiK21w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FE16816FB;
	Fri, 23 Oct 2026 12:32:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A150E12C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90C4240934
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TAnUti02Aehc for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AE0DF40928
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758727;
 b=mFtuCAuaGnMP03YSr8uH3bnnA6jF35obDysJw+xvERivY7tF5KagMg5EURoL3pZCfJ/e
 MTE6ZCYwkWqAN6qMyzGVuhCwfy5EakFL6/4TxqGAFoRI1iTbcwGSpK0Gqln9uZJcwzhuA
 oqS4M5xMIjVAzGbfIB5CTBriJM1UN9UUOaeZaQ3RCGZT+kxckK0LTF4gj/zFV7BuwxAPD
 keG+sXziIj2DCDw8gLIlIjSshT09ijAusvaAtV5yeIgfH1LU8NwKgTx4pg9BV81WVyQua
 K3P0rmy+xFRTifeTymO0juWbLiLfLkdzXJsWIR2LJScI3uS1Msw4PYg83MnUuhhFQNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758727;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ZJgIF65hyeHKsKQAd3jfN97WaOE26GlZQtqu1jIt9ag=;
 b=tbM3U/DtRcPebJ/XyyRQmo0Wc+fTvamEnnio6RW9mkrEcU3hauqWrmRE1l2T9aOvcDZp
 zVXOjo94E171YNrYAHNHShQ5eeci3+7xNR/ePRYKX9tUjsmRP6MkPrL4xj3swK919vA0g
 StP7D5ZH59RnIoxYn8soemiIk7s/tGcn3vwQ4RZP+inq6Pc2t673K9tFslUnWc6EG7Xpg
 AR2VlfHUtRAg7PXUzilkEg2IM3VZDOnGjyJRaUtm37p3B3MSIoG4jhEgC5TmpspjoZhop
 dDbC6HgXB02WU/kqvvqUbU2DUzThSstHl8r+uyR+5RrI4QW5lCxA32odmegNl2yuT+w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE0DF40928
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40E9E9C669; Fri, 23 Oct 2026 12:30:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:50:28 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 8d1527892c2022c0bf340029059f63f8aee5766b
X-Git-Newrev: 2e919a4cb688e2b36c1033978476c47daa2d1bcb
X-Patchwork-Hint: ignore
Message-Id: <20261023123043.40E9E9C669@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/p11-kit: switch
 to meson build system
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1456200631610010597=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1456200631610010597==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2e919a4cb688e2b36c1033978476c47daa2d1bcb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

P11-kit has been offering a meson build since 0.23.17 (see upstream
NEWS [1]), and it is the build system described in the upstream
README.

Changes in the switch to meson:

* Explicitly enable/disable NLS.
* Explicitly enable/disable bash-completion.
* The meson build has no explicit option for libtasn1, it is required
  if trust_module is enabled.
* Add patch for meson configuration to avoid depending on systemd to
  discover install location for units, which would create a dependency
  loop.
* Check for BR2_INIT_SYSTEMD instead of BR2_PACKAGE_SYSTEMD to decide
  whether to install systemd units.

[1] https://github.com/p11-glue/p11-kit/blob/0.26.5/NEWS#L164

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1923f760bbf8ac7ed43f90d2e7df33faebe9afb8)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...-setting-systemduserunitdir-to-break-depe.patch | 61 +++++++++++++++++++
 package/p11-kit/p11-kit.mk                         | 70 ++++++++++++----------
 2 files changed, 100 insertions(+), 31 deletions(-)

diff --git a/package/p11-kit/0001-meson-allow-setting-systemduserunitdir-to-break-depe.patch b/package/p11-kit/0001-meson-allow-setting-systemduserunitdir-to-break-depe.patch
new file mode 100644
index 0000000000..050bc3533b
--- /dev/null
+++ b/package/p11-kit/0001-meson-allow-setting-systemduserunitdir-to-break-depe.patch
@@ -0,0 +1,61 @@
+From 709e37f781e50ef981d337249c574a9255691665 Mon Sep 17 00:00:00 2001
+From: Fiona Klute <fiona.klute@gmx.de>
+Date: Sat, 17 Oct 2026 14:33:02 +0200
+Subject: [PATCH] meson: allow setting systemduserunitdir to break dependency
+ loop
+
+The dependency on systemd is only used to retrieve systemduserunitdir,
+not otherwise needed during build. However, p11-kit is also an
+(optional) dependency of systemd, creating a dependency loop.
+
+This patch allows setting systemduserunitdir directly to break the
+dependency loop. If set, the given value is used unconditionally
+without checking for systemd, otherwise systemd is detected as before.
+
+Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+Upstream: https://github.com/p11-glue/p11-kit/pull/788
+---
+ meson.build       | 11 ++++++++---
+ meson_options.txt |  4 ++++
+ 2 files changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 38cf81b..9e76d62 100644
+--- a/meson.build
++++ b/meson.build
+@@ -456,9 +456,14 @@ conf.set_quoted('TRUST_PATHS', trust_paths)
+ # systemd
+ 
+ with_systemd = false
+-systemd = dependency('systemd', required: get_option('systemd'))
+-if systemd.found()
+-  systemduserunitdir = systemd.get_variable(pkgconfig : 'systemduserunitdir')
++systemduserunitdir = get_option('systemduserunitdir')
++if systemduserunitdir == ''
++  systemd = dependency('systemd', required: get_option('systemd'))
++  if systemd.found()
++    systemduserunitdir = systemd.get_variable(pkgconfig : 'systemduserunitdir')
++    with_systemd = true
++  endif
++else
+   with_systemd = true
+ endif
+ 
+diff --git a/meson_options.txt b/meson_options.txt
+index c1f2362..a7c0553 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -46,6 +46,10 @@ option('systemd', type : 'feature',
+        value : 'auto',
+        description : 'Use systemd socket activation')
+ 
++option('systemduserunitdir', type : 'string',
++       value : '',
++       description : 'Override default location for systemd user units')
++
+ option('bashcompdir', type : 'string',
+        value : '',
+        description : 'Override default location for bash completion files')
+-- 
+2.55.0
+
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index b3bb3e1263..17efff7b16 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -7,57 +7,65 @@
 P11_KIT_VERSION = 0.26.5
 P11_KIT_SOURCE = p11-kit-$(P11_KIT_VERSION).tar.xz
 P11_KIT_SITE = https://github.com/p11-glue/p11-kit/releases/download/$(P11_KIT_VERSION)
+P11_KIT_DEPENDENCIES = host-pkgconf
 P11_KIT_INSTALL_STAGING = YES
-P11_KIT_CONF_OPTS = --disable-static
-P11_KIT_CONF_ENV = ac_cv_have_decl_program_invocation_short_name=yes \
-	ac_cv_have_decl___progname=no
 P11_KIT_LICENSE = BSD-3-Clause
 P11_KIT_LICENSE_FILES = COPYING
 P11_KIT_CPE_ID_VALID = YES
-# Needed because the pre-generated ./configure script has an old
-# broken expansion of AC_HEADER_STDBOOL, which incorrectly detects
-# that <stdbool.h> cannot be used, causing breakage down the road.
-P11_KIT_AUTORECONF = YES
-# Needed for autoreconf
-P11_KIT_DEPENDENCIES = host-pkgconf
+
+P11_KIT_CONF_OPTS = -Dtest=false
+
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+P11_KIT_CONF_OPTS += -Dnls=true
+P11_KIT_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
+else
+P11_KIT_CONF_OPTS += -Dnls=false
+endif
 
 ifeq ($(BR2_PACKAGE_LIBFFI),y)
 P11_KIT_DEPENDENCIES += host-pkgconf libffi
-P11_KIT_CONF_OPTS += --with-libffi
+P11_KIT_CONF_OPTS += -Dlibffi=enabled
 else
-P11_KIT_CONF_OPTS += --without-libffi
+P11_KIT_CONF_OPTS += -Dlibffi=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBTASN1),y)
-P11_KIT_DEPENDENCIES += host-pkgconf libtasn1
-P11_KIT_CONF_OPTS += \
-	--enable-trust-module \
-	--with-libtasn1
+# host-libtasn1 is needed to provide asn1Parser
+P11_KIT_DEPENDENCIES += host-pkgconf host-libtasn1 libtasn1
+P11_KIT_CONF_OPTS += -Dtrust_module=enabled
 ifeq ($(BR2_PACKAGE_CA_CERTIFICATES),y)
-P11_KIT_CONF_OPTS += --with-trust-paths=/etc/ssl/certs/ca-certificates.crt
+P11_KIT_CONF_OPTS += -Dtrust_paths=/etc/ssl/certs/ca-certificates.crt
 else
-P11_KIT_CONF_OPTS += --without-trust-paths
+P11_KIT_CONF_OPTS += -Dtrust_paths=
 endif
 else
+P11_KIT_CONF_OPTS += -Dtrust_module=disabled
+endif
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
 P11_KIT_CONF_OPTS += \
-	--disable-trust-module \
-	--without-libtasn1
+	-Dsystemd=enabled \
+	-Dsystemduserunitdir=/usr/lib/systemd/user
+else
+P11_KIT_CONF_OPTS += -Dsystemd=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-P11_KIT_CONF_OPTS += --with-systemd
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+P11_KIT_DEPENDENCIES += bash-completion
+P11_KIT_CONF_OPTS += -Dbash_completion=enabled
 else
-P11_KIT_CONF_OPTS += --without-systemd
+P11_KIT_CONF_OPTS += -Dbash_completion=disabled
 endif
 
 HOST_P11_KIT_DEPENDENCIES = host-pkgconf
-
 HOST_P11_KIT_CONF_OPTS = \
-	--without-libffi \
-	--without-trust-paths \
-	--disable-trust-module \
-	--without-libtasn1 \
-	--without-systemd
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+	-Dtest=false \
+	-Dnls=false \
+	-Dlibffi=disabled \
+	-Dtrust_paths= \
+	-Dtrust_module=disabled \
+	-Dsystemd=disabled \
+	-Dbash_completion=disabled
+
+$(eval $(meson-package))
+$(eval $(host-meson-package))

--===============1456200631610010597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1456200631610010597==--
