Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73076C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 19:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D504740124;
	Mon,  6 Dec 2021 19:31:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VY5gmCzf0Gxi; Mon,  6 Dec 2021 19:31:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6AC340453;
	Mon,  6 Dec 2021 19:31:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E54D1BF29A
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 19:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A2D684B87
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 19:31:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id acdZkCkMJIbp for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 19:31:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61F6D80C6C
 for <buildroot@busybox.net>; Mon,  6 Dec 2021 19:31:32 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso105502wml.1
 for <buildroot@busybox.net>; Mon, 06 Dec 2021 11:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OoDCVbH3mGYJmxpoUjT5iLVWuSc0nGnI8XZco9URU0M=;
 b=ipBSKXXo6AI5Xv72HDMP6FTxB+7NpQvIaSjXOkZ2YbyGTyLpWQlOHUmQM+Mrv7FGpb
 WWsvnVcRGKBhipIltrsBdLkpGpsSPtqdL/wIoEIXSe9+osMSGA6R36UZ0HDOjl15kZ4E
 pzKMx83XCN7PmqHRHc35PHvy8h6lC558b16yBKNo9eFeCT3SQj3394rEWrk5aq7BdMt9
 MVD9KHdHNKqwSfJkyqCxRCZWtWtO05VMhSgiRliSwAO2Sys8hJyLrpPgICfDNHvCVFfY
 0kGwh1kmkqhirgk+94VLJqKbyvIIqNgpPv6e5B62VcdwFX8hNkb2QlUVgXAgzUqGh/IG
 f21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OoDCVbH3mGYJmxpoUjT5iLVWuSc0nGnI8XZco9URU0M=;
 b=UOnO3nEGTVEQVO18Nf/b1Zik0RXMvmUQyqkquUqiJ/EQ/fSLkdn35cwJOtGP9x2HwE
 O5awqxV5lYtI8k3dxkiiTJGk2jv7dJr18+jtB83bu2SY2d1IW8J4eFnBkcscmyN2lmym
 rBJDXc5gpCu7M5H2rVW95R1fJ95W4Rf76pOSsQE22s+/XnCVyRvhgooFBnqmXk/GS6s6
 u5s8NTANlPGBWAQD1BL5q3/qWNaTyidNUl81c54p/tvgBgN9w+gLwgPBDkYj9yFeBq+j
 Gtgp472FPwH4o2lMNppm022MxtlKx8M5phwzAd3siXVrBMGdetMY9RbJEf2MgndE99+c
 6ktg==
X-Gm-Message-State: AOAM530UHOZ/pWJCoKDzD6bWWtXZD4PU9O1D0PDlFOwTl0+dZsqD6l6s
 z9eVW2Mk048EHhIBj1mT/UHxE3lmBJ0=
X-Google-Smtp-Source: ABdhPJyhODSZ2omPjIRs9yK2CKGPrbmjvs/C9J9SGuYUPkguojluIV9b/gwp9xy3y8TihKJdMicmPA==
X-Received: by 2002:a1c:7907:: with SMTP id l7mr729636wme.72.1638819090559;
 Mon, 06 Dec 2021 11:31:30 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id f15sm332265wmg.30.2021.12.06.11.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 11:31:30 -0800 (PST)
From: guillaume.bressaix@gmail.com
To: buildroot@busybox.net
Date: Mon,  6 Dec 2021 20:31:08 +0100
Message-Id: <20211206193109.21218-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] package/python-pybind: fix upgrade to
 version 2.6.1
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
Cc: yann.morin.1998@free.fr, "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>

The python 'setup.py' script needs header files
in $(@D)/pybind11 to work since v2.6.1, and these
files are generated by an internal minimalist cmake build.

Fixes
   http://autobuild.buildroot.net/results/b89f1de64b308dffa73675f1f31ccb0b7be5a10d
   http://autobuild.buildroot.net/results/d0287b7f64f206b0f074908c5780a3632e0cb799
   http://autobuild.buildroot.net/results/27efb545a5a719a5581c8f746d3a3555ff4216ce
   http://autobuild.buildroot.net/results/d2f0a0ad8f6c7178517df109e7d885dac9134c3a
   http://autobuild.buildroot.net/results/b57e9a3279260dae4a590f9421238fcabb2f7cab
   http://autobuild.buildroot.net/results/515e6f2fc6b5780260d98d6bb52b541ce4bf1afe
   http://autobuild.buildroot.net/results/d89c4ecc81222d4f80c951da2232d2e393fa1c69

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

---
This remains a python-package.

'python setup.py' actually hardcodes a system call to cmake now,
which seems dirty at first. But if we have a cmake env when they
do that, the install variables are passed and installation
is smooth. They probably introduced this call to make setup.py
self sufficient, as most people install this package from 'pip'.

---
 package/python-pybind/python-pybind.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index a6a1bdb976..bfd7f6f59a 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -9,5 +9,12 @@ PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
 PYTHON_PYBIND_LICENSE = BSD-3-Clause
 PYTHON_PYBIND_LICENSE_FILES = LICENSE
 PYTHON_PYBIND_SETUP_TYPE = setuptools
+PYTHON_PYBIND_INSTALL_STAGING = YES
+
+# every single 'python setup.py' call actually calls cmake
+# internally, to populate $(@D)/pybind11 with build requirements.
+# If we have a host-cmake env at that moment, 
+# then the final installation paths are properly defined
+PYTHON_PYBIND_DEPENDENCIES = host-cmake
 
 $(eval $(python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
