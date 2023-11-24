Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA2EC61DF4
	for <buildroot@archiver.kernel.org>; Fri, 24 Nov 2023 16:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDDE1421F5;
	Fri, 24 Nov 2023 16:16:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDDE1421F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ScbJCwVOcw3P; Fri, 24 Nov 2023 16:16:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3739421F1;
	Fri, 24 Nov 2023 16:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3739421F1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F82C1BF29A
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 16:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0769141A7F
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 16:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0769141A7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X9gRn3pxUbtx for <buildroot@lists.busybox.net>;
 Fri, 24 Nov 2023 16:16:09 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78A0141A79
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 16:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78A0141A79
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40b36339549so13376405e9.1
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 08:16:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700842567; x=1701447367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wFtKL2P5YI0it9Om+nCSPKBf+N+aw2JqldAArzhBqGk=;
 b=mTbPgLdmjrMbr5nb3+Q5xxLVmlEbb4bq1MYqNzXWQ7jA2qawWSEXkq/C66u3eYc5XR
 aJyL7//wuRgnbbi6IHfjAnIOrrJuOVohkVNSDhq59G1gPtgJOW9sLKEFQTGGHpmUAvu/
 r3CFu1bZ7K5UDuUlQBOnAu60/NMZHg1cbsmH+mlDXn9bnGJZZjsFVquy//3su/2eCpyO
 MO1QwGOcsxnm42V0L9rMNmodxJ8a4YPo94s+YKd/aUNR3MMPZWKzScfcdm2Y9rHlZifm
 rxxfUBfg1Qfobt8R6YNQcSdoQ/K0meWrUtcJ7W6K3u3mo1JcJSiGEpF5tNecMlgliLAk
 L0yw==
X-Gm-Message-State: AOJu0Yxd5MuvRv/Po5RE3nonlp12rbFf5jK0TTSufy2hhJtbfCT+GbEg
 yDMxcxBPF+xx7HpCa5xK/keB4JJE198kMVliaSkbXQ+8
X-Google-Smtp-Source: AGHT+IF5xcqxnQN0CQFkPugQBr/wMKG5v3mHP3pwhuIDmQtqDpEvtuPvfDXyqvwuBYYxRIeoP2WHVw==
X-Received: by 2002:a05:600c:35d5:b0:401:bcd9:4871 with SMTP id
 r21-20020a05600c35d500b00401bcd94871mr3140096wmq.21.1700842567114; 
 Fri, 24 Nov 2023 08:16:07 -0800 (PST)
Received: from P-NAN-KHNOUM.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 fm20-20020a05600c0c1400b0040b297fce5fsm6147325wmb.10.2023.11.24.08.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 08:16:06 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 17:15:18 +0100
Message-Id: <20231124161523.215078-3-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231124161523.215078-1-antoine.coutant@smile.fr>
References: <20231124161523.215078-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700842567; x=1701447367;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wFtKL2P5YI0it9Om+nCSPKBf+N+aw2JqldAArzhBqGk=;
 b=Islxh583WEW7/kwA0TBUjeCDA6pm91RTX4Y72HPopvOivK0c05Q1hIQ3SmS+CiheEv
 J/hkC4CqM9Jq2Z3/HY6oM7qzkxWMCeBLJVPYDazPJfUDSHGn4svGCyvdoKaqBtpQ8CLX
 X47DrJB+t44aPIR4N7BEKweEU0PVNtTICt4Xz0+Ae+TZUHoGWeV0OkViPmD4XaIkGw6n
 n5fkdvMAbUT+8wPGHKO+NhRVw8NfuYhcdpTc1ADg5BHZ3Q22iKWqrPz7o3//EqxQ/v8u
 SvLeLwgDlVQ4L+Ckh1DYjXT2i5/GqVCXLfBi4pCqF17z0odPu9Z38ziJFbGG8qb2aa6w
 uZUA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Islxh583
Subject: [Buildroot] [[DO NOT MERGE] v3 2/7] package/pkg-meson.mk: add rust
 cross-compiler support
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>,
 Antoine Coutant <antoine.coutant@smile.fr>, romain.naour@smile.fr,
 bernd@kuhls.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Romain Naour <romain.naour@smile.fr>

