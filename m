Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1047EC3DA6D
	for <buildroot@archiver.kernel.org>; Fri, 23 May 2025 12:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48A324045B;
	Fri, 23 May 2025 12:15:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zEQvxJB8owe5; Fri, 23 May 2025 12:15:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71A3240E40
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71A3240E40;
	Fri, 23 May 2025 12:15:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A35DCA
 for <buildroot@buildroot.org>; Fri, 23 May 2025 12:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0114E40D84
 for <buildroot@buildroot.org>; Fri, 23 May 2025 12:15:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RUYTECLGwKR6 for <buildroot@buildroot.org>;
 Fri, 23 May 2025 12:15:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9A5C140D50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A5C140D50
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A5C140D50
 for <buildroot@buildroot.org>; Fri, 23 May 2025 12:15:42 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.115.30]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgNcz-1urWHU1THL-00ej3f; Fri, 23
 May 2025 14:15:39 +0200
To: buildroot@buildroot.org
Date: Fri, 23 May 2025 14:15:20 +0200
Message-ID: <20250523121521.380704-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523121521.380704-1-fiona.klute@gmx.de>
References: <20250523121521.380704-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Bn28meJsFVvEzKlMmSG11w6ZdaF7IQ88JJrR27sMW7Le5oysTX2
 w2uAuhQ59izBB/OViU5Q2q4EIq9QmQryT5uvzG8iD0wLB86FcyRA7pZtZ0pj3teSNeFSx6M
 jXC+QgE2DZgeU2NYE9EpBGa35YdpUn2f7C6T3YbWXbSs+09yYaiFhST6DHZvJfoAxYxl871
 1s/Q0fvMSG6Wg3K57KAhg==
UI-OutboundReport: notjunk:1;M01:P0:EmjdIg/pDG4=;zPtsbEj9ZXw0ofOwEc/lsfCYJ1I
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1748002539; x=1748607339; i=fiona.klute@gmx.de;
 bh=4GGYQl/19mtqDrU0SRCPOw5kKLAClOTWUrY5Im8haMo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=srk9rSQ4/YU0LqYAmNFs807Z7t1IEjD+DvRe+xSBKY1XYGHbZnIH36lzeLXDNAqx
 1I9jTITkQ8PL5+IO0N80qGze9HjjR4hWKDLZ3bEudHjwcFO7QQUtiervM+3CU1d9k
 5GGYk78sBo4TAdCa9dD+Zpn/V5ZZ1hm4iNfDr82EUNN5LVmjAQYqaqppXdbI+d+kK
 WxeJJ3IewnQ/oOT2e9EXW8CaYL2vfsR6zLE+qCoOVdn0SsbgsuVHP6jXafat0+9mC
 NyFRHgEZeTEMFBFmr1WUc4cK8wT6lxuvp5J8BQnGOFckqqoCzQLB/GRAT7Yfd5gp7
 dKlvR3hebMjPD6+jAQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=srk9rSQ4
Subject: [Buildroot] [PATCH v6 3/4] package/gobject-introspection: bump
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
