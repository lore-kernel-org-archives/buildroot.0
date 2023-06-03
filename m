Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8D2C77B7A
	for <buildroot@archiver.kernel.org>; Sat,  3 Jun 2023 22:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB71F41E56;
	Sat,  3 Jun 2023 22:16:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB71F41E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RgoHK7UjY0Ud; Sat,  3 Jun 2023 22:16:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FBC541E53;
	Sat,  3 Jun 2023 22:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FBC541E53
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 28D291BF36F
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 22:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F6E7405EB
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 22:16:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F6E7405EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z6C7Mwtt5eIF for <buildroot@lists.busybox.net>;
 Sat,  3 Jun 2023 22:16:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3677404C2
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3677404C2
 for <buildroot@buildroot.org>; Sat,  3 Jun 2023 22:16:18 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-96f850b32caso546288766b.3
 for <buildroot@buildroot.org>; Sat, 03 Jun 2023 15:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685830577; x=1688422577;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WT52fB60/yYi1XBzXD/PE0oqV8P9kAHpkySK7XbeXJg=;
 b=PgH2XfJoiVJRLpdxEM4m47tz2pvqn8B+B0VY7kZw57XnnF/6kjlQ6xC4a8mvsC90iT
 W/oZy3X2JWB+28QW0r3DETbFHMjSRXvKZEQjRzyHAbICWtb5bXEfqBlOrkowTf4SqDXC
 yeWqhn+5uswx7WJKrMR7fnChNZF63yPuYwYHlVq5V22OtmY4kXhKigEV0K+0r5HhZNDM
 yk2qBUQ1pxowIJZ7GJZXMue9Rwoc7Ga8LXr57TlXw6AwH7VMVHqz/nPiGxju6xrWTnGp
 LLBYu9uwes5OHndw1xlvMdBZIkwlPKpOadBOQgPNAd92SMQno/oeipiO/KouwPgq19Sf
 /2kA==
X-Gm-Message-State: AC+VfDx1Wdb2q2ZxvpK+QtMCu9GofRRNu5pjeBetWBQeL8VnLES+VYSw
 dBs2L1CG/DEuLxpO/8c/jMxxcSkRSUk=
X-Google-Smtp-Source: ACHHUZ73rZX9BOB9x3s403goiMOaz2unzzxrGjGKMFpPPYiglkm7KxiXrLbkoEYiHR+Uly+WHUYyyA==
X-Received: by 2002:a17:907:168a:b0:973:d846:cd5d with SMTP id
 hc10-20020a170907168a00b00973d846cd5dmr2759134ejc.74.1685830576788; 
 Sat, 03 Jun 2023 15:16:16 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 d6-20020a5d5386000000b00307c46f4f08sm5501133wrv.79.2023.06.03.15.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jun 2023 15:16:16 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Jun 2023 00:16:12 +0200
Message-Id: <20230603221612.292994-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685830577; x=1688422577;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WT52fB60/yYi1XBzXD/PE0oqV8P9kAHpkySK7XbeXJg=;
 b=pInJdjmLL6ZsxFaTq0moN0o6HscdEElstB4B79e/3KZfF0dS5nChvcdlslgR9BY8p6
 xuS2A1X/PMhfESajohuBgvDap8bpeGqycEnNkMDNMcp01s0msmziPcj0+Dfj9UeZYC/l
 m6+RQM1cqEylv9L8FYYuAuMjkT/w0U3H64Ya5Nl1HVLM57omK31iaV1zVgTogyKFQ3he
 0yo/vgX6WLaKgY2YO5PxIhwIO2HGe/f0YhTRq7IJsHsHZzDVg6TSJA4QYmUyOpPF84Fy
 JmtMjcZ6O4gVz9rfcQJU10hzPgEoc4ZDbPDbw5lIIhhU0zWGZNHoj3iFGBaHlOLN6XhT
 +9Gw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=pInJdjmL
Subject: [Buildroot] [RFC] support/dependencies: introduce
 BR2_HOST_CMAKE_AT_LEAST
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libjxl requires cmake 3.19 since version v0.7 due to the
new behavior of cmake [1].

-- Configuring done
CMake Error at cmake/FindLCMS2.cmake:40 (add_library):
  INTERFACE_LIBRARY targets may only have whitelisted properties.  The
  property "INCLUDE_DIRECTORIES" is not allowed.
