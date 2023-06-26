Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16204EB64DD
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 18:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87BA2418FC;
	Mon, 26 Jun 2023 18:25:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87BA2418FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vOnMTmpQYSqP; Mon, 26 Jun 2023 18:25:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 578FE418F6;
	Mon, 26 Jun 2023 18:25:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 578FE418F6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B52011BF378
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 18:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99AE2418F3
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 18:25:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99AE2418F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Di8-Ap3UX20c for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 18:24:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EA3D418F2
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4EA3D418F2
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 18:24:59 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1b058bf19ddso176093fac.1
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 11:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687803898; x=1690395898;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jncmDHtW54Olqi0K1ioREXsz7Sv5GqWhA83S3HlFWZQ=;
 b=knDR2ywv1EDue92tLaQPS2H0WkYQxOpcSYxeNPNNnOxxhB+8N0nSIVnFnUK6Oh3WwZ
 eTuJQkuViuUjf9nSXINP4JNtBWAkPgbAh8NsGdlWW+CwRSISGXnPNkzmRCicFHATPr51
 y2BHFPhFyRk0iSikCxcvoXa6kL+utf3kY11aNSY7PtKweK7+vEFb0/9kd4unJvy94sBc
 pC7O7gGsSwxvPfMUETLPvQOWG0QKz2btmnbo/n7U+YaI5tKfrGXwJVocn9RZevYFlHnn
 nXp9hQVqgs8fPavXSi22rzfhB4qLFjm5FAlibRJCTj4SnjtLpjTqZ3zfh6JVxU+OH9Xq
 WuzA==
X-Gm-Message-State: AC+VfDzVhHbV1SB5kr8Jw8WywWHD8xfsqxAnx6nhJVNatqZHYgIreg7u
 UeE2Vq4ba4HvL+OdO6r0fVzrQUNHDHI=
X-Google-Smtp-Source: ACHHUZ4RJc35PoOJDEJCYRXvxoLoKzkz9i8hikyxC6+Y5eiUeuiv3ruxc411UAk0L2L1Uh/DIaoUTg==
X-Received: by 2002:a92:d0ca:0:b0:345:8abb:5b2f with SMTP id
 y10-20020a92d0ca000000b003458abb5b2fmr5371268ila.12.1687803336934; 
 Mon, 26 Jun 2023 11:15:36 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-17.hlrn.qwest.net.
 [71.218.252.17]) by smtp.gmail.com with ESMTPSA id
 z24-20020a029f18000000b004269bbd4586sm1867653jal.77.2023.06.26.11.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 11:15:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jun 2023 12:15:27 -0600
Message-Id: <20230626181531.2312002-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687803898; x=1690395898;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jncmDHtW54Olqi0K1ioREXsz7Sv5GqWhA83S3HlFWZQ=;
 b=S+uw1zx+XhWi2NnMqgLtY6CbGBhnAhCLDZ60zBQXV0iv5/Tv14R7t5pVJyIxLPzkrZ
 3oU/hvVBB3OCNu2HHQb3oXU8cUq4/4wLAKC/60DNo0ahbRTJwv09QkchB0l7EejsXDOO
 pKU87IIG26vnqefd9la1POXlsFA8by7ovqXDZwNwvVgSmw0l7EsULtSYlQkLS6arfDMW
 JkZEYfz/EpHhV2xpQGJOUR53QE5jj3UQhtK+K0cKWNEsGNTneoZ2Blyib5Bi1fZ8miHP
 zNhZngHxMoCqwGc+zZkiVqYfBUcRW45qnCoP08g3fdUcAEd46yOWDNIesvwEEo7CQuOv
 5iCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=S+uw1zx+
Subject: [Buildroot] [PATCH 1/5] package/python-numpy: bump to version 1.25.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>, Michael Rommel <rommel@layer-7.net>,
 Samuel Martin <s.martin49@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate to meson package infrastructure.

License has changed due to date update:
https://github.com/numpy/numpy/commit/c1ffdbc0c29d48ece717acb5bfbf811c935b41f6

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-numpy/python-numpy.hash |  6 ++---
 package/python-numpy/python-numpy.mk   | 31 ++++++++++++--------------
 2 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/package/python-numpy/python-numpy.hash b/package/python-numpy/python-numpy.hash
