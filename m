Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EF3C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 22:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1693681775;
	Fri,  7 Jan 2022 22:08:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RxP4_Ekez7cm; Fri,  7 Jan 2022 22:08:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 559D281516;
	Fri,  7 Jan 2022 22:08:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F8061BF30A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D5C581516
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:08:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QivAEmOIZ5ZO for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 22:08:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1161981467
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 22:08:19 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t28so6812304wrb.4
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 14:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ezvg/PCyjKlbZmf8wBMrLGEE7rfra9GmKw6zqtzqco=;
 b=YTvkkrRHIjA01tezZ6f2KF3RFXueA73blOqgFYn8KptC8/VgjJsnMBA1Cqj1yhdq+n
 l2hJ2iMi8fvfB1ClQHH4qla2sTGe2dBsFTJhZp8+rMTIHNBOkgyHIW/cTtG7ITHp2ug7
 zlUSFY4WeP/L4IaoW9WedKWd7Jh0zpR0H944kA9eHfDHd+Ju9Npr/FIcyV6qMkQ+fb1p
 +PZmRb7H2wpQkNzvRZ3PF4IirW6io2rJRQD77dW+CcI44fAr6OPG/9DiZ84zXkf+xs6c
 iDaqgeZu7NVMKJXFLu3yiQ2LOnriEn2LUvip7jFeBgYUYkmHCpnTcBYOk2TB9p1l0ebm
 +Ojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ezvg/PCyjKlbZmf8wBMrLGEE7rfra9GmKw6zqtzqco=;
 b=kt2vMNwXhVCevEpntjcozMZ6uKT/GgVJcV2RVy7ieKNQLqKV0gnBU2ObIuI/MgsrkI
 UnMmU/hev38B2WHRI1yc8qRMcL/7MascCJYah3vvHRwF3ksescW4ASb0JwTnLT54jXkx
 AR1kbN2DfwqbIC9GpT2k/vx/6tZOuTQ8s80gW5nMJeBJywSSNkmOVVEvv+SZXohBpu5c
 TLLBCxiOU643HPygHZJaydUMivqve0M3BXj+s8quiL2ZL1yorols9aCerRH9vuzQs/3F
 wqT7EREYLab6r0b5Xu6259jJrdx0/y+9QAJv3bQS4jthFe65aAZB2ndxDpgPlvqc9CH9
 L4tA==
X-Gm-Message-State: AOAM530TR1yX/BHttyZkouIlJSS5gm1yNRzXATEr0YKXo5tmwtF+CEqv
 gXI/2ttQ7OXcMEAa6htPIC5UcUt/PlY=
X-Google-Smtp-Source: ABdhPJyZa3efCRIsSb/8khu3KiCTQdIQC7PqacTZji/3EMk8G9lO7O1Q2AdJ51rrbxC/GpNf09QxQg==
X-Received: by 2002:a5d:59a9:: with SMTP id p9mr59291879wrr.251.1641593298164; 
 Fri, 07 Jan 2022 14:08:18 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id q17sm2403420wrx.68.2022.01.07.14.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 14:08:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 23:07:07 +0100
Message-Id: <20220107220707.1679540-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mp4v2: bump to version 5.0.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop first patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mp4v2/0001-Fix-GCC7-build.patch       | 33 -------------------
 ...p4track.cpp-replace-nullptr-by-NULL.patch} |  2 +-
 ...atic-cast-to-unsigned-int-for-cases.patch} |  0
 package/mp4v2/mp4v2.hash                      |  2 +-
 package/mp4v2/mp4v2.mk                        |  2 +-
 5 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 package/mp4v2/0001-Fix-GCC7-build.patch
 rename package/mp4v2/{0002-src-mp4track.cpp-replace-nullptr-by-NULL.patch => 0001-src-mp4track.cpp-replace-nullptr-by-NULL.patch} (96%)
 rename package/mp4v2/{0003-Static-cast-to-unsigned-int-for-cases.patch => 0002-Static-cast-to-unsigned-int-for-cases.patch} (100%)

