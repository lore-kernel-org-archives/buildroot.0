Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE15C433EF
	for <buildroot@archiver.kernel.org>; Sat, 26 Feb 2022 18:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26279833A8;
	Sat, 26 Feb 2022 18:18:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xmPgj0EkToQk; Sat, 26 Feb 2022 18:18:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A26FA83313;
	Sat, 26 Feb 2022 18:18:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 495411BF281
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 18:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34AE683313
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 18:18:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yGqhi6cCvrh0 for <buildroot@lists.busybox.net>;
 Sat, 26 Feb 2022 18:18:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43D5A832EB
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 18:18:02 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id i19so3433045wmq.5
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 10:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ll46zCupYrN9bIhBAQwK2s2bmcd3ov3w8vsaYqHiZus=;
 b=ETTC/M25Q1qCYQLIrJgNZQbh6mGcdalV80jE/4nDXy5hGgaTghlVKFc+g2+A6lUu3B
 J3g0ry4Y8h0EuQDaMki2cQ4YphINbTOVFCABWtyOaH7OoONl090+HpD6eoo337KIXXkY
 NDqDV9sDlqtiDQ5g4UEjZ6iqf1zI93I5McxusFcW4Zg2Fi5oeSOBi/6VmYIKYqQmhtVH
 3dMWwMFa79ybP+Je9iOcAxXBpLHDRjhqwj473/8vO6qCXRNZzNuvCQhYqH01oV10NA6m
 ktmFDVqzfpqQ/bOExknzLRDj5xO+COzODA3HmRebG+wEZj6rOr6AW4X5BLSyRxK/EdHD
 AW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ll46zCupYrN9bIhBAQwK2s2bmcd3ov3w8vsaYqHiZus=;
 b=6ZNFmySErbhHfkswTc8UQGv6L/hVlX9RPmJiM/RJg34aaOA0J9jXsyASWDqFiJyxgO
 RvVKtwVQcOkRv+x8nDoRFqnW2TY4GW8wI4rCnol0dli+k94tZ9ws7oVgt8aruPmfrd/h
 idP+lmzkysju0IpQi/kxA3jCF/PVznvOSuXScshyP3OdnTCo0+t2U0c6FFoxCahTkl7N
 odrPN39POSM2vCI9cyZHcEhZcfq6pg7TD2eD1u+cbBDYmjp6awT1xFIj43F9rus6WcPY
 byjWjL60W7EiaJhOIIC7w6JNu3ovHYJ4tGcMn98zEv/G4VN9Fle5IzwZEzfMF4dZrtVK
 z/0A==
X-Gm-Message-State: AOAM532VpMyQc6ljq4vZy//8vK4qz6zuyzx12Akgrt3zgsJnmoqOWsR1
 r8TvqxfUfUqb9a6910wHTuiCb7CehB0=
X-Google-Smtp-Source: ABdhPJxlUboob4QNkcaS7regTPoiu+3m+CjCfg58a9kAvDw55pUFSnLfdVIJrnYfNvrGy4ze/ratCQ==
X-Received: by 2002:a05:600c:68b:b0:380:d3e3:5bac with SMTP id
 a11-20020a05600c068b00b00380d3e35bacmr7572805wmn.127.1645899480369; 
 Sat, 26 Feb 2022 10:18:00 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a5d45c9000000b001ef9200b856sm1150564wrs.115.2022.02.26.10.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 10:17:59 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Feb 2022 19:17:47 +0100
Message-Id: <20220226181747.3033483-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dbus: bump to version 1.12.22
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

https://gitlab.freedesktop.org/dbus/dbus/-/blob/dbus-1.12.22/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dbus/dbus.hash | 4 ++--
 package/dbus/dbus.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 06512e5656..176396fe2f 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.20.tar.gz.asc
+# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.22.tar.gz.asc
 # using key 36EC5A6448A4F5EF79BEFE98E05AE1478F814C4F
-sha256  f77620140ecb4cdc67f37fb444f8a6bea70b5b6461f12f1cbe2cec60fa7de5fe  dbus-1.12.20.tar.gz
+sha256  8d25785c798ec4f892e6f9d177fb0ceeb8b29867b119798f9d5228561d3ad474  dbus-1.12.22.tar.gz
 
 # Locally calculated
 sha256  0e46f54efb12d04ab5c33713bacd0e140c9a35b57ae29e03c853203266e8f3a1  COPYING
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index d78e102427..de447d8680 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.12.20
+DBUS_VERSION = 1.12.22
 DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
 DBUS_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
