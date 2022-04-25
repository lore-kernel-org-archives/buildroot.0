Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779BAC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 21:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BD04416DE;
	Mon, 25 Apr 2022 21:26:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sBfej-jWkIo3; Mon, 25 Apr 2022 21:26:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF89E41674;
	Mon, 25 Apr 2022 21:26:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A3AA81BF3A6
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 21:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F1DE4167B
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 21:26:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r6OMYDOZhDMF for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 21:26:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68EC44160B
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 21:26:18 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id w4so22638749wrg.12
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 14:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xk9IrWI1x81GUjBLNkrBEzfxe++jWp61kUAU8DXl9P4=;
 b=JG5Y6Db3RI2zkDPFBjD+yF+Q71DkzBeoJAGb2Hli7tqJWMr4KiZW4QPHLpei0UTnBY
 iRab1S/Jx3H4bCenNJExFaZLJ331WgmkWh7nsAUt2/EJdNCjBwH6YFXhkHZMAEZ9E3/v
 cAW+mBogRL7vB+04RBjy2BVlH2RFppH2FRQe9LyGuY2t8oYauh4Qyb/r0Us0vqtWh4mU
 vSbyjVn+hyt4JD8lRWh8NgYZJIp2N5UJxBct3yVjDRx6LqxYkm+yCXYJ7J4eWuwIStJq
 wiP+4UutCjjc+pu9V0awP5b2cOT8KbGwwAPWDWxxbWUncUdtAlxdSaIHxshQnKz5kE2q
 5N0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xk9IrWI1x81GUjBLNkrBEzfxe++jWp61kUAU8DXl9P4=;
 b=ogIu5uyfgwCLBGTbghxxGVjhVfnboh6+xEOES3fbJOzYX3NiSVzMZLpFwv5ymUf4AG
 7i3nQ77JBJ8TA0VIRv8Aeb2ErgltHuX3Z4YIgTcV/k40ERMcQBgJqZ3VEP3HBrZyOXH8
 Iq3CgtqNdeYOv5fWuc6E1VuSnDFTWk8X7k/MuK02g5D9UmvwN8+GJmR/NDDRogtyr30G
 Z663pCxrqC5bC4kFeTwY1iJuMYcx8GpW98Klswo2+kbtDWLw2KwQZ1b9Jvm8ersA95cU
 iogFntOajVJMc4L3ZZhsIujy1RH6E0wxQHFosDcuAhVey++hGs+S5nh1GvlOFaAcsPBy
 jV8A==
X-Gm-Message-State: AOAM531axbMOq4KFMpF7imejfgpRd8Hn//C6Y3AMioSqnsjNQ3QYRsZq
 2VIpwm9PlDC9OiBiaI/rM5zRTwGwP6U=
X-Google-Smtp-Source: ABdhPJxVF3OQqgu80whrqXHS+R/orE9oGkZVu3W3wFtKKkTCnOP873zovwtJVPriUaNkZ6zpHjHvdw==
X-Received: by 2002:a5d:448e:0:b0:20a:de9a:a7f3 with SMTP id
 j14-20020a5d448e000000b0020ade9aa7f3mr4056506wrq.129.1650921976301; 
 Mon, 25 Apr 2022 14:26:16 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 s10-20020adf978a000000b0020ae0154f1esm2023731wrb.5.2022.04.25.14.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 14:26:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 23:23:38 +0200
Message-Id: <20220425212338.1105933-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] Revert "package/pure-ftpd: doesn't build
 with libressl"
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

This reverts commit e87e6fd085b8a4965b9dc84635fd36e380da4dde as
pure-ftpd can be built with libressl since bump to version 3.5.2 in
commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2 and
https://github.com/libressl-portable/openbsd/commit/f5674b4e2330b382bacefd3393affc8eb2ee2ba8.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pure-ftpd/pure-ftpd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 0354949e28..f3cbef84b9 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -45,7 +45,7 @@ else
 PURE_FTPD_CONF_OPTS += --without-ldap
 endif
 
-ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
 PURE_FTPD_CONF_OPTS += --with-tls
 PURE_FTPD_DEPENDENCIES += host-pkgconf openssl
 PURE_FTPD_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
