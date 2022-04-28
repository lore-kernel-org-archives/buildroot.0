Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6365FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 19:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 029474048C;
	Thu, 28 Apr 2022 19:45:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YDqdBLX0h6fa; Thu, 28 Apr 2022 19:45:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10F7D4017E;
	Thu, 28 Apr 2022 19:45:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC19A1BF3AD
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 19:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99F9E4017E
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 19:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uqXmrhmFPVT9 for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 19:45:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B03AF400E3
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 19:45:48 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id t4so2667644ilo.12
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 12:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wWvjVErNZv7DMzAnOTPH+d4e+ncVXrRpFLt8vLRom6s=;
 b=RH57DD6vJNuN8YZYG3R9mmKkFCD3t2rzuWwOpbzcF1CriGITubssldrEon9AR2ISUH
 CvtDa08XqfJ6SNAEQ543aeucwpIX+60hvx8QhhkI0mP0SR7K14AMpSwpiZzRI7GjJ8lk
 g0fkborjtWn91xDnxU2oj0TslT1SLER2Ly+/l2Yic1bMIT71E0J4Qg5TVl7aLsmh/ouY
 S4Z4Y9m5vDwITd+YEi2RkO2HOVMm17LCIkGX033K888e2YrYc/W66uR2xpcoQvkT+ehp
 FtbxCaYSRZuHDGyK+vx/SgYRkx+9Qa60Mp3UDXuXI+GR+xnW/QU+QsgcciQZvMB019l3
 u1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wWvjVErNZv7DMzAnOTPH+d4e+ncVXrRpFLt8vLRom6s=;
 b=ZCiTFnNvGtS09tlKd6RjCsNCfWR4w2gFMRtLsWydgAjDxPkv3tXte6WOxe2mT7EtsK
 k1SR+8yq1Evltg0GmvkaoqIY1emWnPCxYVjB8KlmaC2ekwceDZOZpRw64rUe619JRwGr
 2b3368XWFQmS0Pu/mRZg0rWqJ7g3giByKsM176g8RI6Pcy7a7hG181MAz7YGW3hH+6to
 HN99hN+AHpsCBK1ffWoesbIwz/w+jxzFneDZ3Op6pA7dU6/KOgvcRyNQ5IN2gSvzotYd
 HUTavHKMSMYfLRKWjLd4yujqJnUSJgOfWh+26GRETtppsABj8R0xUH/neWTfg/Iso+Kl
 n8aQ==
X-Gm-Message-State: AOAM5304t0mNNRM7K+yUKBzO20UtA0TfnlgVthLVx45AGCZesUQmeLp1
 9d2NEMEJecFLAn0s9sdBV+ZX4XQB9DA=
X-Google-Smtp-Source: ABdhPJxjZ2gBUrk7LwweAFNIxJG0aD983AVbZm3t5ljhZZnorZARiwRwayUQMq/X+m77iv+UBqxwxg==
X-Received: by 2002:a05:6e02:80b:b0:2cd:b428:e665 with SMTP id
 u11-20020a056e02080b00b002cdb428e665mr6696176ilm.197.1651175147519; 
 Thu, 28 Apr 2022 12:45:47 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 y4-20020a92d0c4000000b002cd8a7db5f5sm451282ila.11.2022.04.28.12.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 12:45:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 13:45:45 -0600
Message-Id: <20220428194545.776652-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-simplejson: bump to version
 3.17.6
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-simplejson/python-simplejson.hash | 4 ++--
 package/python-simplejson/python-simplejson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-simplejson/python-simplejson.hash b/package/python-simplejson/python-simplejson.hash
index bb44bdfc79..0f56d4c6cc 100644
--- a/package/python-simplejson/python-simplejson.hash
+++ b/package/python-simplejson/python-simplejson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/simplejson/json
-md5  1756427859454004e90e028d263cf23e  simplejson-3.17.5.tar.gz
-sha256  91cfb43fb91ff6d1e4258be04eee84b51a4ef40a28d899679b9ea2556322fb50  simplejson-3.17.5.tar.gz
+md5  0b8f47c9451bf101a791f8b5bccf1f33  simplejson-3.17.6.tar.gz
+sha256  cf98038d2abf63a1ada5730e91e84c642ba6c225b0198c3684151b1f80c5f8a6  simplejson-3.17.6.tar.gz
 # Locally computed sha256 checksums
 sha256  fcaa1e313a99304322e2e0836ea4ee7d839ce9a480438f3922a853edfdde129f  LICENSE.txt
diff --git a/package/python-simplejson/python-simplejson.mk b/package/python-simplejson/python-simplejson.mk
index 5bed8d20a9..52bff7569c 100644
--- a/package/python-simplejson/python-simplejson.mk
+++ b/package/python-simplejson/python-simplejson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLEJSON_VERSION = 3.17.5
+PYTHON_SIMPLEJSON_VERSION = 3.17.6
 PYTHON_SIMPLEJSON_SOURCE = simplejson-$(PYTHON_SIMPLEJSON_VERSION).tar.gz
-PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/01/52/41c71718f941c9a5abebfaa24e3c14e3c0229327b7ebd21348989845ed8f
+PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/7a/47/c7cc3d4ed15f09917838a2fb4e1759eafb6d2f37ebf7043af984d8b36cf7
 PYTHON_SIMPLEJSON_LICENSE = Academic Free License (AFL), MIT
 PYTHON_SIMPLEJSON_LICENSE_FILES = LICENSE.txt
 PYTHON_SIMPLEJSON_CPE_ID_VENDOR = simplejson_project
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
