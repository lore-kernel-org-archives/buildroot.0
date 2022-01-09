Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0359C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 18:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FBFF60BC1;
	Sun,  9 Jan 2022 18:08:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id esiqOaFGf_IQ; Sun,  9 Jan 2022 18:08:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8758A60BA4;
	Sun,  9 Jan 2022 18:08:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 719021BF488
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 18:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B75F81767
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 18:08:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mYx2r-9kRL6l for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 18:08:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18EA48145F
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 18:08:27 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id l10so22517535wrh.7
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 10:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hYmDuHox31sm/il7oqN3pwNba+9WAJppCrQwByb8YJQ=;
 b=Swl5pSHHtvH6jwes9ar9QSVq67NtddOoLsSlQvsUZ5EDZGuxwfLldNCG3ECqUPRvFx
 a1vt1MCNK06qwEUMvdwMkA2fBg1RjfxkFFkxfP11owSnUn+UsT4RdMdHKsblcahIe0Mi
 l51HmNRQL9jWIAYVKNpmznBNY3m7FsYUUMmU3h2CO+y4e+3c6xsModYnVnPnUordBzZy
 teJgSZAA4eSpEZAbIWS3kU5iNUcNuLXyGXKVqveEGiFBenpSFNhK8RanVFZhIHW3nD5c
 +TJWsTf0oxcXNanDIm5a8NEP0xPubGbPye96g9wgK3txaTWbvLZ/GZ/B3rnxCrT+P5+q
 vHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hYmDuHox31sm/il7oqN3pwNba+9WAJppCrQwByb8YJQ=;
 b=Cutmbkq/9807chGE6uiGEWyCzZ+eB96W6GCheFq3HQvp56jStQDIGdElv3A82drDEU
 9lCYIgrFzdrxw9szWIp2udH3mG/cRpJFcUagB40PfEWBTdyb37UBSTWmRGp2wBJVaFFE
 NSGUBAEnplqXDFqlkmNQjJCFwOzIxRmdNbxjFBy9PoVe5Mh2PCce20cjnNNZibNVS6vr
 PNMG0iBVGePhgpPdu9GDan8pii/O9b/s9Lf+PSXPe2VlcCpgYYdBoE950jcifT2ePuy0
 lo/8atVlOiDAFfxPS8VQY1xI0mbHxgm/7OAmc0e+vE4jkuMXlcGT9nvR4sorbAyCyxtl
 YI1Q==
X-Gm-Message-State: AOAM5332cHCNZnf9puzrncyivLeG/v2xoW/6yKDQ08na07SJJu8amlNx
 ONML7+AE9lR9g4rNGQxi2QF+h7XmxBQ=
X-Google-Smtp-Source: ABdhPJx1oGLdYn/17hYUBLAqttsPyl9jANPGcJL1dcCUes2DP0BEjCxqIawZ+lFyqzhnWMKKn/OecA==
X-Received: by 2002:adf:f985:: with SMTP id f5mr62463059wrr.14.1641751705204; 
 Sun, 09 Jan 2022 10:08:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id 14sm5030275wry.23.2022.01.09.10.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 10:08:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 19:06:57 +0100
Message-Id: <20220109180657.2765079-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mbedtls: disable
 MBEDTLS_FATAL_WARNINGS
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

Disable MBEDTLS_FATAL_WARNINGS to avoid the following build failure
since bump to version 2.28.0 in commit
0f8aab08e762742d753d5920718f31c629d0f8d7:

/home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/features.h:412:4: error: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
  412 | #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
      |    ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/af017382bb5772de7383d71ed7b8af44717981f9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mbedtls/mbedtls.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index c238d664f8..5facb99b2a 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -8,7 +8,8 @@ MBEDTLS_VERSION = 2.28.0
 MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
-	-DENABLE_TESTING=OFF
+	-DENABLE_TESTING=OFF \
+	-DMBEDTLS_FATAL_WARNINGS=OFF
 MBEDTLS_INSTALL_STAGING = YES
 MBEDTLS_LICENSE = Apache-2.0
 MBEDTLS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
