Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E673C47DDB
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 16:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAEB2403BE;
	Tue, 23 Jan 2024 16:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAEB2403BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BaiEMEb5Nnkc; Tue, 23 Jan 2024 16:26:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 106AB4048A;
	Tue, 23 Jan 2024 16:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 106AB4048A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 659331BF3A6
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 16:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E53841498
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 16:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E53841498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cMTJRIJRWnAS for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 16:25:59 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1BF4410E1
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 16:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1BF4410E1
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40eb99a72dcso9049605e9.1
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 08:25:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706027157; x=1706631957;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fXs+SVCQq8c2NqMhA6C73P6GVkKbhM7uxG29pmqapQw=;
 b=wWrR5QAKnaHYREUfDt3nu2whNAp0IYzMHIpXNbMpYiEpPcEonnU4lB/lwatYPROdkG
 Q7POUqu9KSlFLE9BbfoacTe/kkE1UHxs7nkgm9K7mkmKhtHcZZcCjQQVxd5/3WboanUq
 m7E80LegeJBwEj9tmP8WBI4Buz3S4aUQ0AKJFwfHMMMsi3iTb4wFpH8uONe7sY+EU6z0
 FoLBiU/zSmH8wA/5qGwLJ4xhZgr1jemTrPJMPDpuzox1rnEJdSjQhobSkn/ARgvT0Wmt
 hJw2C+bZJSQyUfbpIClFjUGfvBV1UsIN2DsX1HmEz7orpeJeCEq/wkr+SzkkWs7OQc4P
 /a5w==
X-Gm-Message-State: AOJu0YyjehD8c03nVlw+kESbLS5eWESX9ikNPVdnzoqINTQQwVSepn+U
 VIXxtjMTGUkKneeDAhqns0gJrkY//wuGLGwZo++znKZ1FHbagyI0JUaq7iic1yQW92oTGMA926n
 H
X-Google-Smtp-Source: AGHT+IHcuML94gmroVHuQJ6ECQRiwwfkqfKuSpOryaWIAXqMdgGVhWJgeIKO4oKsN34FnPUixKpGJA==
X-Received: by 2002:a05:600c:1d23:b0:40d:7eb5:788 with SMTP id
 l35-20020a05600c1d2300b0040d7eb50788mr291058wms.96.1706027156729; 
 Tue, 23 Jan 2024 08:25:56 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-nan-1-1117-126.w90-12.abo.wanadoo.fr. [90.12.67.126])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a05600c138600b0040d5a9d6b68sm47270550wmf.6.2024.01.23.08.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 08:25:56 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 23 Jan 2024 17:25:46 +0100
Message-Id: <20240123162548.2738451-1-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706027157; x=1706631957;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fXs+SVCQq8c2NqMhA6C73P6GVkKbhM7uxG29pmqapQw=;
 b=qsxKzZmyogjAl0G8EGN/CFRpanEKIeCcYrefG6MPZHnEFYneu3CCNmKrH7ec+8J2Ng
 Hn7oMvZlE+/ObodxXAlSO6HwXefxJ5c6BwjOSb3O0smsCoqTnssyKJaAnJBjnNSLzT4R
 CV+8O0QnF7dqR7/tdBjpePOcHwfHGHQHLq8H9cgNptgm5NCcUwBGH4FmqtnO87wf3p8I
 Y38ixeK3rmaG2ffruIdB2kQJ5RyiUoY/JGVQKC0j5uRiWuqfVbaWZ+KHZ2Yg0uLxgJW3
 zClETEDO+y2MEg5WIISoM2iSOVODCCO4y7qvHmIDSxO41Rooy0L3XL872HHfJLRXQ07u
 0CQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=qsxKzZmy
Subject: [Buildroot] [PATCH] package/bat: bump version to 0.24.0
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
Cc: Antoine Coutant <antoine.coutant@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/sharkdp/bat/blob/master/CHANGELOG.md

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
Tested on qemu_x86_64
---
 package/bat/bat.hash | 2 +-
 package/bat/bat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bat/bat.hash b/package/bat/bat.hash
index a79cb8f9a3..3fc01aff7f 100644
--- a/package/bat/bat.hash
+++ b/package/bat/bat.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  b29af37f274019cf1a36d9483c6f30ff780d3be9d0a9e6a96a43737388b7e409  bat-0.23.0.tar.gz
+sha256  59d40adf1532834613752511cb5349679bf82f7f20b98e42de50472d4aa97970  bat-0.24.0.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  dccda9eb9533f5c65624a1106536c6cfde46008d58e60b3faf154e8b9fd5b46e  LICENSE-MIT
diff --git a/package/bat/bat.mk b/package/bat/bat.mk
index 395134df17..b95cdb25ac 100644
--- a/package/bat/bat.mk
+++ b/package/bat/bat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BAT_VERSION = 0.23.0
+BAT_VERSION = 0.24.0
 BAT_SITE = $(call github,sharkdp,bat,v$(BAT_VERSION))
 BAT_LICENSE = Apache-2.0 or MIT
 BAT_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
