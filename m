Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7910FCD8CAC
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 17:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E7F06142B;
	Tue, 10 Oct 2023 17:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E7F06142B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FSBspgN22bpx; Tue, 10 Oct 2023 17:03:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1485B61443;
	Tue, 10 Oct 2023 17:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1485B61443
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8FB111BF94D
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 17:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73B3F61427
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 17:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73B3F61427
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kt35VDiLmBIw for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 17:01:54 +0000 (UTC)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62A6C61415
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 17:01:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62A6C61415
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-53447d0241eso10542022a12.3
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 10:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696957312; x=1697562112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qICczBDGi2fMV7qVk7wLhq0aYRlSR6CQy9i9jTtnkoo=;
 b=CDd1Lse79lL3hPbRdjgATDpicmgTXdKl8t5eOuANbO6tEd31WPchuUxPjtdK+BcWvE
 On3CzSzDptmKe4h4R7x6QhSghuNnZzqnKAxlREKKDiNXpH5Ap4MTKvxkFzYEfGT9oIhY
 GWH8DhppEawGInjLMq9jxW/zSDlYN8W9r0l8Xf+b/9xLvE3/pVXFDVowS9T+wOzNPnlB
 PpF7svSRcd7scr20619GazmMAwsL9IMQVYG69dKbQdIrxG2l6LKxcNLGnQwH2Nifau4C
 RylgRA02Y+jDNFPM55FBJhhkORdrB0J9nQJOhzWGsvaqaDO5FV/LTn8HycOEJc8iqVTF
 BH2Q==
X-Gm-Message-State: AOJu0YxBKdMFepId7dzdax3yhciWCKPr4up37vD8oNn7X95VFql5OH/e
 IrL8maIy15/QSXIPT+QKEBGkwR2/6GZsf353xAfMOQ==
X-Google-Smtp-Source: AGHT+IEFydHo9/z7huyLJwx6MDNa9hczc6t9NMlHQ1Ks56Rxxx0XbZ88RIZhDLrECWbqDbrJHxnk2Q==
X-Received: by 2002:a17:906:109e:b0:9b2:f38d:c44a with SMTP id
 u30-20020a170906109e00b009b2f38dc44amr14856297eju.73.1696957311657; 
 Tue, 10 Oct 2023 10:01:51 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 ca9-20020a170906a3c900b009ae587ce128sm8651107ejb.216.2023.10.10.10.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 10:01:51 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 19:01:31 +0200
Message-ID: <20231010170133.2981698-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010170133.2981698-1-adam.duskett@amarulasolutions.com>
References: <20231010170133.2981698-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696957312; x=1697562112;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qICczBDGi2fMV7qVk7wLhq0aYRlSR6CQy9i9jTtnkoo=;
 b=AeFyQbd1sJZo1ioswHT9UWe2ASHkPHb6TH7jy+ubB59z9cStByhTbvaqM2k5azmMmd
 maTsUQnGBCZNl76229dg/FJnRIpTNAkp/aJJI1EZvg9ZJfCS+Fm1cO0gDJ6+/0kmqThq
 lYl/4jPVnqWXHoj+1jOorxCbwZw2jltpcnvxU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=AeFyQbd1
Subject: [Buildroot] [PATCH 7/9] package/xen: enable selinux module
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/xen/xen.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 169753e89f..fcf35144a5 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -6,6 +6,7 @@
 
 XEN_VERSION = 4.14.5
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
+XEN_SELINUX_MODULES = xen
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
 XEN_CPE_ID_VENDOR = xen
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
