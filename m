Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07960C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 19:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 558764024E;
	Sat,  1 Jan 2022 19:30:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cr8-5lTom_QY; Sat,  1 Jan 2022 19:30:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71F2640247;
	Sat,  1 Jan 2022 19:30:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F00B1BF389
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 19:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D21681409
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 19:30:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0p9HcS_HpTrl for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 19:30:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FB6A81407
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 19:30:25 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id i14so35236027ioj.12
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 11:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GrOTjmYDo+XQ72LGbsld/tfW5VwiwWZ5Kl+zedlxODU=;
 b=G4Ze8Y8Ao1blZV/PAfP/lrwz9poJam+RiD93b/AouOPmFOzkL+MbEmNhBBEuqmddvs
 DN5fqawVcJE+nkUukrjGD2eArMgI4CCWqq9SxYGH6IRYm+umrNqOgRjNsHXnND44QpHP
 bvhD+nBlHz0a+JeLFGOoecmpv0ZbBh6PdWOea9M3NnFXjU1hNojKwGHfzLkwd65Az06N
 /cOfq/eragPtU/9wGvZPUBBrpjUWcTCKRjiBuLAXnMyv96Oa2KYTLJ2CdV/GsR9jPYxN
 xE5u6eQJUuHu29Mqr7de7HbhQwfeng8cIxo1P4N5ciAyA92LoZqla8E1/DQ2tge2tIAO
 iU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GrOTjmYDo+XQ72LGbsld/tfW5VwiwWZ5Kl+zedlxODU=;
 b=ZB0Zji7dvjFMcXioIjAj0AwHQuVQjrq6s6BzBA7ll5CIWbhJoABtzDNIu+E0EVShyP
 IhityoZpkQ6vqVAr7ah7hAZht7aYs5D2qGs+lOpwTxpTuEKgm8JDqo61y80LZcUtqV4W
 Hyk3fuqt2G2iFJbxgYeAd1QBTwyfDkD5gx9kHtuUtTEmz/lZ6Tk4rq6VjIpAe7O8bGLD
 PLo0mZ1V9CZ0Wj0ZCZ0bItRsUMTo6l/imFjG1kLODBuhvdDXAj7+PA873sOVIH/hCuZ0
 5Oy6Mi+FF5XemE0D/kIFc56UgSgi7YZf4AMO4sA1LDe+hpeqFU6HPvdjkd80HW5imCf5
 zpUw==
X-Gm-Message-State: AOAM530UzSGoRR8QU8rupxl0jiLTHVJ+xeIhaguavGNzbdi+aHqQ4AYh
 0AO4prlxU02gu+BgFlv7YYmU/cIh5Rg=
X-Google-Smtp-Source: ABdhPJzbk96hGyz7StX3AwwEvg6e03zOjJlifDuRaQoB/qNbeSQEv78QnHDybpqp4Lbq0ZPNLdweiw==
X-Received: by 2002:a6b:dc10:: with SMTP id s16mr17836641ioc.131.1641065423894; 
 Sat, 01 Jan 2022 11:30:23 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id n5sm18046974ilm.87.2022.01.01.11.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 11:30:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 12:30:14 -0700
Message-Id: <20220101193018.404937-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/5] package/python-tomli: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-tomli/Config.in         |  7 +++++++
 package/python-tomli/python-tomli.hash |  5 +++++
 package/python-tomli/python-tomli.mk   | 16 ++++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/python-tomli/Config.in
 create mode 100644 package/python-tomli/python-tomli.hash
 create mode 100644 package/python-tomli/python-tomli.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 21e4f2a84c..e14842575a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1292,6 +1292,7 @@ F:	package/python-snappy/
 F:	package/python-sockjs/
 F:	package/python-terminaltables/
 F:	package/python-tinycss2/
+F:	package/python-tomli/
 F:	package/python-weasyprint/
 F:	package/python-yarl/
 F:	package/python-zopfli/
diff --git a/package/Config.in b/package/Config.in
index d3d0717535..a34323175d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1254,6 +1254,7 @@ menu "External python modules"
 	source "package/python-tinyrpc/Config.in"
 	source "package/python-tomako/Config.in"
 	source "package/python-toml/Config.in"
+	source "package/python-tomli/Config.in"
 	source "package/python-tornado/Config.in"
 	source "package/python-tqdm/Config.in"
 	source "package/python-traitlets/Config.in"
diff --git a/package/python-tomli/Config.in b/package/python-tomli/Config.in
new file mode 100644
index 0000000000..e1cecaaa36
--- /dev/null
+++ b/package/python-tomli/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_TOMLI
+	bool "python-tomli"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  A lil' TOML parser.
+
+	  https://github.com/hukkin/tomli
diff --git a/package/python-tomli/python-tomli.hash b/package/python-tomli/python-tomli.hash
new file mode 100644
index 0000000000..1a274c8a40
--- /dev/null
+++ b/package/python-tomli/python-tomli.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/tomli/json
+md5  2ecbc7a23b8c8dc2fe96f588f88463d9  tomli-1.2.0.tar.gz
+sha256  d60e681734099207a6add7a10326bc2ddd1fdc36c1b0f547d00ef73ac63739c2  tomli-1.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  b80816b0d530b8accb4c2211783790984a6e3b61922c2b5ee92f3372ab2742fe  LICENSE
diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
new file mode 100644
index 0000000000..4e6b023ef7
--- /dev/null
+++ b/package/python-tomli/python-tomli.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-tomli
+#
+################################################################################
+
+PYTHON_TOMLI_VERSION = 1.2.0
+PYTHON_TOMLI_SOURCE = tomli-$(PYTHON_TOMLI_VERSION).tar.gz
+PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/ec/38/8eccdc662c61aed187d5f5b168c18b1d2de3827976c3691e4da8be7375aa
+PYTHON_TOMLI_SETUP_TYPE = distutils
+PYTHON_TOMLI_LICENSE = MIT
+PYTHON_TOMLI_LICENSE_FILES = LICENSE
+HOST_PYTHON_TOMLI_NEEDS_HOST_PYTHON = python3
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
