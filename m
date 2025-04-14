Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10270C369B4
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 16:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A250282BEB;
	Mon, 14 Apr 2025 16:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IEDObAAxe0Sy; Mon, 14 Apr 2025 16:16:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B26CE81EBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B26CE81EBF;
	Mon, 14 Apr 2025 16:16:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 448D3108
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 16:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35E6E40E04
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 16:16:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4pUcDZ4ECC96 for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 16:16:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 73ECC40DC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73ECC40DC2
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73ECC40DC2
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 16:16:06 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.122.10]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MzQkK-1t9Lym19iC-00xdu5; Mon, 14
 Apr 2025 18:16:04 +0200
To: buildroot@buildroot.org
Date: Mon, 14 Apr 2025 18:15:44 +0200
Message-ID: <20250414161545.2863615-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414161545.2863615-1-fiona.klute@gmx.de>
References: <20250414161545.2863615-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:0eN8iyrcJFfTu3KrQ8RZGRuPjc5CvGkfqmrvgy/tY9vMHsEp4vY
 F3qV91bGJu8qw4vkSO8J0uDNfc6aq2oeNaZIP8HtzFyumsJSOXwwz6OSZ9Nal6zQXOvdy9I
 0Cfjlq8saBD5OVtd5xBeHS0CY3NgiK9AZYEuscuGqtH79yrbSHaVvLQHlaD1vo3AgI1ycxz
 715WWTaFG7tXl/ckp0NDQ==
UI-OutboundReport: notjunk:1;M01:P0:PNQBHS5s6ZE=;cuUJ9kwYdOeGj4jpDyI05wA6U1I
 Syk3d1er8zkBoLmrEtxw3rHTs3HX3BujaxGCoz/UvzA94LjtQYagJzfvccH8uAJIM3Ze/3jTz
 kX3cX2ul31gyihFe0/yukI2+ftm4V2T1/LIaJ4dTbzBlfQC+pUDPPqjKCokVjf49TJDK890Zz
 WYlTjp1gfLlvIgLRdY0Z83BFrc38PIlz8F5484Fmbj/Z2uQx0gf1C7m4t4XI8SrevKSoif3dC
 uGInU3xuHUg84woFXC+HF1e9geTrvVDhAegpFPScG7rpqBZ/Yj/1LEzjSF4qRGxSBlRqe3RIy
 9mPh//9IWwps1Ynpwf2+FpUVs+tBPdlVov8unEGo78+WS1CcwYsqPxy7/pyX6XSB/76SzZMnW
 L0qlQKUZa+mQ72aw55Qkr/Z54rEUgVDVgmBhkPsUJ883MVdSgeOrVm8g2YcTL5jcbfXejFJ4B
 GbfBJpwtXEf5lyVKLxKymA1hm3aRj3OCw4HnrtDEano/MPYKrevAXJiuqHp4Bz2HBwBUmfvch
 Eh3QcyIuI7Eh0h2Yl6KTYPsTPdUDCJ5vYWhRUIZXMwi2qXhhueko4BnYMvQL+yhkNOlkthLLW
 etEq5K0bWZlqHvpAQq9eHPUZ9SZfmp4JXgREOL4t7t4vhCl1YVMJxPNan7Qyqrt+x3ROE8uv+
 1SArfBb/M5TFqJHPU4jzXRvPVhqSoprCKKtNKlGg9+J7Y8trxKNuz4n9udpL+rgIIhF5YwfRi
 ANaWdUYLnJWlAvWj44cfnZXOThL2vhIoBc/fvh+4/KcenQFmVm30zSTiOkymXpbsh5ki4lHEC
 EV8VNhPcZrtGHrMEYWHrS7x5m26TSVwl57WZt6y6pYdcWfN3VyPgSnhKMCCrLE9LdMM1Quwz3
 PW9z38YU4Vuw4C5IwdU3AK0TT5nGMycRcW+qg241em9Nys1fyJ3oRti+O5lmT5u7y+BDgQxwZ
 m4FvFAJwJQ+YRNs2RxSfZJoPBJDLslhiZ0/JNjhHDZOQtBtGGpb7HWTkxPoNgPGoFud1+NAlG
 bvqzBPoUcYNlGVtxg7Yk0NHeU6E0ePcQWfRxMs0uL4QowCPE58lKfP4ESHCjjupF+9p4heLDW
 U96lJzKE4NHg1lU/aypaVONgO3SXBKs1yT+HdGqGr3D0HuXONPfwTKwpz7ia7kbwb5FvxEaVp
 mB31sgaQWx9c7IsKR5ex41n6xLNzwxC4P6Udd7DsMYUYoe6vL73gkb5veH6NcQE9w7Zcz+64W
 zAfGgEEmw6EdLtaZoXBEL5XNxbW8tLbUaDvqnYZVS0ArXo+4o1Rw/awbTTgApQRpEdVa5oNbp
 ZqF841XBOLGZr6rsHcFpYsRkUS9/MXZgb9USctW6JN6+g2NuuX4K3gwS1WY17dr7pZ7iFXRcQ
 pZuacLSCd/CX4NigW+tgzEH6wDwZcBex3g8mlJee6cB7tQEuilUGa6I979CQmbaiC/INMz3/T
 yixC32nte5fCMf9mjM8rFswJ5wHg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1744647364; x=1745252164; i=fiona.klute@gmx.de;
 bh=UjALfC5ugSAHXUU5P3VRvJ7e5htb6dtoT/y65w8OEKo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=kHzmZCWOhLdt2YYSAo5DyNYGfz2KMDxOqWuVjEUSo27vlt+3nOvfBy4ktPXov4Bm
 TNG1eXmScsT5j+LEEePZtWAbdS1kqaVVEIxy1dubEeh+mNgO3H3VgDqVGlgT4Cam5
 XO62+aFMbf7k1UPyKPwZRtrcD/k3pSB+rNPUvHyD68He2kRuOatdy9Q+R4qNgrYAm
 UtNpBgIFyB3ULtPv4ge3u4hG8J8bD1EYblhJ7zsBZBacXNd6zOc5Md8aYxWE1Wcbz
 QRuI3C8BmtzVUAU0+QuGXJKnlvsxMB15V3nN6ZKJXXdC/+B2x+x4b+60YUO2ntRmH
 DOHuUhvoYCE8HIpbaA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=kHzmZCWO
Subject: [Buildroot] [PATCH v4 3/4] package/gobject-introspection: bump
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
