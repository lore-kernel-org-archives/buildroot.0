Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFB1C433F5
	for <buildroot@archiver.kernel.org>; Sat, 21 May 2022 13:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98AB040B07;
	Sat, 21 May 2022 13:08:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ipve7totIGWR; Sat, 21 May 2022 13:08:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1EF34014D;
	Sat, 21 May 2022 13:08:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB42D1BF42D
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 13:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A906D41715
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 13:08:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1wcMUkYbnlIM for <buildroot@lists.busybox.net>;
 Sat, 21 May 2022 13:08:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70C8241714
 for <buildroot@buildroot.org>; Sat, 21 May 2022 13:08:52 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id e2so3112950wrc.1
 for <buildroot@buildroot.org>; Sat, 21 May 2022 06:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5JdTtk4lBHuqqLLGOkmu00f/IGDaN9wrSlqWD+4ZOxM=;
 b=Wu1eP6po4HisW1DMs09UImXIWN15fTpSWryv/tazxBzHUgE3ePrX0lOmln/Z5Lmyhl
 gApu8Gl+xjkuGCnwweNLvP96S9JpEBI2Bm7ltgeCoTGpDRQF+ot2Qrm5KFxbvbETOB13
 Zk389z5At+TfOId587tTwOwJjV/kbp788Aumtur5LDN3Xm0GxvmIcGKbpCfwwgNoRmCb
 6utY6x9RlT/+Xrv4ZTwGyq14qrJCaeqq9Qw1pee6pTwSWwiLols/o/5+MX6KTbVSVBOs
 fFgUEECZtyo0QDBMu0RhNnlEl0n0+GiJONeRXV1NfpaV7ZfbOXwtqkdXWV2i4KjR4Bs2
 5CvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5JdTtk4lBHuqqLLGOkmu00f/IGDaN9wrSlqWD+4ZOxM=;
 b=0jvXNxpAEPWQj6HvrOI4d/MevSZygO90rcl6SvDRKVTecnoyOqHwEYrkuAYx2nG8m0
 k8UwZv2ExJFuRhZsPvfMtWy2+QNyEXrX5J8Tuuo1qGDiu3aQL5zBqPsCRirGfUazf0eA
 XIbCuoODKXK/Zy3L3shzi+qRGnv1Vp1VpcL8ZtvgnLNn9WRqBEY/DMWkr7tiE0kEa6Va
 HHy6tq/ARJkjDpO3UKpF+58Ywmi21NC9Fbwf11V5AyUXwARMYLTTzkshEqY/VLIa2r2G
 fwYt7I2ApQoOlZjdUiU4lJB4bvcOLb4m31ujkAxTU4G0RanWyKnr3eZLQYxl+JUQw5To
 fLgQ==
X-Gm-Message-State: AOAM531ODd2UCnSIWNeQwiEASe7obw9G33eOODiZkI7zpY5uFO4p0fvH
 r2dRWH3kmZPdUDrRbr2dOOUSLZl2jaQ=
X-Google-Smtp-Source: ABdhPJwNrJXrPVos4xzo3Lddhuv0H97CTPbC6e3VsKFQVN6o/45Pvankn+m8It2xcTsNpRC4ExrkFw==
X-Received: by 2002:a05:6000:2c9:b0:20e:63ee:eb64 with SMTP id
 o9-20020a05600002c900b0020e63eeeb64mr12253618wry.662.1653138530345; 
 Sat, 21 May 2022 06:08:50 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 9-20020a05600c020900b003942a244edbsm4844546wmi.32.2022.05.21.06.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 06:08:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 May 2022 15:06:22 +0200
Message-Id: <20220521130622.340752-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rsyslog: drop libee dependency
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Extract from
https://github.com/rsyslog/rsyslog/commit/1bc60d4ba29053bd54dd11de46e985f1d34d8462:

"NOTE TO MAINTAINERS: libee is not used by rsyslog for quite some while.
However, we never included this info into the changelog. So if you still
make rsyslog depend on libee (some do this), you should stop doing so
now. Libee is dead and no longer been maintained nor hosted by us."

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rsyslog/rsyslog.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index afd1a5557e..52e76802ef 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -66,10 +66,6 @@ else
 RSYSLOG_CONF_OPTS += --disable-gnutls
 endif
 
-ifeq ($(BR2_PACKAGE_LIBEE),y)
-RSYSLOG_DEPENDENCIES += libee
-endif
-
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 RSYSLOG_DEPENDENCIES += libgcrypt
 RSYSLOG_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
