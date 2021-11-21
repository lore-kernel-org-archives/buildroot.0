Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1000C433EF
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 17:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6962040225;
	Sun, 21 Nov 2021 17:09:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iYTwoSQUn3ab; Sun, 21 Nov 2021 17:09:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5287E401DB;
	Sun, 21 Nov 2021 17:09:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72F991BF3E1
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 17:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62BEE60705
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 17:09:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v15kIRCii7Zs for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 17:09:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9867605E8
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 17:09:25 +0000 (UTC)
Received: by mail-ua1-x92a.google.com with SMTP id j14so22016901uan.10
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 09:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xhPAAXsUTMY9IzWecorU3BbQ/u8cEcO4+Mc9HfHWdJA=;
 b=Ds9IPqvdOnV5Com92SyOPZgeuGWkZ9ykB+YeeyurkZ9083iJAWi8VVRbubAocEEogq
 OPkQ5nCxwXx0c7Y8RGa9UXYZJYtTl0llJQIzIq6vIn4nrGiOZ94irmEncJiMWHkPxYUx
 hwKlnn3VVcV9GM6PSf4xIqMrXqN9ly5keXyMy1/m4TV040exJuTKnA0JKmRvmoa1OopF
 N4BY8NTFK/2WmuWL3C6pX9SN5X2Wife1w4G5AoL5w3j8WQhDlCc4O/J1Sjt/Fv9fb799
 EyzIUkYAUXdrmF6ShYum7yLFHfO/CUV2v4kwLClfYktE2/O125ahyLB7voUw16mo76dH
 /b9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xhPAAXsUTMY9IzWecorU3BbQ/u8cEcO4+Mc9HfHWdJA=;
 b=r9MCUbDFH6aQBMpuHoVNunIXflw4P4dtJxjHaNitUJr7HBX5PolZ+zLJhaqsJvIY0z
 uvFvYcq1Dvi+5qtFrBYEk2STzWi8jJ0Ub22yUVBg5EUTFMBDHF6Xk7t77AR2irLd1GXN
 BxHCTo/YgMZ8CheZDG0eE2zvulW4+za6VlG31ZTS08udZkdnFsbCfQIYE5H8zRPOKAUY
 o0NtAXbU2eX+rZxJ+tXi2wTkqvH6tH7WqlVUXT+ojBMUb78pRSw4VqJHuOLe6B3H1iSF
 SDnKhES3BwYJAnhOaFZfCxjh37vSQ6GQ73y/S8F65icjMsYfEzZGmVJTCIYdncCtrIgC
 iCfw==
X-Gm-Message-State: AOAM533noJWeU0ejEM4bSe4OLvvJHNNFeERF6v6RVU5spKhCLT6rsC7w
 gTZBZ2wCspxLLo3bwYX15/p/AZ9sOc8=
X-Google-Smtp-Source: ABdhPJxWgstXHzHALIja95z8ViPWse0X02s3tBaRLDNCVM8rmaJA50lM3TSDm2opr4a0rkpsmgyxgg==
X-Received: by 2002:ab0:35cd:: with SMTP id x13mr76306163uat.46.1637514564644; 
 Sun, 21 Nov 2021 09:09:24 -0800 (PST)
Received: from localhost.localdomain ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id q9sm3159121vkn.44.2021.11.21.09.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 09:09:24 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 14:07:52 -0300
Message-Id: <20211121170756.3810922-3-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211121170756.3810922-1-ricardo.martincoski@gmail.com>
References: <20211121170756.3810922-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-next v2 3/7] boot/at91bootstrap: rename patches
 with the proper naming convention
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As reported by check-package (by calling it directly):
use name <number>-<description>.patch

Output of:
make at91bootstrap-dirclean at91bootstrap-patch | grep 'Patching\|Applying'

Before:
>>> at91bootstrap 1.16 Patching
Applying at91bootstrap-1.16-eabi-fix.patch using patch:
Applying at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch using patch:
Applying at91bootstrap-1.16-u-boot-relocation-fix.patch using patch:

After:
>>> at91bootstrap 1.16 Patching
Applying 0001-eabi-fix.patch using patch:
Applying 0002-gcc-4.6.x-ldscript-fix.patch using patch:
Applying 0003-u-boot-relocation-fix.patch using patch:

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
v2: new patch in the series
---
 .../{at91bootstrap-1.16-eabi-fix.patch => 0001-eabi-fix.patch}    | 0
 ...4.6.x-ldscript-fix.patch => 0002-gcc-4.6.x-ldscript-fix.patch} | 0
 ...boot-relocation-fix.patch => 0003-u-boot-relocation-fix.patch} | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename boot/at91bootstrap/{at91bootstrap-1.16-eabi-fix.patch => 0001-eabi-fix.patch} (100%)
 rename boot/at91bootstrap/{at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch => 0002-gcc-4.6.x-ldscript-fix.patch} (100%)
 rename boot/at91bootstrap/{at91bootstrap-1.16-u-boot-relocation-fix.patch => 0003-u-boot-relocation-fix.patch} (100%)

diff --git a/boot/at91bootstrap/at91bootstrap-1.16-eabi-fix.patch b/boot/at91bootstrap/0001-eabi-fix.patch
similarity index 100%
rename from boot/at91bootstrap/at91bootstrap-1.16-eabi-fix.patch
rename to boot/at91bootstrap/0001-eabi-fix.patch
diff --git a/boot/at91bootstrap/at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch b/boot/at91bootstrap/0002-gcc-4.6.x-ldscript-fix.patch
similarity index 100%
rename from boot/at91bootstrap/at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch
rename to boot/at91bootstrap/0002-gcc-4.6.x-ldscript-fix.patch
diff --git a/boot/at91bootstrap/at91bootstrap-1.16-u-boot-relocation-fix.patch b/boot/at91bootstrap/0003-u-boot-relocation-fix.patch
similarity index 100%
rename from boot/at91bootstrap/at91bootstrap-1.16-u-boot-relocation-fix.patch
rename to boot/at91bootstrap/0003-u-boot-relocation-fix.patch
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
