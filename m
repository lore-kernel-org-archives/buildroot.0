Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4CCC433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 20:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 267ED40AAD;
	Mon,  2 May 2022 20:12:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kGzoVdfx9CAI; Mon,  2 May 2022 20:12:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CDD440AB9;
	Mon,  2 May 2022 20:12:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D32C31BF2BD
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 20:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFE3B81CBA
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 20:12:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cgvkI6JftB2H for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 20:12:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C868781C6E
 for <buildroot@busybox.net>; Mon,  2 May 2022 20:12:06 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so194967wmn.1
 for <buildroot@busybox.net>; Mon, 02 May 2022 13:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wgXNryjVrP7GgeVPl3wSAqXMcHbKaFXjTX4mDAmOBX4=;
 b=YaklaeAXjmcIM+I5pxdLQER6N2E/gvYn2eNwqJHSW/5sQAK4OShtr+M3TqbXvAORnk
 M+JwA4YebZhmBiMB6149ShCMkDwOdwGvTPLXqpYRY2tb8H0QAeyV7mmSjwheOSpW/I5s
 i0VFBdoSKKVZGpb/37MjbBflW6vnuS7mb/oST4TzJa+bRmLlYSVQ60cjo1Gofgrlz5vV
 yzfPjy2ULne9gf4cTZm/bb8JUDQYbV7U5E3BRu4If8JTcKTu3zeY97PtBfXT33affA9x
 E8Pa/5eR0OUfdcC3QRQh61yZ4jCnqdXEQ21HQkfWUwl6hRXPtxf63KjQtMp8EuXPAK2X
 of6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wgXNryjVrP7GgeVPl3wSAqXMcHbKaFXjTX4mDAmOBX4=;
 b=nTeTeSHPd0Tv2UOKBZdps7KgyEhYeH4IVO6g6zofthkvzPxzMxw/qnrWUKODa4vMoQ
 hXaudR9jdIeWc0nl9kxiQCXVXIvsMHQzvflR9jnS57DVQeE5s4SgURqAvW6uoY/0QVwv
 KHWU1iGwEpAqi9polwbO6jYaBdgeorDdM33xtarS/VNcr4A1yaiU63BAS0JcSiix5uj9
 UZzCa65RmHqGxA9Sw6O9e/X5VkQkyrdMLcqQzHKWWC8/D0jOahQsAW0Phivqb/sWfR5d
 xWFie8Sj9aVmNnjNiO+R4k/1pUAYMLDuL2hCh6uPcW1IJTI8rbil7y7+A1OIlS6d+9fK
 qqnw==
X-Gm-Message-State: AOAM533kz0Xpf0fEfxeRy+0ErEqp3evkvolkQrKkOahLMZAAYHl4VYOK
 yLpo3lYhddeDNqdj9IMPHbbKbtgQ/eU=
X-Google-Smtp-Source: ABdhPJw+yy0ejYGNP0mE/E7EqNjjXAv6bYqos8Uoy/Jqj7e9x9n3AbkwkkBgilXNN4ja6oYAu3+pHw==
X-Received: by 2002:a05:600c:4fce:b0:394:4951:cf0c with SMTP id
 o14-20020a05600c4fce00b003944951cf0cmr552915wmq.73.1651522324860; 
 Mon, 02 May 2022 13:12:04 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a05600c4ec800b003942a244f57sm115942wmq.48.2022.05.02.13.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 13:12:04 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  2 May 2022 22:11:47 +0200
Message-Id: <20220502201148.92261-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/nano: bump to version 6.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 69ebc27b7..8308005bb 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v6/nano-6.2.tar.xz.asc
+# https://www.nano-editor.org/dist/v6/nano-6.3.tar.xz.asc
 # using key BFD009061E535052AD0DF2150D28D4D2A0ACE884
-sha256  2bca1804bead6aaf4ad791f756e4749bb55ed860eec105a97fba864bc6a77cb3  nano-6.2.tar.xz
+sha256  eb532da4985672730b500f685dbaab885a466d08fbbf7415832b95805e6f8687  nano-6.3.tar.xz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index e3ecbab56..cad215bed 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 6
-NANO_VERSION = $(NANO_VERSION_MAJOR).2
+NANO_VERSION = $(NANO_VERSION_MAJOR).3
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
