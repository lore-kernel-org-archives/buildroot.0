Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE35C433EF
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 16:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19DB340D73;
	Tue, 31 May 2022 16:41:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0yBl6dBj8Oo0; Tue, 31 May 2022 16:41:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3358840B2A;
	Tue, 31 May 2022 16:41:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 385A01BF31C
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 16:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34F14416F1
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 16:41:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a-rNyd1bgMnA for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 16:41:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E183E416AB
 for <buildroot@buildroot.org>; Tue, 31 May 2022 16:40:59 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 r9-20020a1c4409000000b00397345f2c6fso1561908wma.4
 for <buildroot@buildroot.org>; Tue, 31 May 2022 09:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ii/G0p1xKH6vcM1+zdrLCytSbTgqLqm4SWtqQ4QdmCk=;
 b=aDTMawa7f88QTxaD80L2V6qTK1xI/+7mNoigN2EPVztT8veNlqeZ/llvgChjZembVk
 cBfJw9rTo2vwc6b/naZrzPgiegTEwMAgNd5SwWiW0slAEMSNomAJb6/mH796KgyT8fk+
 vUjEZcxUJTP1cexminuzso7VbMx7hbvr5cBeyEZC5E/0yJI1Drr0+CnbvwVgiVI2vGlX
 Zqvg8hmhOLLQTFQXzJBqmASdw2pmXrQBSa0PHXtNkVr6GCfeDzKmpjKkgO3GNh3V8lB9
 ZS5URfGqwPud++8xa3ewWjwoW0DQryLaJH/3GShEgmyxJihMMRhBHJl0UX+dOI+8T6XI
 uBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ii/G0p1xKH6vcM1+zdrLCytSbTgqLqm4SWtqQ4QdmCk=;
 b=YW03X//X47gGNPHsFMELkCI40va2MmsEVBZY2LhYWZNp3hk/tWCW+tM46WYwwxHVHF
 cxi7PyU+8fY3HZW6oGntqDjQO1wNnoCmD73niTWl7QM8usZADIhIFcD3LzXDv33PXo0z
 uwaGxxN+iGKGD5Qm+l7j+FCJCDhUknNDzvUHZbk8g255tKZHq2JmgoX2zGGcVNepOAHF
 EUvqA0SZT+XOwhRskDuvZOLf5fVZce7yUnemfpf11ULYbLpIs9YtQfDKvES4Lb+UAy6z
 P1Mc/a/F6G9PPHqJQC4QL5xTRoBOToWjV3j+BiGeabAY3zP4BwacBzU8l8cx+UiDRbkN
 g0kg==
X-Gm-Message-State: AOAM532lmKWlE+KeYOo+ugl/NVHjCfYUEIaJ05AGITeiTcjWLqJHZR3N
 0iYV6dlfd8Xx3Bv6o9ukIFzanCnl06c=
X-Google-Smtp-Source: ABdhPJx9OBL94lP08xFt8Rvl/wkHOAs8a5/73WXoLfhApmjnypYLbEblwidKz0HJddBNcNUGpAYnLw==
X-Received: by 2002:a05:600c:3213:b0:397:4628:2710 with SMTP id
 r19-20020a05600c321300b0039746282710mr24495126wmp.39.1654015257684; 
 Tue, 31 May 2022 09:40:57 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a05600c10cc00b003942a244ed7sm2557865wmd.28.2022.05.31.09.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 09:40:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 18:38:28 +0200
Message-Id: <20220531163828.3865322-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/samba4: needs iconv.h
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

samba4 needs iconv.h since bump to version 4.15.3 in commit
d33ad03e75b89feb97a7edeba3156fa2ac417b06 and
https://gitlab.com/samba-team/samba/-/commit/fc51b38ed8b7ff239db82d4d2d52f6332910ca97:

../../source3/lib/netapi/examples/common.c:13:10: fatal error: iconv.h: No such file or directory
   13 | #include <iconv.h>
      |          ^~~~~~~~~

Strangely enough, there is no autobuilder failures.

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14821

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/samba4/Config.in | 1 +
 package/samba4/samba4.mk | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index e114a7e13f..5907bdc478 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_SAMBA4
 	select BR2_PACKAGE_CMOCKA
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_ZLIB
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index df3a7e58c8..c90fdd006c 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -39,6 +39,11 @@ else
 SAMBA4_CONF_OPTS += --disable-python
 endif
 
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+SAMBA4_DEPENDENCIES += libiconv
+SAMBA4_LDFLAGS += -liconv
+endif
+
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 SAMBA4_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
 SAMBA4_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
