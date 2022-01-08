Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CB3C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD07940140;
	Sat,  8 Jan 2022 15:21:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Vdk_AmYUkuP; Sat,  8 Jan 2022 15:21:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF6DB40105;
	Sat,  8 Jan 2022 15:21:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F6EC1BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A1D34016C
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:21:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3My3Cs409NmK for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:21:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2BF7B400F2
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:21:07 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 18-20020a05600c22d200b00347d3a13c7cso2083847wmg.0
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 07:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mlyg96/QAEp4HIWmm1n5yskq7fUYgTfzyK8PIg8eWYs=;
 b=A+I8kdOjowP47jIQtvk5UHwfWjTXTrHzVtMY+4wgohmGG7F9oj/XbkR3j5Ulpcqhgl
 ZGJx/StAzYQ/lVtvNbr2oh9udBKY2qfzsSmAg5twGLG/cbRfJjvgPDCTqY91qJzWlL5N
 9o8b2vKXtg6ePJaiSYeLDcrVsqhYhR6AINEpLT8qm2J8MGM3chy3ZDi2fmaNoigrsVP2
 60xyx/WwRihcylxU4/Fkew2hZarP50H3uu8+6IuVshKOMNsjujtZipNoESOJ7AnzZIz9
 gePbgSbqZk2SnKvXtkUEmek+pbfC7QcgLQupCQ9RKpj47n4IQ/1czCJE2gYWPBH9k0UU
 omJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mlyg96/QAEp4HIWmm1n5yskq7fUYgTfzyK8PIg8eWYs=;
 b=nGP3rWaYuDiSOnRRjTrAK73zz58vRTkFhPiorXz2Y7VmsjQ5UfC8+8YLGkAzLF+fgr
 Ag40v99cMLEc1eY1rgcMQMLcSmcYs2FImhHmHr9lSo+MuFEk+kimHui34I84BumwGIxT
 +W4NPP7Ct31PD+sFokA7DKqW/ldq71MLsiyL0m8b+au2/9bmr6pgFmpC6ORIuHhRrSP5
 gFpnav1dj8isvmE2RlhQdvszG1KobDDQj9BsnHXi7m9Blj8iEiK/Tb8l+uttuQYYCSDs
 heD34LABh0/wbMmuIzTAHPguii8W+5Cbbd9CL+wFK4mMLiuLEJUvsk6I6oKNB2zSG8v9
 mrFw==
X-Gm-Message-State: AOAM533bbBNfpVKf0C/0calRELYT0aXy6tqSwN1S4oscRLXkC6FMe5xc
 JNZ7fcjBq2MnvHVxonT6mrDiKeZ2ibo=
X-Google-Smtp-Source: ABdhPJynKjiE+5QZbOealsJnm/DDlGFOU/cTwiEw3NHKD6v7+8TYMNymNvGLSQz5PxXt6xGX3zYKJw==
X-Received: by 2002:a7b:c4c8:: with SMTP id g8mr14803871wmk.192.1641655266249; 
 Sat, 08 Jan 2022 07:21:06 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id y15sm1646597wmi.40.2022.01.08.07.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 07:21:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 16:19:54 +0100
Message-Id: <20220108151954.2235611-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mbedtls: bump to version 2.28.0
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

2.16.12 was the last release of the 2.16 long-time support branch.
Users who want a long-time branch should move to mbedtls-2.28, which
is backward-compatible and will be supported for at least 3 years.

Use LICENSE file as apache-2.0.txt was dropped with
https://github.com/ARMmbed/mbedtls/commit/c76a54554ca8bffedf0e78a1cbdb64451e4ae957

https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mbedtls/mbedtls.hash | 6 +++---
 package/mbedtls/mbedtls.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 8247748afd..80ae173aff 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.12:
-sha256  294871ab1864a65d0b74325e9219d5bcd6e91c34a3c59270c357bb9ae4d5c393  mbedtls-2.16.12.tar.gz
+# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.0:
+sha256  6519579b836ed78cc549375c7c18b111df5717e86ca0eeff4cb64b2674f424cc  mbedtls-2.28.0.tar.gz
 # Locally calculated
-sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache-2.0.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 93ac1bb163..c238d664f8 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 2.16.12
+MBEDTLS_VERSION = 2.28.0
 MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
 	-DENABLE_TESTING=OFF
 MBEDTLS_INSTALL_STAGING = YES
 MBEDTLS_LICENSE = Apache-2.0
-MBEDTLS_LICENSE_FILES = apache-2.0.txt
+MBEDTLS_LICENSE_FILES = LICENSE
 MBEDTLS_CPE_ID_VENDOR = arm
 MBEDTLS_CPE_ID_PRODUCT = mbed_tls
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
