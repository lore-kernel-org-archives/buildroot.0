Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F21C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 17:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E91760E62;
	Tue, 26 Dec 2023 17:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E91760E62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LQJRzh07n5wM; Tue, 26 Dec 2023 17:16:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 654FE60655;
	Tue, 26 Dec 2023 17:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 654FE60655
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4BE871BF2A5
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 17:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32AE760C15
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 17:16:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32AE760C15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w1LuUr78w-wt for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 17:16:27 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE271605AD
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 17:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE271605AD
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40d2e56f3a6so25414885e9.1
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 09:16:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703610984; x=1704215784;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gbpJNipw2cUZ3KEdQpYBmvzcRqUUuWxIpnx1CU6BXF8=;
 b=IaApDqidijy3dxG7XQDuJ0BQymh+JNA1bRxsI8hcnpMKGdSlIWds8xhodgByNTEa7U
 bMBA3J+mIvxRTsbUWL8w2F3OhXWRLgCcwjj3yhZrhA67GHadpum26ZP47wpUcTcZvr98
 YQFgMGFmMnLpzcZ3Ze6Kwzk7CGx/EF0GPQ7qTCtQUsWWGUo+Y9CNsTNL2GIQkYkhcdLi
 NvJbSq81+4lTa18Gia9mlagb6hHR+crT+LVLrdAFZVccr7n+u3bJ/hIoz1AyUBZVxJwR
 XHI6R/5Behlo75iQvT0eNOkekEMSBxG8EjivVD3VEkmVDdZnY8xRCD4oh/eunbJ1ju9T
 ZZbg==
X-Gm-Message-State: AOJu0YyT4lPRmbKlV8HNuhqPBo2vFeJFGdXtME01WxJLwN9IvcEzaHL6
 AScP3zw8FgXSrqfTok3BUQw9BuABJn0=
X-Google-Smtp-Source: AGHT+IFBGdLPjypb5TAODS2eSUi1oMnVl0PtzpMeY1NsbhHrDQEF04csOC3tWoZKaMVsUHl1O0u2XQ==
X-Received: by 2002:a05:600c:4e87:b0:40d:3084:a9e8 with SMTP id
 f7-20020a05600c4e8700b0040d3084a9e8mr3241898wmq.21.1703610984436; 
 Tue, 26 Dec 2023 09:16:24 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n23-20020a05600c3b9700b0040d5aa03ee0sm2616775wms.34.2023.12.26.09.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 09:16:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 18:16:16 +0100
Message-ID: <20231226171616.858590-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703610984; x=1704215784; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gbpJNipw2cUZ3KEdQpYBmvzcRqUUuWxIpnx1CU6BXF8=;
 b=Csiulxt3RwzqfPW5d+Qrt8u8IvWNxajwTP5HZn5WbtbHe3K3O8jN2H7U4Stctvb2Ax
 H8TSMW4WfX9vPKrHYCajqphas6mCIaMOzyo1b7gfPknYSpCMqbj0qBj/75MPfawC/2A4
 z0yCopPyf3Z0DRJcnjAk0jbcWUdjX79dRvOJtHA0zejGqdZoBuJTAsJthApVELaj9hlV
 5q1rFIaZk4AQQAUGmOeyi1Xpq9148ywE6lhjswFCZKuyUKh3wlmRBG16aIqvmonWhuW0
 5k//JaacW+jqj64zOGNnxqqRNJrO8ho+2hK0Ws7jqYQyjpdRwzgbNIy4Xx11yy7igcmP
 yq9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Csiulxt3
Subject: [Buildroot] [PATCH 1/1] package/libmpdclient: bump to version 2.22
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

COPYING has been replaced by BSD-2-Clause.txt and BSD-3-Clause.txt:
https://github.com/MusicPlayerDaemon/libmpdclient/commit/0fbe45a419a8a826c8b55741ddf2ad92adcfd63b

https://raw.githubusercontent.com/MusicPlayerDaemon/libmpdclient/v2.22/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmpdclient/libmpdclient.hash | 9 ++++++---
 package/libmpdclient/libmpdclient.mk   | 7 ++++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/libmpdclient/libmpdclient.hash b/package/libmpdclient/libmpdclient.hash
index 8219183c87..626c383402 100644
--- a/package/libmpdclient/libmpdclient.hash
+++ b/package/libmpdclient/libmpdclient.hash
@@ -1,3 +1,6 @@
-# Verified against http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.20.tar.xz.sig, sha256 locally computed
-sha256  18793f68e939c3301e34d8fcadea1f7daa24143941263cecadb80126194e277d  libmpdclient-2.20.tar.xz
-sha256  9574c3b0a9c31723cc3d5f32af4655a015fff5ec6ec8115b7906cd7d9623cf32  COPYING
+# Verified against http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.22.tar.xz.sig, sha256 locally computed
+sha256  eac15b82b5ba5ed0648af580221eb74657394f7fe768e966d9e9ebb27435429f  libmpdclient-2.22.tar.xz
+
+# Hash for license files:
+sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
+sha256  e11af671c491efac2f94c1d752bea92f4308ca2450c7d11e582e4b48c40e4de1  LICENSES/BSD-3-Clause.txt
diff --git a/package/libmpdclient/libmpdclient.mk b/package/libmpdclient/libmpdclient.mk
index 2103ef163e..2e2643396a 100644
--- a/package/libmpdclient/libmpdclient.mk
+++ b/package/libmpdclient/libmpdclient.mk
@@ -5,11 +5,12 @@
 ################################################################################
 
 LIBMPDCLIENT_VERSION_MAJOR = 2
-LIBMPDCLIENT_VERSION = $(LIBMPDCLIENT_VERSION_MAJOR).20
+LIBMPDCLIENT_VERSION = $(LIBMPDCLIENT_VERSION_MAJOR).22
 LIBMPDCLIENT_SOURCE = libmpdclient-$(LIBMPDCLIENT_VERSION).tar.xz
 LIBMPDCLIENT_SITE = http://www.musicpd.org/download/libmpdclient/$(LIBMPDCLIENT_VERSION_MAJOR)
 LIBMPDCLIENT_INSTALL_STAGING = YES
-LIBMPDCLIENT_LICENSE = BSD-3-Clause
-LIBMPDCLIENT_LICENSE_FILES = COPYING
+LIBMPDCLIENT_LICENSE = BSD-2-Clause BSD-3-Clause
+LIBMPDCLIENT_LICENSE_FILES = \
+	LICENSES/BSD-2-Clause.txt LICENSES/BSD-3-Clause.txt
 
 $(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
