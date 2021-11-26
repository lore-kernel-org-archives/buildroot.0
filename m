Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F039DC433EF
	for <buildroot@archiver.kernel.org>; Fri, 26 Nov 2021 17:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E41240189;
	Fri, 26 Nov 2021 17:04:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d5v4GFEH7kkc; Fri, 26 Nov 2021 17:04:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6546C401A3;
	Fri, 26 Nov 2021 17:04:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 079231BF2C0
 for <buildroot@lists.busybox.net>; Fri, 26 Nov 2021 17:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02EBB401A3
 for <buildroot@lists.busybox.net>; Fri, 26 Nov 2021 17:04:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YZ8UeU1LaWne for <buildroot@lists.busybox.net>;
 Fri, 26 Nov 2021 17:04:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9AFCB40189
 for <buildroot@buildroot.org>; Fri, 26 Nov 2021 17:04:04 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id l16so19979033wrp.11
 for <buildroot@buildroot.org>; Fri, 26 Nov 2021 09:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vf+NdqVNh76l4GL3t2J7G4lZKuXM5PfK8TU2KzmkUbw=;
 b=I1Xx0GB4lNfqwvPmQkINYRhvrnnMPdyaZiS5VoFWEYmOLKips+LxH67v6YIXtsVw1B
 OLTG9B1yUUmKOSl1CED8TWaWUczgQGoGECKZ8y2yypBhmpef9pfO8LS6be4FO8GssdEE
 kdBEybc6AA7zHzETIweZXj3NFUgJsQ5yzmSSsaGDaSAMg8Do/Wub/WuyFmlwDzuFVTr4
 bpGOM5a4Gp6Oft/O4F8/mulz8oT6jdX6z0zll0r2p6bH0hEA4R+RF/ENF9PmxupQ37Ma
 DS39jA0MIOPaKTmmD14amCByRFVTbYwekw+byRUpk4hRP/cLwl97ffbFaVj8zSElot8v
 xZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vf+NdqVNh76l4GL3t2J7G4lZKuXM5PfK8TU2KzmkUbw=;
 b=gUzZIarwzuLZ3/3W58Lfq9wd7TKwJrRqT4r3aW2qIG9LlaCgUdAK5O3krwRTECe8oN
 Yq6lwN3GML7neU8olFeGmY6Q3CqsSnsd+mh5kqXjLDANarfDa0NHbRzTfePxi3YRQjWI
 jlzperO2cB6xQuKU5qHBe6RlqVgw8RUUTRbKJ+dw5wPZe3qzIp1/Lcw/zNrvhczalYgR
 9upMJ4q4eLPH3iTB42lk2Zls6ox2M16yk+l7mB0Pja+PAqCspyC6Zc6B9qxAufFrWtNn
 8Q1Z/2NS3j3N2RydaHY6ytrGzfJqqjinPv85lQzLBuXIzyhAUCLVcu3KzIlsI9INEou8
 7VUQ==
X-Gm-Message-State: AOAM530b8JNfsNGX1jyqoI2kewCAaZEjChC8S9/y2wxwtbZ1qkCNbY42
 Q+P/AYJ7OC8BqC4s4/AKInClD52h+ko=
X-Google-Smtp-Source: ABdhPJyB+rkuopRDuPrBuocLY1n4jiCIkUKqBxciHAnYeKQC2jKwMNXidlwr93KWfYxetnYkW5IRlg==
X-Received: by 2002:adf:f2ca:: with SMTP id d10mr15093294wrp.79.1637946242232; 
 Fri, 26 Nov 2021 09:04:02 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id b197sm6602160wmb.24.2021.11.26.09.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 09:04:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Nov 2021 18:01:16 +0100
Message-Id: <20211126170116.920009-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to version
 3.4.10
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

Fix the following security issues:
- https://www.wireshark.org/security/wnpa-sec-2021-07.html
  (CVE-2021-39929)
- https://www.wireshark.org/security/wnpa-sec-2021-08.html
  (CVE-2021-39926)
- https://www.wireshark.org/security/wnpa-sec-2021-09.html
  (CVE-2021-39925)
- https://www.wireshark.org/security/wnpa-sec-2021-10.html
  (CVE-2021-39924)
- https://www.wireshark.org/security/wnpa-sec-2021-11.html
- https://www.wireshark.org/security/wnpa-sec-2021-12.html
  (CVE-2021-39922)
- https://www.wireshark.org/security/wnpa-sec-2021-13.html
  (CVE-2021-39928)
- https://www.wireshark.org/security/wnpa-sec-2021-14.html
  (CVE-2021-39921)
- https://www.wireshark.org/security/wnpa-sec-2021-15.html
  (CVE-2021-39920)

Drop WIRESHARK_BUILD_LEMON_TOOL and set LEMON_C_COMPILER which is
available since
https://gitlab.com/wireshark/wireshark/-/commit/61e66c37abb1b7f59726e4407ac8dd53e6b75cac

https://www.wireshark.org/docs/relnotes/wireshark-3.4.10.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.hash |  6 +++---
 package/wireshark/wireshark.mk   | 23 +++--------------------
 2 files changed, 6 insertions(+), 23 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 0876703e49..bc7c9f4d7e 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.7.txt
-sha1  3fa4bb774030442b9908243a9927d38479c52bf5  wireshark-3.4.7.tar.xz
-sha256  6c4cee51ef997cb9d9aaee84113525a5629157d3c743d7c4e320000de804a09d  wireshark-3.4.7.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.10.txt
+sha1  63839abd94d3ae376f860e2d2969777680106578  wireshark-3.4.10.tar.xz
+sha256  8aa7ef4a44ae62bb8db463cf761e2cc03b97305e0e77ed5be53fa83729187cef  wireshark-3.4.10.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 75b9c8b897..2ba81d1f39 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.4.7
+WIRESHARK_VERSION = 3.4.10
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
@@ -20,29 +20,12 @@ WIRESHARK_DEPENDENCIES = \
 	libpcap \
 	speexdsp
 
-WIRESHARK_MAKE_ENV = \
-	$(TARGET_MAKE_ENV) \
-	PATH="$(@D)/bin:$(BR_PATH)"
-
 WIRESHARK_CONF_OPTS = \
 	-DDISABLE_WERROR=ON \
 	-DENABLE_ILBC=OFF \
 	-DENABLE_PCAP=ON \
-	-DENABLE_SMI=OFF
-
-# wireshark needs the host version of lemon during compilation.
-# This binrary is provided by sqlite-src (which is different from
-# sqlite-autotools that is currently packaged in buildroot) moreover wireshark
-# adds several patches.
-# So, instead of creating a separate host package and installing lemon to
-# $(HOST_DIR), this binary is compiled on-the-fly
-define WIRESHARK_BUILD_LEMON_TOOL
-	cd $(@D); \
-	mkdir -p $(@D)/bin; \
-	$(HOSTCC) $(HOST_CFLAGS) -o $(@D)/bin/lemon tools/lemon/lemon.c
-endef
-
-WIRESHARK_PRE_BUILD_HOOKS += WIRESHARK_BUILD_LEMON_TOOL
+	-DENABLE_SMI=OFF \
+	-DLEMON_C_COMPILER=$(HOSTCC)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 WIRESHARK_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