This change is needed to be able to build target packages requiring
rust. If a package has rust in its project or in an add_language()
call in their meson.build file, meson will try to find a suitable
compiler for this language[1]. If the language is classified as
required but not found, it will abort the build.

It is necessary to specify rust and rust_ld separately in
support/misc/cross-compilation.conf.in. If you specify it in one line
just as "rust", it will generate the following warning:
    WARNING: Please do not put -C linker= in your compiler command,
    set rust_ld=command in your cross file or use the RUST_LD environment
    variable, otherwise meson will override your selection.

[1] https://mesonbuild.com/Reference-manual_functions.html#add_languages

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
 package/pkg-meson.mk                   | 13 +++++++++++++
 support/misc/cross-compilation.conf.in |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 65cabf23ba..25dd4f0d7f 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -82,6 +82,16 @@ else
 PKG_MESON_TARGET_FC = /bin/false
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_RUSTC),y)
+PKG_MESON_TARGET_RUSTC = $(HOST_DIR)/bin/rustc
+PKG_MESON_TARGET_RUSTC_LINKER = $(notdir $(TARGET_CROSS))gcc
+PKG_MESON_TARGET_RUSTC_TARGET_NAME = $(RUSTC_TARGET_NAME)
+else
+PKG_MESON_TARGET_RUSTC = /bin/false
+PKG_MESON_TARGET_RUSTC_LINKER = /bin/false
+PKG_MESON_TARGET_RUSTC_TARGET_NAME =
+endif
+
 # Generates sed patterns for patching the cross-compilation.conf template,
 # since Flags might contain commas the arguments are passed indirectly by
 # variable name (stripped to deal with whitespaces).
@@ -91,6 +101,7 @@ define PKG_MESON_CROSSCONFIG_SED
         -e "s%@TARGET_CXX@%$(PKG_MESON_TARGET_CXX)%g" \
         -e "s%@TARGET_AR@%$(TARGET_AR)%g" \
         -e "s%@TARGET_FC@%$(PKG_MESON_TARGET_FC)%g" \
+        -e "s%@TARGET_RUSTC@%$(PKG_MESON_TARGET_RUSTC)%g" \
         -e "s%@TARGET_STRIP@%$(TARGET_STRIP)%g" \
         -e "s%@TARGET_ARCH@%$(PKG_MESON_TARGET_CPU_FAMILY)%g" \
         -e "s%@TARGET_CPU@%$(GCC_TARGET_CPU)%g" \
@@ -99,6 +110,8 @@ define PKG_MESON_CROSSCONFIG_SED
         -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$($(strip $(1))))%g" \
         -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$($(strip $(3))))%g" \
         -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$($(strip $(2))))%g" \
+        -e "s%@TARGET_RUSTC_LINKER@%$(PKG_MESON_TARGET_RUSTC_LINKER)%g" \
+        -e "s%@RUSTC_TARGET_NAME@%$(PKG_MESON_TARGET_RUSTC_TARGET_NAME)%g" \
         -e "s%@BR2_CMAKE@%$(BR2_CMAKE)%g" \
         -e "s%@PKGCONF_HOST_BINARY@%$(HOST_DIR)/bin/pkgconf%g" \
         -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
diff --git a/support/misc/cross-compilation.conf.in b/support/misc/cross-compilation.conf.in
index 7053df472b..3c5812b131 100644
--- a/support/misc/cross-compilation.conf.in
+++ b/support/misc/cross-compilation.conf.in
@@ -13,6 +13,8 @@ fortran = '@TARGET_FC@'
 pkgconfig = '@PKGCONF_HOST_BINARY@'
 g-ir-compiler = '@STAGING_DIR@/usr/bin/g-ir-compiler'
 g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'
+rust = ['@TARGET_RUSTC@', '--target', '@RUSTC_TARGET_NAME@' ]
+rust_ld = '@TARGET_RUSTC_LINKER@'
 
 [built-in options]
 c_args = [@TARGET_CFLAGS@]
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
