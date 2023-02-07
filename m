Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56145C636D3
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 21:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDACD40B15;
	Tue,  7 Feb 2023 21:09:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDACD40B15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id daeuHCNzdsEb; Tue,  7 Feb 2023 21:09:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F064F4057A;
	Tue,  7 Feb 2023 21:09:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F064F4057A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE77B1BF377
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9764761054
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:09:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9764761054
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V0F0l1eX_4Fj for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 21:09:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2375B61041
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2375B61041
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 21:09:40 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 l21-20020a05600c1d1500b003dfe462b7e4so1623437wms.0
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 13:09:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2oGgSJN/w8TW+VFM84jqFnH6GtpbgJdMuh+wz6a9SmA=;
 b=rQlVIdBrPLeWBR4QDDcPOveMss0toRPJHqL/zxkywCLvWsfxIhDjLuN1S+oRegYQjs
 E3Q3ZdSqFQxtnouvmuZZdcd2Z/45kZSVjvmDvNUukKtHEmL/eEtDfy0KeR100XYsvGCl
 TMwS8XxdoyV/yhPbkeRtywWxbHP75foGCWcMmjtWhI1wQEjSIlvQTZZDCkF1bsEDcghY
 xT537eQLINTCgLl2U9Krp4gxbGN660zGskhiL9Z2q7wEThlPNpHesHVUIQPaFfurUho9
 /3A8WuFlkfQ7unVpCfV9pyNvy3WS/2Ga5k0xq5TIdJXT3ZaP1YJvkpdWgMTi1MR9mNMW
 gMZQ==
X-Gm-Message-State: AO0yUKXwv6UN2eMg5wTPW98KbxvE+DFNaFKKUW+SsXPaYC88SqaICOjU
 qCZIu5D0TPTBFjJ2gR3aaMGDargUyyr53ArV65pyNQ==
X-Google-Smtp-Source: AK7set/sVqhMP6U4kPreVaNbeYHvznkeqiWQHznM1A0iwi8z1fZMuR635o0dsKDwLtBqMJV/G6D59g==
X-Received: by 2002:a05:600c:4483:b0:3d3:49db:9b25 with SMTP id
 e3-20020a05600c448300b003d349db9b25mr4354589wmo.26.1675804177558; 
 Tue, 07 Feb 2023 13:09:37 -0800 (PST)
Received: from angeloc.wifiguest.local
 (220.211-78-194.adsl-static.isp.belgacom.be. [194.78.211.220])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a05600c44c900b003dc4fd6e624sm8057955wmo.19.2023.02.07.13.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 13:09:36 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 22:09:34 +0100
Message-Id: <20230207210934.3132539-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2oGgSJN/w8TW+VFM84jqFnH6GtpbgJdMuh+wz6a9SmA=;
 b=pmZkuPqbyH4t0pgerA2exzsvBZbXFXyhDXGBN8+56clscH+Z+hOd7z9oAQBJ1ZVvGw
 L5MZbisEZX3aKEQtY7XBW8DVkED4huIFgHSxnX8WvEM1zwduQXMX46z5aXzm2OEMUJeJ
 5zYJxAqVt9xnS8lI4AVAWvurF5Zo9ZEN3glGw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=pmZkuPqb
Subject: [Buildroot] [PATCH v5] package/gtkiostream: new package
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
Cc: romain.naour@smile.fr, Matt Flax <flatmax@flatmax.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Matt Flax <flatmax@flatmax.com>

This package provides many useful software engineering and signal
processing libraries.
The package offer also a GUI written in GTK which requires several
missing packages and therefore is left disabled.

Signed-off-by: Matt Flax <flatmax@flatmax.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
v4:
* Bumped to 1.8.0
* Added myself to DEVELOPERS
* Added dependency on octave when enable instead of use
  --disable-octave configure option
