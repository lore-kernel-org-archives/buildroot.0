Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3150DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 22:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3B16405FA;
	Sun, 23 Jan 2022 22:25:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ti5ytXwlcOW; Sun, 23 Jan 2022 22:25:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C61E14060D;
	Sun, 23 Jan 2022 22:25:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A27DD1BF2F9
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 22:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FEDD4060D
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 22:25:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iRPmy5bCrQjI for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 22:25:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D8C5405FA
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 22:25:44 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 r2-20020a1c2b02000000b0034f7b261169so1320531wmr.2
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 14:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zcRKYzZuckalgvmoSv9/TTE4PArMF+887DIxhjJbiFk=;
 b=nWZxl/wLTSM9bo5io4Mzd0gB2HqAGisRXa3aq7uqnqayf1rY8RvXQmcXw6IAgUCl2E
 Ov2st7HH1l5yR8FXRd4Wx8aFbueBZ4nfYNmDnH3nKdJPd6nDzWY0xpjyzM51l0fC9MGf
 KT/OGmE7+jARuljMTKYka33B4piy0Cbrw+g5MXeVTv5BLjrjMh/ea/3fZ9WQobt9hpHH
 eHoV+lMX0xgSSubsftsXxhAn7UBaQ6yjnVOlQELVIA2f3NnEFS8F2KEJx4+xLF53K7aw
 INpv3Ze60L04BQEWOSIAEyhv98nJyUi6X921ZUjRm8qsOLMuL/7Iv+tl7YUj0fdlrUHi
 uNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zcRKYzZuckalgvmoSv9/TTE4PArMF+887DIxhjJbiFk=;
 b=KK8ilw7Y+8q902kgDMeDYE6nt3lP1HxaPxpN06zgaqCbLlOxtMwVxiA08WK+b6AeXz
 mrsMCJa9Piy9HrawV39VXvWZG+0R133uj7UlPH8+OPpNwaSDV9M9kFN/sQDWlzuwJ4UJ
 NvKpeJ00sUUY1uFRW4rCm5cpuBUwNfOaibC2dFMk0YE1nJkP6mIGmyMc4lTN28qQkabQ
 VCOAZJWI+oWLIsQqYZTs7byKCXvn+FKTMsCnNDTcQhnkWeJwXeU8LFvGKTV0tOVkagze
 kBpCuBd7ATNaPY7AFZZN7VtNg7uzffJulbPo0k2UmNgPcT4+eWtyBGbvTRL8KX8If2/U
 fhFA==
X-Gm-Message-State: AOAM530yG/Um+mD1uAn5OWrlf1lv5R/+h9YKOAjRqHvwu3Ri/DZYgO+V
 yC+mU6p9Nm8ZnHZ+LAUPxPoNwWXSMWs=
X-Google-Smtp-Source: ABdhPJyJr12cXUAy9eYbT279DDND59B5XXu7knobJE4C6UaqH05YyAfrCLkedg1uANFr0LhE+pTECg==
X-Received: by 2002:a05:600c:3482:: with SMTP id
 a2mr9420504wmq.152.1642976742361; 
 Sun, 23 Jan 2022 14:25:42 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id c11sm4170660wri.43.2022.01.23.14.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 14:25:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 23:24:05 +0100
Message-Id: <20220123222405.789637-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pathlib2: bump to version
 2.3.6
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update hash of LICENSE.rst (LF replaced by CRLF)
- Update indentation in hash file (two spaces)

https://github.com/jazzband/pathlib2/blob/2.3.6/CHANGELOG.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pathlib2/python-pathlib2.hash | 6 +++---
 package/python-pathlib2/python-pathlib2.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pathlib2/python-pathlib2.hash b/package/python-pathlib2/python-pathlib2.hash
index 986049d9de..ebd197b62e 100644
--- a/package/python-pathlib2/python-pathlib2.hash
+++ b/package/python-pathlib2/python-pathlib2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pathlib2/json
-md5	f2bd0a363eb0f8fa0556f35c1d9e66fb  pathlib2-2.3.5.tar.gz
-sha256	6cd9a47b597b37cc57de1c05e56fb1a1c9cc9fab04fe78c29acd090418529868  pathlib2-2.3.5.tar.gz
+md5  e50a0cf94e406c5110b3aed535626e9e  pathlib2-2.3.6.tar.gz
+sha256  7d8bcb5555003cdf4a8d2872c538faa3a0f5d20630cb360e518ca3b981795e5f  pathlib2-2.3.6.tar.gz
 # Locally computed sha256 checksums
-sha256	f8e02f1a07e4c6fc59a4bee831ddde26b97064105c423b9e24340f35aaa80262  LICENSE.rst
+sha256  861f813004a151ac77024ad445794653809ddf8a7572aee7bab18d11df2ba1c6  LICENSE.rst
diff --git a/package/python-pathlib2/python-pathlib2.mk b/package/python-pathlib2/python-pathlib2.mk
index d813b77d7e..4bcfea78fb 100644
--- a/package/python-pathlib2/python-pathlib2.mk
+++ b/package/python-pathlib2/python-pathlib2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHLIB2_VERSION = 2.3.5
+PYTHON_PATHLIB2_VERSION = 2.3.6
 PYTHON_PATHLIB2_SOURCE = pathlib2-$(PYTHON_PATHLIB2_VERSION).tar.gz
-PYTHON_PATHLIB2_SITE = https://files.pythonhosted.org/packages/94/d8/65c86584e7e97ef824a1845c72bbe95d79f5b306364fa778a3c3e401b309
+PYTHON_PATHLIB2_SITE = https://files.pythonhosted.org/packages/df/16/e9d6bcf1aed52a55bc1696324ab22586716053b3e97b85266e0f3ad36bae
 PYTHON_PATHLIB2_LICENSE = MIT
 PYTHON_PATHLIB2_LICENSE_FILES = LICENSE.rst
 PYTHON_PATHLIB2_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
