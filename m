Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5093DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 19:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFF8060B95;
	Sat,  1 Jan 2022 19:30:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wyC-FWnceBnQ; Sat,  1 Jan 2022 19:30:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72E7560A78;
	Sat,  1 Jan 2022 19:30:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4FBE81BF389
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 19:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AE4E40247
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 19:30:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MUKrGKAeDYei for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 19:30:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C28E40243
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 19:30:25 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id f17so23119456ilj.11
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 11:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WhljE0vUmEYWsfcgtP32QZlvPmwFmySuwTJvtqNKOPY=;
 b=j0JpFmidgBNbsyhRDqaLU/UjKFqEL8b5QFJ0w8rwxrW+GjQjUlu987G2O6YyAaiu49
 WDUs5BBl+uVk8rQCzn6jLfqTVpihBWgZPJlQp9STnZv9d6M2e2ieSW0ZMlHA+8CwTPGE
 XRfwDbVU8szR6dLpcdkrIlF+1YLXlOL5LgReXixwWReGkMa8PEnIdgsnhc2U4itGXvbD
 ITVSZF3d5m/UXv4wSQUGpiS+y7gVt+dz+RTPhcYA+YPROdKtxNPdN55XuoYQztngySba
 CA1qRGwGwju4GVN48L74kqxC8J3IVWzmPtj8oNHTObsQtnKFcRkmRA4Uh6c6+2WnDAOx
 OD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WhljE0vUmEYWsfcgtP32QZlvPmwFmySuwTJvtqNKOPY=;
 b=RIDOArpslDgPRAYe8mGalm5B+PTxA0m75fE0nvBsmFGr3byYAJQm9yjteD4MRQfpCN
 SxQkrTaaUPIh4/8YNbhD/RK0nraz/fX3kljfz8MDkfnodJaz3z0NseiTn76o72YFdHrb
 ccyXsTJ9z+hG6k1kHbEeldd6GfqGf/nNeYIDp9AzHHdt4Rsn+cUUusXPc9ScDtEdaEcf
 XgYIfYu5FJpFwKfKGBQXXJPrFEnKj9kjBnS48/LMsFgUEJ+pFZQKJwkzjeLMx89dt7I8
 md7ag+uY3ssE/bnfdo2Ni8+Uvf2BXXeQ0R1cxs96123NzwdpegA6CDxTtOkmEwxX1e/P
 0g9Q==
X-Gm-Message-State: AOAM532gabCejoAIRtlbiJzSPlfxNR+Apb3jG1+6fa1+edH6oLzvI+ct
 UOCyBBE2r8bx8rp2Qno0Qvf9MwwLgpU=
X-Google-Smtp-Source: ABdhPJx1tFOLYXgaQ/9MEGbQBdzNheVTentCN6Y/ljAP0KP0ebr4noisjsas93VPV+XREOkzmzC7aA==
X-Received: by 2002:a92:ca91:: with SMTP id t17mr17894582ilo.33.1641065424339; 
 Sat, 01 Jan 2022 11:30:24 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id n5sm18046974ilm.87.2022.01.01.11.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 11:30:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 12:30:15 -0700
Message-Id: <20220101193018.404937-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220101193018.404937-1-james.hilliard1@gmail.com>
References: <20220101193018.404937-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/5] package/python-pyparsing: enable host build
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This will be required by host-python-packaging.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyparsing/python-pyparsing.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 0dacf2371d..5741458d65 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -10,5 +10,7 @@ PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/c1/47/dfc9c342c9
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE = setuptools
+HOST_PYTHON_PYPARSING_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
