Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A76C6FD18
	for <buildroot@archiver.kernel.org>; Tue, 28 Mar 2023 21:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8972861439;
	Tue, 28 Mar 2023 21:27:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8972861439
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pavPXorPy4R3; Tue, 28 Mar 2023 21:27:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7FFF613D9;
	Tue, 28 Mar 2023 21:27:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7FFF613D9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B8C8F1BF3F9
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 21:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91F7A4060B
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 21:27:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91F7A4060B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yA5ERTQOF9-P for <buildroot@lists.busybox.net>;
 Tue, 28 Mar 2023 21:27:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3CF9401CC
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3CF9401CC
 for <buildroot@buildroot.org>; Tue, 28 Mar 2023 21:27:18 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 p13-20020a17090a284d00b0023d2e945aebso2578357pjf.0
 for <buildroot@buildroot.org>; Tue, 28 Mar 2023 14:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680038837;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HD/6nAHXzzwfNiMlo//RhL1xJTZSKzxMfCvvLOF5NEo=;
 b=KLmf45mMVHijfnfQyZUCjyMaAA66v6Po1z8Yf1oSvdgI4OaDzuNc5OfN/RjrBO+qee
 qXgtG5wzWHmAossvIy0eZZEN5QOH1FZ0YOpSxvAAceIS0C8YGhcPUTQwmQcFUbVzM5D4
 4nEL6289sJz+dKMnuckZQEkUn11srzqZT6ZJJlh8LpWDzWxs+ieQ4Xw++hR0JwLw616q
 zNvVYUQDBOvsvu+Y7DI/JBdo6xFVMAtRLMVdIxGNeDeyrxj4PVeQCkSpw828OYSbN9xt
 UccouislW+Q9MlQexIl+v6h+/fefzT8+HS1MpMJdbHLUoElnEGIkSsRtqUTGn2Yi48K6
 8W1w==
X-Gm-Message-State: AAQBX9eGX0ywGd6Fo/P9U3STCsPD0GyJhmFbVfnpnVEAvzGnrLvKu4hB
 Gp+ueOo0xdSFHwd2jlC42S04iv0oilQ=
X-Google-Smtp-Source: AKy350aqomTmue5AcsXWguyDMwsiJTT3uDw9fqSB1wupzebx7eTWfn+aaYYuXMrx4zH2YojONz5JxQ==
X-Received: by 2002:a17:903:1209:b0:1a1:dd3a:7512 with SMTP id
 l9-20020a170903120900b001a1dd3a7512mr16904756plh.21.1680038837445; 
 Tue, 28 Mar 2023 14:27:17 -0700 (PDT)
Received: from localhost.localdomain (ip72-194-116-95.oc.oc.cox.net.
 [72.194.116.95]) by smtp.gmail.com with ESMTPSA id
 t7-20020a170902bc4700b0019a91895cdfsm21557225plz.50.2023.03.28.14.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 14:27:16 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Mar 2023 14:27:11 -0700
Message-Id: <20230328212711.3721-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680038837;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HD/6nAHXzzwfNiMlo//RhL1xJTZSKzxMfCvvLOF5NEo=;
 b=Iq82ilst9lGrrls6b8PD+K23Q5GGWXfEUhBsSk+FO5vy4RoHHcvxHnHHg+S3rZLOxF
 iZMtGrYZpxU+3ykTWjd19FpOA4FE1PmUfnikb/qsNs9xrd2N7BFIX3SEmxR9ntY+0wHi
 qCSEo395QQK5FwSAumkPdQ65vbOEQKE0UgkJ0axFEx4eHUYpnI1HFIUPEMAi85a0MeUr
 3OUNb+83DRIRCrmimA+j1Xr2+MnQZMx1PFKa4z0S2k+lor1inytGew93vCSYPfbEWnYe
 0lI1VcIZfvzeGmJva3zCsTn/kpl3IjrO3/6AjDCxrq6Ms2kwU9xIPkDudbtLr4FiVSmL
 uLGQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Iq82ilst
Subject: [Buildroot] [PATCH v2] package/bluez5_utils: Fix builds with
 musl-libc
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, marcin@bis.org.pl,
 d.lang@abatec.at, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport upstream commit ca6546fe521360fcf905bc115b893f322e706cb2
("shared: define MAX_INPUT for musl") to fix builds with musl-libc.

Fixes:
- http://autobuild.buildroot.net/results/3fd24a604a29eff70e20f82690e3f058f04903f9/
- http://autobuild.buildroot.net/results/bd57f1813be699cd5ce2ae94f5f511a71fe10428/
- http://autobuild.buildroot.net/results/90d528cc18a367af2f68e1c0673d962fe399e1ac/
- http://autobuild.buildroot.net/results/552b700ee129e1c7f651de13f6766eae5325dcbc/

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../bluez5_utils/0001-musl-max-input.patch    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/bluez5_utils/0001-musl-max-input.patch

diff --git a/package/bluez5_utils/0001-musl-max-input.patch b/package/bluez5_utils/0001-musl-max-input.patch
new file mode 100644
index 000000000000..4d06a2bbeaf2
--- /dev/null
+++ b/package/bluez5_utils/0001-musl-max-input.patch
@@ -0,0 +1,37 @@
+From ca6546fe521360fcf905bc115b893f322e706cb2 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Tue, 31 Jan 2023 05:52:58 +0000
+Subject: shared: define MAX_INPUT for musl
+
+musl systems don't have MAX_INPUT. Just define it to _POSIX_MAX_INPUT
+which musl does have if it's not already defined.
+
+Note that on glibc, the values match anyway (as of glibc-2.36), and
+indeed POSIX_MAX_INPUT has the same value on musl too.
+
+Bug: https://bugs.gentoo.org/888467
+[f.fainelli@gmail.com: backport from upstream]
+Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
+---
+ src/shared/util.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/shared/util.c b/src/shared/util.c
+index 2f0ae0e86..b466fb001 100644
+--- a/src/shared/util.c
++++ b/src/shared/util.c
+@@ -28,6 +28,11 @@
+ #include <sys/random.h>
+ #endif
+ 
++/* define MAX_INPUT for musl */
++#ifndef MAX_INPUT
++#define MAX_INPUT _POSIX_MAX_INPUT
++#endif
++
+ #include "src/shared/util.h"
+ 
+ void *util_malloc(size_t size)
+-- 
+cgit 
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
