Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E787C7EE2E
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 17:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27F5C84274;
	Fri,  9 Jun 2023 17:50:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27F5C84274
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i6FPzhexpvEm; Fri,  9 Jun 2023 17:50:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B8D384192;
	Fri,  9 Jun 2023 17:50:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B8D384192
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E40B01BF37B
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 17:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD653417F1
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 17:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD653417F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5shSvBYwNnCf for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 17:50:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 886D340127
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 886D340127
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 17:50:02 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-30af20f5f67so1958365f8f.1
 for <buildroot@buildroot.org>; Fri, 09 Jun 2023 10:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686333000; x=1688925000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=51sKJndqVFOiwttZhVJeHE91ero+wZ5cewy90L17QYE=;
 b=R1Vuuo/K3VQXIpVHJl61HxwlN5oXWpQaxCvS/tsU5UDJeiIl6OjU/d2qjaXojrsOke
 wjNZkuhJUd0acgTKb4T4dHpBwbvWtl4zKxIvCDQ5/LydIhIxj1FzpDc13Ycokv0PHSlr
 CGICJPqvy3tnJtemzqjMs9v8G9ngDYyPBjqBVoJQf0bF/67CeBkb9HqYzDx1HYkm4N2k
 h76532jUpkFCwBlU66q0+awTOUOxXHjRxstcyXnKD8NXLsbmvy9gIpGREvAPirOQXD2r
 X3oUBqe0LMJn5c7WL7qJxDBBLNt4trjTPQjn1c6/I0NXZhKnbRYVe6cq9fFHypqEYjm+
 6XCQ==
X-Gm-Message-State: AC+VfDy7BiCCpfa8Uj7gbgZXJFUnAaGoQ04eSr+WYihz+JXIhcTojfMZ
 fJMueT1cmvDITEzIiN5wEe37XnWtpLk=
X-Google-Smtp-Source: ACHHUZ7ggd59J87Q4PdwFnb4fJaT4cYgwzN0nEEpYYo7H+ibSmM+YzVjMCs6H1GBW0dJNFf4d7rl9A==
X-Received: by 2002:a05:6000:545:b0:30a:e954:fde2 with SMTP id
 b5-20020a056000054500b0030ae954fde2mr1358976wrf.53.1686333000225; 
 Fri, 09 Jun 2023 10:50:00 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 a4-20020adffac4000000b00307c46f4f08sm5048877wrs.79.2023.06.09.10.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 10:49:59 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Jun 2023 19:49:53 +0200
Message-Id: <20230609174955.409551-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609174955.409551-1-romain.naour@gmail.com>
References: <20230609174955.409551-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686333000; x=1688925000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=51sKJndqVFOiwttZhVJeHE91ero+wZ5cewy90L17QYE=;
 b=fxtQK/fpdGM+146oCfGGMiFA/P3sMAw8o9bxQS3lwtz7na4b2CzvR7wxwZQ2TaQtS/
 JNlWZf6wXYalShirC3GMuaMkYIg98ZBUzWmaPtSGzE7tAErAGxjRf5/5XmAEL8Br5F3y
 IjKH0LGJDDVshFVOatS7oqa+aF0q2Pdc3Jiy1MSQaI8PyLHaeu2UQJY1/RccFy15qest
 dqmgduuC1zB+cQH9DhuTDfVJ36T1kFZZgA4oijPxjXj6T0p3dlXBi/+7lBfCt7bC28rA
 tbbzu4OKnxZ52rLoDdqo0umXB7PEJ6Fayji9Ynr00VpjtHdLzcrJWfgIh5g4RP1id4DD
 YmVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fxtQK/fp
Subject: [Buildroot] [PATCH 2/4] package/python-mako: add optionnal runtime
 dependency on python-pygments
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/python-mako/Config.in | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/python-mako/Config.in b/package/python-mako/Config.in
index e6a10c9c2e..2e1094189f 100644
--- a/package/python-mako/Config.in
+++ b/package/python-mako/Config.in
@@ -7,3 +7,14 @@ config BR2_PACKAGE_PYTHON_MAKO
 	  for maximum performance.
 
 	  https://pypi.python.org/pypi/Mako
+
+if BR2_PACKAGE_PYTHON_MAKO
+
+config BR2_PACKAGE_PYTHON_MAKO_EXT_PYGMENTPLUGIN
+	bool "mako extension pygmentplugin"
+	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
+	help
+	  Provide python-pygments support for
+	  mako.ext.pygmentplugin
+
+endif
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
