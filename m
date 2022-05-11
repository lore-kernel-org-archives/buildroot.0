Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C52C433F5
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 16:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 717DA40502;
	Wed, 11 May 2022 16:51:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mT4O_viW-iE4; Wed, 11 May 2022 16:51:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24A8940135;
	Wed, 11 May 2022 16:51:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C71B1BF580
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 16:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A31A41866
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 16:51:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IL2k_veestTi for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 16:51:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE4C5417DE
 for <buildroot@buildroot.org>; Wed, 11 May 2022 16:51:33 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so1583693wmn.1
 for <buildroot@buildroot.org>; Wed, 11 May 2022 09:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HZwYkBt8FUJ6z8tBhQIzq7DxGx1AW5QiSPv5buvMgUk=;
 b=T5l7GkoavSuTHmocZbqZ/c1BazYOUGbqC1JZPyPjy3czOIV08rfiUyN7e4UEc4U8ZC
 U2Vu2pZur7e12B+0bbx6yhXVJWXGeW8AZt3gPZLzItPvpByIMeujJH7acyLBfUoo6qWK
 Q3RYezSVWKmI3gM6AQ/W8ofL4FOj0qm58JR58HBo65BazBywGcF/1cIU8xeecUPoepBR
 FVS/EQjub9cBdGJenSnFURmH2jTneqqSkINp+/ovzZvvFNMavdyD804yjHprKZPO+43X
 jY+rrI4xb4ymHEWt7fc/7ggCXqJRbfPPUCMEMcVeOIlAoPAk95Z7+M29yyDCIPbTgjzY
 L2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HZwYkBt8FUJ6z8tBhQIzq7DxGx1AW5QiSPv5buvMgUk=;
 b=RWtQFXL6jLSJpb2rGhs9otOHLt9wJc8DnivWPLbQQtVg3zV9U4s4KuLdZHKyHwkomq
 VSrJgZH0MWaJqXco9hm/mNhpiu38ev3M2w8Q0pbB4K44ggIrvr+mmqJdZpzmV1aVgZkj
 0Oi3TBWnF9UlHuLA77L4Dy37qsTJgO0reSdcZrxrPBqZCHlVV6N3zb1fvN1llgJYF+Hl
 0ymErWV2CFPAVf3TUtHziIak7mE8ypaMP/6E2i3+Tx5/Gh1MwjBDd+Mw7sTCfLBJ2igz
 V4A1cdbYcirIVmUZqFBSdJ8/nBg37RxRwGCAbFw0mOKUKC4PFPCsNKLR2CL+5pMjKnWe
 cGOA==
X-Gm-Message-State: AOAM533hv6XQZF4vDxrMsFj25KUCYcg4rcf4/wS8MepPoZrVinCDLRwv
 S7wd5Cj/Xo2UuOb8PjB4e5SaVWrwlZw=
X-Google-Smtp-Source: ABdhPJz4fEDTxBbCqgz8wnoDaAhvzwVSywTYuCQ2SjbEazGl5LEZF0H8/7lp1kWrj9VrnwGyDYUZRg==
X-Received: by 2002:a1c:2c6:0:b0:38f:f280:caa2 with SMTP id
 189-20020a1c02c6000000b0038ff280caa2mr5803057wmc.87.1652287891357; 
 Wed, 11 May 2022 09:51:31 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a7bcc08000000b003942a244f35sm319302wmh.14.2022.05.11.09.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 09:51:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 11 May 2022 18:48:38 +0200
Message-Id: <20220511164838.1496613-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/htop: fix uclibc build without wchar
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

Fix the following uclibc build failure without wchar raised since bump
to version 3.2.0 in commit b054353e59488713f841cd9ac9384b8a23f2e83a:

configure:5351: checking for /nvmedata/autobuild/instance-0/output-1/host/bin/i586-buildroot-linux-uclibc-gcc option to accept ISO C99
configure:5500: /nvmedata/autobuild/instance-0/output-1/host/bin/i586-buildroot-linux-uclibc-gcc  -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g1  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.c >&5
conftest.c:70:9: error: unknown type name 'wchar_t'
   70 |   const wchar_t *name;
      |         ^~~~~~~

[...]

configure: error: htop is written in C99. A newer compiler is required.

Fixes:
 - http://autobuild.buildroot.org/results/795bb4ae4f1a725c56353915c21fa784ca547c59

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/htop/htop.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index f4d9032d4a..cb8170a0a3 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -13,6 +13,10 @@ HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/$(NCURSES_CONF
 HTOP_LICENSE = GPL-2.0+
 HTOP_LICENSE_FILES = COPYING
 
+# ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
+# provided by autoconf relies on wchar_t.
+HTOP_CONF_ENV += ac_cv_prog_cc_c99=-std=gnu99
+
 ifeq ($(BR2_PACKAGE_HWLOC),y)
 HTOP_CONF_OPTS += --enable-hwloc
 HTOP_DEPENDENCIES += hwloc
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
