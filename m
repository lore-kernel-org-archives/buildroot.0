Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C78C433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 17:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C18584055D;
	Mon, 21 Feb 2022 17:26:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O5je7QIOPca5; Mon, 21 Feb 2022 17:26:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7876D404A0;
	Mon, 21 Feb 2022 17:26:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6FDC11BF339
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 17:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E3928134E
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 17:26:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M63yFxb46ESL for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 17:26:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2752681393
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 17:26:30 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d3so12679607wrf.1
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 09:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MfvtfnjyFOT9qJUV6HcjhktiZZYPWgVl2I42A+K0Z2Y=;
 b=VHeYNCB6PCynwevOt7UDWZqRUbvsr4EsuHiBRxthJk5xVp+3EyopViyGnLPSv8VmHL
 SM3johsQ8ES8J/fzElsCRtyDrqpZDicuNae4seAv0Qzqya+7e1dF3eV7WdULGd3bsDxa
 SGyVE3bKY9S5anZKnbvzlO6OvgzP0+3DwK9r2geT0aGnzsbmt6VSutrlos6652zZP9gZ
 HGl/piYy7zsgpP98tAAY/6ltXLYqdHHnf9QenFH6cd8EJq97HqoGPyX/JyHxR3PpFd86
 e74gzR0a+XuDSn9lZrdMybhzBhsR8cRMeEmzOIqsjVoUVzNKZH1xWLVg9vo/iafqTEh6
 xm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MfvtfnjyFOT9qJUV6HcjhktiZZYPWgVl2I42A+K0Z2Y=;
 b=EyrAASmG3X9z/d8CoNqbLiIFLSq6lnQLTRACRlkOprt51Wp2NjNYeChDD3vFXdM7c4
 o9pXXiVlhJ7RFUL4+syJOKrDMQzx/T5VUt12zCp90bkNlecYFXhUJFPqNE+/krZZJlRe
 KL+bRd59tV/5P3k+FLKb/QHo4C+eT9Hr0RGiTFyaGEfMGaO4lnfnnKGWud+8I4qU2ER1
 xiivWrffwiXImpPEnPHF7bJ40W/MPhx6CgftAToOoWVnbQaM/QaVUbENkqABQYyK7VXe
 cMN34uAkRgQYstzRDnlP9no7VyZi1eNg4lCI4Ar154QGEoT+ewK0dE3RCz6WinOd5GGi
 4XUg==
X-Gm-Message-State: AOAM531ULx2JK+bgZwvVs6TtZZKY7L3UXYPrUf2tMZdUeNcfKODVn5BO
 plxh2LLYA6g+c4iaeE27uBS80KUesNA=
X-Google-Smtp-Source: ABdhPJy2BlmzFLnWFS8hyBi6Za3HDszdjk/TrJ72p5V+E9Z2xn+f4jWMmBwKnajkoCI2KcUSaq4nrA==
X-Received: by 2002:a5d:64c1:0:b0:1e4:987a:51b with SMTP id
 f1-20020a5d64c1000000b001e4987a051bmr17174485wri.471.1645464387897; 
 Mon, 21 Feb 2022 09:26:27 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 v124-20020a1cac82000000b0037c3d08e0e7sm7874411wme.29.2022.02.21.09.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 09:26:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 21 Feb 2022 18:26:21 +0100
Message-Id: <20220221172621.1937610-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/flac: security bump to version 1.3.4
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This release mostly fixes (security related) bugs including:
 - Fix 12 decoder bugs found by oss-fuzz, including CVE-2020-0499
 - Fix encoder bug CVE-2021-0561

