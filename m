Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D8DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 10:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1755409D0;
	Sun, 13 Mar 2022 10:38:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XKeDU2hc1Bwg; Sun, 13 Mar 2022 10:38:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0B8B4099B;
	Sun, 13 Mar 2022 10:38:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1540C1BF341
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 10:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1123B60B57
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 10:38:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id edHWTinaQRUz for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 10:38:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20C4F60ACD
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 10:38:39 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id 19so7672454wmy.3
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 03:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JPDZgEiyOWaxQkCMVLrKja/D1bjz1j1IfsJo0EcNc/I=;
 b=JW0uQ0io8COrnBAkHIejkjatOwZ3rPpr4pgZwwkhPX0isAaFKuQWT6c2KpBC8inn6I
 zt+/JqgNlyMLAIBLE8YAVX41yDu9DnAbEAtAnobb/PM2Fm/uggrucbFuyU2JwZdf7KVl
 +u2tKG5aA/hfj0zf/9szjf6911nQchfaoc4d/zVBRJ0e7B5R7tkfXlPrw9kOfjW0PDWm
 nlSjy35FSDL57sHNFkle94UbzJ3rfMmsKtngbYcN96sGR2TMFiWglJdEmd6UEdNEtnuv
 buw54wWQE0btxMFaq1pa13AwDcUMKdZCudOfThbpZ4NS5PGv3bU3Hmbblf8hb6bUyy9E
 +xjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JPDZgEiyOWaxQkCMVLrKja/D1bjz1j1IfsJo0EcNc/I=;
 b=tgMN4Yi8Y6E4G/hPBt5W9zizpVNVaxGWw0VIMMa6SHSiFaQKOI4z1DRqfXbFIQSM9g
 +vrpwf3vM84MImSNyR6V4QG5w5DqS6aDajds9IwYT0GKUbjq0ktt3OngmuEpquhTFMUK
 tMSbAqrWghXZ6az3ZmqVuDRpO78jHmXm3MVz/xTF8G24FERku6G0HUbi7z9e8SMwN76r
 Pam6f5JEVgeJyRoVN4rSHsxKzGAB5sIeCRV4ZaTgU+3qmpxJI7ia2BC3coycLHFGiiEo
 1hEtNmDUTStr0UU8RQ1D6qev5GyBNjalbdPQFfCYdfnqrGAVxhPQkQQiDFemPFRtEvDy
 HldQ==
X-Gm-Message-State: AOAM530f0YSJky/HR1b0urTVdNezQhG2jPs+lX9x5QHO61wcLVW1jjoB
 T7x3uOTmqvkL3QzuShOymc6PyC8k56I=
X-Google-Smtp-Source: ABdhPJyDpQpky+Dg+TALQpTnPw2ASjXTGG3RR0pWz2BlVmdbvWzx1pMxQ90Liyjk0Ie1nwqHDpICuQ==
X-Received: by 2002:a05:600c:3c9b:b0:380:be98:6204 with SMTP id
 bg27-20020a05600c3c9b00b00380be986204mr21412456wmb.121.1647167917012; 
 Sun, 13 Mar 2022 03:38:37 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037bb8df81a2sm19239301wmp.13.2022.03.13.03.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 03:38:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 11:37:37 +0100
Message-Id: <20220313103737.751528-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220313103737.751528-1-fontaine.fabrice@gmail.com>
References: <20220313103737.751528-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/ola: fix build with libexecinfo
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised on uclibc and musl since the
reintroduction of the package in commit
16ff948444c3978d63f483344a3d92d994c64312:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: common/.libs/libolacommon.so: undefined reference to `backtrace'

Fixes:
 - http://autobuild.buildroot.org/results/4362b20d786a0f44268ec32a689c23ac6d3b71c6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ola/ola.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 5090076175..471ae8ed9b 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -53,6 +53,11 @@ endef
 OLA_CONF_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
 OLA_MAKE_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+OLA_DEPENDENCIES += libexecinfo
+OLA_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lexecinfo"
+endif
+
 ## OLA Bindings and Interface selections
 
 ifeq ($(BR2_PACKAGE_OLA_WEB),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
