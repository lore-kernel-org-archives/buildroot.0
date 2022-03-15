Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62985C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 22:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0664741624;
	Tue, 15 Mar 2022 22:04:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zh-F6G0wTeKl; Tue, 15 Mar 2022 22:04:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35C36403F5;
	Tue, 15 Mar 2022 22:04:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F0701BF28B
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 22:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BB4E60B1A
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 22:04:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ELcXE0yKBNaD for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 22:04:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0702B60AEA
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 22:04:09 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 r190-20020a1c2bc7000000b0038a1013241dso399261wmr.1
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 15:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HPxMgD/PdXC39ShOaJ6BOuuQQtq+Gl6usgvVBHBeuBg=;
 b=lao2zSAwbRGmof/FbhwWrvUa0ECAeGbOvfe6VNANi0QViFxs2/ZyUPWiQLwJ6nbYH+
 bQ+QdnT4uuLdA2iydiwtHi6TmLcZG9ihfYZkHFgQmL7yAdCvf5pW1cnf2I6w3fy6Kwj4
 FXtARwVF+t/BxJfAcTrteBHsJHTJsUeWPsx2+JFOljOxymiQH0E4yJ+7LIab21YQvz6f
 75Z1d13p1f4uDkuWneopz1/xgGUn73hhI6caI5SkqZmSERrGiM6fNbKFxesFa8PEAUU9
 1s5uG3Fq420blRdJki2FYhtEzt81voZdfORB14VaUaZ4HbEqxFh20G4TwD+wwbwz9dw7
 6wjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HPxMgD/PdXC39ShOaJ6BOuuQQtq+Gl6usgvVBHBeuBg=;
 b=kjecjvSv7XVIFtlgYxo6US1wEMwMh30giN7ezmCSXNBhAZDCa+1c8wQQeeKer7IhkN
 XsxD/vRqk//Q/QW0uHE7gJL+MRGuansRjfuRPnALg0IMrOA9Jy81jddo2Y7Qb06WjISn
 8ZYWOc7YP/bIads3Cnq2JEPbrDpNQGQiO+EFpG3VdDZuYEr1dEQ2Hl4eMIM6qjGzSwU0
 ihgjYA2PAkiArNKlZjNTV9jRp3SSzvUyXtSm20ckJkfUihng4lHAiHfRcHQOVt6d1ZuO
 bg6m5FimIc/s4H7IIdKDp2hY/HKkutYlE3YN1s/C3xYfeIvk/0BoygFr+PU4LVlgfYpI
 JVdA==
X-Gm-Message-State: AOAM532CA1e4y0hd7F7ObmnDUqKagjwVsVWYGJgbw2bbiAg/3Cg92k1I
 EuQGRNoWR7BYzKYQgv5sOe5a1h2vFy8=
X-Google-Smtp-Source: ABdhPJz+4rMbfp49vMAiFL8ryKEO1j3VYVS7SuHDgXcnc2+hFtR6lJgw0G85Hn1kqnf7PRfmJWJvUg==
X-Received: by 2002:a05:600c:3c8a:b0:389:cf43:eaf6 with SMTP id
 bg10-20020a05600c3c8a00b00389cf43eaf6mr4858618wmb.199.1647381848078; 
 Tue, 15 Mar 2022 15:04:08 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a7bcc0b000000b0037e0c362b6dsm45388wmh.31.2022.03.15.15.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 15:04:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 23:03:05 +0100
Message-Id: <20220315220305.2439467-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libbluray: bump to version 1.3.1
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

https://code.videolan.org/videolan/libbluray/-/blob/1.3.1/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libbluray/libbluray.hash | 4 ++--
 package/libbluray/libbluray.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libbluray/libbluray.hash b/package/libbluray/libbluray.hash
index 4ab8c85866..6e62bb49a1 100644
--- a/package/libbluray/libbluray.hash
+++ b/package/libbluray/libbluray.hash
@@ -1,4 +1,4 @@
-# From http://download.videolan.org/pub/videolan/libbluray/1.3.0/libbluray-1.3.0.tar.bz2.sha512
-sha512  3d5145e6fd7de099c07f937282112c7abb12a5590b7c0b965b00bddee3837ddfd1a30076aaa6d6278d07a5beee3856f602125983ae075ab30eceb6ac1bd9bcdc  libbluray-1.3.0.tar.bz2
+# From http://download.videolan.org/pub/videolan/libbluray/1.3.1/libbluray-1.3.1.tar.bz2.sha512
+sha512  f39fc8a11771e8fdd5eeebf0ab23535ffab44721f64b350e5d153eee44555b31c618b6d765da114254dc83ff0ff89e84c6b185f61cdbcfedd2d47a5f6e26b75a  libbluray-1.3.1.tar.bz2
 # Locally computed
 sha256  b3aa400aca6d2ba1f0bd03bd98d03d1fe7489a3bbb26969d72016360af8a5c9d  COPYING
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index 233797f38d..a9eb3c67c6 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLURAY_VERSION = 1.3.0
+LIBBLURAY_VERSION = 1.3.1
 LIBBLURAY_SITE = http://download.videolan.org/pub/videolan/libbluray/$(LIBBLURAY_VERSION)
 LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.bz2
 LIBBLURAY_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
