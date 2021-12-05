Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E841C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 08:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0885C4056A;
	Sun,  5 Dec 2021 08:49:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Piz3rF_TGpQ; Sun,  5 Dec 2021 08:49:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E2D24039C;
	Sun,  5 Dec 2021 08:49:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D05A1BF593
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 08:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 165CE4039C
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 08:49:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lZNXdq72SOns for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 08:49:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CBEDD40384
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 08:48:59 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id c4so15554699wrd.9
 for <buildroot@buildroot.org>; Sun, 05 Dec 2021 00:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rOYX6SUrRRq/FHyNCcCrmlPrTHvsGgHlE+QlvbEP6DI=;
 b=fuwu8FdMGB4Z5C38oT9y6DikfcLHG7QQwHCLOCVfPCwzIGNEoT/2JLFn84gDmpfjYH
 7s2h1mmXUxmAsmDc0zoPTpZY9vZqnAKStnwHn0LrgMUYy+x5egPa+OqFyRnz9nfNrjCl
 uy+ftw0/GGDFLxmUzfuB2RQoTzc1fQfmaHwfvOFQy+PifdGcVnsAywRrdFHDit0RUcAz
 R+9VqEcYTM6POukLRMpPPJerw74Zr5gDbqisjwY22lhLh5208uKHdOVukuVa1dcZzi41
 DlWr2uk5eIobw4MnR0P+RgyImGBkSAxVcVOYaSq/O7ZCoteCpzxOss54evAR4/sg4UmZ
 nk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rOYX6SUrRRq/FHyNCcCrmlPrTHvsGgHlE+QlvbEP6DI=;
 b=j0NtECHjaloItXN2Hh+w5v51YWGbfj/4UlB2FMrYaU0Cb1ZoEPKUDwAZtiDsOfR0zm
 sZ0+7LhwWZJ5AnebcM2vPAdSMqj9kSZ5KZhMFfU/f/F/zRwoRaKev8hUUWSJp6zhEeSq
 S7I+eIUiCqGPZPHigcM18391IW2YgKekiPsvk5pBCeLM4df8VraEW/snomlfIq6K7yEj
 Oyg8T7hY1o88pWD/+d5wXDkvswCWOu+l6EOKAl7R0MjrJUkgCgFw2octJNvM4vWRDzRR
 pTf+kAHP0FbRXeBpXYNR5+FpngivI9ytrcKslYCdLeGDs9FeOITA5zvrZ5uH9rKH5o1j
 x4ug==
X-Gm-Message-State: AOAM530OTSZFFnVw+2dl1SaK18Ae0RmVa0DdNNeOUL809QKn7jkLYLp0
 fEJStATs3fF9RH/hgfGiDOCFvQigbfbhag==
X-Google-Smtp-Source: ABdhPJxkLNb4lp42LIKF+rda6xKieD82Fux+jmioLu7lXg7Uac0YtsT7tQCCBe4o7xd4wOXvBnmz2A==
X-Received: by 2002:a5d:6547:: with SMTP id z7mr33702804wrv.597.1638694137787; 
 Sun, 05 Dec 2021 00:48:57 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id j18sm12683249wmq.44.2021.12.05.00.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 00:48:57 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Dec 2021 09:49:00 +0100
Message-Id: <20211205084900.2108940-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/apr: add CPE variables
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

cpe:2.3:a:apache:portable_runtime is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aapache%3Aportable_runtime

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/apr/apr.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index 466222586c..c45829aacc 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -9,6 +9,8 @@ APR_SOURCE = apr-$(APR_VERSION).tar.bz2
 APR_SITE = http://archive.apache.org/dist/apr
 APR_LICENSE = Apache-2.0
 APR_LICENSE_FILES = LICENSE
+APR_CPE_ID_VENDOR = apache
+APR_CPE_ID_PRODUCT = portable_runtime
 APR_INSTALL_STAGING = YES
 # We have a patch touching configure.in and Makefile.in,
 # so we need to autoreconf:
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
