Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7BBC433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 18:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C1A3404B6;
	Fri, 14 Jan 2022 18:04:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rPftWNFNhfca; Fri, 14 Jan 2022 18:04:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A725F40477;
	Fri, 14 Jan 2022 18:04:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6FF531BF2A3
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 18:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B9828135D
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 18:04:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5-FtEGvcMvwJ for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 18:04:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BE34812A5
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 18:04:06 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id v123so7515717wme.2
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 10:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WPKJO0ugVcuoKY/4zdJPsp/Pbi3ZBnRh1z9X2w4JIOE=;
 b=oPAcSf/559m+MUbrKY/aQXGXTujzgr3mBVmYRwroM7XLjvlxK2vIePgdVvpDWqqCDm
 SqIvLm0v5GpRaSOHuHdo7Hh5tHDIoPlf/3JXGyaU1YUQZhCrNpGbahWywrfakXjmOW17
 NIFGrcdrfed1p9idQp0wVzk/IYGH7Z9YCDFyCbc2tCYc++JYDfgW7EF19dnVUwZZ130j
 jf9Udg6QZVwLWwbHi+VdCC/EYAcySOXigd+JPQUiCxjiir+Gt33Fg2OhM1fxiDkTp0wo
 Xlm/2k0K7RUVuIhvAZ/BseUbTJU1di12ppPld3mDhj345rH9z5Ynqdmeu3hnx6pgdY+m
 TuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WPKJO0ugVcuoKY/4zdJPsp/Pbi3ZBnRh1z9X2w4JIOE=;
 b=31FAsAr0CcByC7SDkcacT+Mid1x91b+H5seOQDMTDn6S/BaT44EQjFhaEebWD+8G28
 x4+L31mPnXo8JarIu2zWJKFH4F4M5BQTof5sVt3hfJ8P8+58WW1Ivz1hnTQWN4ct/LgX
 h07aHMU9uqgCkImETbSqOFGU1F9Kc3fo3OWlYM/P2rUHGRXs3ohvGWbhGT4sl/YEEDSd
 /63k9CTUeuPGjgnRqnbwfH9y4Xs0bshs4RnfThciGsePvGWdOmvBCkXJQDV0BnAQpoRh
 S4UjG1tpxnujvEW5o8GBz7s8MHyghzu1IwY4Kc9Al3AdlrdYwAM97VWTpjZ0+CW68Zw3
 DciQ==
X-Gm-Message-State: AOAM532HK1hkt6kD0NtJrTkSlVsOvGv0XrR2wHqY0ndoMkJQqemhgm7S
 gtU7TLhwqmMiluJyQdDHD2AvNA8T9Iw=
X-Google-Smtp-Source: ABdhPJxYrMt9xdy/+v2jQOqKPSxZLHD0zEysyso9ONyjjMCZNR9LsupJ6MQH8fPxHDEDXxSb2ZPHHg==
X-Received: by 2002:adf:dfc8:: with SMTP id q8mr9640240wrn.142.1642183444639; 
 Fri, 14 Jan 2022 10:04:04 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id i6sm1135206wrf.21.2022.01.14.10.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 10:04:04 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 19:02:42 +0100
Message-Id: <20220114180242.963756-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/targetcli-fb: add
 TARGETCLI_FB_CPE_ID_VENDOR
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:targetcli-fb_project:targetcli-fb is a valid CPE identifier
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atargetcli-fb_project%3Atargetcli-fb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/targetcli-fb/targetcli-fb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
index 75643446d2..7425423b8f 100644
--- a/package/targetcli-fb/targetcli-fb.mk
+++ b/package/targetcli-fb/targetcli-fb.mk
@@ -10,6 +10,7 @@ TARGETCLI_FB_VERSION = 2.1.fb41
 TARGETCLI_FB_SITE = $(call github,open-iscsi,targetcli-fb,v$(TARGETCLI_FB_VERSION))
 TARGETCLI_FB_LICENSE = Apache-2.0
 TARGETCLI_FB_LICENSE_FILES = COPYING
+TARGETCLI_FB_CPE_ID_VENDOR = targetcli-fb_project
 TARGETCLI_FB_SETUP_TYPE = setuptools
 TARGETCLI_FB_DEPENDENCIES = python-configshell-fb python-rtslib-fb python-six
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
