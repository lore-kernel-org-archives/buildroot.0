Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F209CC433F5
	for <buildroot@archiver.kernel.org>; Sat, 27 Nov 2021 11:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BD1540172;
	Sat, 27 Nov 2021 11:38:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UQYwosa0nN1c; Sat, 27 Nov 2021 11:38:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59009400B9;
	Sat, 27 Nov 2021 11:38:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E9B7C1BF30D
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 11:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D80BC40162
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 11:37:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2SrIxva5K-wL for <buildroot@lists.busybox.net>;
 Sat, 27 Nov 2021 11:37:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 977CB40194
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 11:37:47 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id b187so3507162iof.11
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 03:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h9DmAXGB4RNTGkrNARW3OM9hk6LXk27LSXsJwVrjFaQ=;
 b=CfxKT/MmzAGc/UeewxGyDycxuomDIrJr5Vfp3Xq52nGg2wXXxKYUc+oUrdJMBY1rO4
 7ln699GWLxOHsytOeUWMCYey7r+ySuc11d2HKlkTqdK4vsLZcq90eMZpc3kFRaq24AfR
 J/tmdVlSmvv63kdHIBjfN5MtZp8RWr9TLfWVT+EYI9yAOVmTa7EB2Pc1+VoTfW9B7HBm
 FYf7LgVmCgoBtG2K19JzgMSExSrSBFHq3s8fI2Dk6/0HF9fUYxxg/T4g3hUbb7sVuqyb
 fYpFZpDIQyUu0RbSyl1AwSHgCIqssA4G5rhUyzoPZL9hXbNG66JKX9qvTsrQ22vcykkC
 9+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h9DmAXGB4RNTGkrNARW3OM9hk6LXk27LSXsJwVrjFaQ=;
 b=de+CCxESnkgutMMw4yFe3/Qlzn4dHrbsBz9UifZiQa9e4b0Y49doLCPfAANnVYeJVA
 Py1RkzRIxJ4JOB3YEoSZWiAal/Mfb40pzz6xyzc7YdC5+SIM2vPoit62UTv2SqgzxvA6
 dX7ucdNgwWKOO9qCayxnd4ayK/0VwD7D4YTRZ48OoHFtzg7+T/5F99CULxOUjLldvtob
 fIm2H65I2ecLF6Jl0uGNdJ/fuSDi8DKWKs8Pt+4REXAY32z90bfTotvXjhLbvkxRrd70
 +TfFzAgVA3Vt3CioiC4nooJqOdkOEZG/cv+xIzw0zppZ0NXQC+cHGPE/60rvxf7teRqj
 b/YA==
X-Gm-Message-State: AOAM533P9l+qSN3+KVcYfDK52GU2c1dMaJ8y/FUOzOgG9v/zgwaVeQTN
 QN+5IzU/OVDJmE46lUSeC0aLBv9Vz84=
X-Google-Smtp-Source: ABdhPJwLq7aaP/HwjTMM3zfKDWKwulLI8/3sIhle1GBpTWoShDulyqLAleJqvQKBZ14pME3vrTT3TA==
X-Received: by 2002:a05:6638:2727:: with SMTP id
 m39mr50866199jav.75.1638013066581; 
 Sat, 27 Nov 2021 03:37:46 -0800 (PST)
Received: from james-x399.localdomain (71-33-128-47.hlrn.qwest.net.
 [71.33.128.47])
 by smtp.gmail.com with ESMTPSA id g4sm6389435ila.78.2021.11.27.03.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 03:37:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Nov 2021 04:37:33 -0700
Message-Id: <20211127113735.2178776-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211127113735.2178776-1-james.hilliard1@gmail.com>
References: <20211127113735.2178776-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/7] package/python-zopfli: new package
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
 package/Config.in                        |  1 +
 package/python-zopfli/Config.in          |  7 +++++++
 package/python-zopfli/python-zopfli.hash |  5 +++++
 package/python-zopfli/python-zopfli.mk   | 21 +++++++++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 package/python-zopfli/Config.in
 create mode 100644 package/python-zopfli/python-zopfli.hash
 create mode 100644 package/python-zopfli/python-zopfli.mk

diff --git a/package/Config.in b/package/Config.in
index b4520f43c3..c138911eb9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1296,6 +1296,7 @@ menu "External python modules"
 	source "package/python-zc-lockfile/Config.in"
 	source "package/python-zeroconf/Config.in"
 	source "package/python-zope-interface/Config.in"
+	source "package/python-zopfli/Config.in"
 endmenu
 endif
 	source "package/quickjs/Config.in"
diff --git a/package/python-zopfli/Config.in b/package/python-zopfli/Config.in
new file mode 100644
index 0000000000..69d4b8b514
--- /dev/null
+++ b/package/python-zopfli/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_ZOPFLI
+	bool "python-zopfli"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  Zopfli module for python.
+
+	  https://github.com/fonttools/py-zopfli
diff --git a/package/python-zopfli/python-zopfli.hash b/package/python-zopfli/python-zopfli.hash
new file mode 100644
index 0000000000..92b51bdf18
--- /dev/null
+++ b/package/python-zopfli/python-zopfli.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/zopfli/json
+md5  f66b6f4132533b9b0ab8b0af757237bf  zopfli-0.1.9.zip
+sha256  78de3cc08a8efaa8013d61528907d91ac4d6cc014ffd8a41cc10ee75e9e60d7b  zopfli-0.1.9.zip
+# Locally computed sha256 checksums
+sha256  018b1cb87efdf7a04c2fcc13d57ed63f62149113fb207b27ea13430d64f13513  COPYING
diff --git a/package/python-zopfli/python-zopfli.mk b/package/python-zopfli/python-zopfli.mk
new file mode 100644
index 0000000000..95a0067b05
--- /dev/null
+++ b/package/python-zopfli/python-zopfli.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# python-zopfli
+#
+################################################################################
+
+PYTHON_ZOPFLI_VERSION = 0.1.9
+PYTHON_ZOPFLI_SOURCE = zopfli-$(PYTHON_ZOPFLI_VERSION).zip
+PYTHON_ZOPFLI_SITE = https://files.pythonhosted.org/packages/10/7d/278fd896401b0ef76e06cd42c3ce1541572d83b1c713b6786795c60a1bbe
+PYTHON_ZOPFLI_SETUP_TYPE = setuptools
+PYTHON_ZOPFLI_LICENSE = Apache-2.0
+PYTHON_ZOPFLI_LICENSE_FILES = COPYING
+PYTHON_ZOPFLI_DEPENDENCIES = host-python-setuptools-scm
+
+define PYTHON_ZOPFLI_EXTRACT_CMDS
+	$(UNZIP) -d $(@D) $(PYTHON_ZOPFLI_DL_DIR)/$(PYTHON_ZOPFLI_SOURCE)
+	mv $(@D)/zopfli-$(PYTHON_ZOPFLI_VERSION)/* $(@D)
+	$(RM) -r $(@D)/zopfli-$(PYTHON_ZOPFLI_VERSION)
+endef
+
+$(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
