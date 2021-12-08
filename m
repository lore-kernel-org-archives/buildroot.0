Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2578BC433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Dec 2021 01:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F12780C16;
	Wed,  8 Dec 2021 01:08:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dfW6QGqVcJpP; Wed,  8 Dec 2021 01:08:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D4F4801D6;
	Wed,  8 Dec 2021 01:08:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39D381BF3ED
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 01:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 322D483F9D
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 01:08:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dhZFZzt61P4E for <buildroot@lists.busybox.net>;
 Wed,  8 Dec 2021 01:08:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B556E83F8A
 for <buildroot@buildroot.org>; Wed,  8 Dec 2021 01:08:20 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso879966pjb.0
 for <buildroot@buildroot.org>; Tue, 07 Dec 2021 17:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lpUQlVIeU+NIGwoY+d99IqeZ2A6kOVA+4hSs7WQ7Q00=;
 b=o1v7ORJdMEKLVMrbszDAJfilruwk25HDOzJQ+XWL0m5IymPJV/7+pHVFmYwMkL1cJb
 3Ho019teoGLIHKimoO1lzZOKoXGzK3P4bf4RqUW//j01PJCrJfSc3AmalUL5p995N1y8
 mgreW4QwY7/cyG2rS8iFU/m1+bm4dYZNnTyKhJr01noN/QyPZAp+AGjdTAQLCCQqc5Ic
 7hs5MLSMxZXWxMFXAKhkhlcflthCew/XVIkjCkL2bLDYkWeD0BtxH3WF4dEyVoSsp5oi
 jjjg1jlhQlHZv84CddRx2NcgsTfC0v8rqjhWpwV2xB2+f7GCRkAhjMTdOBzz9pYJ/XgP
 pqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lpUQlVIeU+NIGwoY+d99IqeZ2A6kOVA+4hSs7WQ7Q00=;
 b=iWbkb7q3S+Cyo4zX4PCFopP2tOemnAZkUWIoLzis5vKd7Ipi5lwbleI0Y/qTwQvVy1
 5Jpzoi/YCS8nV+OfkHRD22dylIZn+D8pQ6e0J+10FKu7Cr+cqIxlG9qAupy7jS0SwjCE
 ADa6/C24VyHJHXo7+oNft9QU+byrf56Y/3GukgVwSMbZMchXLM/0jmyct/s+USuMG5j9
 Z1ky6QO99nIwBSOZ97G2nj77mDFrfF9DWrV7yE+DWr9X8U5r6DLv98W+jiZDwQKnjZ7E
 kKsKxlngbNJYDUHnOq3LdmI6ebDvBxa6WCiSM6vOKLeuan2+1F9ZBM5uoVU91zsu7lns
 RIcQ==
X-Gm-Message-State: AOAM531L8JUZEILy1u3GX9c3K7jwbS+L871OiDNEd7KMeGqQZpzIX6Sm
 ch2OSTRS3Kg9Pky7gB1RqN+hc6H6xCs3kg==
X-Google-Smtp-Source: ABdhPJxYPvgIHC8AzAbnPEmXPS3xNpzu7LCuTjLgrBF6eW3ACrSAlNhFP+7u6FvrQvPBQLX1yZvtQA==
X-Received: by 2002:a17:902:e302:b0:141:ba08:2e44 with SMTP id
 q2-20020a170902e30200b00141ba082e44mr55278086plc.81.1638925699990; 
 Tue, 07 Dec 2021 17:08:19 -0800 (PST)
Received: from adam-workstation.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id m13sm664421pgt.22.2021.12.07.17.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 17:08:19 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Dec 2021 17:08:16 -0800
Message-Id: <20211208010816.3186969-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211208010816.3186969-1-aduskett@gmail.com>
References: <20211208010816.3186969-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/watchdogd: enable selinux watchdog
 module for refpolicy
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
Cc: Joachim Wiberg <troglobit@gmail.com>, Adam Duskett <aduskett@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>,
 =?UTF-8?q?Alejandro=20Gonz=C3=A1lez?= <alejandro.gonzalez.correo@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is needed for watchdogd to work with SELinux.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/watchdogd/watchdogd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/watchdogd/watchdogd.mk b/package/watchdogd/watchdogd.mk
index b666b56433..1a9d04d938 100644
--- a/package/watchdogd/watchdogd.mk
+++ b/package/watchdogd/watchdogd.mk
@@ -11,6 +11,7 @@ WATCHDOGD_LICENSE_FILES = LICENSE
 WATCHDOGD_CPE_ID_VENDOR = troglobit
 WATCHDOGD_DEPENDENCIES = host-pkgconf libconfuse libite libuev
 WATCHDOGD_CONF_OPTS = --disable-compat --disable-examples --disable-test-mode
+WATCHDOGD_SELINUX_MODULES = watchdog
 
 ifneq ($(BR2_PACKAGE_WATCHDOGD_TEST_SUITE),y)
 WATCHDOGD_CONF_OPTS += --disable-builtin-tests
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
