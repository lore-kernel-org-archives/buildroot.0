Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D08C47074
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 21:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29E5981E40;
	Sat,  6 Jan 2024 21:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29E5981E40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rkn4cqHJHwd7; Sat,  6 Jan 2024 21:44:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6019E8294A;
	Sat,  6 Jan 2024 21:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6019E8294A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F28C41BF295
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 21:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D76A34010C
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 21:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D76A34010C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KxNf__h1eD_k for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 21:44:18 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3E25400FD
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 21:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3E25400FD
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3606f507efeso4334305ab.3
 for <buildroot@buildroot.org>; Sat, 06 Jan 2024 13:44:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704577457; x=1705182257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6rl4T58qEEu0pxpjd90nJYa1+6bIjAZJSBusPBrM6sw=;
 b=d0RL6oA65kydP8DD13DX4Fn2cTIU7sDQ3fj4WVSTp2424awkTCIdMyjfkSNsXd3EIJ
 TjIT7+C4znCgICfcMl733oCaA/1WlwYh4GgVmD4NKMQIXnUPHMbgaizBxOm57f/DgM3r
 VdHWjgkX1j89HpX8NstRD682d+xrOmZV5YMHFBe1sMiCo9Hchr6uZDiPkCfKhzXjhJE2
 WTOTdgyjmnUeee0LxG32VSM4BfO3nJv1mMrXrYRsV9k+r4kjAf9CdaUMH/iYey+UI3X9
 sj6nDnORUwGPuLnz02F5ZRBZH4Yarzxdc6AX2oX1gw2AhsClIoZucPw3Y47gBk8IkYt9
 xt9Q==
X-Gm-Message-State: AOJu0YzhFt/ZwDQar6WqA6bOPYh8LJN179ApooGSZK3fdd0Y8v+ew60A
 y/1aCrQSYoN6/ucY2soW/rz8HgxkHzZZmQ==
X-Google-Smtp-Source: AGHT+IHLhWAHsYL+WqQB18jNqWRN1zUoK4UMIY4KgLH0jmtT9JyqjYTKlAFxhjhN5/vZbfpdlUxJvA==
X-Received: by 2002:a05:6e02:1c21:b0:35f:df71:423b with SMTP id
 m1-20020a056e021c2100b0035fdf71423bmr3089218ilh.30.1704577457076; 
 Sat, 06 Jan 2024 13:44:17 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 6-20020a056e020ca600b00360039199cesm1496587ilg.3.2024.01.06.13.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 13:44:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jan 2024 14:44:10 -0700
Message-Id: <20240106214410.3294887-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240106214410.3294887-1-james.hilliard1@gmail.com>
References: <20240106214410.3294887-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704577457; x=1705182257; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6rl4T58qEEu0pxpjd90nJYa1+6bIjAZJSBusPBrM6sw=;
 b=M/SiSjKzaPdpQorzgaQfwCTMEppEz+oHmaTgpqgMMuROeyasjAi6GSV0FwTM0voe/y
 GTvDNEgW0o6RKWspVWgAscCmO3M9hUj1pTU/i8BRNH/yjlCd2Nud+wL8XRtSeyu2tRMJ
 PRv7025IRNijNNqI6tDjQDb6HLelpKV5uEPikrf9p25OmLaATy4TrVpIe/Mz3ifHQC1A
 YtjGtNQciWM3ifKJNZrBkGxbf6C97D+Q8z3LwCBqrdePuAohrgC30fXIhh9MvMIU1kL8
 2JwzV00oFXhs71h0eoQaJde1ExZuneK6OR2O9EBnSusHwW3IqZsJdJORviXna/sh716z
 gt1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=M/SiSjKz
Subject: [Buildroot] [PATCH v2 4/4] package/python-tortoise-orm: new package
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
 package/Config.in                                 |  1 +
 package/python-tortoise-orm/Config.in             | 10 ++++++++++
 .../python-tortoise-orm/python-tortoise-orm.hash  |  5 +++++
 .../python-tortoise-orm/python-tortoise-orm.mk    | 15 +++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/python-tortoise-orm/Config.in
 create mode 100644 package/python-tortoise-orm/python-tortoise-orm.hash
 create mode 100644 package/python-tortoise-orm/python-tortoise-orm.mk

diff --git a/package/Config.in b/package/Config.in
index 645393c0a4..307ecd8552 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1378,6 +1378,7 @@ menu "External python modules"
 	source "package/python-toml/Config.in"
 	source "package/python-tomli/Config.in"
 	source "package/python-tornado/Config.in"
+	source "package/python-tortoise-orm/Config.in"
 	source "package/python-tqdm/Config.in"
 	source "package/python-trafaret/Config.in"
 	source "package/python-traitlets/Config.in"
diff --git a/package/python-tortoise-orm/Config.in b/package/python-tortoise-orm/Config.in
new file mode 100644
index 0000000000..62b1a5a86e
--- /dev/null
+++ b/package/python-tortoise-orm/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_TORTOISE_ORM
+	bool "python-tortoise-orm"
+	select BR2_PACKAGE_PYTHON_AIOSQLITE # runtime
+	select BR2_PACKAGE_PYTHON_ISO8601 # runtime
+	select BR2_PACKAGE_PYTHON_PYPIKA_TORTOISE # runtime
+	select BR2_PACKAGE_PYTHON_PYTZ # runtime
+	help
+	  Easy async ORM for python, built with relations in mind.
+
+	  https://github.com/tortoise/tortoise-orm
diff --git a/package/python-tortoise-orm/python-tortoise-orm.hash b/package/python-tortoise-orm/python-tortoise-orm.hash
new file mode 100644
index 0000000000..4796c8277f
--- /dev/null
+++ b/package/python-tortoise-orm/python-tortoise-orm.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/tortoise-orm/json
+md5  aa5efa50e69d0a67b75c187f7550acd7  tortoise_orm-0.20.0.tar.gz
+sha256  283af584d685dcc58d6cc1da35b9115bb1e41c89075eae2a19c493b39b9b41f7  tortoise_orm-0.20.0.tar.gz
+# Locally computed sha256 checksums
+sha256  f955d347b975d5867ee364f978476b3012878a706d468571b9758cac74de6041  LICENSE.txt
diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
new file mode 100644
index 0000000000..cc1c2126b7
--- /dev/null
+++ b/package/python-tortoise-orm/python-tortoise-orm.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-tortoise-orm
+#
+################################################################################
+
+PYTHON_TORTOISE_ORM_VERSION = 0.20.0
+PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
+PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/3b/84/8ca142fe370d59c4e3135825b2822d199c4f885ae855657c1a7361e68511
+PYTHON_TORTOISE_ORM_SETUP_TYPE = pep517
+PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
+PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
+PYTHON_TORTOISE_ORM_DEPENDENCIES = host-python-poetry-core
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