* Fixes from check-package
v5:
* Fixed wrong syntax (Romain)
* Added optional dependency on sox (Matt)

 DEVELOPERS                           |  4 ++++
 package/Config.in                    |  1 +
 package/gtkiostream/Config.in        | 15 +++++++++++++++
 package/gtkiostream/gtkiostream.hash |  3 +++
 package/gtkiostream/gtkiostream.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 48 insertions(+)
 create mode 100644 package/gtkiostream/Config.in
 create mode 100644 package/gtkiostream/gtkiostream.hash
 create mode 100644 package/gtkiostream/gtkiostream.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d7c4d03c4c..5355d6d5ac 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -165,6 +165,7 @@ F:	package/cups/
 F:	package/cups-filters/
 F:	package/fail2ban/
 F:	package/grep/
+F:	package/gtkiostream/
 F:	package/htpdate/
 F:	package/i2c-tools/
 F:	package/jq/
@@ -1978,6 +1979,9 @@ F:	board/technologic/ts4900/
 F:	configs/ts4900_defconfig
 F:	package/ts4900-fpga/
 
+N:	Matt Flax <flatmax@flatmax.org>
+F:	package/gtkiostream/
+
 N:	Matt Weber <matthew.weber@collins.com>
 F:	board/freescale/p*
 F:	board/freescale/t*
diff --git a/package/Config.in b/package/Config.in
index 06d0a05854..70e446be47 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1389,6 +1389,7 @@ menu "Audio/Sound"
 	source "package/bcg729/Config.in"
 	source "package/caps/Config.in"
 	source "package/fdk-aac/Config.in"
+	source "package/gtkiostream/Config.in"
 	source "package/libao/Config.in"
 	source "package/libasplib/Config.in"
 	source "package/libbroadvoice/Config.in"
diff --git a/package/gtkiostream/Config.in b/package/gtkiostream/Config.in
new file mode 100644
index 0000000000..bb97961587
--- /dev/null
+++ b/package/gtkiostream/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_GTKIOSTREAM
+	bool "gtkiostream"
+	depends on BR2_INSTALL_LIBSTDCPP # eigen
+	select BR2_PACKAGE_EIGEN
+	select BR2_PACKAGE_FFTW
+	select BR2_PACKAGE_FFTW_DOUBLE
+	select BR2_PACKAGE_FFTW_SINGLE
+	help
+	  This package provides many useful software engineering and
+	  signal processing includes and linkable library.
+
+	  https://github.com/flatmax/gtkiostream
+
+comment "gtkiostream needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/gtkiostream/gtkiostream.hash b/package/gtkiostream/gtkiostream.hash
new file mode 100644
index 0000000000..90c754f48c
--- /dev/null
+++ b/package/gtkiostream/gtkiostream.hash
@@ -0,0 +1,3 @@
+# locally computed hash
+sha256  44e8d921d462005cd330a1c24e5bd8061175b90ae53f537dbf73f59b74f6e01b  gtkiostream-v1.8.0.tar.gz
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  gpl.txt
diff --git a/package/gtkiostream/gtkiostream.mk b/package/gtkiostream/gtkiostream.mk
new file mode 100644
index 0000000000..f110e6c149
--- /dev/null
+++ b/package/gtkiostream/gtkiostream.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# GTKIOSTREAM
+#
+################################################################################
+
+GTKIOSTREAM_VERSION = v1.8.0
+GTKIOSTREAM_SITE = $(call github,flatmax,gtkiostream,$(GTKIOSTREAM_VERSION))
+GTKIOSTREAM_LICENSE = GPL-2.0+
+GTKIOSTREAM_LICENSE_FILES = gpl.txt
+GTKIOSTREAM_DEPENDENCIES = eigen fftw-double fftw-single host-pkgconf
+
+GTKIOSTREAM_DEPENDENCIES += $(if $(BR2_PACKAGE_SOX),sox)
+
+ifeq ($(BR2_PACKAGE_OCTAVE),y)
+GTKIOSTREAM_DEPENDENCIES += octave
+GTKIOSTREAM_CONF_OPTS += --enable-octave
+else
+GTKIOSTREAM_CONF_OPTS += --disable-octave
+endif
+
+# configure script not available
+GTKIOSTREAM_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
