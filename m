Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC02C77B73
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 09:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F2678235E;
	Mon,  5 Jun 2023 09:56:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F2678235E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kChS-722vUCh; Mon,  5 Jun 2023 09:56:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63B84822C1;
	Mon,  5 Jun 2023 09:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63B84822C1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DDB9D1BF3D1
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 09:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B69B48233E
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 09:56:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B69B48233E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0zMrlwtwzc4a for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 09:56:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8038282280
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8038282280
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 09:56:14 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f6195d2b3fso2433399e87.1
 for <buildroot@buildroot.org>; Mon, 05 Jun 2023 02:56:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685958972; x=1688550972;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nwCRILOUq7UOn7+tVcu8bHUODAFWCifaEmc8AE21Ml4=;
 b=HzJWGWwbxVNeUPRme9s+QNULti5Wp1xzkF4zI+QuqP5/LRbCSGYY2Jz91MJ4wn8zxr
 PgKFPnJG6Om14yk/GgwROC36NXAiwyBkZ/iCyrOrP9XouAgYOPm5zTQ/60b9Us86/ADf
 JbyEDFRQ1bxGpUMrdGjId+9yN0cMHNpPCNX93dV1E4z43meVLr4mFPDkMaZfRoHcgOkF
 GKQVIdlqqasdpxZOZb8qzshhkKtcC46mmApqhCXVxUdfwqHQts1lC02R4UySXcBOKuzI
 aWwcLF4Sb9yYG3ZsdeGOM5J4hkoC0IcEBHULHrlUFNELUDI0fKNheWdrjs4ZtxPK7xty
 jnvg==
X-Gm-Message-State: AC+VfDwDPB1oJ3EVrpCoscCL4GwvKHBfZ+/oCq9Del2NtfMu1sXAa4Fq
 irw7IlnrGcXRNMr1r3ZYfAqSqf0xRzA=
X-Google-Smtp-Source: ACHHUZ62I8sPTlH1ttj3/dRyb0DmYGZifIcXKg2velR8SWbX8iwkkRjl7ajKIf5jzyWjHMoMUUffoQ==
X-Received: by 2002:ac2:495e:0:b0:4f3:895f:f3f5 with SMTP id
 o30-20020ac2495e000000b004f3895ff3f5mr5339022lfi.61.1685958972093; 
 Mon, 05 Jun 2023 02:56:12 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a7bc048000000b003f4b6bcbd8bsm10291176wmc.31.2023.06.05.02.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 02:56:11 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jun 2023 11:56:06 +0200
Message-Id: <20230605095607.332091-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685958972; x=1688550972;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nwCRILOUq7UOn7+tVcu8bHUODAFWCifaEmc8AE21Ml4=;
 b=p5S49SmbhuLtgwxAlwHINiwnskFWXD0Qohc4J8Q4E/HbTnwODCROqJkbnpsiP4hhr0
 KgbaVhxZ6sxKX3mZ35adqM4HK4gSx4JLn8twYDVoBVWX4rhCHBlOaBLUq4hmr1cdF13J
 vicXtmod0eF9helPl0NyvheCU2Ov0MjgFIzvNQ1Pv+g2aYh12y+lZYveVONb4JlGZaW0
 AS+Nfs6vYwpU7je/rUYnhOl3s4bR2ZgTEyJzgaRefRJIl7qBVW3TqdOiD6YnQU26MkiE
 HAXk24/enYgX0/oBIrOv6fkzbkIdaiRQPi8DIXOI3wc3JwbP8zQ1760Ho5FBwbvgZnEI
 jfAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=p5S49Smb
Subject: [Buildroot] [PATCH 1/2] support/dependencies: introduce
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

Some packages (e.g. libjxl) requires a quite recent cmake version,
that is not yet available in most distributions, especially those
LTS versions.

Currently, when we bump the minum cmake version we require, it gets
bumped for all packages, regardless of their own minimum required
version, which means that a given configuration will trigger the
build of our host-cmake even if the packages that require it are not
enabled and those that are would be content with the system-provided
cmake.

Since host-cmake can take quite some time to build, this can get a
bit annoying to pay the price of a host-cmake build that would
otherwise not be needed.

Some packages even use an alternative build system when available
since they requires a more recent version of cmake than the our
minum cmake version
(wpewebkit use Ninja: 78d499409f71d8a22b0632c8ebc06f67ee6ae6dd).

We introduce config options that packages can select to indicate
what minimal cmake version they require, and use that version as the
required minimal version required by the current configuration [0].

We would like to ensure that the currently selected minimum cmake
version is indeed lower (or equal) to the cmake version we package,
but that is not possible: dependencies.mk is parsed before we parse
packages, so we do not yet know the cmake version we have, and we
can't invert the parsing order as we need to know the requires
dependencies before we parse packages (so that we can build their
dependency rules in Makefile). So we can only add comments in both
places, that refer to the other location.

[0] note that this is yet not optimal, as in such a case, host-cmake
would be in the dependency chain of all cmake-based packages, even
for those packages that do not require it. The optimum would be for
each package to gain such a dependency on an as-needed basis, but
this is by far more complex to achieve, and would only speed up
cases where a single package is built from scratch (e.g. with:
make clean; make foo), which is not worth optimising (yet?)

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Julien Olivain <ju.o@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
v2: Use the commit log suggested by Yann
    http://lists.busybox.net/pipermail/buildroot/2023-June/668312.html
---
 package/cmake/Config.in.host             | 27 ++++++++++++++++++++++++
 package/cmake/cmake.mk                   |  1 +
 support/dependencies/check-host-cmake.mk | 12 ++++++-----
 3 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/package/cmake/Config.in.host b/package/cmake/Config.in.host
index b2e210ee2c..5de076537b 100644
--- a/package/cmake/Config.in.host
+++ b/package/cmake/Config.in.host
@@ -9,3 +9,30 @@ config BR2_PACKAGE_HOST_CMAKE
 	  the compiler environment of your choice.
 
 	  http://www.cmake.org/
+
+# The minimum system cmake version we expect if 3.18 as provided by
+# Debian bullseye, that we use in our reference build docker image.
+config BR2_HOST_CMAKE_AT_LEAST_3_19
+	bool
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
+	default "3.18"
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
