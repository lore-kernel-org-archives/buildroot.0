Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AF9C4828D
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADE8541FCF;
	Sat,  3 Feb 2024 18:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADE8541FCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SBBsTc-JwhwV; Sat,  3 Feb 2024 18:02:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0CB341FCB;
	Sat,  3 Feb 2024 18:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0CB341FCB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC2D01BF29D
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 17:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D24B283E5D
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 17:58:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D24B283E5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id om69dr43Xv_J for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 17:58:46 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 174C283E58
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 17:58:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 174C283E58
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40fcb4ef7bcso11544525e9.0
 for <buildroot@buildroot.org>; Sat, 03 Feb 2024 09:58:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706983123; x=1707587923;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HNPUXT4n1INEnAiXnwMnpxChF/ysf9LQRRq2bA4bmlg=;
 b=oAeCPJB6kYULU/MQmCAqZK1SDDpT+GVxtFY+CiHPZ8vaWEE0CsCONhFgpH9aoG5D+a
 bGu2vh7QvQl8vnQ/oY0mWrb43659r30Mk6Vfe01HpZNAv/4Qm2XP1AMMwVv3bex82L90
 TT1YJZvFchkiHq/WoNVEWbLCnAVT+lFmTFo0dXSbGy7xXsr+/6FxxlylDd5bbH4pypA4
 1fgUvGs2WvJCptG1KaP0vCwZUCxhetHLyn4VOkuNFRyfSGlplgBFzWCSaB7mJeOk2X9U
 9cueX7+pfC+p4nm0d4JB1vf8pQi7FUsw1YIfWq+qALwO0BDC/PL8FZWem+sQ/X4Y8pdd
 Qa4g==
X-Gm-Message-State: AOJu0YxRCfBRUpUVa3um1+7/m8ZrSJbT3fHybGnjsrWeRR1I6D5NfWcJ
 oDrevhN4aDV00AhAWwuru0i4GIXFNTHtn8CYWr8EaYIEbdxfdTgYtaI36dKZLtM=
X-Google-Smtp-Source: AGHT+IHTjprMRhPzEK02ubPcV75tj67sPxmwim3edtoJsonGbHHMr+LbHLExvhdowWssVuhH28AsyA==
X-Received: by 2002:a05:600c:4fc6:b0:40e:f557:738d with SMTP id
 o6-20020a05600c4fc600b0040ef557738dmr1310647wmq.26.1706983123017; 
 Sat, 03 Feb 2024 09:58:43 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCW0ZiUHr12+aVAEaxz9AvEiIzkbIF+16QUrrry8kQuLv1ZsAJ6En5KTTM9IRe+tiIekD9tuw4MimxwfVJwO36Qryd1j2lLB+La4CA==
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o13-20020a05600c4fcd00b0040fccf7e8easm3261828wmq.36.2024.02.03.09.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 09:58:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Feb 2024 18:58:40 +0100
Message-ID: <20240203175840.141039-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706983123; x=1707587923; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HNPUXT4n1INEnAiXnwMnpxChF/ysf9LQRRq2bA4bmlg=;
 b=nGdIgbryTG0UlViDKQeBHRTuxQqzHlKbo9xz6tYrvDq9PRuwxIII0l7yncgBdSxSbb
 JeBf8Lon9FcOUgPO0oxO1r2/iJIbd84q2rq4bzKrFPck0WUP32y5B3IxT3kXIiwTU0Ge
 LN8MYemT8ywT8U9y+C2XBJ7EzwLFJ88D/Mpn/vWezdWxD0p0jAM8QweuWx+D9nBAbZkX
 7h0HsjJcW97X015QxflGihP1YvyeVkosxXgD/3thxnLv5PZE1QX9pF63VlL84IxMWvhz
 O4tQO5IAiDnpDHaFLVlk9jhOTFWMNjfnNk3r+FkUcccRO16YDu3Cc9hbEJfusITSyn3t
 lUFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nGdIgbry
Subject: [Buildroot] [PATCH 1/1] package/libjwt: add gnutls support
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

gnutls can be used if openssl is not available since the addition of the
package in commit 7251775773011e7da38e3a33c6817eceab6a9dfa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libjwt/Config.in |  2 +-
 package/libjwt/libjwt.mk | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/libjwt/Config.in b/package/libjwt/Config.in
index fa042d67ef..39d1665e0e 100644
--- a/package/libjwt/Config.in
+++ b/package/libjwt/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBJWT
 	bool "libjwt"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_JANSSON
 	help
 	  JSON Web Tokens are an open, industry standard RFC 7519
diff --git a/package/libjwt/libjwt.mk b/package/libjwt/libjwt.mk
index 6ae1717b7d..7e2ea03b09 100644
--- a/package/libjwt/libjwt.mk
+++ b/package/libjwt/libjwt.mk
@@ -6,10 +6,18 @@
 
 LIBJWT_VERSION = 1.15.3
 LIBJWT_SITE = $(call github,benmcollins,libjwt,v$(LIBJWT_VERSION))
-LIBJWT_DEPENDENCIES = host-pkgconf jansson openssl
+LIBJWT_DEPENDENCIES = host-pkgconf jansson
 LIBJWT_AUTORECONF = YES
 LIBJWT_INSTALL_STAGING = YES
 LIBJWT_LICENSE = MPL-2.0
 LIBJWT_LICENSE_FILES = LICENSE
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBJWT_CONF_OPTS += --with-openssl
+LIBJWT_DEPENDENCIES += openssl
+else
+LIBJWT_CONF_OPTS += --without-openssl
+LIBJWT_DEPENDENCIES += gnutls
+endif
+
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
