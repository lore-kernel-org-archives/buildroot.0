Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E432BC4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 09:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E4386F4CE;
	Thu, 14 Dec 2023 09:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E4386F4CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aJkPk8NFDq70; Thu, 14 Dec 2023 09:49:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 826E761B21;
	Thu, 14 Dec 2023 09:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 826E761B21
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 182D01BF28E
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 09:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E61C08382F
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 09:49:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E61C08382F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W2JbBPDLXcnr for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 09:49:03 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE13C83C77
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 09:49:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE13C83C77
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7b701f86c3aso266029439f.3
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 01:49:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702547341; x=1703152141;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O6jaNC8pkHoQR57P1ijEFnievnqROKSBymEBBNYGJXA=;
 b=hJ8l+4k1aBbJLn9aehsfRvSzD0XjuN1XyqB7j/8N2CbieJpj3RpO7YAfly/yMVyJpL
 UPgEzpQA49HSLK8h9YSIfLbmKkvlBxU3CtZvbueUFRZW7vAKFOaDHmpgCf6dMRauam64
 +OjyReWrsZaRWj42FYrjNTIxvt3Scshk2NKfYFJ8Y7OAX7WhIzZ/vZuujI92fnYuGEUG
 L/A03CAfRVoLJvGd39uOWo4B/hMVvwgJJT/Ie5I5FpJeJpjPDzbbkDeQyyLwI6zxkWWY
 SZjgnCscBgQYXWz4icFBbW9MX9BUDv+WMW1mbKaoeSnbxN/hx5gk5j++mCspjAmppseX
 Gv4Q==
X-Gm-Message-State: AOJu0Yzjb7ZatAS3cBq5CGujiNXO37F/QXGpLSVlifbjPmR2DFcnaKvk
 5iqWYAUe7c9Z/zEcnhAHkwXhFUCZVK0ndQ==
X-Google-Smtp-Source: AGHT+IEjwzstq6N2C4A1CKlIj2c97/KkQvkUh+RDmzKBujnqOANdvS2iJNnALxqwB4pqequwRvYxGQ==
X-Received: by 2002:a05:6602:2f10:b0:7b4:3be1:91ac with SMTP id
 q16-20020a0566022f1000b007b43be191acmr12183163iow.22.1702547341698; 
 Thu, 14 Dec 2023 01:49:01 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 fx5-20020a0566381e0500b00455d85d6656sm3342144jab.173.2023.12.14.01.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 01:49:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 02:48:46 -0700
Message-Id: <20231214094846.115655-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231214094846.115655-1-james.hilliard1@gmail.com>
References: <20231214094846.115655-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702547341; x=1703152141; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O6jaNC8pkHoQR57P1ijEFnievnqROKSBymEBBNYGJXA=;
 b=C/wYb5bfAm5TdU8GNVjIFMdmnHLy5MRcxeZWoC/3S6pjIcuZb8cK0+urVqy9c897LH
 /0zhNobqAV0Q5u1xViZELxHHwF4mmtFWkpXLPD6TadYRXtH+VXHxmNkyj2zjRjOCPbk9
 ZURIB5uX/12Vlsqu0F9tA0C9AgxqerS2ZlCT0BRjpiRYcsXk50x28BiVCZ14lG2ubMyj
 ycidiFtIgJZ8J/fAERR79FD6lorPde6s0HrKk7A7ItANs/b1ATkEthxb2Q9p+CYd0eLJ
 l5qR2r8Miah5JtunRNBu91CWI2RXaMWboxMLXUIzLdo53YQbVuzPceWSd2afMXWuqKdB
 D/KA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=C/wYb5bf
Subject: [Buildroot] [PATCH 3/3] package/python-fastapi: new package
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
 package/Config.in                          |  1 +
 package/python-fastapi/Config.in           | 12 ++++++++++++
 package/python-fastapi/python-fastapi.hash |  5 +++++
 package/python-fastapi/python-fastapi.mk   | 15 +++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/python-fastapi/Config.in
 create mode 100644 package/python-fastapi/python-fastapi.hash
 create mode 100644 package/python-fastapi/python-fastapi.mk

diff --git a/package/Config.in b/package/Config.in
index 3a4bf21a2a..8a97eb2897 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1073,6 +1073,7 @@ menu "External python modules"
 	source "package/python-evdev/Config.in"
 	source "package/python-executing/Config.in"
 	source "package/python-falcon/Config.in"
+	source "package/python-fastapi/Config.in"
 	source "package/python-filelock/Config.in"
 	source "package/python-fire/Config.in"
 	source "package/python-flask/Config.in"
diff --git a/package/python-fastapi/Config.in b/package/python-fastapi/Config.in
new file mode 100644
index 0000000000..7d376d3dd7
--- /dev/null
+++ b/package/python-fastapi/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_FASTAPI
+	bool "python-fastapi"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
+	select BR2_PACKAGE_PYTHON_ANYIO # runtime
+	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
+	select BR2_PACKAGE_PYTHON_STARLETTE # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	help
+	  FastAPI framework, high performance, easy to learn, fast to
+	  code, ready for production.
+
+	  https://github.com/tiangolo/fastapi
diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
new file mode 100644
index 0000000000..3dc1578cb7
--- /dev/null
+++ b/package/python-fastapi/python-fastapi.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/fastapi/json
+md5  06bfa7c610fc9e81d05b0319eb70cae7  fastapi-0.105.0.tar.gz
+sha256  4d12838819aa52af244580675825e750ad67c9df4614f557a769606af902cf22  fastapi-0.105.0.tar.gz
+# Locally computed sha256 checksums
+sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
new file mode 100644
index 0000000000..db86bfce30
--- /dev/null
+++ b/package/python-fastapi/python-fastapi.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-fastapi
+#
+################################################################################
+
+PYTHON_FASTAPI_VERSION = 0.105.0
+PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/77/bb/5941e6e2ce3020f64b539a49d39f49be05de17d0c47fea95012589f812a5
+PYTHON_FASTAPI_SETUP_TYPE = pep517
+PYTHON_FASTAPI_LICENSE = MIT
+PYTHON_FASTAPI_LICENSE_FILES = LICENSE
+PYTHON_FASTAPI_DEPENDENCIES = host-python-hatchling
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
