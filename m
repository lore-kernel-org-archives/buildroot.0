Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BFCC433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 18:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8323A60BAF;
	Fri,  3 Dec 2021 18:01:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s5LWURN7Rlc7; Fri,  3 Dec 2021 18:01:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0845560B8D;
	Fri,  3 Dec 2021 18:01:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 565921BF2A2
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 18:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52E7F60B8D
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 18:01:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5aNiULlkUJxh for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 18:01:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1FCC60B87
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 18:01:14 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id f125so3878787pgc.0
 for <buildroot@buildroot.org>; Fri, 03 Dec 2021 10:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8e7AcUXQHBfpiHN5LPIRVfIJOxv1COptSjQ4y0Vda2s=;
 b=C+pzSpZyL8QRh+vTii29PBsyEP7lLqNFH774vBx9EaDoHqFYRWwwOYERySnq8ZHukv
 HExP2AB/W+nG5wLumUjx1YNA0U0pONhftgnINi51xMf10IHvFhmLquJ03xx+NqFmP2Z2
 zf8DPi8qgXV6RA6EcBee9Eq/wXEVmODBInW3stZCl26qDMdRwzRNiupcg9sI2mhKn2Ws
 Z3PaJLtlp6bo6TnvKDsINoccB8lfgcItpDTQI9/stWdGVVcToG9tb6gEbhsb4KbDxnUR
 XJJAAMUfiX61KQXQ4GRevC+0ecakIp2xBg9gAuuXtxbP25C493hJCzbJQT8urYiBconf
 9TNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8e7AcUXQHBfpiHN5LPIRVfIJOxv1COptSjQ4y0Vda2s=;
 b=Iymk7/ffPd+yH5MLMpxqT6bQypWfYudDC3Rq4Bj1HJ5Adyu91MHHNph1DmGrQ62D3O
 2nPdnUQM1iF2pubmyPsOYzyST7VHN5mzKnE6510tVgA9wddBoWOy8rg4rH2a9ayq2bRY
 PgQxiiE4vHWZt2OqeKLNHBRTPzfq29j50pME/VwQeXCFoFlgbmBb3ahOgaKpy4CP0tL0
 2vFl7e+fIB2Sh9NJvs+S6Fo/kpYG3GMoNI/JoTn8tDly1eoB8/roMhcAQQmJRKe/T7B1
 HJwwuIZXmngPU1BFVJKXylINvb1Q46YYgjnIjSkeB0FKMZFRHennbBcG4IF3qVgQzipO
 Nh/g==
X-Gm-Message-State: AOAM532HboJE3fsL5D36zXCxS9QMO8LGuwdN9P2ZdUGOYQlnI6Pi7g29
 qbmmEzhRWPZ1ZFjkHGEOobzBNQuO9wbhXw==
X-Google-Smtp-Source: ABdhPJxdwpTCO7OMO4CN3Nu0ozh1N7CFoGnI0YuLLMszUtFFM8JHiQe2gVslkVxFppUgx2PHucnUcw==
X-Received: by 2002:a63:554a:: with SMTP id f10mr5736858pgm.444.1638554473923; 
 Fri, 03 Dec 2021 10:01:13 -0800 (PST)
Received: from localhost.localdomain ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id x37sm4011278pfh.116.2021.12.03.10.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 10:01:13 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Dec 2021 10:01:04 -0800
Message-Id: <20211203180105.1165486-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/openssh: enable selinux ssh module
 for refpolicy
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
Cc: Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is needed for ssh to work with SELinux.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/openssh/openssh.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 75c4a0128b..4145bfd8dc 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -27,6 +27,8 @@ OPENSSH_CONF_OPTS = \
 	--disable-wtmpx \
 	--disable-strip
 
+OPENSSH_SELINUX_MODULES = ssh
+
 define OPENSSH_PERMISSIONS
 	/var/empty d 755 root root - - - - -
 endef
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