index 9ac9280c78..6629cebbce 100644
--- a/package/python-numpy/python-numpy.hash
+++ b/package/python-numpy/python-numpy.hash
@@ -1,7 +1,7 @@
-# Copied from https://github.com/numpy/numpy/releases/tag/v1.23.5
-sha256  1b1766d6f397c18153d40015ddfc79ddb715cabadc04d2d228d4e5a8bc4ded1a  numpy-1.23.5.tar.gz
+# Copied from https://github.com/numpy/numpy/releases/tag/v1.25.0
+sha256  f1accae9a28dc3cda46a91de86acf69de0d1b5f4edd44a9b0c3ceb8036dfff19  numpy-1.25.0.tar.gz
 # License files, locally calculated
-sha256  0f88787955e7131224f53a8c3f3e859dc502408e3a539a4dcf61fb7888b5b984  LICENSE.txt
+sha256  1034d3bd61783f3b5e7ec3e7ca818f4da4135132323a0ef99f4c0edb3c7f6bd2  LICENSE.txt
 sha256  c27d0a8026bdb8876562b720ab24d1688e3827a89f6083cd6e7e8caa9584aba3  numpy/core/src/multiarray/dragon4.c
 sha256  fbc539f47d0cf83bc61378080fb873d5c14630126cacbfe754035c3926daa5ec  numpy/core/include/numpy/libdivide/LICENSE.txt
 sha256  a14cc25e10d40a3aa705b7de2fb764a6535d8ee9b2db4e1724900585457dfd55  numpy/linalg/lapack_lite/LICENSE.txt
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 812bfdae4a..ad64a0cc6b 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_NUMPY_VERSION = 1.23.5
+PYTHON_NUMPY_VERSION = 1.25.0
 PYTHON_NUMPY_SOURCE = numpy-$(PYTHON_NUMPY_VERSION).tar.gz
 PYTHON_NUMPY_SITE = https://github.com/numpy/numpy/releases/download/v$(PYTHON_NUMPY_VERSION)
 PYTHON_NUMPY_LICENSE = BSD-3-Clause, MIT, Zlib
@@ -15,30 +15,27 @@ PYTHON_NUMPY_LICENSE_FILES = \
 	numpy/linalg/lapack_lite/LICENSE.txt \
 	tools/npy_tempita/license.txt
 
-PYTHON_NUMPY_SETUP_TYPE = setuptools
-PYTHON_NUMPY_DEPENDENCIES = host-python-cython
+PYTHON_NUMPY_DEPENDENCIES = host-python-cython python3
 HOST_PYTHON_NUMPY_DEPENDENCIES = host-python-cython
 
+PYTHON_NUMPY_CONF_ENV += \
+	_PYTHON_SYSCONFIGDATA_NAME=$(PKG_PYTHON_SYSCONFIGDATA_NAME) \
+	PYTHONPATH=$(PYTHON3_PATH)
+
 ifeq ($(BR2_PACKAGE_LAPACK),y)
 PYTHON_NUMPY_DEPENDENCIES += lapack
+PYTHON_NUMPY_CONF_OPTS = -Dlapack=lapack
 else
-PYTHON_NUMPY_ENV += BLAS=None LAPACK=None
+PYTHON_NUMPY_CONF_OPTS = -Dlapack=""
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
-PYTHON_NUMPY_BUILD_OPTS = --fcompiler=gnu95
-PYTHON_NUMPY_ENV += F90=$(TARGET_FC)
+ifeq ($(BR2_PACKAGE_OPENBLAS),y)
+PYTHON_NUMPY_DEPENDENCIES += openblas
+PYTHON_NUMPY_CONF_OPTS += -Dblas=openblas
 else
-PYTHON_NUMPY_BUILD_OPTS = --fcompiler=None
+PYTHON_NUMPY_CONF_OPTS += -Dblas=""
 endif
 
-define PYTHON_NUMPY_CONFIGURE_CMDS
-	-rm -f $(@D)/site.cfg
-	echo "[DEFAULT]" >> $(@D)/site.cfg
-	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
-	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
-endef
-
 # Fixup the npymath.ini prefix path with actual target staging area where
 # numpy core was built. Without this, target builds using numpy distutils
 # extensions like python-scipy, python-numba cannot find -lnpymath since
@@ -55,5 +52,5 @@ PYTHON_NUMPY_POST_INSTALL_STAGING_HOOKS += PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FIL
 # in the staging area.
 PYTHON_NUMPY_INSTALL_STAGING = YES
 
-$(eval $(python-package))
-$(eval $(host-python-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