Also:
 - Replace first patch which was reverted by
   https://github.com/xiph/flac/commit/4fbb6d4f2ecf2a96c17ea9880108409f852c08a9
 - Disable stack protection (enabled by default since
   https://github.com/xiph/flac/commit/f706f2832270a0b7851cdffe62ad37acda9423fe)
 - Drop md5 which is not provided anymore
 - Update indentation in hash file (two spaces)

https://github.com/xiph/flac/releases/tag/1.3.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ck-for-sys-auxv.h-before-defining-FL.patch | 36 -------------------
 package/flac/flac.hash                        | 12 +++----
 package/flac/flac.mk                          |  5 +--
 3 files changed, 8 insertions(+), 45 deletions(-)
 delete mode 100644 package/flac/0001-configure.ac-check-for-sys-auxv.h-before-defining-FL.patch

diff --git a/package/flac/0001-configure.ac-check-for-sys-auxv.h-before-defining-FL.patch b/package/flac/0001-configure.ac-check-for-sys-auxv.h-before-defining-FL.patch
deleted file mode 100644
index d1398d4b3e..0000000000
--- a/package/flac/0001-configure.ac-check-for-sys-auxv.h-before-defining-FL.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 14a0713389fbfef59225d027ea466ebb478a8c6b Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Thu, 19 Sep 2019 21:18:04 +0200
-Subject: [PATCH] configure.ac: check for sys/auxv.h before defining FLAC__CPU_PPC
-
-Upstream: https://github.com/xiph/flac/pull/142
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0228a12..64cb3f2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -144,7 +144,7 @@ case "$host_cpu" in
- 	powerpc64|powerpc64le)
- 		cpu_ppc64=true
- 		cpu_ppc=true
--		AC_DEFINE(FLAC__CPU_PPC)
-+		AC_CHECK_HEADER(sys/auxv.h, AC_DEFINE(FLAC__CPU_PPC))
- 		AH_TEMPLATE(FLAC__CPU_PPC, [define if building for PowerPC])
- 		AC_DEFINE(FLAC__CPU_PPC64)
- 		AH_TEMPLATE(FLAC__CPU_PPC64, [define if building for PowerPC64])
-@@ -152,7 +152,7 @@ case "$host_cpu" in
- 		;;
- 	powerpc|powerpcle)
- 		cpu_ppc=true
--		AC_DEFINE(FLAC__CPU_PPC)
-+		AC_CHECK_HEADER(sys/auxv.h, AC_DEFINE(FLAC__CPU_PPC))
- 		AH_TEMPLATE(FLAC__CPU_PPC, [define if building for PowerPC])
- 		asm_optimisation=$asm_opt
- 		;;
---
-2.23.0
-
diff --git a/package/flac/flac.hash b/package/flac/flac.hash
index df7c2d1b95..2444535e0f 100644
--- a/package/flac/flac.hash
+++ b/package/flac/flac.hash
@@ -1,10 +1,8 @@
-# From https://ftp.osuosl.org/pub/xiph/releases/flac/MD5SUMS
-md5 26703ed2858c1fc9ffc05136d13daa69  flac-1.3.3.tar.xz
 # From https://ftp.osuosl.org/pub/xiph/releases/flac/SHA1SUMS
-sha1 6ac2e8f1dd18c9b0214c4d81bd70cdc1e943cffe  flac-1.3.3.tar.xz
+sha1  99c28482a8b2d81deaf740639e4cb55658427420  flac-1.3.4.tar.xz
 # From http://downloads.xiph.org/releases/flac/SHA256SUMS.txt
-sha256 213e82bd716c9de6db2f98bcadbc4c24c7e2efe8c75939a1a84e28539c4e1748  flac-1.3.3.tar.xz
+sha256  8ff0607e75a322dd7cd6ec48f4f225471404ae2730d0ea945127b1355155e737  flac-1.3.4.tar.xz
 # Locally computed
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
-sha256 5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LGPL
-sha256 fa27cb11f13f97b0c5f3ff363b1e2610c6efe87ed175779cb2a78e44eb19d34c  COPYING.Xiph
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
+sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LGPL
+sha256  fa27cb11f13f97b0c5f3ff363b1e2610c6efe87ed175779cb2a78e44eb19d34c  COPYING.Xiph
diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index 9aa00b7ffd..2ff048b6e6 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLAC_VERSION = 1.3.3
+FLAC_VERSION = 1.3.4
 FLAC_SITE = http://downloads.xiph.org/releases/flac
 FLAC_SOURCE = flac-$(FLAC_VERSION).tar.xz
 FLAC_INSTALL_STAGING = YES
@@ -19,7 +19,8 @@ FLAC_AUTORECONF = YES
 FLAC_CONF_OPTS = \
 	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-cpplibs,--disable-cpplibs) \
 	--disable-xmms-plugin \
-	--disable-altivec
+	--disable-altivec \
+	--disable-stack-smash-protection
 
 ifeq ($(BR2_PACKAGE_LIBOGG),y)
 FLAC_CONF_OPTS += --with-ogg=$(STAGING_DIR)/usr
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
