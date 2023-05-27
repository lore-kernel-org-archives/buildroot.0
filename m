Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F180C77B73
	for <buildroot@archiver.kernel.org>; Sat, 27 May 2023 21:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8995761153;
	Sat, 27 May 2023 21:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8995761153
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FSaFtGhr8uJF; Sat, 27 May 2023 21:11:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A113260A97;
	Sat, 27 May 2023 21:11:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A113260A97
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C3B81BF308
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 21:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FBC283A6C
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 21:11:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FBC283A6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J2Bn-LM-ptOT for <buildroot@lists.busybox.net>;
 Sat, 27 May 2023 21:11:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77D0F838F2
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77D0F838F2
 for <buildroot@buildroot.org>; Sat, 27 May 2023 21:11:49 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f603ff9c02so13041955e9.2
 for <buildroot@buildroot.org>; Sat, 27 May 2023 14:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685221907; x=1687813907;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1PmFPVrlg/7WhgYvGpw1m2WhkhGPfUbiBb8Oq1y5zl4=;
 b=MiCDnWyJjdhE5CCU1/YKlvvWdp04dYOJ/6c5wbSgBGldwAjhtxB9nl3124SWJfShQD
 E/OVCtCur9SwhAGL7f6LRqPDwa7uTGwXh1tz8Bsua+awOHyX/dgsqLi3UP6APErtf/A3
 d/Wvok6EgdnvujCmgp1+uq51AkBKsbx+b44Q1jQE5wRhB8wnN7Ogo/fpHGH3EgAKNRiz
 uTX5pM/vqK4iqDFr1DK3syAsFqnPXNCEs5nqVKdz7og38YYx1p23BvE5yAiiKfWVkAIG
 R80izcAWhFP8Pp5GrMxnExuqg28znYuZ9rQSlMyc1sMCPDjA4PNU5dX2av/rpCrkL8sE
 3wxQ==
X-Gm-Message-State: AC+VfDyWjSIP6hm85ZnXJpRDimmMdQlfCf8Jj6L8g7Pj6LX71UxvUO/W
 XZOpdVYInxGboDwnugxERaBlc1yo2vI=
X-Google-Smtp-Source: ACHHUZ4ApqIh0JFIWOFo1TT9c82dfkP+zxSIaKbJOEMCh9iI2Lc/9+FeVBbxuC/rGzTjzd3Y+FfWQg==
X-Received: by 2002:a1c:7c19:0:b0:3f5:6e6:9d83 with SMTP id
 x25-20020a1c7c19000000b003f506e69d83mr5549439wmc.23.1685221907374; 
 Sat, 27 May 2023 14:11:47 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcd0c000000b003f601a31ca2sm9419884wmj.33.2023.05.27.14.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 May 2023 14:11:46 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 May 2023 23:11:44 +0200
Message-Id: <20230527211144.2136991-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685221907; x=1687813907;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1PmFPVrlg/7WhgYvGpw1m2WhkhGPfUbiBb8Oq1y5zl4=;
 b=lbAS8pBOeoOQfrCO8XZtg4SNFZXcyOc6AwrArlDL5aBKEJtpXGpUzpiZvwC2eWwLQo
 phqWaXPcAX/1Fk1nFgzJ64ezZMZiYdOJAM3sfRGoG6Q28dhUWeZYZgPLkG+kNswKocDn
 tC0mCp4P+ioR9IcIvuWMckYeLm01utYuUrhKyxjxcl6IZQ+rWMOjyFyHxWRygEJZHISR
 ZsXMT+XpIvOBa0dKCxMuweayDjhzEViWWyysVIXoJH5Ke1QYtR1jxjmbYNaVxbBr+uvr
 yEuOJzYbdetqhkZkK0VUrdBHvtilBtpMbYA2kyZXwJGX+6vtjrLeL5botIb2OyJSJ3Mz
 TLKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=lbAS8pBO
Subject: [Buildroot] [PATCH] support/dependencies: requires cmake >= 3.19
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
Cc: Romain Naour <romain.naour@gmail.com>, Julien Olivain <ju.o@free.fr>
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

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819095

[1] https://gitlab.kitware.com/cmake/cmake/-/commit/afb998704e67d3d3ce5b24c112cb06e770fca78d
[2] https://github.com/libjxl/libjxl/issues/1425

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Julien Olivain <ju.o@free.fr>
---
This will increase the build time in gitlab-ci since
our docker image provide cmake 3.18.
---
 support/dependencies/check-host-cmake.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
index 5760e4ded1..516f55908e 100644
--- a/support/dependencies/check-host-cmake.mk
+++ b/support/dependencies/check-host-cmake.mk
@@ -1,9 +1,9 @@
-# Set this to either 3.18 or higher, depending on the highest minimum
+# Set this to either 3.19 or higher, depending on the highest minimum
 # version required by any of the packages bundled in Buildroot. If a
 # package is bumped or a new one added, and it requires a higher
 # version, our cmake infra will catch it and build its own.
 #
-BR2_CMAKE_VERSION_MIN = 3.18
+BR2_CMAKE_VERSION_MIN = 3.19
 
 BR2_CMAKE_CANDIDATES ?= cmake cmake3
 BR2_CMAKE ?= $(call suitable-host-package,cmake,\
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
