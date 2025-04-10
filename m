Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65256C369A6
	for <buildroot@archiver.kernel.org>; Thu, 10 Apr 2025 13:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAC4240DE0;
	Thu, 10 Apr 2025 13:49:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XDfrIjp82IJ7; Thu, 10 Apr 2025 13:49:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6721414ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6721414ED;
	Thu, 10 Apr 2025 13:49:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AC3C2108
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 13:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8ECC760D80
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 13:49:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MIvDUSupm91R for <buildroot@buildroot.org>;
 Thu, 10 Apr 2025 13:49:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 366B36077E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 366B36077E
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 366B36077E
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 13:49:40 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.125.230]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKbkM-1tmIH839HY-00QdTf; Thu, 10
 Apr 2025 15:49:38 +0200
To: buildroot@buildroot.org
Date: Thu, 10 Apr 2025 15:49:13 +0200
Message-ID: <20250410134914.916804-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410134914.916804-1-fiona.klute@gmx.de>
References: <20250410134914.916804-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:itYU31FxbfUtj5y8lLJicDMSrANsPnVPRPwqd7pg47KXBSK3mjd
 TBStYu02HTu7zvgaYXbB0SXBozL4q9xXjpKW+KehfZrE3kQE9U2bKuqe9HyKam85mGZ0Sqk
 44uZjERgTa8GPQBUsjISxa5+nGG+5g58Tc36UIeht+IwESs+rilRHU2JEShKApj/DQNfQZN
 tCQVii+5kf1p9XtM2MHrQ==
UI-OutboundReport: notjunk:1;M01:P0:68XOldGO83I=;k7lX+JjtU0p24SWQ5xsFtBe65w1
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1744292979; x=1744897779; i=fiona.klute@gmx.de;
 bh=+/KVb2nAvEtCxfPzM0JNV+e/5lbuvetWpmMjQjzhXHI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ZY/5BbZVXPBxE1obYcVyW85zb6GGTE55so6Nh3vUkYvjkwjVdcjJ3Hc2CF0dBJLy
 RJIohF4mxPED0JEyyL+wR6Cz0CQhgB+6nPcWmVb3r/BgyaeJNPpH1yKcbXuTF+0Pk
 ogyHAorktg7DszPTjC/8b9Lt7G/QVhox/oPfAZXPvweM7WxsGxSEg7fCX0BF/KSJY
 32rqDTwEKWfVfJicFqb+NNPnMLeD0RuLEKI4+lqu42MGL76a6QaFqbCWufNkg6Bv2
 8+4usUInHY/N06at6tGc6XCNLEXYITMzfzPC0MspsTkrSc7PFx6t5TwPBjT8ZooIu
 jz7YujQYPW7mcqpa5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=ZY/5BbZV
Subject: [Buildroot] [PATCH v3 3/4] package/gobject-introspection: bump
 version to 1.84.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

GOI now has a build option to disable tests [1], so use that and drop
the "disable tests" patch. Hash for giscanner/scannerlexer.l changed
due to small code additions.

Upstream changelog:
https://gitlab.gnome.org/GNOME/gobject-introspection/-/blob/1.84.0/NEWS?ref_type=tags

[1] https://gitlab.gnome.org/GNOME/gobject-introspection/-/commit/3e41addbd0f22024f63cc9c3fbef04ca16f05364

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 .checkpackageignore                           |  3 +-
 ...> 0001-Add-rpath-links-to-ccompiler.patch} |  0
 .../0001-disable-tests.patch                  | 34 -------------------
 .../gobject-introspection.hash                |  6 ++--
 .../gobject-introspection.mk                  |  7 ++--
 5 files changed, 9 insertions(+), 41 deletions(-)
 rename package/gobject-introspection/{0002-Add-rpath-links-to-ccompiler.patch => 0001-Add-rpath-links-to-ccompiler.patch} (100%)
 delete mode 100644 package/gobject-introspection/0001-disable-tests.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 4c7834f20f..2f9c65c8a3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -523,8 +523,7 @@ package/gnupg/0001-build-Always-use-EXTERN_UNLESS_MAIN_MODULE-pattern.patch lib_
 package/gnuplot/0001-configure-add-without-demo-option.patch lib_patch.Upstream
 package/go/go-src/0001-build.go-explicit-option-for-crosscompilation.patch lib_patch.Upstream
 package/gob2/0001-dont-include-from-prefix.patch lib_patch.Upstream
