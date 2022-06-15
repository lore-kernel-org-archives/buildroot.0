Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F03C43334
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 21:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9A4A83155;
	Wed, 15 Jun 2022 21:10:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id udkWdOyysd_m; Wed, 15 Jun 2022 21:10:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FF938151E;
	Wed, 15 Jun 2022 21:10:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3928A1BF3DC
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 21:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3559840204
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 21:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Jaw2EnNdBCK for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 21:10:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B3134010C
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 21:10:03 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id h19so13706940wrc.12
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 14:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iS+8bb5MNuJLxVEy9yKCmQz0xBc4G2YQKUeT9dTOuwQ=;
 b=mmMpUTMczmTcZrThm/QXVRya0fXO9msrl9bYEtr9cEWlblqAZQnMsHtybRTuV9q3nT
 i1ZRyv9xK0Ii+6mDX8FVQQBvmOdT3x1e30MxJNl6Z/AD6PyezSJpiMwXuOHM5t8utOet
 fBKHLHXADmKA2uRViNKVyiZdqMBOeZbpowkvbTy0un0WLsln1ToazdDdkVjpufyF/acO
 K9cBFrs8GlosL+zD1DfgAb2KguYRv/buPgsXJgMF2dnLdkOX13wQkrf2svtssjfGIUl+
 laW817kNd2/4/59Rm2/XNcOhcgxTuCl/dsMkhsUbJyr4lb3o7hpzLVfeNWUy9wyMsNFt
 z5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iS+8bb5MNuJLxVEy9yKCmQz0xBc4G2YQKUeT9dTOuwQ=;
 b=pWnIY3xNYrP8eqB7kt38kMXJVVjczkoZzAj+OexGJ6RgOP79Hwgn+WO5CHtB3kEX2k
 8hb7TlmrzfQkO9TAmmABr13z6kpK/uNz2FpXTRO9MHUucIhTUCOMLCxD4muwJKo5pevL
 +LINsRn/4rShBp21zhyouC6YyhZKYAk5VpSvc0SQLjqA2DjBvUEEi9XgyuEmDx76pc8X
 hv3GPgJ3lEq072UgP2RXndYmjP/usdB+43gRN0dw/hQDFSg5033p5RYznVB153UTNRB7
 ezWcpMxVgG0i/avwt4y3YronTSh0q+pcejYzmg4+8knjrN1MHDxwVDiYGC4Xz70XkF2l
 0wLw==
X-Gm-Message-State: AJIora/qW2wrA0c0reDsMdp8knFvQux4gXd2BFkLgjo5++NEqf03T1hU
 /6FW2PJixZ2+T7L6S3F6mGgadZjaWJI=
X-Google-Smtp-Source: AGRyM1uyWpcg+0mp+68gjvLZqqxOSvSsD9NOYzjkNRtHTMcvFXqHDRCcC0VLgDssH9wwtA/SQk2PxA==
X-Received: by 2002:adf:a4d8:0:b0:219:ecd4:159b with SMTP id
 h24-20020adfa4d8000000b00219ecd4159bmr1574949wrb.431.1655327401811; 
 Wed, 15 Jun 2022 14:10:01 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 eh1-20020a05600c61c100b003973d425a7fsm35408wmb.41.2022.06.15.14.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 14:10:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Jun 2022 23:07:24 +0200
Message-Id: <20220615210724.120635-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-bottle: security bump to
 version 0.12.21
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix CVE-2022-31799: Bottle before 0.12.20 mishandles errors during
  early request binding.
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-bottle/python-bottle.hash | 6 +++---
 package/python-bottle/python-bottle.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-bottle/python-bottle.hash b/package/python-bottle/python-bottle.hash
index 7dcaac8dc6..b1cc2aac20 100644
--- a/package/python-bottle/python-bottle.hash
+++ b/package/python-bottle/python-bottle.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bottle/json
-md5  50075544706b5e662a3fbd9a98e24b07  bottle-0.12.19.tar.gz
-sha256	a9d73ffcbc6a1345ca2d7949638db46349f5b2b77dac65d6494d45c23628da2c  bottle-0.12.19.tar.gz
+md5  4934ad7347eef30db669ccd05283a5e0  bottle-0.12.21.tar.gz
+sha256  787c61b6cc02b9c229bf2663011fac53dd8fc197f7f8ad2eeede29d888d7887e  bottle-0.12.21.tar.gz
 # Locally computed sha256 checksums
-sha256	d0e7211f1c3c1a1c56f39d18bcb07f27f480c8a9552617756dda3a335933b8a6  LICENSE
+sha256  d0e7211f1c3c1a1c56f39d18bcb07f27f480c8a9552617756dda3a335933b8a6  LICENSE
diff --git a/package/python-bottle/python-bottle.mk b/package/python-bottle/python-bottle.mk
index d19a439f8c..ffea59f38f 100644
--- a/package/python-bottle/python-bottle.mk
+++ b/package/python-bottle/python-bottle.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTTLE_VERSION = 0.12.19
+PYTHON_BOTTLE_VERSION = 0.12.21
 PYTHON_BOTTLE_SOURCE = bottle-$(PYTHON_BOTTLE_VERSION).tar.gz
-PYTHON_BOTTLE_SITE = https://files.pythonhosted.org/packages/ea/80/3d2dca1562ffa1929017c74635b4cb3645a352588de89e90d0bb53af3317
+PYTHON_BOTTLE_SITE = https://files.pythonhosted.org/packages/95/e3/5749d7657b6fb38d65afb3c0b345514a783de7a9feb4fab594fa0bacc2a0
 PYTHON_BOTTLE_LICENSE = MIT
 PYTHON_BOTTLE_LICENSE_FILES = LICENSE
 PYTHON_BOTTLE_CPE_ID_VENDOR = bottlepy
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