Call Stack (most recent call first):
  third_party/CMakeLists.txt:114 (find_package)

The portability issue has already been reported upstream [2].

host-cmake is know to take a long time to build and we want
to avoid bumping BR2_CMAKE_VERSION_MIN only for one package.
As discussed on the mailing list [3] introduce
BR2_HOST_CMAKE_AT_LEAST_X_Y selected by package that
requires a higher cmake version than the one provided by
the host.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819095

[1] https://gitlab.kitware.com/cmake/cmake/-/commit/afb998704e67d3d3ce5b24c112cb06e770fca78d
[2] https://github.com/libjxl/libjxl/issues/1425
[3] http://lists.busybox.net/pipermail/buildroot/2023-June/668287.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Julien Olivain <ju.o@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cmake/Config.in.host             | 31 ++++++++++++++++++++++++
 package/cmake/cmake.mk                   |  1 +
 package/libjxl/Config.in                 |  1 +
 support/dependencies/check-host-cmake.mk | 12 +++++----
 4 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/package/cmake/Config.in.host b/package/cmake/Config.in.host
index b2e210ee2c..fe5640088e 100644
--- a/package/cmake/Config.in.host
+++ b/package/cmake/Config.in.host
@@ -9,3 +9,34 @@ config BR2_PACKAGE_HOST_CMAKE
 	  the compiler environment of your choice.
 
 	  http://www.cmake.org/
+
+# The latest version in this list must match the one provided by host-cmake.
+config BR2_HOST_CMAKE_AT_LEAST_3_18 # Debian bullseye provide cmake 3.18.x
+	bool
+	default y
+
+config BR2_HOST_CMAKE_AT_LEAST_3_19
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_3_18
+
+config BR2_HOST_CMAKE_AT_LEAST_3_20
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_3_19
+
+config BR2_HOST_CMAKE_AT_LEAST_3_21
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_3_20
+
+config BR2_HOST_CMAKE_AT_LEAST_3_22
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_3_21
+
+# This order guarantees that the highest version is set, as kconfig
+# stops affecting a value on the first matching default.
+config BR2_HOST_CMAKE_AT_LEAST
+	string
+	default "3.22"	if BR2_HOST_CMAKE_AT_LEAST_3_22
+	default "3.21"	if BR2_HOST_CMAKE_AT_LEAST_3_21
+	default "3.20"	if BR2_HOST_CMAKE_AT_LEAST_3_20
+	default "3.19"	if BR2_HOST_CMAKE_AT_LEAST_3_19
+	default "3.18"	if BR2_HOST_CMAKE_AT_LEAST_3_18
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index dc92c8bb4e..b99877696a 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 3.22
 CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
diff --git a/package/libjxl/Config.in b/package/libjxl/Config.in
index da04b89f9b..923560298f 100644
--- a/package/libjxl/Config.in
+++ b/package/libjxl/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBJXL
 	# libjxl fail to link statically due to libatomic issue
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_81426
+	select BR2_HOST_CMAKE_AT_LEAST_3_19
 	select BR2_PACKAGE_BROTLI
 	select BR2_PACKAGE_HIGHWAY
 	select BR2_PACKAGE_LCMS2
diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
index 5760e4ded1..e367690319 100644
--- a/support/dependencies/check-host-cmake.mk
+++ b/support/dependencies/check-host-cmake.mk
@@ -1,9 +1,11 @@
-# Set this to either 3.18 or higher, depending on the highest minimum
-# version required by any of the packages bundled in Buildroot. If a
-# package is bumped or a new one added, and it requires a higher
-# version, our cmake infra will catch it and build its own.
+# The cmake minimum version is set to either 3.18 or higher,
+# depending on the highest minimum version required by any
+# of the packages bundled in Buildroot. If a package is
+# bumped or a new one added, and it requires a higher
+# cmake version than the one provided by the host, our
+# cmake infra will catch it and build its own.
 #
-BR2_CMAKE_VERSION_MIN = 3.18
+BR2_CMAKE_VERSION_MIN = $(BR2_HOST_CMAKE_AT_LEAST)
 
 BR2_CMAKE_CANDIDATES ?= cmake cmake3
 BR2_CMAKE ?= $(call suitable-host-package,cmake,\
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
