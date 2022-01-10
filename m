Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F113C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 09:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7DCE60C0B;
	Mon, 10 Jan 2022 09:11:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ZlLYzQUIFBT; Mon, 10 Jan 2022 09:11:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A87F60601;
	Mon, 10 Jan 2022 09:11:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6BF731BF3D0
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 09:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 695BA408EC
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 09:11:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ey5qAUCEOT-H for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 09:11:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CBD92408E9
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 09:11:23 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id r10so17735446wrc.3
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 01:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CoIy3RORAyhT0shbjiMk6Nd439tXqYKvYep9JeL8GhY=;
 b=NbgI1Jd+IcGHUPD+DU/2hm4ofX8TKfSgw4ZB2JLZI0CNZN92FgsT2Gdy3mX6NZUPVR
 3FIHkiolD1fQF+pM3DN0rqjRlS9y1efQJPoXbPIvmh3nP57QgAVS2vfVR9i8+g3vQGQ1
 YmdrE+5BmHRbfVKsCBjsiiREMGh4sNRlPYAVfPNZtIEKG3rT0Xx1gmoGsz7l5Bim24KY
 GWmuy6ug/aSfYGi5nj7+YWC8MTMtulOwEUANynGAX6Cb/BY4jMLUbGzyv0kmTFghpQTt
 dmbUyoCDTTYI7JXWvKRpBGnPYXfVNYq8ToOKblb+Fvpi4cQjjB4SYDzKwhyu7a/HTeDl
 6Zkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=CoIy3RORAyhT0shbjiMk6Nd439tXqYKvYep9JeL8GhY=;
 b=mpk8PRfGX+GVZ+2JpEK+NSmN9gPxyeWZr8Gs7dv20XSGEftvl75RYMA+lrR4Wu1C83
 9bU2FQP43Bf4fQ5oUoL52qekYsN3EMOuJrDpep3oHyJpQgSkRtSojCxFIGWk10JTfbFw
 93tNiS0bZf7Y18HKSSStZgIa3Xrhhx3n6t1STnt6tU2AsABxaTOgFQljZ9kKJJszljYx
 cC+RDV/wkeN6bKJBJpzyioeu+7IC47yfl7lB4hDMQqNB9JbNaH9H4rpWm6U5A10O4cMc
 T4ZHjToppOUjGspxsRbfDaYqdFVT4Nmqf/p9SgIvieYy8jfQ+VeFeSdj1REKcc8YiThy
 DOow==
X-Gm-Message-State: AOAM533P4cXnhlA00z1UA/emVvOOeclBwmr+yYQhIPiQOcATazg0GgBh
 fPIczOGfDaGPFG209wbWw+v2q/K7fMs=
X-Google-Smtp-Source: ABdhPJzuTsQPOzfBu6rS5AxvrJcKVB2Ibu3CVlHqzEtepIhA88M9WQFIhj7LFt++b+GaxaFOkDHQjA==
X-Received: by 2002:a5d:4212:: with SMTP id n18mr165438wrq.362.1641805852219; 
 Mon, 10 Jan 2022 01:10:52 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:884e:4989:9dec:67ee])
 by smtp.gmail.com with ESMTPSA id j16sm5427729wrp.76.2022.01.10.01.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 01:10:51 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 10:10:35 +0100
Message-Id: <20220110091036.4165679-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/uclibc: disable LTO unconditionally
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Recent commit b7a00b39bca0 (package/glibc: force -fno-lto) only catered
for glibc, but all C libraries, like uClibc-NG, are impacted, for very
similar reasons.

Disable LTO unconditionally for uClibc-NG too.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Norbert Lange <nolange79@gmail.com>
---
 package/uclibc/uclibc.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 87e283de2a..0feedb6cfa 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -362,10 +362,18 @@ endif
 # Commands
 #
 
+UCLIBC_EXTRA_CFLAGS = $(TARGET_ABI)
+
+# uClibc-ng does not build with LTO, so explicitly disable it
+# when using a compiler that may have support for LTO
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),y)
+UCLIBC_EXTRA_CFLAGS += -fno-lto
+endif
+
 UCLIBC_MAKE_FLAGS = \
 	ARCH="$(UCLIBC_TARGET_ARCH)" \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-	UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
+	UCLIBC_EXTRA_CFLAGS="$(UCLIBC_EXTRA_CFLAGS)" \
 	HOSTCC="$(HOSTCC)"
 
 define UCLIBC_KCONFIG_FIXUP_CMDS
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
