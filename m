Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11907C433EF
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 08:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B61D4608EF;
	Mon, 29 Nov 2021 08:57:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g-2KEbKGYWHi; Mon, 29 Nov 2021 08:57:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 129C7608AA;
	Mon, 29 Nov 2021 08:56:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 474E31BF3F4
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 08:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 373C2608AA
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 08:56:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hDc1v7UkLnXU for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 08:56:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 653B760899
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 08:56:21 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id z8so6444694ilu.7
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 00:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y5Uoyxm9F11SskRpbRD1EtTWgOmDoiCdtghVt+5/6ZI=;
 b=KJ8NE9iKttPFkWjxLPoFxgQEoR8WB3Zaltb9Fg1ApwEcZtbZT3EEZRYty+Jgtq7TKI
 n+fbPZ9NWVmZH0P0brXYQe+3ud5lz9A/ZuavSka4T58muKswoA0qzwC/RSyQMYWiPsfe
 77kfszbw1ofYyTwKOJZU8RSNs/Cm/NfyrKC/wvEHyqLOqg5N38unRVocUhRuY+zp+vuW
 K+EteSFXC26KMpu/7VkwK/7e1FwcJ5WL7yjSf2aUoihSEi+9Y/XSm7EPamUN7E7jL6C2
 wEbAYtN0ilwCUlODOe12HoXVbBa9tsKet4rSpfak69TcO5BdDub7jPQGDqKlbiLNGv0i
 Zx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y5Uoyxm9F11SskRpbRD1EtTWgOmDoiCdtghVt+5/6ZI=;
 b=p8ioh+QXn6w9CHGCtB5dbKq5SDpgdPl2jIRig+isuPV847w2A1s5EjdC8ktAFKav5o
 usWaNT5XpfNTPgAfKKCmo1A2duFXKbBIrryTGNNjcHKVn9/ifzHhL1BRlE93Pyt+Kqt7
 MyBOrWL60Zos9nrqnw7bR4vYq89Y3ypJ9bUV3YB7/53CSYMAQ7wPLekAsXcbkZzj1sWD
 BRk3uwH9l8/Dnl4aQSjWXMLStfsBBNKMLSRL/pGqjeJZ8s+x+JOOoBz2vHw2ziQ3zacK
 L5GAOIDmDnWk25CmAnUQGoSNHZw/YAft7D3tCyBzgBUtaDLUue4tJJPdkqzJSwczC9QT
 tLIg==
X-Gm-Message-State: AOAM530wS2BUV40vlFXqzZMLR5E2tjSUh2vvKZh7Rl8iq7TaYiQlOg0n
 hbYe2Mrzo6ryD+9wwoQCNKO8Jp+XmV4=
X-Google-Smtp-Source: ABdhPJyicoLDRdWOp4AT1iE9n6HMmgfpx4Ap4clTjyj+Pz20L9TJSjJOVwT60th23NxnNUuN/ebQRA==
X-Received: by 2002:a92:cad0:: with SMTP id m16mr51631731ilq.86.1638176180360; 
 Mon, 29 Nov 2021 00:56:20 -0800 (PST)
Received: from james-x399.localdomain (71-33-128-47.hlrn.qwest.net.
 [71.33.128.47])
 by smtp.gmail.com with ESMTPSA id l3sm7127145ilv.37.2021.11.29.00.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 00:56:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 01:56:10 -0700
Message-Id: <20211129085610.3701585-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129085610.3701585-1-james.hilliard1@gmail.com>
References: <20211129085610.3701585-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/4] package/python-tinycss2: new package
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
 package/Config.in                            |  1 +
 package/python-tinycss2/Config.in            |  8 ++++++++
 package/python-tinycss2/python-tinycss2.hash |  5 +++++
 package/python-tinycss2/python-tinycss2.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-tinycss2/Config.in
 create mode 100644 package/python-tinycss2/python-tinycss2.hash
 create mode 100644 package/python-tinycss2/python-tinycss2.mk

diff --git a/package/Config.in b/package/Config.in
index 52ef33ab97..bb8374a213 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1240,6 +1240,7 @@ menu "External python modules"
 	source "package/python-terminaltables/Config.in"
 	source "package/python-texttable/Config.in"
 	source "package/python-thrift/Config.in"
+	source "package/python-tinycss2/Config.in"
 	source "package/python-tinyrpc/Config.in"
 	source "package/python-tomako/Config.in"
 	source "package/python-toml/Config.in"
diff --git a/package/python-tinycss2/Config.in b/package/python-tinycss2/Config.in
new file mode 100644
index 0000000000..e7a5bb3659
--- /dev/null
+++ b/package/python-tinycss2/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_TINYCSS2
+	bool "python-tinycss2"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_WEBENCODINGS # runtime
+	help
+	  A tiny CSS parser.
+
+	  https://www.courtbouillon.org/tinycss2
diff --git a/package/python-tinycss2/python-tinycss2.hash b/package/python-tinycss2/python-tinycss2.hash
new file mode 100644
index 0000000000..e8e1d93f83
--- /dev/null
+++ b/package/python-tinycss2/python-tinycss2.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/tinycss2/json
+md5  60272f58f8d5834b2e09ffbc9bd5de53  tinycss2-1.1.1.tar.gz
+sha256  b2e44dd8883c360c35dd0d1b5aad0b610e5156c2cb3b33434634e539ead9d8bf  tinycss2-1.1.1.tar.gz
+# Locally computed sha256 checksums
+sha256  6b94acee20ec9f2709333134f3ba70322535fb420af0ce8c1455d9cbe297f1d5  LICENSE
diff --git a/package/python-tinycss2/python-tinycss2.mk b/package/python-tinycss2/python-tinycss2.mk
new file mode 100644
index 0000000000..e4fc5dc9c5
--- /dev/null
+++ b/package/python-tinycss2/python-tinycss2.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-tinycss2
+#
+################################################################################
+
+PYTHON_TINYCSS2_VERSION = 1.1.1
+PYTHON_TINYCSS2_SOURCE = tinycss2-$(PYTHON_TINYCSS2_VERSION).tar.gz
+PYTHON_TINYCSS2_SITE = https://files.pythonhosted.org/packages/1e/5a/576828164b5486f319c4323915b915a8af3fa4a654bbb6f8fc8e87b5cb17
+PYTHON_TINYCSS2_SETUP_TYPE = flit
+PYTHON_TINYCSS2_LICENSE = BSD-3-Clause
+PYTHON_TINYCSS2_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
