Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3925C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 20:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C11F605DB;
	Thu, 28 Apr 2022 20:16:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gGIlQxEd9LCg; Thu, 28 Apr 2022 20:16:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADAA861189;
	Thu, 28 Apr 2022 20:16:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 344F51BF36D
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 20:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22C0641BD6
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 20:16:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uYZdkV1BCFbi for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 20:16:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7E7041BD5
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 20:16:22 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id y11so2713471ilp.4
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 13:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U+p9COgGZnYEOg7op2h2Ojnh7Za94NAqq1KaUni6oes=;
 b=Vj6keSizpykKpxCO6sQjQt/7qub7bWWQQAOilzSdD1o4HcPPUKdFX9fa8zk05hWCqV
 w+CmxAUO93yGg6IYt6lgl5+YDL3/P+lKxxFKxzuSXU5izUhTdaxlcyMRMjMU8IMl+x7N
 rFVa8uIgyRU1IXCXKPOefJq3lHZUPgto/eISTIs6Fj3y3PdKTUQVQtnYHi33Hbe5DVUC
 hdbQhCDCKlQ7S/18MZ9ddrVJjOr21K6vrSS2qRo91wO6869OYl+J76H2lYzsJaNB+HK6
 oqegboEYPpcP9i93/oVlL3Loy4xoQM0LGLIWj7aUwYaOExQehaIiIy05cDFJVMmol9Ll
 olbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U+p9COgGZnYEOg7op2h2Ojnh7Za94NAqq1KaUni6oes=;
 b=7Gp9pAD2udY46+9cZnbQnzcozfBONjHWJjd7frE/WxdPBjCLH18AsZxs/KNJffuVld
 87uOo+dInz+C2ZvbravI5rFHQzWM4/tKK1J238TYOSI0/uETXGttlTx455dzICLmp9nh
 1N7bMWAtZCZUzgzPWZ9EDx6k2jxFsR9AHdwTAWVEDSAQ4g2ZguBHNHiqp6WcbV1EEhIz
 ocsQ1v4H1u2srAujzheKWLZOXqgJ6ADwMdbGJV2/sGmRUxZDpED+e2aHZuvmSUiXysa+
 zThl7jx/6hjd0+4wE7jeOKjEpOZ8X1jqIl7URF/9jMhq6O5/E6+3jGVU/HNPEf/pgCL8
 beqA==
X-Gm-Message-State: AOAM532BXPAbctuXpvXrQMT6NdqX2f8Zx4rpIW+WrGuiu6jliTszf6Lh
 LHDyB8UaDP/3R2Jr0S/xIjHEYbew6e8=
X-Google-Smtp-Source: ABdhPJwKchqofh2C8y035FCgkTwBHP3wHdP07iXQeqEoMu4aPX/MkZfpylCCPYM7LrmC3UYIdsvfIA==
X-Received: by 2002:a05:6e02:1a4c:b0:2cd:8b45:a4cb with SMTP id
 u12-20020a056e021a4c00b002cd8b45a4cbmr10019449ilv.186.1651176981401; 
 Thu, 28 Apr 2022 13:16:21 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 i3-20020a056602134300b0064620a85b6dsm638176iov.12.2022.04.28.13.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 13:16:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 14:16:19 -0600
Message-Id: <20220428201619.792756-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-autobahn: bump to version
 22.3.2
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 7b963df635..cc68f822a3 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  9b0ae4ff164232c952ba01ab3516188e  autobahn-22.1.1.tar.gz
-sha256  17e1b58b6ae1a63ca7d926b1d71bb9e4fd6b9ac9a1a2277d8ee40e0b61f54746  autobahn-22.1.1.tar.gz
+md5  b0b5e10bfea95f32900708be705efcf0  autobahn-22.3.2.tar.gz
+sha256  58a887c7a196bb08d8b6624cb3695f493a9e5c9f00fd350d8d6f829b47ff9036  autobahn-22.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index df43e9cdf2..37256ec8f6 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 22.1.1
+PYTHON_AUTOBAHN_VERSION = 22.3.2
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/0e/2a/0b627ad4adf70437b5753462958b3ba5c6802d7664eb4a680e46423659ba
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/e9/a7/4dea20063b78eb50a54182494ae634cffc0ed6208bf775771f374a9fb8bc
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
