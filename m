Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4B2C3600B
	for <buildroot@archiver.kernel.org>; Mon, 31 Mar 2025 13:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E7D560D6B;
	Mon, 31 Mar 2025 13:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E6VXVWc3EoPW; Mon, 31 Mar 2025 13:14:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E19EF60C27
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E19EF60C27;
	Mon, 31 Mar 2025 13:14:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DE5FD0
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 13:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FDB04093D
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 13:14:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iKJIP_Kt7m0D for <buildroot@buildroot.org>;
 Mon, 31 Mar 2025 13:14:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DB17840932
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB17840932
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB17840932
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 13:14:40 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.117.119]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFKGP-1tswMe1qIL-003RC6; Mon, 31
 Mar 2025 15:14:37 +0200
To: buildroot@buildroot.org
Date: Mon, 31 Mar 2025 15:14:02 +0200
Message-ID: <20250331131402.3590411-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331131402.3590411-1-fiona.klute@gmx.de>
References: <20250331131402.3590411-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:z6rvioTYSOaglrPlDOK3wXpQEzUvslF0TLYGySlH590sAL+9Lr3
 pDsSP86XD4HRUpVcZjBl7f0Ssf8OgbuJqKfZPOIP9aVKc3Xm50ujGFe+7tDe2xJeVbqf86g
 azn+7nDOiOCLHf+dGiId1xtbOr/N5X9fonOABv2w4aSpBfzBGZTYT8po+SgOEQVB2inb2ds
 OFDMEzyS1/P071KbIrNQA==
UI-OutboundReport: notjunk:1;M01:P0:sxwFRiuyjLQ=;J9C1kAXUM6M09Y7DP1bXCfhrmj1
 rWzopcOTPYTp2g5sRy0vKBJFpyB91Su8AkhL+qCr1U3hXovW+6xMzXWPq9rUXhjGEyC1gIFi+
 T7sKhriXQzPBiNttGkSC6rgFTHYfl6jRyEBYGUJQx7IFroIIB/YyBUZIdWu8gMQRMCj2zaEjm
 3QpZs5hEryaDMokLspyweGXvWiVYINNJh1CiVOwtyjRVk6atwFONFKi50yHw+NXI0pz7Nh780
 L+fJGiMsvfvZuwEt3XSiIJPlu1XEInmTrU7KdCADjroTh5l/gXlqYNJgjdbdIDjr/XnGdj4WS
 ehN7fmTBzQJ4oDmdEJmUZWoM6fd9gKuo0y3+XOab44mYEqmUr7zoJAkHy3hdixuHIx9LYuuGo
 /doErQhenpkUTqpPWZ8UT23GXn+FSM4sV6KFRvnZqXvHeUeQuHDiQxvEmaFo9aXzkZio4iPer
 FpCqoaPTUdvkXUS35Sv6/f0VjN7H2acFuzVwGGlB55BImhCOK0paEQ3ZqvVaY11UgsQCK5YK1
 eG0Z6XHmSaJaPVv7PhOarhrf3xE9akFKN88QGVAy8T/isbIZmcL4EloMxP4we58Rv2su13yA/
 8cfl/HAK2m3xsqhaEMeTKDpKH9dB+qkBLcwhARkSgBGMAGxIKpIt0fk66D2JPZ+027FK4X7T+
 Euz191EPdIFWjlXTOmJVt4SHGcxEzeCRNIiwiAFuyVWy2w7aYDVzOhDreTT3Y5xm8ckBOrplY
 z6dUekl3TNAZsKAhKjBqXkGHZ6QYLtG7PNbnSWvvrAzC2QBnFWmZjgCFl8S5IOXfAlvbTXTGt
 C6WBZZB9h0KF2i6/g9xz49kLQp1T4zYRVAriekLR6kx6Os6rnrp/73ymWUjDOof3lRqzuXnKE
 cK/DDXJQHa9wRB4nf4p66+Oa7ePlrqZkvKeROhb18ZdYkk1nhusZ5kAPTuqJNbuQnJYaSRozr
 KZUyjz/1rF2nvaPj4JP6wzGamlW+Hc1AWy3kdcaT63nGg/gDPqs0Rbpd4TN4nlxYiuSeEywE4
 djK+BTfz241mX3KrF969Uu7bh7mijFgzaVfhbkc4uSqabpys4I9oG60BnHCwkjeqliNW0jBtl
 kTpRzv5ck3AI4JKJdecT2WzHXTZ4UAMdQOeqIeEmGOvBPJtA7c6aT5prdxZwevOq65079kX8F
 wVyNKathUpP820Yfmc9tJaRKXfvJU3jc1N59eoKejWXg9ZHUWxhTUhLt9K8yUyx7SONi+A2eI
 h+6t6KgkyGWE6IRa1u+COTb1/KCsITEJKd9oAewxVfAxVlUrj5vuK36n05h9cnN+GsqwbEU28
 h1VKbVHzf2ZvIt3PJ0gbApxxNNwEz0fxblCbuDshOVjEfGyb6k442WVNj9stJMgmzTMoG9nAd
 wg8+O6rfolysvXVz2TcchK9rLH/hlLP1x8cl2GtRT6+GEJvNfNUVNUmzOGG28oibXSoCrtmZS
 7APYtM2XkI1KdmrqAOLGxZYHdPBc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1743426877; x=1744031677; i=fiona.klute@gmx.de;
 bh=a3QO4oUqsj9G7YKLGUhzT/6Fug7pPlOaNz/YFCi62xc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=P5zrPmJ7kDSxMcUMjp/JIiGjj+5GBbfor4tGI/MPOaPJbmghZUbXTBWDn417l8t+
 44IV9cXTYPVlUWThTgp8kNuQwPJ4f+YTbDMOUHduWF/HXSif0eCtTQGD7jf+7jnlP
 eCu7BGMpgKMaL3BgryaIrFtvz/ASOyLqiJVfb3y7fd1omCn0XDwhvX9ZnAxCwXNu7
 C6HL6yfYbTxBxnPGgdPdsqFYh9jwsSBrpV++qWmG+5yMcnV29w1Sd0DkKL+TPPZda
 uw5ULpxOtkXeOM0vbyr0MuWdP46Oc4HYb26U5awyqXKjq7fdpnUqRZ431E7ngp4Jc
 fegXyEd6QBobryJTlQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=P5zrPmJ7
Subject: [Buildroot] [PATCH v2 3/3] package/gobject-introspection: bump
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
index 1a61aa1ac0..5350c6633a 100644
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
