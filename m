Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B07C36010
	for <buildroot@archiver.kernel.org>; Thu, 27 Mar 2025 11:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A51242EE1;
	Thu, 27 Mar 2025 11:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJtF2ihir6u5; Thu, 27 Mar 2025 11:58:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A7FF42EEF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A7FF42EEF;
	Thu, 27 Mar 2025 11:58:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BB20612A
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 11:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1E726059F
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 11:58:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iuo4ApqKEXk7 for <buildroot@buildroot.org>;
 Thu, 27 Mar 2025 11:58:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2195B6FC11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2195B6FC11
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2195B6FC11
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 11:58:28 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.122.102]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9Wuk-1u138X3GGC-00Binm; Thu, 27
 Mar 2025 12:58:25 +0100
To: buildroot@buildroot.org
Date: Thu, 27 Mar 2025 12:58:04 +0100
Message-ID: <20250327115804.3162110-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250327115804.3162110-1-fiona.klute@gmx.de>
References: <20250327115804.3162110-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:648ldZQC3LacMXi0cdbsev3yeAM0rVXKlj0CfdNdY1tGvhbomK6
 tug8VhK2eFkGcmZ0WnbjRkEiFnF3YeY676yn5VG5iIa0WXdwf56oJt5zmSAwZ0/8T37Y6VN
 eyZHdXxHCpQJ7LaLNPEAVnNeXA/wyMO9ZNoT6+5SCHDvv7gqMeZUG8+c3dj8GUvQImjmM9e
 4ltCbY3wzOA5CxTth3sKA==
UI-OutboundReport: notjunk:1;M01:P0:AQkOo7Q3uRc=;xsqr5k0W+NrernkOA3sOJRoqDy5
 ukbL+byPJgm06XzFbvqoedkVCqwvBHqHEJ6bEdLGPu1ePbC9HWk9rRIJsPmn7TWgZqjMHIpHh
 2nIjo7fMOp4r0YYPdHPqaW1EqoJgQTc5CrnmC8XGeunXG0CCvtJ1zSUjMjOtKqCjN4w/K63GT
 9GlTq2/vI0rZXnBrUEiUslf9wsxbeXgYh+3MRlJ0duzZwxUdgDmDWJeYutw3eqnyitSKcm5eV
 wrUStGO3/UNCjjEnaeS82gDILn+lkOrzkf+g7iUNWtSeRE+8gkfR1wqkO5nPRiQBP0Ff8S9zx
 fZKV2M0HOajBBzYAN2aNk38PoNOijIFzCk6oBcfLiy2A2lQUEztBZMXhtcMokclyga/NOUQzN
 yfJ6SUeX1sMGYyPDGmAfjtLBcUVpLd5MixVRhZL4rbM8ab5IGEWqpmwZIxAyq0qv5b7Cs9UPk
 od2l/CDdI64mkCZ3iAzGtYx3TzbIQwY3mjCoVDERZur7kzrmHiTIHvxP+i75QW3zI2u4Yy2X5
 H/wQWNV+kMwPU76wVieLrI91bldzlPOwdxXI4flnjpsN+SebxA0xAPvb5qqbXA6aN4hQ4nShC
 lDAsswiwYlKUWG3jWghFhjjli/GjFzj+liobNjt/SW6hJ7KGxEFAvoOcwzOVpaF8sKx7DEHuO
 QTP6ncI2AdwQbNuacIyi/6r5A95eh6EodHtEiEn65trCp3RFsXW4xIKQTqBh3FBkH7og/kmvm
 MHxGAib45r+tJ2F1O/HsbSRs7Yc5REMzdjuaDGA+MWar4vlAiw8JmsgYy3HC5qL79g7wHqzzv
 AytOkkTEDEr1CfqbeXQadB+E1jZsW9iE1Cy8thATtKGVC1GxMYJF8AaiCyNCM6c8bIXEgYXaO
 edoVeK5rDXxsVlS4FCCBJI95sHCqhYz4xiVBY62++LsVTioOZY0gSXVBuc0g2ZG37pHPKFIzh
 Bq++t0m6BENTSI1q5oTiSx3UYhJFBZbCKVCqa6h1Xtx7Jh9711VbqcTCDcEyqtiC0iRRFkTgY
 jeY1sIEU2MU+uqB0g/kkoXKzv21i6vr9JYIdHzmamg+Z9N8a5m0IFLs/Zz2uHVvcWNNJ/Yq6u
 h2hBBIzMwtBLhO5nvxh2zLj7Ms3LejJa8j6D1wsnI/vfF6IzC1yGTgxC32K5cg7sxQCqngDfc
 2V/01UZMeAA8kKSKT3fTG39miByNVJQ1EKTafZ0N8EmgOM1OivBYqUOQ7xMBYTnLzJoUzWN1q
 hSUPuUxEqxHBtS0GlLS7gskMKQchVjXxKpiuRa0T94fcLOURslXACAhS0YH/yVCCJQ7kfkQZQ
 MFxvC/lygQguOD2ImIyLmS8SxtnydbUBWQhC08FNSoFRMdYkXGgy6W13inUPnyHMtSHFNspGu
 CROfft21zyOBwjY72ZncNQcWKQUPt0B/AKE/3mpuw9rzguMAjoTiCRqoA6h3V2ArJZStwPvU4
 U9a+FM4KJA8qt/+N85WkZ583YZetqliPGth/1kNJiRJLrsOUR
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1743076706; x=1743681506; i=fiona.klute@gmx.de;
 bh=W7UeKEUCXsIJu0VPa7Hre0oeplj40DnULw+/Wq1rPPc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=dOPiuyhNFcVphhXs4oLnM4xVO1uwtog6D80AgIp+QgCNFTrJ4E0dfrQ0lDluHCoC
 bmG9VrX3fO+cx0c41p1vq+gbog1HY2dL1EFm6LGZov92QtxY9TEKjxeTudNyLARI2
 DncnSjFk2N4pidc9iZcLGk9kAb87V8/726xtBCceDeeVDEOJ5KubmF/ySMMNPBabL
 DbzQWqsP5G/lOBFHQ3XIDzJhpIGar4f7GvTs2+pTik3U88e7PCy5dgMKUCaqXMBK2
 c/9QGsq8UMzsBdACvYyMNgthQ1lbRGLSnKhyRcuPkbgIpK9DF6rEIy0SJtZ/VFHFK
 TfCtfV675ph1iJa1MA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=dOPiuyhN
Subject: [Buildroot] [PATCH 3/3] package/gobject-introspection: bump version
 to 1.84.0
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
index 260168b0e8..17c43229fe 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -525,8 +525,7 @@ package/gnupg/0001-build-Always-use-EXTERN_UNLESS_MAIN_MODULE-pattern.patch lib_
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
