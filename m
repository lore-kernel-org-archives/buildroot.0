Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6CFC433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 11:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2576C410BA;
	Mon, 24 Jan 2022 11:24:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3TV5fi15GiC3; Mon, 24 Jan 2022 11:24:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F4DF410B1;
	Mon, 24 Jan 2022 11:24:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D57771BF215
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 11:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2DD0404C4
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 11:24:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wfVaYaJjOKud for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 11:24:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79989408AE
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 11:24:06 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id w7so19053724ioj.5
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 03:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wLUQLAqsaYzrPpyWSLQKejYElayiVm1akGN23JKcN5U=;
 b=dPE0ELZGQeb1MYkumy0AeRKivXBVPlQOVcPHZdV3cI03WNF0EiGyKy+7M2YATogZCq
 pTPE+syRwWNwrLWkHVd63Fq8c1WlUeN/ewotLAI2tjBjV2p6NGWNP0A5tbXMWpRYNsUx
 bsIZ4uNDfsyx+B6jCkPqX9k17mj/x32/R5achGOHIMxSalSDE4PuLmqGZ+0KujQRm0Q6
 iO/EVdye/htt5DyHze7Jv/R6LymsS2cJVkOCtoeEvuKe4zTED9cgBzMPzdSHhJUJ3t2n
 mMprDR8g3GTTDAPpjRARNyUMWBVSQ/5iFU8/+dhdA1LbEkKZgQX1vIHBr6SK7s619iz4
 umxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wLUQLAqsaYzrPpyWSLQKejYElayiVm1akGN23JKcN5U=;
 b=rUd7oSgOCjEaHbnMR/atOBrT94bxore49WygRVoDCzr2m0XsuIMefBh0iWshXonjsz
 Ey11iyhHiJDtsF40ckLtPyt1FHPdcUElCnql8IC6BvOGd2ykHRKtxYVi/8+icOpovfjt
 iAR2qvnvsg9GQM3Tlb08vVU5/qo9MLb7ArvZeTJh76Z3JpuDnrxwVTRtELZj7CpZw+hf
 rDq52lJpDnHt6tjJ2UoYGU7eKFLmv0WPQh7Mjve8ChpNQQ+7xBHSIYCJsJyyerr+clKT
 qWKkShTKciQXiy2ezd4srLymu611Fdl28SNS4Jo07ZfwFzj5aVm9oCF0jek5uVSu69J4
 MX1w==
X-Gm-Message-State: AOAM532/ELYmtJDGwr9pR/moTsvhm3Rk6uSle1+BVX1ealD7TI3aSQF9
 ldhqxScXJaKx1TLaJfX9BFD9Nk4VCv8=
X-Google-Smtp-Source: ABdhPJyf4A8zQWmjk3dp69q31OvpLeqO5T2Fyec2n1Fim7uz1RuVOhA6Yb9KBJSt8yIf6C0L3Icuag==
X-Received: by 2002:a05:6602:2b89:: with SMTP id
 r9mr7811745iov.167.1643023445426; 
 Mon, 24 Jan 2022 03:24:05 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id b21sm6569314iow.49.2022.01.24.03.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 03:24:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 04:24:03 -0700
Message-Id: <20220124112403.546605-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-terminaltables: bump to
 version 3.1.10
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update repository upstream url and add license hash.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-terminaltables/Config.in                  | 2 +-
 package/python-terminaltables/python-terminaltables.hash | 6 ++++--
 package/python-terminaltables/python-terminaltables.mk   | 5 +++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/python-terminaltables/Config.in b/package/python-terminaltables/Config.in
index 8f3c4296ed..8a387466ec 100644
--- a/package/python-terminaltables/Config.in
+++ b/package/python-terminaltables/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PYTHON_TERMINALTABLES
 	  Generate simple tables in terminals from a nested list of
 	  strings.
 
-	  https://github.com/Robpol86/terminaltables
+	  https://github.com/matthewdeanmartin/terminaltables
diff --git a/package/python-terminaltables/python-terminaltables.hash b/package/python-terminaltables/python-terminaltables.hash
index 3184f5f716..b6c95aa269 100644
--- a/package/python-terminaltables/python-terminaltables.hash
+++ b/package/python-terminaltables/python-terminaltables.hash
@@ -1,3 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/terminaltables/json
-md5	863797674d8f75d22e16e6c1fdcbeb41  terminaltables-3.1.0.tar.gz
-sha256	f3eb0eb92e3833972ac36796293ca0906e998dc3be91fbe1f8615b331b853b81  terminaltables-3.1.0.tar.gz
+md5  5467e06a1a6e24dc44e6dd241706668e  terminaltables-3.1.10.tar.gz
+sha256  ba6eca5cb5ba02bba4c9f4f985af80c54ec3dccf94cfcd190154386255e47543  terminaltables-3.1.10.tar.gz
+# Locally computed sha256 checksums
+sha256  2e1320fd337db06a3136d0f4101bd62f13249c95c5b581304f35481e979d432a  LICENSE
diff --git a/package/python-terminaltables/python-terminaltables.mk b/package/python-terminaltables/python-terminaltables.mk
index 763f82e9a2..b31ed332b6 100644
--- a/package/python-terminaltables/python-terminaltables.mk
+++ b/package/python-terminaltables/python-terminaltables.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_TERMINALTABLES_VERSION = 3.1.0
+PYTHON_TERMINALTABLES_VERSION = 3.1.10
 PYTHON_TERMINALTABLES_SOURCE = terminaltables-$(PYTHON_TERMINALTABLES_VERSION).tar.gz
-PYTHON_TERMINALTABLES_SITE = https://files.pythonhosted.org/packages/9b/c4/4a21174f32f8a7e1104798c445dacdc1d4df86f2f26722767034e4de4bff
+PYTHON_TERMINALTABLES_SITE = https://files.pythonhosted.org/packages/f5/fc/0b73d782f5ab7feba8d007573a3773c58255f223c5940a7b7085f02153c3
 PYTHON_TERMINALTABLES_SETUP_TYPE = setuptools
 PYTHON_TERMINALTABLES_LICENSE = MIT
+PYTHON_TERMINALTABLES_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
