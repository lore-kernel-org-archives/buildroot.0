Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4241BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 20:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CB08404BD;
	Sat, 23 Apr 2022 20:27:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lrnT-I4-4MHq; Sat, 23 Apr 2022 20:27:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A558940111;
	Sat, 23 Apr 2022 20:27:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D1EB91BF59E
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 20:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE27240111
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 20:27:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p5ytSOBUk2Hx for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 20:27:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95DB440108
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 20:27:20 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id j15so2328698wrb.2
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 13:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PhpLTPM2Q+GlXBPTThho+9FLPXLPoE/ivSqo/hVFV/A=;
 b=Wv6YMt/gKOUGP+rFf7PlS4yJfjYjEGBDG6GNcgQ+DA47mSwwcan7Rty/odrW3b7cVe
 OpBpB73ShD4Bq3CsVUzFSc31vNxXIb5LsUynrxaieoniXOLqtm734734MKd2zGUuoQo8
 5/X7Er1MZspE5HMCehXHK26cXwUm7gS8eAH4fQmMDL2jdXiVNNceKy/y7g5k4G+lgfHn
 7iQlUuB7XzFoNxaNi/PuQPXQ5jNvxZKIWXIMfuOAI3QZLxP8KnC8XyfwhP1FdXFD0Pbn
 yjOLAo4FVKAmURfFvy34cYDnNCH2e7g9b3/Xf9ZTrl1irWdS/ZvSotQY7gih8TBfJRsa
 xSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PhpLTPM2Q+GlXBPTThho+9FLPXLPoE/ivSqo/hVFV/A=;
 b=lQLqXNsWtMO5/kVG55nFhRIYUEVwV55FmkkXSI5VfRjadHO+E1Hj0ertgwcMfldbI6
 L2AHAf0eVdcfeWK568IlIpq4W8s8cVWryhG46wQu94KpcaPBVDYqOWWW8iIMY8W0oMoU
 2EyNZTsnnkSvtRN/RmQgYhoPFtXYwzNY+8A5rBVlJzmYbkiJplAxLQPf6L1omBBqajoq
 t5i2UveeQoXvfdsQabrtV2+LNLJG9VJWJvDO8XyL/rUK3PtJ9rMGG5MpKO00c+I5QJvy
 tkWwJiZprCsCJq6kArj6DETxXxIKJoXjLQrVI7dPGtRGhfyfR6ToIrPX3dn68qRitTNC
 nbmw==
X-Gm-Message-State: AOAM530gwV+LfCGcozUkdh7zHZc7M16voyDT5Jlb1SYkJyvcK4gAYFAf
 L40hdYu0BcgyypYdxY2GQil0M6uxEto=
X-Google-Smtp-Source: ABdhPJwGsWk9dOT7vuy26DqJ4YZAJlLvqKeBUI509Y/khXcU9TGZxGzCNsat1vt5WPEO5bfZb/vnqw==
X-Received: by 2002:a5d:584e:0:b0:20a:9034:e312 with SMTP id
 i14-20020a5d584e000000b0020a9034e312mr8720378wrf.518.1650745638485; 
 Sat, 23 Apr 2022 13:27:18 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 204-20020a1c02d5000000b003928c42d02asm5817479wmc.23.2022.04.23.13.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 13:27:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 22:24:57 +0200
Message-Id: <20220423202458.299067-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/libhtp: bump to version 0.5.40
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

https://github.com/OISF/libhtp/releases/tag/0.5.40

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libhtp/libhtp.hash | 2 +-
 package/libhtp/libhtp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libhtp/libhtp.hash b/package/libhtp/libhtp.hash
index eae3009c76..8759823e16 100644
--- a/package/libhtp/libhtp.hash
+++ b/package/libhtp/libhtp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d5956b49314fc6a058864130fbcf040a12584ee1e38f3b6ea52aedfa99d4c14a  libhtp-0.5.39.tar.gz
+sha256  0afaff837c295c868db8c967b87b1b5e21c0386c15c3b5ead474799724c54ef8  libhtp-0.5.40.tar.gz
 sha256  87c93904e5434c81622ea690c2b90097b9f162aaa92a96542649a157dbf98d15  LICENSE
diff --git a/package/libhtp/libhtp.mk b/package/libhtp/libhtp.mk
index 532eaa340b..bb8aa73b42 100644
--- a/package/libhtp/libhtp.mk
+++ b/package/libhtp/libhtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTP_VERSION = 0.5.39
+LIBHTP_VERSION = 0.5.40
 LIBHTP_SITE = $(call github,OISF,libhtp,$(LIBHTP_VERSION))
 LIBHTP_LICENSE = BSD-3-Clause
 LIBHTP_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
