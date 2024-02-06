Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA23C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 19:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB2AE82193;
	Tue,  6 Feb 2024 19:31:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q0UBqF4KGFMb; Tue,  6 Feb 2024 19:31:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B390D8201D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B390D8201D;
	Tue,  6 Feb 2024 19:31:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B34B1BF2FB
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 19:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1630D60BE8
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 19:30:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H3RpKaVn07b4 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 19:30:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2C19760B9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C19760B9A
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C19760B9A
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 19:30:54 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7baa8097064so363178439f.3
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 11:30:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707247853; x=1707852653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eq7r0ZEkV6sozy4Gs/erFzlmBknBPKEp7vEy7rLfrMg=;
 b=bDjmMSbUKKn+AUqCMHrzPfXhRFENH9hSwAQ5qdMBf2ntnRLogt/LCBwCGRGQWlKVmK
 9vtZTvtlZ4H1qUIHgq6d1sjgOmQO6uQNTvB287gH3WpXdcYu04Ql4R0CwqR5LYvLlz+/
 wXMaCOJPeVqaCchd1p0lJjToePRNh9rEI1BtCcBJ6nS+xsR9OT6kRzZis24r2PpBX4T+
 FGM2hY992hBYYOyf7kG5dgFDaayqpq9sj/a7dxZwEMZ43pf37IsUIzj1DjWl/hIhm5rv
 fZaUOsvFq+b8Yw7PjaXG9+qWl1KuFL+u/P4DA43ATRU/frakQ9FG2ZYwVgvfMsIwkNLI
 J8WA==
X-Gm-Message-State: AOJu0YwwtN6iKPr2x2NigQ9cEFOMVRGK3idx88UyZzZ/EJ0VNy8mCSds
 Wvp3afdQSy+dCSbKSh53fCCWOcLhyylnxpKxaaV9Fa4omRfH8ubviyO86rwRwxM=
X-Google-Smtp-Source: AGHT+IG16IS0/z3magCBdj0lJJKiXADOY8dfcs5sY7pQbzKOW5AYELOFUXXpnEYBd4C2An+WaM8uTQ==
X-Received: by 2002:a6b:ea02:0:b0:7bf:f005:2eb2 with SMTP id
 m2-20020a6bea02000000b007bff0052eb2mr3548182ioc.8.1707247852835; 
 Tue, 06 Feb 2024 11:30:52 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXErOdIQV+i/Fumfa8Ly0n6Nz8MyFVyuMo63J+kl4Qrzt7thZgOdQIn2fLWTdwu6Qi+q0wEF7wLxQvcgUTgM9g3ST2iLb7+vsUFWANKNfszT7DkhdlAseDQRoBKKNiekATfHTbSrmDRJQ0UPv/cRQYXSIW7MHSsV3U=
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 gk5-20020a0566386a8500b004712ffda5ecsm658717jab.60.2024.02.06.11.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 11:30:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 12:30:48 -0700
Message-Id: <20240206193048.658003-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206193048.658003-1-james.hilliard1@gmail.com>
References: <20240206193048.658003-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707247853; x=1707852653; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eq7r0ZEkV6sozy4Gs/erFzlmBknBPKEp7vEy7rLfrMg=;
 b=Bv3+Ry3zZo9l/Lbu5p+lRkYa8HGDCAyDHtEJwjFZn/DLBrKNFxmyr7GkThhSgfn/iv
 pAwCJZS79TGjA8rAh2F2ApyfWRR9bmvA//JiI9nEWmEeXbZFDe8t8E1aBVdb/Eg/g2+3
 69Sc4GqGipMUJ7YoXTzaNxqESU9bzJ5gj3mV3UcaxQIsgj4ia3u7EwtRDhHXc6Ppvplw
 0B5psdkjAGv4tJaQcB4iSxe/B8d1IPF3Sk7W2EznIPQDqTIpwlPt44JBHkpBni7KN0hG
 IhE5okGaedR2AAJL1H6gq6qs/+HbzOg8AHvvRG2xho12FxNerQ1SIogVqTFbXcPo8amD
 dBCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Bv3+Ry3z
Subject: [Buildroot] [PATCH v3 3/3] package/python-tortoise-orm: new package
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
 package/Config.in                                 |  1 +
 package/python-tortoise-orm/Config.in             | 10 ++++++++++
 .../python-tortoise-orm/python-tortoise-orm.hash  |  5 +++++
 .../python-tortoise-orm/python-tortoise-orm.mk    | 15 +++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/python-tortoise-orm/Config.in
 create mode 100644 package/python-tortoise-orm/python-tortoise-orm.hash
 create mode 100644 package/python-tortoise-orm/python-tortoise-orm.mk

diff --git a/package/Config.in b/package/Config.in
index d1ed6cf224..30113d1a1b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1381,6 +1381,7 @@ menu "External python modules"
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
