Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F52C433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 07:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D96AF60FDE;
	Tue,  3 May 2022 07:44:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z9zWK0shymEN; Tue,  3 May 2022 07:44:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA3A960FDB;
	Tue,  3 May 2022 07:44:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A2FD71BF2E3
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 07:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 910EF4012E
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 07:44:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fyIMkdkimGJG for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 07:44:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83B89400FE
 for <buildroot@buildroot.org>; Tue,  3 May 2022 07:44:42 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id d6so18938214ede.8
 for <buildroot@buildroot.org>; Tue, 03 May 2022 00:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=Is47TYKIDXcEbDmlp3Q1rA/pSDIjkj5kaX0Cc5FBFzc=;
 b=durF0ss80bl5F3Fp0xb8aefuGIeOzeNTH/fUEgv/KAyUxB8kFNycWR2vkXhFUvRSoF
 eNEY1JVr2cxjFzWfiEYNxAGbc1PZjpYrU2gn2PMxeoYnt5wWmmO07bFGdeS9d2frT34T
 UTKKfosYrxv9csmASH5lkq8mZqjUFfSWg5dG8VdySrd1zMV3FQsbs/jDbedkerexMZFl
 B0txb5EEbRqvuj+dj085uclMOv/gs3JCQr20pVIY4WyFqZFjG/N/IlEcIqfLzt5oQky+
 FbrD+Cd5U0UTH83SNNpT2UWI4lGNJs66J4NwZJFonaSim2Tckx9njTwXnVzLezCrKtRG
 XO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Is47TYKIDXcEbDmlp3Q1rA/pSDIjkj5kaX0Cc5FBFzc=;
 b=jCpXaPi8D5dlFaPK2jCyNcUX8f1NHHlj8HA0dmQ0jh3WXQbbEzzw9/mJOzszoqVmho
 XgC2+mRg49johnjm5N/Lkzuctf4xebR86v/DTCkdDFOJH4IzG405UkZjYvum4v2IkC0V
 ls3EgbOFjY1q7/zLDJS28seitpulJ7H79kxTzQ3nyoVX5oScLwfXboyfJZ+JzqCb+i82
 BFAw2tw4QPirJG8Z4uROOhZVPT2C1c0BMrsloAMEiy+35diTVz6RSmp+TxYatvBk6NIX
 ajTatn6VXymx4LQOPRRenonRmLIMysedIFJZ3EvxoK8wf0jvARvyOJKJi40g6z0km1vh
 LrHA==
X-Gm-Message-State: AOAM532FW+yQIgIulX9P1TZpCg+BwQhTRiC/Pdu8M0snDIfDwlhfHAbF
 MHR3QipfYx4uPjX8zkQgw8Hs3TBXcWY=
X-Google-Smtp-Source: ABdhPJxrPUa6JDIEYKdVhpAN/dNjRHF3VeFBQjMLdxUeKbJWI1XRtzDYsEJc+N3bm3hmJts4bqoSAg==
X-Received: by 2002:a05:6402:2985:b0:425:d51f:ae4 with SMTP id
 eq5-20020a056402298500b00425d51f0ae4mr16802950edb.379.1651563880134; 
 Tue, 03 May 2022 00:44:40 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 bf16-20020a0564021a5000b0042617ba63aesm7658515edb.56.2022.05.03.00.44.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 May 2022 00:44:39 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  3 May 2022 09:44:26 +0200
Message-Id: <20220503074426.9207-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
Subject: [Buildroot] [PATCH] package/python-pydevmem: new package
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

Python DevMem is designed primarily for use with accessing
/dev/mem on OMAP platforms. It should work on other platforms
and work to mmap() files rather then just /dev/mem, but these
use cases aren't well tested.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                            |  1 +
 package/python-pydevmem/Config.in            |  9 +++++++++
 package/python-pydevmem/python-pydevmem.hash |  3 +++
 package/python-pydevmem/python-pydevmem.mk   | 13 +++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-pydevmem/Config.in
 create mode 100644 package/python-pydevmem/python-pydevmem.hash
 create mode 100644 package/python-pydevmem/python-pydevmem.mk

diff --git a/package/Config.in b/package/Config.in
index 4687dd4426..66682b9b2d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1151,6 +1151,7 @@ menu "External python modules"
 	source "package/python-pycups/Config.in"
 	source "package/python-pydal/Config.in"
 	source "package/python-pydantic/Config.in"
+	source "package/python-pydevmem/Config.in"
 	source "package/python-pydyf/Config.in"
 	source "package/python-pyelftools/Config.in"
 	source "package/python-pyftpdlib/Config.in"
diff --git a/package/python-pydevmem/Config.in b/package/python-pydevmem/Config.in
new file mode 100644
index 0000000000..a0e2da9f0b
--- /dev/null
+++ b/package/python-pydevmem/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_PYDEVMEM
+	bool "python-pydevmem"
+	help
+	  Python DevMem is designed primarily for use with accessing
+	  /dev/mem on OMAP platforms. It should work on other platforms
+	  and work to mmap() files rather then just /dev/mem, but these
+	  use cases aren't well tested.
+
+	  https://github.com/kylemanna/pydevmem
diff --git a/package/python-pydevmem/python-pydevmem.hash b/package/python-pydevmem/python-pydevmem.hash
new file mode 100644
index 0000000000..e9ee18b872
--- /dev/null
+++ b/package/python-pydevmem/python-pydevmem.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  1a72db41effeb83e01fc9a422abfe345a92220b0382403a5040b2811e4ee6496  python-pydevmem-600b5d1ef8997c394db3512b735d75d5abc4ad41.tar.gz
+sha256  cb013ffd1fd415a348f9a32231ceb133770623b69484a24ad49b6da4904cac2e  LICENSE
diff --git a/package/python-pydevmem/python-pydevmem.mk b/package/python-pydevmem/python-pydevmem.mk
new file mode 100644
index 0000000000..385b123290
--- /dev/null
+++ b/package/python-pydevmem/python-pydevmem.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-pydevmem
+#
+################################################################################
+
+PYTHON_PYDEVMEM_VERSION = 600b5d1ef8997c394db3512b735d75d5abc4ad41
+PYTHON_PYDEVMEM_SITE = $(call github,kylemanna,pydevmem,$(PYTHON_PYDEVMEM_VERSION))
+PYTHON_PYDEVMEM_SETUP_TYPE = setuptools
+PYTHON_PYDEVMEM_LICENSE = MIT
+PYTHON_PYDEVMEM_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
