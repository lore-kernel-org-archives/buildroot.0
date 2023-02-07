Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14672C636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 09:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90EE740084;
	Tue,  7 Feb 2023 09:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90EE740084
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xfuKJZsvcd2Q; Tue,  7 Feb 2023 09:49:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F9B340629;
	Tue,  7 Feb 2023 09:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F9B340629
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 64F3F1BF2C2
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 09:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BB418134D
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 09:49:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BB418134D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uSUBSejWu0Pw for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 09:49:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45B5F81298
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 45B5F81298
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 09:49:27 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 f23-20020a05600c491700b003dff4480a17so586006wmp.1
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 01:49:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BFU1QZVUXt4liSaioxfuQRpiI/8l/YzCF638iZUpGG0=;
 b=kEbO9T6vamH8bDbou1hP33Zc+P6d1P8780++ljIL51v7hdZZ07GaitWMW8EhRjc54/
 YfgxINjP9OswGuz9bt1g6R4HOze6r7tVq/Luzq6nNDxpMjBoKT4won4fDYlFeK8TO2WD
 qsuyyowoO6AduOX2mP7o9YVI7jLyJCEki+4sk5XVJz/iFBJPIRgPGmKLK0eQZxLeOJX4
 gRyaTCHkVSbBv6r2wEoz5ZeUQr5oLhi4qARyPSq9RD2eGZDW+BrER92IVi4dP/jOska7
 ouBZu6RQR1gxHE2ZbSirLxLi6AQDo2dMx3+cEXpdmQMbzGhoWMZ35PsuiBoqjMG0yW7l
 w6+Q==
X-Gm-Message-State: AO0yUKVUcl+nWJ2ClC1l2bRilrxlfCecDtTRb0biSfefsLua4G8m1SDL
 /SWPNwY15IcJZCoSfjPpXO8033ujyYNQBi0RwLs=
X-Google-Smtp-Source: AK7set+HfzzSoV/UaGpxIDh7G5jbYTedy1OtqhpimujP4MeTr4j53k2k81o6stT8wHOHIPFgN/uZyQ==
X-Received: by 2002:a05:600c:1684:b0:3dc:5622:5ded with SMTP id
 k4-20020a05600c168400b003dc56225dedmr2578872wmn.12.1675763365141; 
 Tue, 07 Feb 2023 01:49:25 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (mob-5-90-193-20.net.vodafone.it. [5.90.193.20])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a1c4b0d000000b003dc4aae4739sm18084606wma.27.2023.02.07.01.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 01:49:24 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 10:49:13 +0100
Message-Id: <20230207094913.603489-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BFU1QZVUXt4liSaioxfuQRpiI/8l/YzCF638iZUpGG0=;
 b=rVibNTXIMIiD8qzQdO7dyg6GET6Mm+D5JnoirVqjcYh+YSQVJmGxGITBtH+P4tagns
 klmiebhpUs0RKJaqBadJLwyj4axu+SQ2DEnWW3Bd+NvRCLtotMcIC0sNxWAOIZN056PF
 QlJICtxqkW+Tx4ueX4sCbaKJ6kmJ5DicauLmw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=rVibNTXI
Subject: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.21
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fixed android super.img loop download 52byte after some block
- Use login header as in curl
- Skip sleep in usb_add
- Add empty line after input password
- linux prompt ask user name and password for http(s) download
- fix linux build failure

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index cc1cd8326672..a5b665620c64 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  932c0a4acde0f52b907f5693c6d133c83142c4ca6e9df05a38b3ac1e50628883  uuu_source-1.5.11.tar.gz
+sha256  e89d3665af499ab71360d948176cf64619b082f8272a994d1fbfc000e67c0f14  uuu_source-1.5.21.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
 sha256  584bfbb18b4c08b872d48b80419dd453307212a144134fb516bd6ddc0700c2e8  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 647015e2dd85..1a5f84ce4d7d 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.11
+UUU_VERSION = 1.5.21
 UUU_SOURCE = uuu_source-$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
