Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E97C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 22:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0339B40276;
	Sat,  4 Dec 2021 22:37:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id URaZDjvraaOD; Sat,  4 Dec 2021 22:37:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B4E8401AF;
	Sat,  4 Dec 2021 22:37:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD1DB1BF3F7
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC4FF82D75
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:37:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MV3aA1FI38ZD for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:37:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02536828E3
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:37:05 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id p18so5191573wmq.5
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 14:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/wO7ewZ9OrUM2DIk2WSupjo4INai9nBgy2iqK0dem7k=;
 b=cfJbuxt82evg8/ePxPltdqaz447d+Cywb84H/NSoomDso2gv5lU9Fhf6zMMhqvTj48
 YWyt0EgGHjxOB0/dGeSJ4DtyBJZn1UwTp2Jf58+OjgGIsyz+Mho/JLQzn5iEBdui8N+z
 6YRl2HSEOYFarvCPlO/IOflsNXNavrBOxX1cXtmt3ubTFvr3NoFxypMengZPCcj+/JuT
 MHrnG+VpQfc2EB62PGPwfz0JSoQ4Kvvsh1lI5oNgH8Un1uh9KDBPuMnYPHpTgELMArrD
 3zZBQZr+dYj2UwyBPAoiyhVUsx86ABLi2JZ+iBi/t88Wkx32LB5y0dJF0C7RCFFMtBR5
 sApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/wO7ewZ9OrUM2DIk2WSupjo4INai9nBgy2iqK0dem7k=;
 b=zTUyhLoaht+f5so1R6ouhzF1nasJw0vS69hCGWAkYnxpIy2pBNzeiOlZwUqD/rA1tn
 1+5533tdi55azfQfuB2N2dAbjRNr4jVtpHM6/n1MJAa1puJ2wXfrflB8HN3J6wHxFQKJ
 jB//tcoyTFkijaMwM6Wz+CCO3Gv/wp50kKZxlTgQKl9Za/9KwHhZDFwaxV+YQC0jL6fZ
 K9GEpzVBw4vfkRJTXL01Qnxg18EaBeVpOykv7Rc1/1YkfdukOzHOZzPZ9ZRkNi0w2b5N
 /8oPNSdB1rzIK0Z51XZM4uvEmVRDEPTIQpx1w5LNWPoF4vqXWnFnY+TwejBXuC1Py2+r
 vmEQ==
X-Gm-Message-State: AOAM533qGxNLQljNWUdLSLr4lNfJNbVcH5WgNFrsJAX+YyATWIBA225e
 M4v0ts4ezVl+GdkkTA4mMurBiUOSZaXiWA==
X-Google-Smtp-Source: ABdhPJwb/bfws38vPjAQYOhQUiUNWrRWGDHj2kGfCWHc0ge+3KlVJQCexot5/WbjTMTu6YBAz0a5/Q==
X-Received: by 2002:a1c:1f53:: with SMTP id f80mr25928656wmf.129.1638657424028; 
 Sat, 04 Dec 2021 14:37:04 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id o3sm9688605wms.10.2021.12.04.14.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 14:37:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 23:36:40 +0100
Message-Id: <20211204223640.2022478-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/hplip: add CPE variables
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

cpe:2.3:a:hp:linux_imaging_and_printing_project is a valid CPE
identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ahp%3Alinux_imaging_and_printing_project

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hplip/hplip.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/hplip/hplip.mk b/package/hplip/hplip.mk
index 9eac83d567..c3aae157d4 100644
--- a/package/hplip/hplip.mk
+++ b/package/hplip/hplip.mk
@@ -10,6 +10,8 @@ HPLIP_AUTORECONF = YES
 HPLIP_DEPENDENCIES = cups libusb jpeg host-pkgconf
 HPLIP_LICENSE = GPL-2.0, BSD-3-Clause, MIT
 HPLIP_LICENSE_FILES = COPYING
+HPLIP_CPE_ID_VENDOR = hp
+HPLIB_CPE_ID_PRODUCT = linux_imaging_and_printing_project
 
 HPLIP_CONF_OPTS = \
 	--disable-qt4 \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
