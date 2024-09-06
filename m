Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC0AE6FE30
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 16:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D949A812F1;
	Fri,  6 Sep 2024 16:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oLMdguWrtJYL; Fri,  6 Sep 2024 16:45:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7E11840AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7E11840AD;
	Fri,  6 Sep 2024 16:45:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD10C1BF97A
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 16:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA21A400D3
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 16:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BLo0ZORBA8HP for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 16:45:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 97F32400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97F32400F9
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97F32400F9
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 16:45:54 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-81f9339e534so88889239f.3
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 09:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725641153; x=1726245953;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0YijqTGorEBZ5NRtKZTU1KXF9IYh92/BBrO69I8P5sI=;
 b=FsUPocVQHEJvQJPUUnbQzT7g7xl1Rk9jxG5I3g80OjavLSUojAR2Z7dW435sF3zH9a
 kDF6uUfrgNze7chpmEJ1w2JBHDWDeQRy5gHDsetT6Ku1BNOmrg/yCA1Vw06xoK5sZUk1
 0Ynndwat7he/YTUTYfp1dy24S3LhVhXV7jnzcQQfRNyIrY3D6aS+1VYJmN/Gi4yYb63v
 iIinnY908AcFY6SyTyEGZnFPwHBz8BBaF5ZLNAjNWFePBxzoUvcnMDyQpYyX6QJg175E
 8Ut8Ed/ycG4NiCvpuRqM4KODKRObxvPMuwuX4igBh45gg/SDakvdzR9aJYu62RQHJqIt
 UmgQ==
X-Gm-Message-State: AOJu0Yy8K41g4D8Al2AjXg6IZiQ4A47WC9G4HM1cC/YBvOmpE2Xaidw4
 QCaHJ9Bu4ZF0azRVFdQs+3m4jA3C0kYhiMVpXhn9insKgQ8Ly50+vjSIOw==
X-Google-Smtp-Source: AGHT+IEHoMK+t4xrx2NDmt1SL/Ca2a8feOVO0yVhlpcpOtCMbTOO4qz5ShPGdC2RJWR4J8HLXExzmQ==
X-Received: by 2002:a05:6602:3d4:b0:82a:4c58:e1e0 with SMTP id
 ca18e2360f4ac-82a961fde77mr304558239f.12.1725641153213; 
 Fri, 06 Sep 2024 09:45:53 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ced2e93795sm4101543173.94.2024.09.06.09.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 09:45:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 10:45:49 -0600
Message-Id: <20240906164549.889058-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725641153; x=1726245953; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0YijqTGorEBZ5NRtKZTU1KXF9IYh92/BBrO69I8P5sI=;
 b=TCBYAyY3PsGZL5SKeu/YTji/TMb/h12N1BVDqNFBiFBEuZHn/LDTUH57NywTgWmbcq
 4K5pvPeyiM68PAj35NkOoIq+mZjweBPTJbKE4dtE/FbynF+RUXwOfPeh4X769RYSsFzG
 sjaJAJjdHBuETRblBRZvQOGzlqV8UrQePx2P5hlEMUKXqNEI997c7vqCt8zb7fVFaxMz
 Af+pNlUCTCebvAGyGnXZNh/1CTVSi+xrLQr7/k0WjXVFvuqmi5OsP8SfQ/DIwzq+p4YO
 oGIyabFGF4DwghrSfuyXUoZaCx4lFbeIbR916zqJ+wiIELJ8OM1/1vbR8+cZngytJjH9
 p5ww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TCBYAyY3
Subject: [Buildroot] [PATCH 1/1] package/python-asyncssh: bump to version
 2.17.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-asyncssh/python-asyncssh.hash | 4 ++--
 package/python-asyncssh/python-asyncssh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asyncssh/python-asyncssh.hash b/package/python-asyncssh/python-asyncssh.hash
index f74cbe9c83..6550b850ba 100644
--- a/package/python-asyncssh/python-asyncssh.hash
+++ b/package/python-asyncssh/python-asyncssh.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/asyncssh/json
-md5  3b22a39fa9d638b277c9441187b73c5c  asyncssh-2.14.2.tar.gz
-sha256  e956bf8988d07a06ba3305f6604e261f4ca014c4a232f0873f1c7692fbe3cfc2  asyncssh-2.14.2.tar.gz
+md5  baadd6f26ddf3164ae5ae3c09a6b4e18  asyncssh-2.17.0.tar.gz
+sha256  3b159c105aa388c1e2245c4faf483f540ada8cad99402281119100166e5edb3c  asyncssh-2.17.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  LICENSE
 sha256  68c286b0cf4507bec8922103efe861adb0bd3218003b1ec1b25e2e64bdd76bd3  COPYRIGHT
diff --git a/package/python-asyncssh/python-asyncssh.mk b/package/python-asyncssh/python-asyncssh.mk
index 1f6b9d79a2..b286fc42b2 100644
--- a/package/python-asyncssh/python-asyncssh.mk
+++ b/package/python-asyncssh/python-asyncssh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNCSSH_VERSION = 2.14.2
+PYTHON_ASYNCSSH_VERSION = 2.17.0
 PYTHON_ASYNCSSH_SOURCE = asyncssh-$(PYTHON_ASYNCSSH_VERSION).tar.gz
-PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/6c/f9/849f158fe50cdb0b1bf75009861865c9a30c3b5a0d62ad43bb5e00b10feb
+PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/32/34/007ba4c65dc15ad394ff50d6ce272bcc028a8824ab1658c5fe5c480be515
 PYTHON_ASYNCSSH_SETUP_TYPE = setuptools
 PYTHON_ASYNCSSH_LICENSE = EPL-2.0 or GPL-2.0+
 PYTHON_ASYNCSSH_LICENSE_FILES = LICENSE COPYRIGHT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
