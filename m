Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE97C25B07
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 16:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3169440241;
	Wed,  3 Aug 2022 16:29:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3169440241
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nTRy6yWKjecE; Wed,  3 Aug 2022 16:29:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8F5D40262;
	Wed,  3 Aug 2022 16:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8F5D40262
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B0FF41BF3D5
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42191828A9
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:29:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42191828A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jrRLqQIgJSLd for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 16:29:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A433F82897
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A433F82897
 for <buildroot@busybox.net>; Wed,  3 Aug 2022 16:29:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7E34D1BF208;
 Wed,  3 Aug 2022 16:29:31 +0000 (UTC)
Date: Wed, 3 Aug 2022 18:29:29 +0200
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20220803182929.6453d096@windsurf>
In-Reply-To: <20220803093754.19637-1-guillaume.bressaix@gmail.com>
References: <20220803093754.19637-1-guillaume.bressaix@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659544172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T3Qx3l9i/yGPqOzIDlPgZBgtZV6VgEDyMyt3cOHtmU0=;
 b=kUPO9yBggn23k/EjiJvtxTKc7PgJP5CBqoT75qLxF6Bu2q0xp97YFWYf4Rk9o/Do8vPXJC
 0zeNrOmEFXCfuqkpECB4RxePZbpQJ60/1BPPmIH6CBv0AdLiR0SgTD6dwxQBxs1pO/fqLy
 2Nqljxu1ZbBVYDMP220kbOfl7bRem7o8hRjSQhqEtuUbvSCFlhnKbFgVPIuT3G7iU5GUTe
 wlB4ulZWoHbf+/zu3l1cy2EjYU9cllgx3V3YI7q9TgnWU7hl3QkD6/PVxae5FazlU81l8F
 0QYo8ZPr0K8eCsKCaTHGTvrpg/5oUPuheceu+Jm3N7h0du48wqGDnCVUld6wgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kUPO9yBg
Subject: Re: [Buildroot] [RFC 1/1] package/python-scipy: bump version to
 1.9.0
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed,  3 Aug 2022 11:37:54 +0200
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> My current setup has pretty much everything figured out, but meson
> does not locate the fortran cross-compiler. Could anyone help me?
> 
> output/build/python-scipy-v1.9.0/meson.build:41:0: ERROR: 'fortran' compiler binary not defined in cross or native file

Try this:

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 156b005fdd..a9bbb130a0 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -76,6 +76,7 @@ define PKG_MESON_CROSSCONFIG_SED
         -e "s%@TARGET_CC@%$(TARGET_CC)%g" \
         -e "s%@TARGET_CXX@%$(TARGET_CXX)%g" \
         -e "s%@TARGET_AR@%$(TARGET_AR)%g" \
+        -e "s%@TARGET_FC@%$(TARGET_FC)%g" \
         -e "s%@TARGET_STRIP@%$(TARGET_STRIP)%g" \
         -e "s%@TARGET_ARCH@%$(PKG_MESON_TARGET_CPU_FAMILY)%g" \
         -e "s%@TARGET_CPU@%$(GCC_TARGET_CPU)%g" \
@@ -83,6 +84,7 @@ define PKG_MESON_CROSSCONFIG_SED
         -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$($(strip $(1))))%g" \
         -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$($(strip $(3))))%g" \
         -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$($(strip $(2))))%g" \
+        -e "s%@TARGET_FCFLAGS@%$(call make-sq-comma-list,$($(strip $(2))))%g" \
         -e "s%@BR2_CMAKE@%$(BR2_CMAKE)%g" \
         -e "s%@PKGCONF_HOST_BINARY@%$(HOST_DIR)/bin/pkgconf%g" \
         -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
diff --git a/support/misc/cross-compilation.conf.in b/support/misc/cross-compilation.conf.in
index 235e5a8495..7053df472b 100644
--- a/support/misc/cross-compilation.conf.in
+++ b/support/misc/cross-compilation.conf.in
@@ -9,6 +9,7 @@ cpp = '@TARGET_CXX@'
 ar = '@TARGET_AR@'
 strip = '@TARGET_STRIP@'
 cmake = '@BR2_CMAKE@'
+fortran = '@TARGET_FC@'
 pkgconfig = '@PKGCONF_HOST_BINARY@'
 g-ir-compiler = '@STAGING_DIR@/usr/bin/g-ir-compiler'
 g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'
@@ -18,6 +19,8 @@ c_args = [@TARGET_CFLAGS@]
 c_link_args = [@TARGET_LDFLAGS@]
 cpp_args = [@TARGET_CXXFLAGS@]
 cpp_link_args = [@TARGET_LDFLAGS@]
+fortran_args = [@TARGET_FCFLAGS@]
+fortran_link_args = [@TARGET_LDFLAGS@]
 wrap_mode = 'nodownload'
 cmake_prefix_path = '@STAGING_DIR@/usr/lib/cmake'
 
It solves the fortran not found issue, and it now finds the Fortran
compiler:

Fortran compiler for the host machine: /home/thomas/buildroot/buildroot/output/host/bin/aarch64-linux-gfortran (gcc 10.3.0 "GNU Fortran (Buildroot toolchains.bootlin.com-2021.11-1) 10.3.0")
Fortran linker for the host machine: /home/thomas/buildroot/buildroot/output/host/bin/aarch64-linux-gfortran ld.bfd 2.36.1

However, it still fails later with:

output/build/python-scipy-v1.9.0/scipy/meson.build:70:0: ERROR: Include dir /home/thomas/buildroot/buildroot/output/host/aarch64-buildroot-linux-gnu/include does not exist.

An error that I have not investigated.

> -PYTHON_SCIPY_VERSION = 1.8.1
> -PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.xz
> -PYTHON_SCIPY_SITE = https://github.com/scipy/scipy/releases/download/v$(PYTHON_SCIPY_VERSION)
> +PYTHON_SCIPY_VERSION = v1.9.0
> +PYTHON_SCIPY_SITE_METHOD = git
> +PYTHON_SCIPY_SITE = https://github.com/scipy/scipy.git
> +PYTHON_SCIPY_GIT_SUBMODULES = YES

Why not keep the tarball download? They have a tarball of the 1.9.0
release at
https://github.com/scipy/scipy/releases/download/v1.9.0/scipy-1.9.0.tar.gz

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
