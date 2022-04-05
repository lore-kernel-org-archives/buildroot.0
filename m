Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9F6C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 18:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35C2340AF4;
	Tue,  5 Apr 2022 18:56:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CxgQhOXBw0OR; Tue,  5 Apr 2022 18:56:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C10C40AEE;
	Tue,  5 Apr 2022 18:56:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D0321BF83E
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 18:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37C4540AEE
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 18:56:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UHEVJS2qSUEb for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 18:56:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91C8E4050C
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 18:56:16 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id w4so20684029wrg.12
 for <buildroot@buildroot.org>; Tue, 05 Apr 2022 11:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qc5ntpGF4iJKQkkz3iv74hnO3B99iAUaNE9ATqS6Dhw=;
 b=VFXPwEyBcrk7Tsfi+cYp9AYiNJvCmgyPnyruj02Jyl9ZjJmRVh6kYV5Jwb0yHO4ogc
 2DLBFGQC06aTp0XMSStH74757Wn71We2ZRBH+lerAzlELjOTrML44eZ1ldpY0QAicvJ+
 uyyfJwOasE3hir+zeqZ2FeGIAtJ0k5jVbdY6jO1cV9gZmGa3mdPCHeuu+dCRRB6a35EN
 k+5AOAxqYQAz2HucVmSySLbonHrx6DD0910WgYC/2xCtQLY5L8CAvCb/83gJpFely7gm
 BJ2EesvSEYqfpiQPMxA9qP7zVvRyvwxkOnVoXXbh3z6Lz8ruOPCJ4bVVNEKC+e8OA8v5
 lYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qc5ntpGF4iJKQkkz3iv74hnO3B99iAUaNE9ATqS6Dhw=;
 b=XFiZzmCrEv3Sr5CpmI0hrxM68Wj4CdA4PRSBZN93qYeYYOXupgxgYghijvF/iTtuj6
 7DOYVrB3L+ERgqSdDvQOSnj6rudhsmYS2NBJ1+4Qk2cp52SNYtd4QO1PVGLKrj3wyaRn
 vuIOOzcj6epIiAsMeIc01r785a3UHFnyb3CZiUzH9c1K8j6nIT1glYfC/X3HMW9wX+3m
 rAnwuTtyOHDI4GTqNO9iMtDlopRaUEjzcpLfsNS6zZxUPLKWJQLbxgsKgPRojP6DNhAy
 409FUj+D2EiQ2cEHqE8cauU00LtnejjL8oKRACfzpS8PIG1R8DKJSgM9433bx7g4yv1P
 aXNg==
X-Gm-Message-State: AOAM530BsYKiQthZGgGu9hea9PjEbQhx/LPoe0yp10eD9Aq5PjUj1dZs
 gsq6xICSflo2uHHOIbOAeXK48uRFeco=
X-Google-Smtp-Source: ABdhPJy03g8VhKMiX8T7S1NS19aA8chatYZKOxSFpJchB3NAVay09bVGkOUDZqzWkoL8Dky7MGRMtA==
X-Received: by 2002:a05:6000:18a2:b0:203:d2f5:28a0 with SMTP id
 b2-20020a05600018a200b00203d2f528a0mr3878987wri.355.1649184974500; 
 Tue, 05 Apr 2022 11:56:14 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a5d53c2000000b0020604b2667asm13734788wrw.81.2022.04.05.11.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 11:56:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Apr 2022 20:54:26 +0200
Message-Id: <20220405185426.1250850-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/util-linux: drop
 UTIL_LINUX_FIX_DISK_UTILS_COMPILE
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

Drop UTIL_LINUX_FIX_DISK_UTILS_COMPILE which is not needed since bump to
version 2.37.4 in commit a586f0a283cd69f436bc6d0cff484460b412a1ce

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/util-linux/util-linux.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 7c153a6804..243e7dac8d 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -37,13 +37,6 @@ UTIL_LINUX_CONF_OPTS += \
 
 UTIL_LINUX_LINK_LIBS = $(TARGET_NLS_LIBS)
 
-# workaround missing disk-utils/raw.8 file in util-linux-2.37.3
-# release download package
-define UTIL_LINUX_FIX_DISK_UTILS_COMPILE
-	touch $(@D)/disk-utils/raw.8
-endef
-UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
-
 HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
 
 # We also don't want the host-python dependency
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