-package/gobject-introspection/0001-disable-tests.patch lib_patch.Upstream
-package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch lib_patch.Upstream
+package/gobject-introspection/0001-Add-rpath-links-to-ccompiler.patch lib_patch.Upstream
 package/gpsd/S50gpsd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch lib_patch.Upstream
 package/graphite2/0001-don-t-install-a-libtool-file-with-static-library.patch lib_patch.Upstream
diff --git a/package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch b/package/gobject-introspection/0001-Add-rpath-links-to-ccompiler.patch
similarity index 100%
rename from package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch
rename to package/gobject-introspection/0001-Add-rpath-links-to-ccompiler.patch
diff --git a/package/gobject-introspection/0001-disable-tests.patch b/package/gobject-introspection/0001-disable-tests.patch
deleted file mode 100644
index a39f51617b..0000000000
--- a/package/gobject-introspection/0001-disable-tests.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From c87faf380ddf44da9d624dabd28178c9065f0f76 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Mon, 3 Feb 2020 10:07:15 -0800
-Subject: [PATCH] disable tests
-
-If introspection data on the host is not built, meson throws the error:
-"Unknown variable "typelibs". Because tests are not required, removing
-the subdir tests altogether fixes this issue.
-
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- meson.build | 6 ------
- 1 file changed, 6 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index c2cb577f..65ce7adf 100644
---- a/meson.build
-+++ b/meson.build
-@@ -237,12 +237,6 @@ else
- endif
- subdir('docs')
- 
--# The tests will also run, which is not possible if they
--# were built for a different architecture.
--if not meson.is_cross_build()
--  subdir('tests')
--endif
--
- install_data('Makefile.introspection', install_dir: join_paths(get_option('datadir'), 'gobject-introspection-1.0'))
- install_data('m4/introspection.m4', install_dir: join_paths(get_option('datadir'), 'aclocal'))
- 
--- 
-2.25.1
-
diff --git a/package/gobject-introspection/gobject-introspection.hash b/package/gobject-introspection/gobject-introspection.hash
index c39c06d102..044216c65f 100644
--- a/package/gobject-introspection/gobject-introspection.hash
+++ b/package/gobject-introspection/gobject-introspection.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gobject-introspection/1.82/gobject-introspection-1.82.0.sha256sum
-sha256  0f5a4c1908424bf26bc41e9361168c363685080fbdb87a196c891c8401ca2f09  gobject-introspection-1.82.0.tar.xz
+# From https://download.gnome.org/sources/gobject-introspection/1.84/gobject-introspection-1.84.0.sha256sum
+sha256  945b57da7ec262e5c266b89e091d14be800cc424277d82a02872b7d794a84779  gobject-introspection-1.84.0.tar.xz
 sha256  faa2e414bd5f91d2d2c39e85c7cc3f2ccde05c3306f96b404f8ed8cf0266c279  COPYING.LGPL
 sha256  4c1cedcbb4a12ea964f1160dbbf36099e5a59b96129a99a1a1a61f2cb09271fb  COPYING.GPL
-sha256  fb538e24d22de4f8dab6b48b862be84469bcc089e1cf98f6f46d6f74f6f44655  giscanner/scannerlexer.l
+sha256  60cf20b6532aa2f5622f753a55672630b789c04174acca361033e6f1ad29f8ab  giscanner/scannerlexer.l
diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index eb46fb61c1..12e527378f 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.82
+GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.84
 GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).0
 GOBJECT_INTROSPECTION_SITE = https://download.gnome.org/sources/gobject-introspection/$(GOBJECT_INTROSPECTION_VERSION_MAJOR)
 GOBJECT_INTROSPECTION_SOURCE = gobject-introspection-$(GOBJECT_INTROSPECTION_VERSION).tar.xz
@@ -51,7 +51,10 @@ GOBJECT_INTROSPECTION_CONF_OPTS = \
 	-Dgi_cross_ldd_wrapper="$(STAGING_DIR)/usr/bin/g-ir-scanner-lddwrapper" \
 	-Dbuild_introspection_data=true \
 	-Ddoctool=disabled \
-	-Dcairo=disabled
+	-Dcairo=disabled \
+	-Dtests=false
+
+HOST_GOBJECT_INTROSPECTION_CONF_OPTS = -Dtests=false
 
 # GI_SCANNER_DISABLE_CACHE=1 prevents g-ir-scanner from writing cache data to ${HOME}
 GOBJECT_INTROSPECTION_CONF_ENV = \
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
