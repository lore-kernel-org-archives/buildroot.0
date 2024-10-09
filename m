Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226C5CEE33C
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 18:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2ED4812ED;
	Wed,  9 Oct 2024 18:09:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SIvu5CVS8q2M; Wed,  9 Oct 2024 18:09:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98580812EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98580812EF;
	Wed,  9 Oct 2024 18:09:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8860A1BF403
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 18:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 849CF606AF
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 18:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SvBI5UkoIfi8 for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 18:09:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 919D46064B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 919D46064B
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 919D46064B
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 18:09:05 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-82ce603d8daso2998639f.0
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 11:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728497344; x=1729102144;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3s4A3bwg8zbBcvKloZ49W18nANyhSMnW0vPA4o37k28=;
 b=hRvq6JxjC3ROiWg65c5ox4IsEJIHmHZwryCL6UaYmTIg0czc3XPP/X37UQFE/34Pv8
 Nl7jBjKuWvkzMHx7A2tgOsis38X0RyuD6RLvjLDlEj/Z73qUguxOCqj6+OwCavOGsehm
 RAnwSFm/rGwfCgEA3VSmyLidHuR2GH4hy5dcr9ER5Kf9xUAR3RzmQj8Bf93dLj4K3R5M
 J8AntcJTtXwQQ/xqhMrZj/OnbwOlqeO/C9lJ0JbqbqfXZbhXlgwpAr4bcQN7Ngt2KjJY
 YZxFgYFMXmc6Rez2VrutOflkTmsvxV4YZ19cx8AQx5izFo6plsmkUwz8mKhc7uStbdYO
 BSEw==
X-Gm-Message-State: AOJu0YwsCb3c6eYUvbKiLTTeIUmYGCu9f9Se49h7nBs6PyFeJksyJ2+1
 qyz/Td2QPDYx2dXx4gdvhWm3YnVg80QszUN5P5HrgkzTNZQXrfQWhd5dAiRo
X-Google-Smtp-Source: AGHT+IH0I4LG0a9LERHKh9hFUKtZ2dOgxeLvdN+jhbauR7rd1UqStm+dhQ1f/GwV8L/OBRpbTU6YGA==
X-Received: by 2002:a05:6602:3c7:b0:82a:4480:badc with SMTP id
 ca18e2360f4ac-8353d5255b9mr433721039f.10.1728497343749; 
 Wed, 09 Oct 2024 11:09:03 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-835486be06bsm4677339f.37.2024.10.09.11.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 11:09:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 12:09:01 -0600
Message-Id: <20241009180901.3872894-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728497344; x=1729102144; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3s4A3bwg8zbBcvKloZ49W18nANyhSMnW0vPA4o37k28=;
 b=g+9GGaWo3TYIzbjta0xceR8N0rdj5KLKz4WFBL2AuGKDQN0SWoX5vGPiP3dWTRWBRj
 +4tcs28TtVyLea+6iRGzI+M10sWFmlpSENsj7CNbcxb7a053tWJXmZhOBd3wffzcWv3Z
 iJqV26ZTzqdwI6olaUOw8ZlSgcnvGU8wVxTMpFFr9ml/4hw9vbFEIZm1LN5Fr8TuIqe2
 qRKTcom8bVsNjf2oWkCXxjsP4VUADxflfrJMGm5Xk9/DUw7k0eOopDPVMOVxZyNoLhNS
 5aEHHJ3rLJ6h+7k9RdcYEgJ1GI/GGJMZikDvMX6Pmc2WBxTEAQl3ghe1G5H42kO0aNTB
 Jfvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g+9GGaWo
Subject: [Buildroot] [PATCH 1/1] package/python-termcolor: bump to version
 2.5.0
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
 package/python-termcolor/python-termcolor.hash | 4 ++--
 package/python-termcolor/python-termcolor.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-termcolor/python-termcolor.hash b/package/python-termcolor/python-termcolor.hash
index ed69ab06d1..4bed487025 100644
--- a/package/python-termcolor/python-termcolor.hash
+++ b/package/python-termcolor/python-termcolor.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/termcolor/json
-md5  1d567737d43835549d2fd1bc87ec6c7d  termcolor-2.4.0.tar.gz
-sha256  aab9e56047c8ac41ed798fa36d892a37aca6b3e9159f3e0c24bc64a9b3ac7b7a  termcolor-2.4.0.tar.gz
+md5  26f496075070852b5d39762bbd14ec46  termcolor-2.5.0.tar.gz
+sha256  998d8d27da6d48442e8e1f016119076b690d962507531df4890fcd2db2ef8a6f  termcolor-2.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  e79b6bd82962c1330caaa7c42278567b08667777673f8e2371a624d5715d4c0e  COPYING.txt
diff --git a/package/python-termcolor/python-termcolor.mk b/package/python-termcolor/python-termcolor.mk
index c242cfa474..fc1db17629 100644
--- a/package/python-termcolor/python-termcolor.mk
+++ b/package/python-termcolor/python-termcolor.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TERMCOLOR_VERSION = 2.4.0
+PYTHON_TERMCOLOR_VERSION = 2.5.0
 PYTHON_TERMCOLOR_SOURCE = termcolor-$(PYTHON_TERMCOLOR_VERSION).tar.gz
-PYTHON_TERMCOLOR_SITE = https://files.pythonhosted.org/packages/10/56/d7d66a84f96d804155f6ff2873d065368b25a07222a6fd51c4f24ef6d764
+PYTHON_TERMCOLOR_SITE = https://files.pythonhosted.org/packages/37/72/88311445fd44c455c7d553e61f95412cf89054308a1aa2434ab835075fc5
 PYTHON_TERMCOLOR_SETUP_TYPE = pep517
 PYTHON_TERMCOLOR_LICENSE = MIT
 PYTHON_TERMCOLOR_LICENSE_FILES = COPYING.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
