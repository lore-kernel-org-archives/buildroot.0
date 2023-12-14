Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49081C4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 09:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDF26405B1;
	Thu, 14 Dec 2023 09:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDF26405B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sYkEursWtsIf; Thu, 14 Dec 2023 09:15:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C360E436B6;
	Thu, 14 Dec 2023 09:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C360E436B6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 803861BF376
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 09:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 658B183C6B
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 09:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 658B183C6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cWxDD254_9LH for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 09:15:08 +0000 (UTC)
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18E7983C23
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 09:15:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18E7983C23
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-35d5b30eb85so23471885ab.3
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 01:15:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702545306; x=1703150106;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ilJJoghLms5YY8wwddnYoyCGJ3iRn/9Desf+RaNSp04=;
 b=fMK2I5oi7G/l+rJr8H8dn4+FGBmotAcjt2uE5hc1Yq9GvzLuyP5+RRXo4fa3sl6OMw
 +JFgLqIn+vZIz4kj+1VjnCH5JhDJdgxdG1uuWY3y0jSd/k0nR62dqQxAO82nR5mYIhq5
 iXL5v++SohTSbCg6wFMlhsDLTUie00fr7dbCUAmhIn4mZq1vkHnbx7tjCcTXlw4c869g
 c6zZ34wbn5ikksm3wM4JI2M7vm/iPd8SbJywrnh2rWvfNtpcgCu9rayHwpqdicMAJRli
 wIbfHiFEo3+wnkVtFmdcUqnikkEkXxWZySjb/7aaWHp/TCE0fhG5fCZsJIeAziMWTUZH
 7mzg==
X-Gm-Message-State: AOJu0YzrdBDM3d0gVCYfpB8u5eI8MBuMHt8VpVwWdXjs7WBQsSExDOSE
 4sH7gccl3EfNmhID1V9n5ew1Z0c9Dyhufg==
X-Google-Smtp-Source: AGHT+IHRRiUTRAQRrJayViB66YDYqU7zMEem3g/97/Xs8Q9hhStKnaC96LW5JoEdNbOO7OAUsORYog==
X-Received: by 2002:a05:6e02:1cae:b0:35d:5d42:ba2b with SMTP id
 x14-20020a056e021cae00b0035d5d42ba2bmr11285374ill.8.1702545306485; 
 Thu, 14 Dec 2023 01:15:06 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 db10-20020a056e023d0a00b0035af0c79e23sm103446ilb.40.2023.12.14.01.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 01:15:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 02:15:01 -0700
Message-Id: <20231214091504.101102-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702545306; x=1703150106; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ilJJoghLms5YY8wwddnYoyCGJ3iRn/9Desf+RaNSp04=;
 b=cvuQeIzUW5lLMfDypDIMm2wwwIhLUtursuE6pufOR4thWF670juHH1usds2GQh91aN
 H9BkfVATwprrUkKHx78z3FNPr/FqwhPWUj9DRenFMfWRhKHs9kltZVn/ZQLtf+3CnIzK
 aWYp3vKpn0gL7mFNpJpCl/koNNpi1+rlT91VbaiUOPyTYwcTwbabNwR3Q03Uo48EJ6eF
 ksLp5RFWg8TOOVPLC2BrWftYIr653YCUBbhAQ/BgDmQVIZ6abvP5I8vs9T45kfusVqf/
 iOt/PSz3ZGpAwyQRh1ttyBYgoHjlxuiqWGLQt4ksstLkYQ0ZFQV71r++JbgWPrEbBnqi
 WyBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cvuQeIzU
Subject: [Buildroot] [PATCH 1/4] package/python-poetry-core: new host package
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
