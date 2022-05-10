Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B883C433F5
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 09:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03F8E81345;
	Tue, 10 May 2022 09:46:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b9rsBO_mhmCr; Tue, 10 May 2022 09:46:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 754098134A;
	Tue, 10 May 2022 09:46:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D7B4A1BF2B6
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 09:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C507E40A9C
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 09:46:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PeXgkfSjDMD0 for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 09:46:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C82DC40AB5
 for <buildroot@buildroot.org>; Tue, 10 May 2022 09:46:03 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id dk23so31799134ejb.8
 for <buildroot@buildroot.org>; Tue, 10 May 2022 02:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=pHRDYWBYVryoZg8tQ/+PvYFAxpbr/b5f9OuChayzIQQ=;
 b=VwIAVDSBnMaPoVEL8Unk+dC1b/9CluMfQyeJwIs6yFlcrwXnCUuSQPFTC8/tWgZGj0
 r/TMBStSlgEhy1tz0HOElOPOL4XPhQiG2Qf03rAFVzhE4+vr4nlSEaIy2TeDc040c+KE
 fX6+bcUqHFi74wznLWyP0UE3XteJGJYLNJOgSVMVJzRUIZWGqePX1hNl1OrsN7NsI+F5
 ctQ6SNxsTXnc1wIGKXywvFL6EzJySbXEA85Mmp7Lrunemh/marZYmgbGNsEo2IR7HPyZ
 effkSw3DDidXrJn6T1NQo12GAbvCiiCrscQuSuehHCaRiaq1fOSFq1VORmpJRdIoxQzT
 uX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pHRDYWBYVryoZg8tQ/+PvYFAxpbr/b5f9OuChayzIQQ=;
 b=NFTPpaWt6VJgb8aYzi5TB8AnY9gae4QQNNaEL1XfmSrp40qGZl4b3iot+ZDcydUhfu
 T0WuQSda54iOjBseHviS5WCWOcQPVQ08EM/YsDHIS5ithaFKKyEh7seGnE9JMWKsPu4y
 ZSNsDeyWLly/NwBTqW0FVO/Ua+aQPWOJkkAdM5XfSe39N/dohrI+9pE6D64okhP2FKh3
 ocUzmjhNyLJa6Q3rC7jx8l3mff0ekmWQ2Ih11apdsjslRYJnEuCKmNGc02VU2Rxrwb2Y
 iyHIVjHs96e2A7VrnXzUeum2SgNhjjW4+CCGQQs0zoHnw4hdlCvzDekjZvEf1S/8dudX
 33Tg==
X-Gm-Message-State: AOAM532FxzrruU+Rz8y7DtdxSgEYl/U6IMJZd2O4VUHJfKLdTT2FNnCn
 3cxHeC2Ie55FWjbSWoMHXwznFJ8a6IE=
X-Google-Smtp-Source: ABdhPJyJQUu55o3/AxdZYbrHmMlx0Bd8hEq1ZftZtHaMHKRHIiJWhjVYfS84CNK5IlB1FaZS2YBgSg==
X-Received: by 2002:a17:906:c109:b0:6f4:d700:2e66 with SMTP id
 do9-20020a170906c10900b006f4d7002e66mr19100260ejc.738.1652175961708; 
 Tue, 10 May 2022 02:46:01 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 e15-20020a50e44f000000b0042617ba63c7sm7398335edm.81.2022.05.10.02.46.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 May 2022 02:46:01 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 10 May 2022 11:45:56 +0200
Message-Id: <20220510094556.20618-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
Subject: [Buildroot] [PATCH] package/python-ruamel-yaml: new package
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                                  |  1 +
 package/python-ruamel-yaml/Config.in               |  8 ++++++++
 package/python-ruamel-yaml/python-ruamel-yaml.hash |  6 ++++++
 package/python-ruamel-yaml/python-ruamel-yaml.mk   | 14 ++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-ruamel-yaml/Config.in
 create mode 100644 package/python-ruamel-yaml/python-ruamel-yaml.hash
 create mode 100644 package/python-ruamel-yaml/python-ruamel-yaml.mk

diff --git a/package/Config.in b/package/Config.in
index 68eafd2463..90357240b6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1210,6 +1210,7 @@ menu "External python modules"
 	source "package/python-rpi-ws281x/Config.in"
 	source "package/python-rsa/Config.in"
 	source "package/python-rtslib-fb/Config.in"
+	source "package/python-ruamel-yaml/Config.in"
 	source "package/python-s3transfer/Config.in"
 	source "package/python-scandir/Config.in"
 	source "package/python-scapy/Config.in"
diff --git a/package/python-ruamel-yaml/Config.in b/package/python-ruamel-yaml/Config.in
new file mode 100644
index 0000000000..afde3d53d4
--- /dev/null
+++ b/package/python-ruamel-yaml/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_RUAMEL_YAML
+	bool "python-ruamel-yaml"
+	help
+	  ruamel.yaml is a YAML parser/emitter that supports roundtrip
+	  preservation of comments, seq/map flow style, and map key
+	  order.
+
+	  https://sourceforge.net/projects/ruamel-yaml/
diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.hash b/package/python-ruamel-yaml/python-ruamel-yaml.hash
new file mode 100644
index 0000000000..8888c5f2b1
--- /dev/null
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/rfc3987/json
+md5  206bda0f33ab2c2f63777636200748b7  ruamel.yaml-0.17.21.tar.gz
+sha256  8b7ce697a2f212752a35c1ac414471dc16c424c9573be4926b56ff3f5d23b7af  ruamel.yaml-0.17.21.tar.gz
+# Locally computed sha256 checksums
+sha256  ab837b032c5aae84503fc0c733a116a26fd272e90dc4402fa68d3c9e51aed3b0  LICENSE
+
diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.mk b/package/python-ruamel-yaml/python-ruamel-yaml.mk
new file mode 100644
index 0000000000..124e9d1eb6
--- /dev/null
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-ruamel-yaml
+#
+################################################################################
+
+PYTHON_RUAMEL_YAML_VERSION = 0.17.21
+PYTHON_RUAMEL_YAML_SOURCE = ruamel.yaml-$(PYTHON_RUAMEL_YAML_VERSION).tar.gz
+PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/46/a9/6ed24832095b692a8cecc323230ce2ec3480015fbfa4b79941bd41b23a3c
+PYTHON_RUAMEL_YAML_SETUP_TYPE = setuptools
+PYTHON_RUAMEL_YAML_LICENSE = MIT
+PYTHON_RUAMEL_YAML_LICENSE_FILES = LICENSE 
+
+$(eval $(python-package))
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
