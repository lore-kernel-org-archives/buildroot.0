Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093E7C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 22:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA64A611A2;
	Thu, 28 Apr 2022 22:17:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rYaxTy8CddrG; Thu, 28 Apr 2022 22:17:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3D006119D;
	Thu, 28 Apr 2022 22:17:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8720B1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 22:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83DEF6119D
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 22:17:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 58sobUumBb88 for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 22:17:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B029561197
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 22:17:31 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id r11so2896013ila.1
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 15:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QSkHuTmRBugP+dzFUEgMtkeQ6q+1izoFeyc0lcECcOg=;
 b=BQsdrNaZkFE4PFD7rqR0J6DFS+fQHWjeKDwchUCcVCRIF5LjQblhX+uTIMCY+vX2YD
 YcmBpbz5A7QDrjRN9GnLkC3kkC1qE/Su9kVCmxI5sagQkwlDT4jYQ4OqHQY7IdeyuoIE
 17BgRH0s8SxP7DTGFDa7bBmMQ6fX+eOg7u0dvZmYZgTzlvlBR5FYlR0q4nerWK1I7oSP
 CfQww59GVYVv/es9t2JbzaoGl8U6t1iMetDJXdesYu9WYCEqrxNN6y3psPjewga5Vr77
 eO1WibBfc7PxnegrjT/x8y1APWLr08t3M5viW+jqPm+eoma+UXdGksf1jwCrxtY22CYu
 iy9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QSkHuTmRBugP+dzFUEgMtkeQ6q+1izoFeyc0lcECcOg=;
 b=N2SBCqtWm2XrstOm0qWvz33GJfQCeBI4DzzY2aZP6NfAGAzgBk4oSgG2UMmAbJ9Fnb
 2zIH2MbKWp1H08rZcktzP+YOAme15K5ZlH4P0O9q/qSgrG5QtwC9xiSw0WhB/OFku9J9
 KOv5S0u0o5vTFQm4OsxGSHHQmHXGvBTB3+FDgTsK2XOKhyx19KdYJaeFWjb1gWrJfAeU
 jcV4LyA7QTcyBQvmSCNR1K8UW6MH6Cw+Y2+hjplbRpA8FkxZzrCbkeUJ7GnA6J5bsywF
 YZ5KR5qNXSx8SSSAFatwstAH+AQpWpD42gcPaGJ39sE719b7aFqaGPPwfZJsiPFdikpY
 jLsQ==
X-Gm-Message-State: AOAM533jTqFjzVxRB1bcKuacZKNKTudOEnZSBqpp//YrZFFRn7qIcrhD
 zh/8gLFQt/uo3ilg2mYSrA3+g2LK7Do=
X-Google-Smtp-Source: ABdhPJw4Y4ckN10tON17oPe4MR9SZ7YNxg87jnV3jXT/stR4xTLktUd8ndAZoFgl571P5ng8wWOPGQ==
X-Received: by 2002:a05:6e02:1ba3:b0:2cc:4158:d3ff with SMTP id
 n3-20020a056e021ba300b002cc4158d3ffmr13976049ili.98.1651184250600; 
 Thu, 28 Apr 2022 15:17:30 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 f15-20020a92b50f000000b002cde6e352e8sm57103ile.50.2022.04.28.15.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 15:17:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 16:17:27 -0600
Message-Id: <20220428221727.1680234-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428221727.1680234-1-james.hilliard1@gmail.com>
References: <20220428221727.1680234-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/3] package/python-cryptography: migrate to
 setuptools-rust infrastructure
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

We can now significantly simplify the python-cryptography build using
the new setuptools-rust setup type introduced in the python package
infrastructure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-cryptography.mk                    | 30 +++----------------
 1 file changed, 4 insertions(+), 26 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 7714b9ad88..e3fde91c5b 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -7,36 +7,14 @@
 PYTHON_CRYPTOGRAPHY_VERSION = 37.0.1
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
 PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/3d/5f/addb8b91fd356792d28e59a8275fec833323cb28604fb3a497c35d7cf0a3
-PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
+PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools-rust
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
 PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
 PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
-PYTHON_CRYPTOGRAPHY_DEPENDENCIES = \
-	host-python-setuptools-rust \
-	host-python-cffi \
-	host-rustc \
-	openssl
-HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = \
-	host-python-setuptools-rust \
-	host-python-cffi \
-	host-rustc \
-	host-openssl
-PYTHON_CRYPTOGRAPHY_ENV = \
-	$(PKG_CARGO_ENV) \
-	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
-HOST_PYTHON_CRYPTOGRAPHY_ENV = \
-	$(HOST_PKG_CARGO_ENV) \
-	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
-# We need to vendor the Cargo crates at download time
-PYTHON_CRYPTOGRAPHY_DOWNLOAD_POST_PROCESS = cargo
-PYTHON_CRYPTOGRAPHY_DOWNLOAD_DEPENDENCIES = host-rustc
-PYTHON_CRYPTOGRAPHY_DL_ENV = \
-	$(PKG_CARGO_ENV) \
-	BR_CARGO_MANIFEST_PATH=src/rust/Cargo.toml
-HOST_PYTHON_CRYPTOGRAPHY_DL_ENV = \
-	$(HOST_PKG_CARGO_ENV) \
-	BR_CARGO_MANIFEST_PATH=src/rust/Cargo.toml
+PYTHON_CRYPTOGRAPHY_CARGO_MANIFEST_PATH = src/rust/Cargo.toml
+PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi openssl
+HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi host-openssl
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
