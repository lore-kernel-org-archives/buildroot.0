Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916C9C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 18:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B68660ADD;
	Sat, 12 Mar 2022 18:14:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JkTm3wvO-iVm; Sat, 12 Mar 2022 18:14:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E8A260899;
	Sat, 12 Mar 2022 18:14:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 20B101BF5F6
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 18:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07CFA60899
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 18:14:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T9m94jjTT4e5 for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 18:14:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F371560803
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 18:14:22 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u10so17658384wra.9
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 10:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WBe3GElyNmHLTpGWOf1Zq6LgmQEt93tzL2xuoIyGBlg=;
 b=XsTuOXk2P5vRBICkNqQg5GnUT7WZKMUOGdVDKIGGmabpzFmzDr/kwU6pmjES4GSrn0
 KtOhrBtrsdUjP5F54BVx6Ekd/9UDtaTeanvXelfD2ouSgpvSVN9+drtGrStjlX0DMkw2
 tAZq1Qb1HiK89jDj0eWdJkQidOdELDK5a5xwXfPPA9leNhOCD/2TQBnjQRhBndu2MGCS
 TtZ00ZLYg5Gr0YQiLujb0LH8Ydmr9djzwyT5ohAbcJU/xaDKTlKOBQZdYslvc4cQqAqE
 K7Px3HyRaJqC+WbvHQCL849hxvOLwxnOJwCok8NRxeI7h+obgn08wwvukOP3tSmIGboj
 vDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WBe3GElyNmHLTpGWOf1Zq6LgmQEt93tzL2xuoIyGBlg=;
 b=M/2GHPIRHmVHBdgf/yNYu/T3xECFMkJnLuzoMa1lY6sk/qaz5fsdPic1dxM/epLjq0
 nyEbha0eCwPduh3Oyz0RtPrsvyxYCwdFFplnVYLwO0uHSYWtyug3Shozf7f13dzCUjW7
 +ch5Gf9jIYzQaL/QdB7UHgHW8EsS1ai6NyxXJ1DDj2pAm9GI5laucbsvOYfXPrhoiZIU
 KXM9rOLHBmEX7S7EqdNSMPOcynOm+cPNhjNewzqYxueGvpOSRj04pN7L8a3x6fRISqeT
 /LUokU/w/9k/WHNX0LNdcAbYDp0dOLhnsQXTQBaFwlIngKMP43Gnm9ABATVhzeddNrfM
 sCGw==
X-Gm-Message-State: AOAM532uCWQ3kc0CZ8w0ZGEnqC4z+gidpEdLPBFquU0SkZr0McsUG6LK
 4vpnW4IcnzpHRsnz9GbNAPkJTRUD2rY=
X-Google-Smtp-Source: ABdhPJzNX2DNQdkvd78eH4GCrn6s3Cg2kduNvPqGo0oPiPmwdsiWcwb0tlHWXq0GNXhRqbbhxzWWFw==
X-Received: by 2002:a5d:59a9:0:b0:203:79cc:20dc with SMTP id
 p9-20020a5d59a9000000b0020379cc20dcmr10749770wrr.17.1647108860784; 
 Sat, 12 Mar 2022 10:14:20 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 j42-20020a05600c1c2a00b00389d2ca24c9sm10351055wms.30.2022.03.12.10.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Mar 2022 10:14:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 12 Mar 2022 19:12:49 +0100
Message-Id: <20220312181249.7288-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libsrtp: drop shared library
 dependency from openssl
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
Cc: Gregory Dymarek <gregd72002@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

openssl handling needs shared library support since commit
67cebbdf5f349cc176037fa15c281a9462dae591 however this is not needed
since version 2 and
https://github.com/cisco/libsrtp/commit/333fa84e8ed1395753fd1c0c4eb5534208510f26

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/asterisk/asterisk.mk | 2 +-
 package/libsrtp/libsrtp.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 0a26fb38ea..2b7854b982 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -247,7 +247,7 @@ ASTERISK_CONF_OPTS += --without-speex --without-speexdsp
 endif
 
 # asterisk needs an openssl-enabled libsrtp
-ifeq ($(BR2_PACKAGE_LIBSRTP)$(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yyx)
+ifeq ($(BR2_PACKAGE_LIBSRTP)$(BR2_PACKAGE_OPENSSL),yy)
 ASTERISK_DEPENDENCIES += libsrtp
 ASTERISK_CONF_OPTS += --with-srtp
 else
diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
index f2ba600dd6..e7a771c6b2 100644
--- a/package/libsrtp/libsrtp.mk
+++ b/package/libsrtp/libsrtp.mk
@@ -21,8 +21,7 @@ endif
 
 LIBSRTP_DEPENDENCIES = host-pkgconf
 
-# openssl handling needs libdl support
-ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBSRTP_DEPENDENCIES += openssl
 LIBSRTP_CONF_OPTS += --disable-nss --enable-openssl
 else ifeq ($(BR2_PACKAGE_LIBNSS),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
