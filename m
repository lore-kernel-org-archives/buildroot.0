Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A478FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 21:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56FBB40A6E;
	Mon, 16 May 2022 21:50:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3nMWnPJnUtlg; Mon, 16 May 2022 21:50:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E95934048F;
	Mon, 16 May 2022 21:50:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2189D1BF35A
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 21:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F02E418F8
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 21:50:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YKm6i2GvihC0 for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 21:50:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F072E418F7
 for <buildroot@buildroot.org>; Mon, 16 May 2022 21:50:20 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id z18so17489122iob.5
 for <buildroot@buildroot.org>; Mon, 16 May 2022 14:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mwm+Q1u3WGwXFglwMXAywTWJ/IrkUuXf7VtjVbvqejE=;
 b=Io2wwYQsAIuHgpN5kO2lIhtVB7dZEECsrrrqZsuvm8ywZT1hdLNH7TSK6yPW+/oTnl
 9apwiZZIQMLaxFPs0N0NcHG9ZsS8pqeWN5T5DMu4yBMRKQKjQMFYTH/xjZlf9okupcWE
 f1JOolunCn3TL/L8OHGTGxHY8dRHwWiAPory9gR7sPBAFWS1zbWo4sXnLnYrhIEXpbqb
 qj9Andx67sb/IF7YB2glR4DCbIOoATDlOg2bmMj5ALXjb4qDYv3sT0E3E4VSUd297kxv
 LIRP0IqiwPc7qINbb/2HrQhHyxuSA5NXbSQZFLwBpeivz/AATgrwqJ2xlyZe4E/8Ay38
 PCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mwm+Q1u3WGwXFglwMXAywTWJ/IrkUuXf7VtjVbvqejE=;
 b=JMP0a+AB5TDlK0O2UYk7q2huGn2FcubSJ/JXsHopywV4FZT+xQFlkhRSiVQYDW0qqv
 Hna8tstfLiSJuVDbE6FwztTaTWsZ2pZqsd/MqAeFh0TyDuf9KL6wCjZgQTzBI6CtJduA
 yU8nj0hNiW4tsMz4RVYOXa0UgaS10ubsgmxEP6ZQLn6XAN1VdnXt5Ppr6xXyp+ERmEXH
 vMuVOr0a+7lFyzaivWydnYJBtTlF1tYnMR8lmLv9q86IQ1IVEWP/h3GQPvSCUsgvHV5J
 rQtKQqPrrE62YPWLmoysYnB9mvfa6kYiPWemdlOMvQs3QxTqGoZ5MuESGRxAOxZwPjWG
 c3hw==
X-Gm-Message-State: AOAM532gK1tDHOn+rgcKQnex342d9QSOrIcj1zoimht9XaW5SwJdRcdF
 iSvStGWpLffKhHoJICJkpzpoi82zjsM=
X-Google-Smtp-Source: ABdhPJwRSRir0wZEZgdl+UvzfORCu693wcstdn5R058Rdflpm6ymQCcgzlz3vvCYryW176YoiM20Sw==
X-Received: by 2002:a05:6638:1515:b0:32b:eb62:97c8 with SMTP id
 b21-20020a056638151500b0032beb6297c8mr10740674jat.61.1652737819837; 
 Mon, 16 May 2022 14:50:19 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 n29-20020a02715d000000b0032b3a7817d8sm3055496jaf.156.2022.05.16.14.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 14:50:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 15:50:14 -0600
Message-Id: <20220516215015.4107253-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/2] package/python-maturin: new package
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
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is pep517 pyo3 build backend that's an alternative to
python-setuptools-rust.

Note that maturin itself uses python-setuptools-rust for
bootstrapping.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Tested-by: Graeme Smecher <gsmecher@threespeedlogic.com>
---
Changes v2 -> v3:
  - update to 0.12.16
  - migrate to new python-setuptools-rust based bootstrapping
Changes v1 -> v2:
  - update patch comment to backport as it is merged upstream
---
 package/python-maturin/python-maturin.hash |  5 +++++
 package/python-maturin/python-maturin.mk   | 25 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 package/python-maturin/python-maturin.hash
 create mode 100644 package/python-maturin/python-maturin.mk

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
new file mode 100644
index 0000000000..8f86311d60
--- /dev/null
+++ b/package/python-maturin/python-maturin.hash
@@ -0,0 +1,5 @@
+# Locally calculated after vendoring
+sha256  91be78b43e737323a0946069a9582acbff6a0692523e016838b7fb09c1c55ee4  maturin-0.12.16.tar.gz
+# Locally computed sha256 checksums
+sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
+sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
new file mode 100644
index 0000000000..5584dd7e06
--- /dev/null
+++ b/package/python-maturin/python-maturin.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# python-maturin
+#
+################################################################################
+
+PYTHON_MATURIN_VERSION = 0.12.16
+PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
+PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/79/b4/db1e3df1d05c42f0de29e2227ee17190c95f6724fcea47436c5f5e86ff53
+PYTHON_MATURIN_SETUP_TYPE = setuptools
+PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
+PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
+HOST_PYTHON_MATURIN_DEPENDENCIES = \
+	host-python-setuptools-rust \
+	host-python-tomli \
+	host-rustc
+HOST_PYTHON_MATURIN_ENV = \
+	$(HOST_PKG_CARGO_ENV) \
+	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+# We need to vendor the Cargo crates at download time
+PYTHON_MATURIN_DOWNLOAD_POST_PROCESS = cargo
+PYTHON_MATURIN_DOWNLOAD_DEPENDENCIES = host-rustc
+HOST_PYTHON_MATURIN_DL_ENV = $(HOST_PKG_CARGO_ENV)
+
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
