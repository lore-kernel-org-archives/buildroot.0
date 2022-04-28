Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7546C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 22:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EC8940C64;
	Thu, 28 Apr 2022 22:06:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G49vHxVjXzAL; Thu, 28 Apr 2022 22:06:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF3A04055D;
	Thu, 28 Apr 2022 22:06:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 728381BF2B9
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 22:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 609214051A
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 22:06:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J3SKf8KG-K-g for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 22:06:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41BF840004
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 22:06:04 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id z18so7575924iob.5
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 15:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QSkHuTmRBugP+dzFUEgMtkeQ6q+1izoFeyc0lcECcOg=;
 b=JDuTTOdFyauuqHZKrCnF3k5oRPLLNap78pgk8fLf8mCKTSxmN1ZpxFOAnOAOBfT3vI
 qq30EzieP/m0V82LJCHtz9tKjgz9QPeXIwl1mu3+2GV4aeX9lM8M1Rxric8XNjjGDLa9
 t/qG3a+yttatuuy+sF2G4bHRh9BIQlR1gwonjB8dol2OMB4u6J4tSh0aGHbA65uViINm
 LFLEkW1Qzj6Kpa0pflf3s5YPdOIf4x7wLtATvx6rHaPCkrxPDzVFEqKzLU9f6Q5XiXD7
 SGqHFddFNSpkLVjOAjWm8Zct6GiJwYvMw72xqAIzEEvvWyc+otyYgmVTAhmtJXX6Kt9w
 mL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QSkHuTmRBugP+dzFUEgMtkeQ6q+1izoFeyc0lcECcOg=;
 b=bD8N2v6WIbEBcRbeLlOlUqVqYkhjwAs9y2ooRXGIjHn+5N9eqMhDWOLLiovarFNuO/
 fa+BOk7qS0sRCU2a+bVJJ7ApH2aG+olk2wY+Zo0F4D6oA62WU1Asru00GY8j5wlu3GcF
 kxc81HAO3dHs+p9FT2ZhYItlP49OluDW7+3POV+PBwt75h9jiBs+LMqmHYisjbnkqijV
 FKXowGIaErSxtdPTSF1CF3ZpthJAF3OfZ2SObwCRG+owKtoWPhunQIhUhRAhImj82f06
 sop0FIUcflbdCxAS7nzGm3MnJgxDXkmzHIBgNJy2uDyiRV2zoGHyZNUpjTZdyC3IEu9C
 OimQ==
X-Gm-Message-State: AOAM530FHf82Se24JoOmFbU8lV8vaKa0bAjc6cWdoLN99h6m13Umbtis
 /YAEOgARP7O/UxfEZcDpRV00tZkeByc=
X-Google-Smtp-Source: ABdhPJzmcpJy20DjnoiUtr4GTKn/5UZvEQD+RAzj1amWfja6U/CJesG9BjydrNuSiJDvXt/Hece5zQ==
X-Received: by 2002:a5d:8d94:0:b0:652:f6f0:6330 with SMTP id
 b20-20020a5d8d94000000b00652f6f06330mr14673515ioj.199.1651183563093; 
 Thu, 28 Apr 2022 15:06:03 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 123-20020a6b1581000000b00657b48baeb8sm635769iov.41.2022.04.28.15.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 15:06:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 16:05:59 -0600
Message-Id: <20220428220559.1236052-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428220559.1236052-1-james.hilliard1@gmail.com>
References: <20220428220559.1236052-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/python-cryptography: migrate to
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
