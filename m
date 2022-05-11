Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E21C433EF
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 21:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CD5783E0A;
	Wed, 11 May 2022 21:18:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yB-lKNMSPugn; Wed, 11 May 2022 21:18:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2841D83459;
	Wed, 11 May 2022 21:18:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5BF111BF383
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 21:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44F6683459
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 21:18:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FTeQ00vnUP4I for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 21:18:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6023283449
 for <buildroot@buildroot.org>; Wed, 11 May 2022 21:18:50 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id q8so4176593oif.13
 for <buildroot@buildroot.org>; Wed, 11 May 2022 14:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rd2XWH4yITG/dHmu3ZjxQKLH6izh4uQA37L7eRm3MY4=;
 b=Rw/k8Xr16m5ibudnBV6+YI1Xudhaq6VZQZld8pFDVeO4Ft/flYN2izgOoWYWszkWtn
 eG8ONSIkDuLGWMYmjID6aeDUbEutyWC367lN6PBvIm3TaC+jv30eKbwc3GIl3ABfWKNE
 qtz6BVqfnDLSJXOH16VepU8U8h7DELYl+vDkYZs+Co0zUk4muDaoeScMmcuOAvnFubCA
 jihNu+1yy05fgSL/KQTYU8/B7uzQUNXHEW5sGR3xFSPhjvghlyEJbCG/3KTdheCFjyd3
 1PD2RdGXQlxbimLrfxdeSxP+6mwIYuiwoAM3C2ar0eHu4eHta4Yv9TcVAhPhWR2imy2y
 7gIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rd2XWH4yITG/dHmu3ZjxQKLH6izh4uQA37L7eRm3MY4=;
 b=vnnbRun3RURhmutZC7Y22TFIGnKpFpQgUQ3eedYLlTpQcKqFtIR+TVVxBqMeEJZ70D
 8mPjqKaMJAevYKt9wJIn0M0n9/XhsiqCrhihBZTzPFD0IozubAmOLHas9CXG6M7mNDmk
 C5fu5CVEjUYDRH0aYL/uzVZ7u5aUasXYTM4GvpUBnFlYS+Eg2V76/QfRDyYwP3phf7wv
 exrpxJwvjFdtypK+gXQTjNuh5gKV+Ztq1ganLp+6RyQTduaVq+9GtNInU42KfgJyyRUe
 s7GbeKdeXoQSRwgSzCt2TvlyJoNT4Gy3laGxsI5V1aw0hn/JJaFrSAHAtiJhISQZCKz7
 eXPA==
X-Gm-Message-State: AOAM531XIHjUH38PSCgP0fmI9E7866PQzrI3ySVigkqycy2bjsmSEC6h
 c2rXbXwPPJpiPkR8QBgi8XuQi3H2wsg=
X-Google-Smtp-Source: ABdhPJxeYIMV7P4Lnru00BDKcO6xnAoxGaEGqA+UWy+fYqzxJbaorS+zl/RDBJVt2NqDKjYc+3cIBg==
X-Received: by 2002:aca:6c5:0:b0:325:5bce:bbc1 with SMTP id
 188-20020aca06c5000000b003255bcebbc1mr3457638oig.221.1652303929251; 
 Wed, 11 May 2022 14:18:49 -0700 (PDT)
Received: from james-x399.localdomain (71-218-126-237.hlrn.qwest.net.
 [71.218.126.237]) by smtp.gmail.com with ESMTPSA id
 o188-20020acabec5000000b00326bab99fe5sm1133970oif.40.2022.05.11.14.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 14:18:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 11 May 2022 15:18:45 -0600
Message-Id: <20220511211845.2277928-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-rtoml: new package
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
 package/Config.in                      |  1 +
 package/python-rtoml/Config.in         |  7 +++++++
 package/python-rtoml/python-rtoml.hash |  4 ++++
 package/python-rtoml/python-rtoml.mk   | 22 ++++++++++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 package/python-rtoml/Config.in
 create mode 100644 package/python-rtoml/python-rtoml.hash
 create mode 100644 package/python-rtoml/python-rtoml.mk

diff --git a/package/Config.in b/package/Config.in
index 8892134133..741f9f9a0c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1208,6 +1208,7 @@ menu "External python modules"
 	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rpi-ws281x/Config.in"
 	source "package/python-rsa/Config.in"
+	source "package/python-rtoml/Config.in"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-s3transfer/Config.in"
 	source "package/python-scandir/Config.in"
diff --git a/package/python-rtoml/Config.in b/package/python-rtoml/Config.in
new file mode 100644
index 0000000000..410976f138
--- /dev/null
+++ b/package/python-rtoml/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_RTOML
+	bool "python-rtoml"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	help
+	  A better TOML library for python implemented in rust.
+
+	  https://github.com/samuelcolvin/rtoml
diff --git a/package/python-rtoml/python-rtoml.hash b/package/python-rtoml/python-rtoml.hash
new file mode 100644
index 0000000000..04d22ed1a4
--- /dev/null
+++ b/package/python-rtoml/python-rtoml.hash
@@ -0,0 +1,4 @@
+# Locally calculated after vendoring
+sha256  821a430ab6587bdaaf7cb95044e8e0d99c77c6aed0adce5a370045b270f7ee20  rtoml-0.8.0.tar.gz
+# Locally computed sha256 checksums
+sha256  cd5ffde80e6d3286a2e2e5f02fb2cb07b823931ca368e7c735a6c5f5aebe7103  LICENSE
diff --git a/package/python-rtoml/python-rtoml.mk b/package/python-rtoml/python-rtoml.mk
new file mode 100644
index 0000000000..9afe8c0315
--- /dev/null
+++ b/package/python-rtoml/python-rtoml.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# python-rtoml
+#
+################################################################################
+
+PYTHON_RTOML_VERSION = 0.8.0
+PYTHON_RTOML_SOURCE = rtoml-$(PYTHON_RTOML_VERSION).tar.gz
+PYTHON_RTOML_SITE = https://files.pythonhosted.org/packages/33/a6/b42d8e0e28bec9fd7fdbafb2d76db3f8578f151a669eba564d422756d909
+PYTHON_RTOML_SETUP_TYPE = setuptools
+PYTHON_RTOML_LICENSE = MIT
+PYTHON_RTOML_LICENSE_FILES = LICENSE
+PYTHON_RTOML_DEPENDENCIES = host-python-setuptools-rust host-rustc
+PYTHON_RTOML_ENV = \
+	$(PKG_CARGO_ENV) \
+	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+# We need to vendor the Cargo crates at download time
+PYTHON_RTOML_DOWNLOAD_POST_PROCESS = cargo
+PYTHON_RTOML_DOWNLOAD_DEPENDENCIES = host-rustc
+PYTHON_RTOML_DL_ENV = $(PKG_CARGO_ENV)
+
+$(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