diff --git a/package/mp4v2/0001-Fix-GCC7-build.patch b/package/mp4v2/0001-Fix-GCC7-build.patch
deleted file mode 100644
index 4e39be4a79..0000000000
--- a/package/mp4v2/0001-Fix-GCC7-build.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 855e9674232808ff3be7191b697dfb56917db21f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?S=C3=A9rgio=20M=2E=20Basto?= <sergio@serjux.com>
-Date: Wed, 8 Feb 2017 00:56:32 +0000
-Subject: [PATCH] Fix GCC7 build
-
-if (*pSlash != '\0') {
-
-As it stands the body of that if will always execute and when there are
-no encoding parameters ppEncodingParams will be returned as a pointer to
-an empty string rather than as a null pointer
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-[Upstream status: https://github.com/TechSmith/mp4v2/pull/36]
----
- src/rtphint.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/rtphint.cpp b/src/rtphint.cpp
-index e07309d..1eb01f5 100644
---- a/src/rtphint.cpp
-+++ b/src/rtphint.cpp
-@@ -339,7 +339,7 @@ void MP4RtpHintTrack::GetPayload(
-                 pSlash = strchr(pSlash, '/');
-                 if (pSlash != NULL) {
-                     pSlash++;
--                    if (pSlash != '\0') {
-+                    if (*pSlash != '\0') {
-                         length = (uint32_t)strlen(pRtpMap) - (pSlash - pRtpMap);
-                         *ppEncodingParams = (char *)MP4Calloc(length + 1);
-                         strncpy(*ppEncodingParams, pSlash, length);
--- 
-2.11.0
-
diff --git a/package/mp4v2/0002-src-mp4track.cpp-replace-nullptr-by-NULL.patch b/package/mp4v2/0001-src-mp4track.cpp-replace-nullptr-by-NULL.patch
similarity index 96%
rename from package/mp4v2/0002-src-mp4track.cpp-replace-nullptr-by-NULL.patch
rename to package/mp4v2/0001-src-mp4track.cpp-replace-nullptr-by-NULL.patch
index 72bae463c9..c279b9c56a 100644
--- a/package/mp4v2/0002-src-mp4track.cpp-replace-nullptr-by-NULL.patch
+++ b/package/mp4v2/0001-src-mp4track.cpp-replace-nullptr-by-NULL.patch
@@ -16,7 +16,7 @@ Fixes:
  - http://autobuild.buildroot.org/results/14937c96a82fb3d10e5d83bd7b2905b846fb09f9
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent yet]
+[Upstream status: https://github.com/TechSmith/mp4v2/pull/62]
 ---
  src/mp4track.cpp | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
diff --git a/package/mp4v2/0003-Static-cast-to-unsigned-int-for-cases.patch b/package/mp4v2/0002-Static-cast-to-unsigned-int-for-cases.patch
similarity index 100%
rename from package/mp4v2/0003-Static-cast-to-unsigned-int-for-cases.patch
rename to package/mp4v2/0002-Static-cast-to-unsigned-int-for-cases.patch
diff --git a/package/mp4v2/mp4v2.hash b/package/mp4v2/mp4v2.hash
index 85fce49384..7aa5402c8f 100644
--- a/package/mp4v2/mp4v2.hash
+++ b/package/mp4v2/mp4v2.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e3ad6c2dc451b0875dbe34bfe7f51f4fe278b391434c886083e6d3ecd5fa08c2  mp4v2-4.1.3.tar.gz
+sha256  de31e430e2641f25b67d10c47b0cda35279881b0196120e33bcd71b9cef1bd58  mp4v2-5.0.1.tar.gz
 sha256  15e38684c940176e2fc76331a2299d2ab5115ac997078f768ef31b896af69fc5  COPYING
diff --git a/package/mp4v2/mp4v2.mk b/package/mp4v2/mp4v2.mk
index 478d10d472..6d29228a13 100644
--- a/package/mp4v2/mp4v2.mk
+++ b/package/mp4v2/mp4v2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MP4V2_VERSION = 4.1.3
+MP4V2_VERSION = 5.0.1
 MP4V2_SITE = \
 	$(call github,TechSmith,mp4v2,Release-ThirdParty-MP4v2-$(MP4V2_VERSION))
 MP4V2_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
