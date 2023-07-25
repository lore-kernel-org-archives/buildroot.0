Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8A0C0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 14:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7BA981746;
	Tue, 25 Jul 2023 14:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7BA981746
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c9vW1NdvEkpW; Tue, 25 Jul 2023 14:08:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30F7A813F4;
	Tue, 25 Jul 2023 14:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30F7A813F4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9AA3E1BF588
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 14:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 749B940B91
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 14:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 749B940B91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pWkc0C_XoBkv for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 14:08:05 +0000 (UTC)
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80B564016F
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 14:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80B564016F
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-348dfefd1a4so3538745ab.1
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 07:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690294084; x=1690898884;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PCH0vjQd6jfz4uVDHlsSXerO4WrklPULkLOFiuxTq34=;
 b=ftHvKQHNbuympWRB79mcSQeyzDmqZYPPPY8ZlO0gZm5rtqPbR+PsTcpcZQ55DnIywp
 cd0Ux+CbEqzYWxjHP2Un085+AghFYkdRFMrVSpjSu1DXHf8viys8TM+9H/cideES3oEp
 gCC+Ps9+uBKu+Mg92cV1WbcKFJWFaaKN4hDDSBI1ze6I4O0z2Qr7WeYJ6+cd9zMzfZsD
 mvOCq1ImCMIqkAgELlwZcuxytq5VWj0vDX9dQUHuzjXkg+jXUPFXbfBDrX7JplLsIif/
 GPiXzkU5Wo/RhFWqRLzfbKt015I8bpPjmKEaoqVVJ7jDXieUDHcsP6naQYo6rmhuI6dZ
 ziwg==
X-Gm-Message-State: ABy/qLarQcw9wk22kHiOv26DvS1TSQKumj4hrrm7Om7vCmHoHFSogZST
 2la0RPZtk9UZIvSJcU50RApv3WHZseY=
X-Google-Smtp-Source: APBJJlFtmQ29ouFkWrLQMv5/gDZyFTv3PV1FVNawQ3LY+B/QhajcUBKUjvakiByqlaudYPoT45GIHQ==
X-Received: by 2002:a05:6e02:1a87:b0:346:5bd7:4a17 with SMTP id
 k7-20020a056e021a8700b003465bd74a17mr3608668ilv.17.1690294083973; 
 Tue, 25 Jul 2023 07:08:03 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-134.hlrn.qwest.net.
 [71.33.156.134]) by smtp.gmail.com with ESMTPSA id
 u12-20020a056e02080c00b0033e62b47a49sm3741790ilm.41.2023.07.25.07.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 07:08:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 08:08:01 -0600
Message-Id: <20230725140801.310910-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690294084; x=1690898884;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PCH0vjQd6jfz4uVDHlsSXerO4WrklPULkLOFiuxTq34=;
 b=SLaugpXERTpJNJ+mGTRegIKamoJfYAqwCZIAEh1doCwrbkYMxgGR3/f7HP8I9ugRrM
 J07XbrnUJkQoIeFMzZuqJVp+NEAqLoltWhh9f/hd0xSaeq7mSjdF9wHwRBTqw/9M9Mrr
 LRy7H84lX1O/EO4zrXkd392CHiMSt+zQC2giEbKOaLMyASP5cSXmbJg6ZYg95Yy+v2uO
 MgHHcGATNeTzIg4WFWnvwiW0if1DwEEY256/IqN6gq4c6JmmbOQHQIQZh4UhGLo9VxdI
 anwj6HoPP509001RvAvl1RUXa6PPQNBHsGyOzjfrmAyGWJupkdVds+EJgxbHBYbkKVfn
 3hPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=SLaugpXE
Subject: [Buildroot] [PATCH 1/1] package/python-pyyaml: bump to version 6.0.1
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyyaml/python-pyyaml.hash | 4 ++--
 package/python-pyyaml/python-pyyaml.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyyaml/python-pyyaml.hash b/package/python-pyyaml/python-pyyaml.hash
index f8b5332565..e1f9412c30 100644
--- a/package/python-pyyaml/python-pyyaml.hash
+++ b/package/python-pyyaml/python-pyyaml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/PyYAML/json
-md5  1d19c798f25e58e3e582f0f8c977dbb8  PyYAML-6.0.tar.gz
-sha256  68fb519c14306fec9720a2a5b45bc9f0c8d1b9c72adf45c37baedfcd949c35a2  PyYAML-6.0.tar.gz
+md5  c9246277af2d9a13b7018af267a0831a  PyYAML-6.0.1.tar.gz
+sha256  bfdf460b1736c775f2ba9f6a92bca30bc2095067b8a9d77876d1fad6cc3b4a43  PyYAML-6.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  8d3928f9dc4490fd635707cb88eb26bd764102a7282954307d3e5167a577e8a4  LICENSE
diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
index 067af8ea7d..846c57df4f 100644
--- a/package/python-pyyaml/python-pyyaml.mk
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYYAML_VERSION = 6.0
+PYTHON_PYYAML_VERSION = 6.0.1
 PYTHON_PYYAML_SOURCE = PyYAML-$(PYTHON_PYYAML_VERSION).tar.gz
-PYTHON_PYYAML_SITE = https://files.pythonhosted.org/packages/36/2b/61d51a2c4f25ef062ae3f74576b01638bebad5e045f747ff12643df63844
+PYTHON_PYYAML_SITE = https://files.pythonhosted.org/packages/cd/e5/af35f7ea75cf72f2cd079c95ee16797de7cd71f29ea7c68ae5ce7be1eda0
 PYTHON_PYYAML_SETUP_TYPE = setuptools
 PYTHON_PYYAML_LICENSE = MIT
 PYTHON_PYYAML_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
