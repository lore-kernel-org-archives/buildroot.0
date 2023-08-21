Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0916EE49A6
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 23:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3317440B53;
	Mon, 21 Aug 2023 23:03:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3317440B53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BCtowObPCK-o; Mon, 21 Aug 2023 23:03:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F9724063C;
	Mon, 21 Aug 2023 23:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F9724063C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B67D91BF35B
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 23:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DD33409FB
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 23:02:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DD33409FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xCJViewNZ7oX for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 23:02:57 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F1FF409F4
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 23:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F1FF409F4
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7922c7967d4so61246939f.0
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 16:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692658976; x=1693263776;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u4SMY3qP9ScLd/bQ35z79Uggu1NKXadaIXh+ia45aCM=;
 b=AiHZMd/f45G9LXRxw6yZ+ph0oxa6GLFUmC0DAVhBjGVOd1MAtoAtba/J/8dRgIKSn8
 8l3h6RpqrtV5ADJLFtoRxK3KigBmIBgztOmRDS+qiEsFngRY1Jsl7hw0UUwDQvCLayYu
 IZwpoGXIOPWkd5zRJAbDkQdIMyoHSA/Mxyl6bxdhHO0ND+f0bvETv/Waot/nl1whUSOh
 bRuOIh3DkKwyHJ57B/niuGIxPtcgvRywKVoSXyAQtkAEzneuRxBLedfSDsAUHzdC+Hff
 c9TQkvjfufrsp1P5xv6wbA6zuviX5GCO2tJ03yS6pds9InEp8JAi8ljP5+tLZCFnmMvB
 5EWw==
X-Gm-Message-State: AOJu0YyD6GnnDzT+HMJw48dg3yL4GzuJU3nbfsmviGvYAmVdXTVzyrcW
 My+v+9YbfSddh8cP6H0Okzg1ZW5Xwd8=
X-Google-Smtp-Source: AGHT+IG8Z/icpATbFKIqrP4VglvNYVXUn2FIY2sZLPTKSIMSBZ8b1JAHYbArpGbN8qNSrJrzim+MBQ==
X-Received: by 2002:a6b:e217:0:b0:791:1b1c:b758 with SMTP id
 z23-20020a6be217000000b007911b1cb758mr10231567ioc.19.1692658975835; 
 Mon, 21 Aug 2023 16:02:55 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-15.hlrn.qwest.net.
 [97.118.146.15]) by smtp.gmail.com with ESMTPSA id
 y6-20020a02c006000000b00430979b6aa5sm2634509jai.0.2023.08.21.16.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 16:02:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 21 Aug 2023 17:02:40 -0600
Message-Id: <20230821230241.553689-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692658976; x=1693263776;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u4SMY3qP9ScLd/bQ35z79Uggu1NKXadaIXh+ia45aCM=;
 b=W2RDSkxdUklKYac51GvP72PluG570hlXetwaMoFnYhbnNTxLK/POYqYTJZnB3rCaTa
 ADdyMZ9GTf1L8pqQISycwUgZ2nwCLhxuK1uRRsQQLZZAIU9/s9GgPqwthcqzHRRcw/SA
 p4lDtCvBWLm+YUhJQZdfOffDnHwLS1GX4PIRRCvCgPVa1r9D4mm/BxTIl9lSRK2gw3yu
 1YVXwrGS4n5jfj2XhzYhv5/nAzFvTpW/dFfKkQbXYi0l/rWGvpf3IVsqVVBb+IAcw0Wc
 +UeO6lkxpGAOKFDp13h7QVNliY0bYfBVJbjbWbdsVzhBj6bvve85QkEA2Q5D32XzooPD
 pqAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=W2RDSkxd
Subject: [Buildroot] [PATCH v2 1/2] package/python-poetry-core: new host
 package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - update to 1.7.0
  - drop patch which is now upstream
---
 package/python-poetry-core/python-poetry-core.hash |  5 +++++
 package/python-poetry-core/python-poetry-core.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-poetry-core/python-poetry-core.hash
 create mode 100644 package/python-poetry-core/python-poetry-core.mk

diff --git a/package/python-poetry-core/python-poetry-core.hash b/package/python-poetry-core/python-poetry-core.hash
new file mode 100644
index 0000000000..c6b180c852
--- /dev/null
+++ b/package/python-poetry-core/python-poetry-core.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/poetry-core/json
+md5  7461547cac0e0e9c8cd7463aa87e7470  poetry_core-1.7.0.tar.gz
+sha256  8f679b83bd9c820082637beca1204124d5d2a786e4818da47ec8acefd0353b74  poetry_core-1.7.0.tar.gz
+# Locally computed sha256 checksums
+sha256  f1978133782b90f4733bc308ddb19267c3fe04797c88d9ed3bc219032495a982  LICENSE
diff --git a/package/python-poetry-core/python-poetry-core.mk b/package/python-poetry-core/python-poetry-core.mk
new file mode 100644
index 0000000000..4ca587b11d
--- /dev/null
+++ b/package/python-poetry-core/python-poetry-core.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-poetry-core
+#
+################################################################################
+
+PYTHON_POETRY_CORE_VERSION = 1.7.0
+PYTHON_POETRY_CORE_SOURCE = poetry_core-$(PYTHON_POETRY_CORE_VERSION).tar.gz
+PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/cb/1c/af7f886e723b2dfbaea9b8a739153f227b386dd856cf956f9fd0ed0a502b
+PYTHON_POETRY_CORE_SETUP_TYPE = pep517
+PYTHON_POETRY_CORE_LICENSE = MIT
+PYTHON_POETRY_CORE_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
