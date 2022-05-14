Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285EFC433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 06:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A6EE40600;
	Sat, 14 May 2022 06:50:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nVPofDayHkMu; Sat, 14 May 2022 06:50:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFA19400F8;
	Sat, 14 May 2022 06:50:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 56A331BF57B
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 06:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 444DD400F8
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 06:50:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QsrrzdF9Dsik for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 06:50:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92775400C6
 for <buildroot@buildroot.org>; Sat, 14 May 2022 06:50:15 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id y12so2597577ior.7
 for <buildroot@buildroot.org>; Fri, 13 May 2022 23:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oAGDM0WmQ06yFXNa004dnIRh8XtY3pYGi77iCXepgOk=;
 b=asrmHbp7+HkDJsgGFf5vjhheNdhnRn2wMA3R+nV8GEfApAn8XHqpI7pq+SV+1bO663
 Ru8W7gnFlm1WuFbXyhO5AldBbGOP5AJ8aAwGdxmrAXLAgdWUpsXMoa8m9QE7WGtMp9RP
 xzAG01BEJ4VsOTk19uZB033eymLFkfHr7/y3cuFO1OG13Q2o2NR87FrY8Pj0MtBSANwl
 qSjn7hiSnukiLvH6ulK3bFKFRLUc0hxI7RZrFRYD7ZhtQc+lvIDY6PrztfP3kFnaZbg1
 c9reGn0rccJgeJkfkTMTI3o3QDBW8cIaAYMb/4FukTYM3Uv3oSdVSqnxF56UF0XqmCtZ
 EsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oAGDM0WmQ06yFXNa004dnIRh8XtY3pYGi77iCXepgOk=;
 b=tRaKYPUHyR9lq7QbZEwesl2Ld3B+SwnWNd9a8dvM+I1wyLaS3br+LAb+eTboWA2hcg
 lniqDIAaP691l/wW+vyuWAFBU5f7hkDu5P2Z/ZDPenL/mGkq8tqTzq6yyzmpz54q/MOW
 CuqVSn1F6hsI55s9Y9ZYry0UkmL3zD4IRvmgqMn9b5t96FncJZNoo20ISG6GDeZFj+Q2
 RQjP1RXqNGaF/2xLyZlEAKWNRzhoxrgyqtrkJH3301ojiYwimCOYuJYS/4aUJerk1StN
 uoDQJkRfw9OBQ2rC0E+x/+p8WPEBwhtVVbwYQdknl3FDAGZEBoqzs/l9eUeq3TW7uVoB
 Mi6Q==
X-Gm-Message-State: AOAM533qDXq5BA8XaHcJVugwXCaIlYe4dQiwgoPFVweMSuwcR7bA3VNU
 vFPTPP1W5lu91th4ABu+VK2WvFO+0Vo=
X-Google-Smtp-Source: ABdhPJzdPloJep9uiFIfs5nqH7/iJ5iB+NnfHJeL+N34caKu62e/NUhEY7SsPp2JjnVv7/gh4iKfsA==
X-Received: by 2002:a6b:6b0a:0:b0:657:be18:d34b with SMTP id
 g10-20020a6b6b0a000000b00657be18d34bmr3806099ioc.174.1652511014409; 
 Fri, 13 May 2022 23:50:14 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 c13-20020a02a60d000000b0032df31d45fesm210040jam.166.2022.05.13.23.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 23:50:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 00:50:11 -0600
Message-Id: <20220514065011.782988-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/swupdate: bump to version 2022.05
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop libubootenv and efibootmgr dependencies which are now
optional runtime dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/swupdate/swupdate.hash |  2 +-
 package/swupdate/swupdate.mk   | 16 +---------------
 2 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index e431ecf40b..638b586e8a 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  4d078e57bb91e17025ee8cb1bb54c25532e8d2dbe329bba6a7a0328ac34a07e3  swupdate-2021.11.tar.gz
+sha256  1e819f71b19626bde1a4906ced39d3406ca240b458d3c4a998bd9c7333eba260  swupdate-2022.05.tar.gz
 sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
 sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 065ae772ba..b2f50d2b71 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2021.11
+SWUPDATE_VERSION = 2022.05
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
 SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
@@ -32,13 +32,6 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBEXT2FS=n
 endif
 
-ifeq ($(BR2_PACKAGE_EFIBOOTMGR),y)
-SWUPDATE_DEPENDENCIES += efibootmgr
-SWUPDATE_MAKE_ENV += HAVE_LIBEBGENV=y
-else
-SWUPDATE_MAKE_ENV += HAVE_LIBEBGENV=n
-endif
-
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 SWUPDATE_DEPENDENCIES += json-c
 SWUPDATE_MAKE_ENV += HAVE_JSON_C=y
@@ -158,13 +151,6 @@ define SWUPDATE_SET_SYSTEMD
 endef
 endif
 
-ifeq ($(BR2_PACKAGE_LIBUBOOTENV),y)
-SWUPDATE_DEPENDENCIES += libubootenv
-SWUPDATE_MAKE_ENV += HAVE_LIBUBOOTENV=y
-else
-SWUPDATE_MAKE_ENV += HAVE_LIBUBOOTENV=n
-endif
-
 ifeq ($(BR2_PACKAGE_WOLFSSL),y)
 SWUPDATE_DEPENDENCIES += wolfssl
 SWUPDATE_MAKE_ENV += HAVE_WOLFSSL=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
