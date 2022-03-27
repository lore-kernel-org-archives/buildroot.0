Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB13C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 20:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07C7B416D0;
	Sun, 27 Mar 2022 20:59:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dCH8XfRUBsMe; Sun, 27 Mar 2022 20:59:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7F04416CC;
	Sun, 27 Mar 2022 20:59:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C9DB1BF20B
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 20:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BBED81D02
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 20:59:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SKW-632YA1gq for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 20:59:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E0C681C6F
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 20:59:17 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id u3so17740701wrg.3
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 13:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dofeBQJZins8v5MMeg/43E5/KWJyl77RprmHbU25gC8=;
 b=OpUz3OKg+g2a4xX70yIA/YCBkZxF+tbzE9SWT5Axodf8i4EsuBApx9XWto0MKMV0Bd
 +0lknHW0lCaC2aTO8CNcjg4EmxrPietkVzTvz/4CGYk0a+dAxa/5lWNtV3X8+iNrPHPO
 0B8xDm/HpyyhCIUSNGg/mcl3Gl219lBJSSEt+yM7z5UG9AHSANgNoKrgbIPGqdsEsHT0
 LcrEiiRMWaOMSig7vok6+lvG2pU4ECKanmUWs1JwCWW17HlcE/e3l61Er63Wj8an5zVd
 G0AWo2FuGW5cpqkU+7fXAKQwSgBKdYQGBoFBDcOKjXM0KyQWhMZaI1ZKHTxCn30fXCdf
 U70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dofeBQJZins8v5MMeg/43E5/KWJyl77RprmHbU25gC8=;
 b=S9P48m4LU6cBqxnZZWvKG8asF2OAMBNKGBYalh/q7fUUVhC58nxf2UimCrh7mQaVMI
 sxAh1zoAaiXE1bqvi1qYlNJUEwz95xKvdaLFb3J/ZK4sOKxCQHtetZh9xaRsFrPwIy0e
 308jwK4wqmQVKWLc4AljzEkS7pgZut/qfgdxP1a48Ya3Q1ekGutWHLHR1zgK+us1f9A9
 SAqt83BFAbFpWk7dIdlyYR//YOL18eqWMiAnAHn77TY8raxxLstMfvy5rbwQxRzhgmYp
 SdzJPixc7mKT3fXZFpgQJUdUSl8MZuCcnt0KBO0r+VFDVrhLkEITPnQ0vBX9/mt7r0EI
 OsjA==
X-Gm-Message-State: AOAM532BGs8rxI5SO4H1oBF2eOSWrap3fz7D0KH2xM2/0JjoyQBMIb52
 mTYdBd2A+yAgPw19+vebjnm0i+m68YA=
X-Google-Smtp-Source: ABdhPJzsw+erimV3eeA/H/639Vk6qrYpU1DGfisSjhSUcWYrH41teJpFw0sIfEWJ7VMvmQLXJIS8sg==
X-Received: by 2002:a05:6000:1047:b0:204:101:7c79 with SMTP id
 c7-20020a056000104700b0020401017c79mr18891717wrx.277.1648414755444; 
 Sun, 27 Mar 2022 13:59:15 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 q17-20020adff951000000b00205c1b97ac4sm968338wrr.20.2022.03.27.13.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 13:59:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 22:57:50 +0200
Message-Id: <20220327205750.1448336-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/unclutter-xfixes: bump to version
 1.6
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

https://github.com/Airblader/unclutter-xfixes/releases/tag/v1.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/unclutter-xfixes/unclutter-xfixes.hash | 4 ++--
 package/unclutter-xfixes/unclutter-xfixes.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/unclutter-xfixes/unclutter-xfixes.hash b/package/unclutter-xfixes/unclutter-xfixes.hash
index 785825da7a..b0bd5532ef 100644
--- a/package/unclutter-xfixes/unclutter-xfixes.hash
+++ b/package/unclutter-xfixes/unclutter-xfixes.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 35c75ad24be989dd6708db1d9ce9b2a2f814b80638c0633cdb075c6df090ed11  unclutter-xfixes-1.5.tar.gz
-sha256 33e94693849b57fdb34987c95fd0076b4aa4b70fcd9a3152313d00b86a3f7bf7  LICENSE
+sha256  6f7f248f16b7d4ec7cb144b6bc5a66bd49078130513a184f4dc16c498d457db9  unclutter-xfixes-1.6.tar.gz
+sha256  33e94693849b57fdb34987c95fd0076b4aa4b70fcd9a3152313d00b86a3f7bf7  LICENSE
diff --git a/package/unclutter-xfixes/unclutter-xfixes.mk b/package/unclutter-xfixes/unclutter-xfixes.mk
index 713a84bca6..6da607b660 100644
--- a/package/unclutter-xfixes/unclutter-xfixes.mk
+++ b/package/unclutter-xfixes/unclutter-xfixes.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNCLUTTER_XFIXES_VERSION = 1.5
+UNCLUTTER_XFIXES_VERSION = 1.6
 UNCLUTTER_XFIXES_SITE = $(call github,Airblader,unclutter-xfixes,v$(UNCLUTTER_XFIXES_VERSION))
 UNCLUTTER_XFIXES_LICENSE = MIT
 UNCLUTTER_XFIXES_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
