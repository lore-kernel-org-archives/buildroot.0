Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8EEE6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 19:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B693440151;
	Fri,  6 Sep 2024 19:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lW3lQJIuT54P; Fri,  6 Sep 2024 19:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7393A40229
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7393A40229;
	Fri,  6 Sep 2024 19:07:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 448A71BF46A
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30EC76062F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9u2lH7aboZsG for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:07:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 34A6C60604
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34A6C60604
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34A6C60604
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:07:07 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-829f7911eecso103220439f.1
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 12:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725649625; x=1726254425;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H3J8OGpuJWO0Y6FtrXAZYF9FGUkXvH2fM88zUvKEPl4=;
 b=SMZI6X3MVtSMQr5TfUk4O5XMwjFLELbZ/nWEtXMRe6Qe0Qn0fKvcim9lKjun8waAnH
 Br+5HFPWfpKjU6mCI81P0dISqPW4Iz0FMPyyMD48t3VIO0AKq2pXclUKSr3VZ7ZmUyE1
 hDiKz7ZfGQ3rIYiT/KvLAu8bY9WQMVuDTzYel97ugI09yAcm25cH9lZKc0tnRfSby8gW
 Zf2ECmkEXLiNdLOPNJozfAn0Rpc2KZZ+fVou8tGn5v8zhrqHYRhzLS7g5pvgV3gRppqE
 xmAgaZ0harS4GLXZo0OclUAd5m4E65LVylDTDMUPrriUrjjfvGLJLp1vFM5upUzo5g/Z
 AOkg==
X-Gm-Message-State: AOJu0Yy7a+k3hUp2r4hrkHmxjqOh2ut8IrRjDxLul5HN4b8YOv/9trRS
 ctmA6uiswvhq3DoFhfjheVYBIKSycsuiojVZsh0nry45/PQNPUlKwy9aIQ==
X-Google-Smtp-Source: AGHT+IGVBUMf1xgHCJ1IYYXFvF4CiBi9II3VsbS72dkk7F5S3twkbRXadrPHnewGcSh9p+E6APCMgQ==
X-Received: by 2002:a05:6602:150b:b0:82a:9348:6486 with SMTP id
 ca18e2360f4ac-82a9a276fd0mr357578639f.10.1725649625469; 
 Fri, 06 Sep 2024 12:07:05 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82a1a5d0f80sm482414139f.54.2024.09.06.12.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 12:07:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 13:07:02 -0600
Message-Id: <20240906190702.1601185-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725649625; x=1726254425; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H3J8OGpuJWO0Y6FtrXAZYF9FGUkXvH2fM88zUvKEPl4=;
 b=IZOWXs9D97Sy56MTSDqvbbQsgP2ycSLYS1r/cFA+gtuCrasbhaavnJxn29xRx86GOu
 FJePi9Cqa+76xeS4ftLyfvtOjSJrB9Wrch4kjcMY4y4IM1LfjSw0C2OWQSLDwRQ3iumj
 dgmFWhXR9jN/0RQTeznOj4fsptMj3hyHbYHWVOec08ZJmtpIQH+AGmT2ZV0pJGw1Xvl4
 AO6WM34O+OED9grcCRtCe0GVIfPOlUq+aJkuDJK1g1GyNi/ShgrUoqIQnob1MsNZSr6r
 TLHRg/ht8DqAJCyAvgAr/3mznmKuqgx59vGeplV6H4dpGJe/EOOk6G5a4Dfbtl5xagh5
 b2/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IZOWXs9D
Subject: [Buildroot] [PATCH 1/1] package/python-tortoise-orm: bump to
 version 0.21.6
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tortoise-orm/python-tortoise-orm.hash | 4 ++--
 package/python-tortoise-orm/python-tortoise-orm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tortoise-orm/python-tortoise-orm.hash b/package/python-tortoise-orm/python-tortoise-orm.hash
index 4796c8277f..5a57e3af11 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.hash
+++ b/package/python-tortoise-orm/python-tortoise-orm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tortoise-orm/json
-md5  aa5efa50e69d0a67b75c187f7550acd7  tortoise_orm-0.20.0.tar.gz
-sha256  283af584d685dcc58d6cc1da35b9115bb1e41c89075eae2a19c493b39b9b41f7  tortoise_orm-0.20.0.tar.gz
+md5  6035547e880b23990fa1b0c7f030810b  tortoise_orm-0.21.6.tar.gz
+sha256  0fbc718001647bf282c01eaaa360f94f1432c9281701244180703d48d58a88ec  tortoise_orm-0.21.6.tar.gz
 # Locally computed sha256 checksums
 sha256  f955d347b975d5867ee364f978476b3012878a706d468571b9758cac74de6041  LICENSE.txt
diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
index cc1c2126b7..eb8ba8e053 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.mk
+++ b/package/python-tortoise-orm/python-tortoise-orm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORTOISE_ORM_VERSION = 0.20.0
+PYTHON_TORTOISE_ORM_VERSION = 0.21.6
 PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
-PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/3b/84/8ca142fe370d59c4e3135825b2822d199c4f885ae855657c1a7361e68511
+PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/00/fc/8d70e3dbaa091986a0933a7941b73646c37792709443e701cb76d8a6e680
 PYTHON_TORTOISE_ORM_SETUP_TYPE = pep517
 PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
 PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
