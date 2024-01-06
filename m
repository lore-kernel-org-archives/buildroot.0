Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B79C46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 21:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3285D81E40;
	Sat,  6 Jan 2024 21:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3285D81E40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OWWaAuUHJkT5; Sat,  6 Jan 2024 21:44:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FC1181DE7;
	Sat,  6 Jan 2024 21:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FC1181DE7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 37EF21BF295
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 21:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E2B360BD0
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 21:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E2B360BD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qaDZD7plwLho for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 21:44:16 +0000 (UTC)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33CB960B3B
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 21:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33CB960B3B
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3606e211e5cso5000155ab.3
 for <buildroot@buildroot.org>; Sat, 06 Jan 2024 13:44:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704577454; x=1705182254;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ilJJoghLms5YY8wwddnYoyCGJ3iRn/9Desf+RaNSp04=;
 b=U4aPBaJQMYFRQ3WyRDqHWj0U0mPIJPilETLGxflZ9b8b84WbZXuPyoDC8OphPEMGWc
 jaAZmqweaNIQoq9nL+7M14Lq8Qp83xM1Wn8yO6CL7rBWEyAQthyW2wxoh6iUmbJgVb1L
 a+pYRppfG3uSWTBuIi0Vk9KelYH6vP/Aqgyh2KXjICjczYjUAZ+az+jhva7VW4zvV/zZ
 j77RZYELaJ7A9YOU3yTu2DVU2tc8xz/GYRQDcYNQd0o8eDLhrzyw6YGr1ZHjH1WhoRnf
 n40zBZzSD9xaD74oVvgghPPydziLKNIYgudzAUAQgDoeBtzskqsAz3HwSVFj2AaEzUKE
 kkow==
X-Gm-Message-State: AOJu0YzIOWtlSUgMV9+FakWE+uSUKlUPvCb/YAoHozFDPY8HQvGdkC/g
 xqnGFPo6q1K4XOB4s0MkAwtxl8z5fqNppg==
X-Google-Smtp-Source: AGHT+IEEHi8FPnelOA0IXLw892ZRdvtKbYY+QPgCgNOHmLx9QhVLAkglVf8XwomsRdgh3Xrki5o4bQ==
X-Received: by 2002:a05:6e02:3886:b0:35f:ef06:3cee with SMTP id
 cn6-20020a056e02388600b0035fef063ceemr1511426ilb.33.1704577454404; 
 Sat, 06 Jan 2024 13:44:14 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 6-20020a056e020ca600b00360039199cesm1496587ilg.3.2024.01.06.13.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 13:44:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jan 2024 14:44:07 -0700
Message-Id: <20240106214410.3294887-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704577454; x=1705182254; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ilJJoghLms5YY8wwddnYoyCGJ3iRn/9Desf+RaNSp04=;
 b=eZJuwAxgtIMiasx96eeCMwYXmlABq5OTHNNgBQOg5c4GEd5l7heqsqEU4X4TI3jgJZ
 IVISiG5gUKVlYq3n2fprE31qm2i/1ZgDv5Q5Cwsg9SKuAhDCQYjEKJrfeX0UrSkMgjXx
 GuSF1/Vp7po8e4Rlm8uEEsc1aZlRGRn5wZJiaIz/+9xPSVn3wDeEUG1KFVDio5+At3bI
 TMm7qUlRSMSdk0lYvUfbz8y4buAKO/0m5KCL/ghzNyUdQ8jMz6w1EVJTFqvOuw4Qm98h
 HIUK4MdKlpqyZDVnEKY1C3Pl0cxowlNQUnjoic/5Mf8fO644chU7eXddkRkXCV/THk4s
 XA2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eZJuwAxg
Subject: [Buildroot] [PATCH v2 1/4] package/python-poetry-core: new host
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-poetry-core/python-poetry-core.hash |  5 +++++
 package/python-poetry-core/python-poetry-core.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-poetry-core/python-poetry-core.hash
 create mode 100644 package/python-poetry-core/python-poetry-core.mk

diff --git a/package/python-poetry-core/python-poetry-core.hash b/package/python-poetry-core/python-poetry-core.hash
new file mode 100644
index 0000000000..3c07fef04f
--- /dev/null
+++ b/package/python-poetry-core/python-poetry-core.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/poetry-core/json
+md5  9ed2f2e9244165b34d7233c306a34a2a  poetry_core-1.8.1.tar.gz
+sha256  67a76c671da2a70e55047cddda83566035b701f7e463b32a2abfeac6e2a16376  poetry_core-1.8.1.tar.gz
+# Locally computed sha256 checksums
+sha256  f1978133782b90f4733bc308ddb19267c3fe04797c88d9ed3bc219032495a982  LICENSE
diff --git a/package/python-poetry-core/python-poetry-core.mk b/package/python-poetry-core/python-poetry-core.mk
new file mode 100644
index 0000000000..e1acf3179c
--- /dev/null
+++ b/package/python-poetry-core/python-poetry-core.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-poetry-core
+#
+################################################################################
+
+PYTHON_POETRY_CORE_VERSION = 1.8.1
+PYTHON_POETRY_CORE_SOURCE = poetry_core-$(PYTHON_POETRY_CORE_VERSION).tar.gz
+PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/36/66/6af2891495d12020419c8447d0b29c1e96f3be16631faaed6bda5b886d5d
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
