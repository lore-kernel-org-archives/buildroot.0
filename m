Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C726CC30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93B66811F8;
	Tue,  2 Jul 2024 07:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TWCBPFav5uZ2; Tue,  2 Jul 2024 07:44:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B67E812BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B67E812BA;
	Tue,  2 Jul 2024 07:44:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B6B2A1BF365
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3F4E409B6
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:44:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fWmwroz1Irqa for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:44:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8507E40B7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8507E40B7F
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8507E40B7F
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:44:31 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-58b0beaf703so967605a12.2
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719906270; x=1720511070;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qvAxdmhVXcncC5fzFUNn7S72Zhbap5cy7AIT9afCAMU=;
 b=GuStlHezvs3PdcAO5ydUE/AYd6DJOHqHQsjWjC+0Tc6BQJ0HoZ6faPEJRv03CbH5ay
 rXqLgR4fVYVPFISZk16bAPVeipZHBhytTr0zXO4CDkLgZpK2zq0xu/1hzmWmnSLR7/Fr
 kjNyJ8zG2+y6m9k3QkQOCkPB/dOXGyudV0qJSqsUY+tWuU6wFJxbXVkDu3Y7aLZbCLtE
 1HSrR0kvqlRuVSCIwa0jxGf47yKZHNqwlT8T1rh52snbGqjCThKqpW4xQvC9YCT0mmpy
 CqgRg0P0Icg+3FA+KBTOIXESWufgpaG1spEY0+K1piVTlpVpdMTwMlxJfYkPKDpIHWMR
 /eww==
X-Gm-Message-State: AOJu0Yw3CdOUg8xEpV2yaqiZsgnFxo6F6+304M0tErdC7kOcmSTSn4io
 jYUU1sF/dlOJ3N7IatNnlxtbP8wwj7tRjS6II1SRDvvVyY9QSjIlDPDhOaIdFVzn1EEG9jIIVTS
 T7uc=
X-Google-Smtp-Source: AGHT+IGOzUiyDCC3DGbY4ArvSUuuehKjt6+ahA8jX2McF+9tNElK648kPMZ3quPHXS5imuEQJFHIDQ==
X-Received: by 2002:a17:906:3a8f:b0:a6f:af4f:ff82 with SMTP id
 a640c23a62f3a-a7514430c05mr499469266b.25.1719906269833; 
 Tue, 02 Jul 2024 00:44:29 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:c733:f73f:670d:ca47])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab08cf7csm396816266b.155.2024.07.02.00.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 00:44:29 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jul 2024 09:44:23 +0200
Message-ID: <20240702074423.2380064-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1719906270; x=1720511070;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qvAxdmhVXcncC5fzFUNn7S72Zhbap5cy7AIT9afCAMU=;
 b=G6PDfSPZtcCPPCRNqTDsSSipS4QTNVXZhlWrfl9fmu84zAVC04Wefth1zadWeTeBq8
 t/wW7ltm554WBMnu2+z/6M9OSRl9Tg+euSDwygR4xNbGmciRRJENhByI9saf7EWGJlez
 w/w5bcpDwZLe9/SiQn0nSnYfH7InaMJHn4cKs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=G6PDfSPZ
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-kobs: update the
 patches to be applied with fuzz 0
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, imx-kobs fails to build with output:

    Applying 0001-Fix-musl-build.patch using patch:
    patching file src/mtd.c
    Hunk #1 FAILED at 31.
    1 out of 1 hunk FAILED -- saving rejects to file src/mtd.c.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch b/package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch
index ce123de9cc49..373b34ffce0b 100644
--- a/package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch
+++ b/package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch
@@ -1,6 +1,8 @@
 [PATCH] Fix musl build
 
 Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  src/mtd.c | 1 +
  src/mtd.h | 5 +++++
@@ -17,6 +19,7 @@ index 1edc441..6d2264c 100644
 +#include <stddef.h>
  #include <sys/types.h>
  #include <sys/ioctl.h>
+ #include <sys/utsname.h>
  
 diff --git a/src/mtd.h b/src/mtd.h
 index bd21add..debfc84 100644
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
