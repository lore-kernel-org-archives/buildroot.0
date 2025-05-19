Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CCDC3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 12:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 455DD803F9;
	Mon, 19 May 2025 12:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9BUbUG166gyZ; Mon, 19 May 2025 12:14:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51CFB81260
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51CFB81260;
	Mon, 19 May 2025 12:14:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0582D193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 12:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 712F1803F9
 for <buildroot@buildroot.org>; Mon, 19 May 2025 12:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6YpMbHUXKvDU for <buildroot@buildroot.org>;
 Mon, 19 May 2025 12:14:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F40948124A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F40948124A
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F40948124A
 for <buildroot@buildroot.org>; Mon, 19 May 2025 12:14:41 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.126.193]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MORAa-1ubRHn3ka6-00PP5g; Mon, 19
 May 2025 14:14:38 +0200
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 14:14:24 +0200
Message-ID: <20250519121425.1316837-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519121425.1316837-1-fiona.klute@gmx.de>
References: <20250519121425.1316837-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:v9vJwWfRG2xxudAuc8ZN/CH/otfI+P9ppFFC1YR+fWr7J7yrrUP
 3V5kEgN0QFUtkNsHLx91+UrGwOyYSNnUP9mfB+v2tbB51CgWCff37Dwn3aAi4FcWQhxHj1b
 rFT33fbzmKQH3aaMl5tBFcR6QjKVquJvapQ7GJt+5a+HwdcMCmlxaFkau/H4/oavvRFOxOC
 naRQs62j09ZzkKG5Q5Hxw==
UI-OutboundReport: notjunk:1;M01:P0:ecPzcIcwDR8=;MnuYIB+TczIH6uX9VlkTqiU+Twv
 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
 wo3MPQn9v73pRTpz4tIV7f2aG+ppPwj8+5
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1747656878; x=1748261678; i=fiona.klute@gmx.de;
 bh=4GGYQl/19mtqDrU0SRCPOw5kKLAClOTWUrY5Im8haMo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=AI2hgAalO9qkX6TSs8FB8bHbzrcmdsPMHkblrjB3vo5TdpKkfH3hRtnAqAJlrus8
 RgKXtrCn7K7Wx9LhEM2DNnMkn8pJnXCHb+6krIsB5mgmoTyZiyx9/JUpaOmXLf076
 S4LEBhaTMzj7CCcdFKoUuw1asdBf4IorVTPx/eepPCEO57eQyNxQbE0301L5nJ0x4
 5tW8ueO6JOq4/cqftv4gQtIofv2YEZeUgLqFK9bLQMuOVUDBKHhymMujj4FoinMhV
 i8mn9zFHeT3kVQskfJwOXmpD65FgIr2x83RqFvmU6Gmysd9xPR3vTJMgkfHH9ghS3
 ybU0hBFh5M+UHCXWoQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=AI2hgAal
Subject: [Buildroot] [PATCH v5 3/4] package/gobject-introspection: bump
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
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

GOI now has a build option to disable tests [1], so use that and drop
the "disable tests" patch.

Meson now checks LD_LIBRARY_PATH during configure and sets the result
when calling g-ir-scanner [2]. This means overriding it in _NINJA_ENV
does not work any more, set LD_LIBRARY_PATH in _CONF_ENV instead.

The hash for giscanner/scannerlexer.l changed due to small code
additions.

Upstream changelog:
https://gitlab.gnome.org/GNOME/gobject-introspection/-/blob/1.84.0/NEWS?ref_type=tags

[1] https://gitlab.gnome.org/GNOME/gobject-introspection/-/commit/3e41addbd0f22024f63cc9c3fbef04ca16f05364
[2] https://gitlab.gnome.org/GNOME/gobject-introspection/-/commit/d3f684559facd0edc368e3ac6db95b16e28ed743

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v3 -> v4:
* Fix LD_LIBRARY_PATH for g-ir-scanner

 .checkpackageignore                           |  3 +-
 ...> 0001-Add-rpath-links-to-ccompiler.patch} |  0
 .../0001-disable-tests.patch                  | 34 -------------------
 .../gobject-introspection.hash                |  6 ++--
 .../gobject-introspection.mk                  | 13 ++++---
 5 files changed, 13 insertions(+), 43 deletions(-)
 rename package/gobject-introspection/{0002-Add-rpath-links-to-ccompiler.patch => 0001-Add-rpath-links-to-ccompiler.patch} (100%)
 delete mode 100644 package/gobject-introspection/0001-disable-tests.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index fe736e3185..78db0350c0 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -521,8 +521,7 @@ package/gnupg/0001-build-Always-use-EXTERN_UNLESS_MAIN_MODULE-pattern.patch lib_
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
index eb46fb61c1..dbf0ee3fa8 100644
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
@@ -40,7 +40,9 @@ GOBJECT_INTROSPECTION_NINJA_ENV += \
 # .gir and .typelib files. g-ir-scanner does not use LDFLAGS, and by default,
 # links to the system-installed libglib2 path. To remedy this issue, defining
 # LD_LIBRARY_PATH forces g-ir-scanner to use our host installed libglib2 files.
-HOST_GOBJECT_INTROSPECTION_NINJA_ENV += \
+# As of gobject-introspection version 1.84.0, Meson records the
+# LD_LIBRARY_PATH set during config and passes it to g-ir-scanner.
+HOST_GOBJECT_INTROSPECTION_CONF_ENV = \
 	LD_LIBRARY_PATH="$(if $(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)$(HOST_DIR)/lib"
 
 # Use the host gi-scanner to prevent the scanner from generating incorrect
@@ -51,13 +53,16 @@ GOBJECT_INTROSPECTION_CONF_OPTS = \
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
 	GI_SCANNER_DISABLE_CACHE=1
 
-HOST_GOBJECT_INTROSPECTION_CONF_ENV = \
+HOST_GOBJECT_INTROSPECTION_CONF_ENV += \
 	GI_SCANNER_DISABLE_CACHE=1
 
 # Make sure g-ir-tool-template uses the host python.
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
