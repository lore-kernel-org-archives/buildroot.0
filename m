Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E24FCF0427
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 21:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF06740103;
	Tue,  8 Oct 2024 21:58:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3U7xFm6t-fLi; Tue,  8 Oct 2024 21:58:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65FEC4051A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65FEC4051A;
	Tue,  8 Oct 2024 21:58:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B7C7A1BF577
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 21:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5EE44051A
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 21:58:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9HlFnjCDg3VR for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 21:58:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 65B7040103
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65B7040103
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65B7040103
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 21:58:19 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3a3938e73d3so3003235ab.1
 for <buildroot@buildroot.org>; Tue, 08 Oct 2024 14:58:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728424698; x=1729029498;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MrtkhPyQeIGnE0XRXAiJEaHGXyJ/36Y2IlJWM3lTIbA=;
 b=m/taLyGF/aHPoRyMEBedFFxhSjsdZ7F3lhWg7Z737A60Nl5f0WmhD0rHiss+mdIG00
 QSeAkZyTlh6/yB8BQ8YX6hfPf8fdwpE3azes9uvKJEJjusGPepdfXFXXjtmlA/J4LPi4
 o4c2Z40goa0rnkHc/AbGT7sqQb1xa8Ws6HbU6YAnjLjjF4P1SV1ajpvxIRlkcniPTdbm
 JrwhXRy5340lMMMLF4Jp5rzwbDsxfdQwlmvKl9JrdA0svw+S3DzRo7BhAeNugytPw9Mb
 k2KQEy2174m9AqpSVPfaRwYWlyKvxWZhVPXCX5dbEOO6klT4DF6dZSYcw1H3rPwRXAsI
 hCJQ==
X-Gm-Message-State: AOJu0Yzs8WlgWUKF+KE6XaVzhJDeNfbmSrc469K9VRlOm6Bri6baD2qm
 cIy1m+V/a2dkcvHCb9E/zOEKABlto/9Ox7ZM0HnmQ60Cnjp0tht6SX9vnbe8
X-Google-Smtp-Source: AGHT+IFK5VKFBH9Chu6yWXh6pIwtXQfd9gZ4KAUKr8xNx8QuLJCYWM4w/yuY05CqGs22QGEiimSc6g==
X-Received: by 2002:a05:6e02:1561:b0:3a0:98b2:8f3b with SMTP id
 e9e14a558f8ab-3a397cfa93cmr4120035ab.7.1728424697856; 
 Tue, 08 Oct 2024 14:58:17 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a37a8694f4sm20228875ab.61.2024.10.08.14.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 14:58:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  8 Oct 2024 15:58:15 -0600
Message-Id: <20241008215815.3762594-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728424698; x=1729029498; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MrtkhPyQeIGnE0XRXAiJEaHGXyJ/36Y2IlJWM3lTIbA=;
 b=eu391krRQ2T8O1PMmNZmgDWwz/WTqJSs2KVqaGtAbAmqX1wQy4bUB1UqHLprCayQVo
 U7/rGEeM/aoyrhfFLkhc9sRWhj9O1KiUV/sZVy9iDWv+7BO/mTJnGjisvOGFM9mDOJeK
 jaoeWVCj1saZiusVqDLMZLlAUno/GtH3HvXL4VamGnlp0+IbI7o0mRTdDchqdegHO3mN
 LLLcslsJKjBax1GfRkN0v2G3TnAOX7g2evR5L+T81me+OicyJOLdfGdpdog7b4snVo0O
 8k1+oAZXhJNlDIq8SwnWg40hB1CMLSaZj4hkcs2jTew4/fifBL64iqXEVPfnQTYoMUk7
 G37A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eu391krR
Subject: [Buildroot] [PATCH 1/1] package/python-psygnal: new package
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
 package/python-psygnal/Config.in           |  6 ++++++
 package/python-psygnal/python-psygnal.hash |  5 +++++
 package/python-psygnal/python-psygnal.mk   | 15 +++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-psygnal/Config.in
 create mode 100644 package/python-psygnal/python-psygnal.hash
 create mode 100644 package/python-psygnal/python-psygnal.mk

diff --git a/package/Config.in b/package/Config.in
index e1ceb81dc0..c3dedc1326 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1269,6 +1269,7 @@ menu "External python modules"
 	source "package/python-protobuf/Config.in"
 	source "package/python-psutil/Config.in"
 	source "package/python-psycopg2/Config.in"
+	source "package/python-psygnal/Config.in"
 	source "package/python-ptyprocess/Config.in"
 	source "package/python-pudb/Config.in"
 	source "package/python-pure-eval/Config.in"
diff --git a/package/python-psygnal/Config.in b/package/python-psygnal/Config.in
new file mode 100644
index 0000000000..d6fbcbcd6a
--- /dev/null
+++ b/package/python-psygnal/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PSYGNAL
+	bool "python-psygnal"
+	help
+	  Python observer pattern (callback/event system).
+
+	  https://github.com/pyapp-kit/psygnal
diff --git a/package/python-psygnal/python-psygnal.hash b/package/python-psygnal/python-psygnal.hash
new file mode 100644
index 0000000000..f378861063
--- /dev/null
+++ b/package/python-psygnal/python-psygnal.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/psygnal/json
+md5  13955249103622604d4022e7d5ef94e0  psygnal-0.11.1.tar.gz
+sha256  f9b02ca246ab0adb108c4010b4a486e464f940543201074591e50370cd7b0cc0  psygnal-0.11.1.tar.gz
+# Locally computed sha256 checksums
+sha256  50169b145e35e6ae11a1e05cebdaa7052a58a8a2325dd5c394f8a68199c78415  LICENSE
diff --git a/package/python-psygnal/python-psygnal.mk b/package/python-psygnal/python-psygnal.mk
new file mode 100644
index 0000000000..57ba442e6c
--- /dev/null
+++ b/package/python-psygnal/python-psygnal.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-psygnal
+#
+################################################################################
+
+PYTHON_PSYGNAL_VERSION = 0.11.1
+PYTHON_PSYGNAL_SOURCE = psygnal-$(PYTHON_PSYGNAL_VERSION).tar.gz
+PYTHON_PSYGNAL_SITE = https://files.pythonhosted.org/packages/bc/b0/194cfbcb76dbf9c4a1c4271ccc825b38406d20fb7f95fd18320c28708800
+PYTHON_PSYGNAL_SETUP_TYPE = pep517
+PYTHON_PSYGNAL_LICENSE = BSD-3-Clause
+PYTHON_PSYGNAL_LICENSE_FILES = LICENSE
+PYTHON_PSYGNAL_DEPENDENCIES = host-python-hatchling host-python-hatch-vcs
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
