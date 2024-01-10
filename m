Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587AFC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 04:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F4155426F2;
	Wed, 10 Jan 2024 04:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F4155426F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2pSfLukivVjx; Wed, 10 Jan 2024 04:36:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42B21409CF;
	Wed, 10 Jan 2024 04:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42B21409CF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A8841BF5F5
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 04:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EA5E81815
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 04:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EA5E81815
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZH-tUl6Zg482 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 04:36:15 +0000 (UTC)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 056ED80AC0
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 04:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 056ED80AC0
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3606ef221dbso20290465ab.2
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 20:36:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704861373; x=1705466173;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IR2Z67bHVriTPsolppTZFD11gOzQ1IueyQI/wAwHtLU=;
 b=Xncpe/M5ZG4yiEFEJvWfPtOL4jQnjDIsBakmPT29NUcoZ4BuPMjqB3GH6W3IohbOVL
 D7lbKXLHvKb3T5lowUlJU8j97pah0okUecaxzEJVgYEWE1mntkA9J8Neg0IC91+dLTSz
 ZpE2pZbb9NWFPa/hdIsVhi7rgCQ2N2FQ5+KoGYri+hbNsAgQ8j3uMA7PH5ijnj5KjvuJ
 PJmEmr1+HXK4uEIvAjuxdXloaZ0pWy1dc9xA931yo2E8FTrKT1PauocbvJaLKO2Z54+O
 SoxULhaEUZK/X3f6SAzGCBxSmn4qBKOqUHzQRL8Dq+Q8vEEvfqM+z+A7Wc1OEfdsP9+q
 2baw==
X-Gm-Message-State: AOJu0YyhwaJWGit+gMj/x333MIQdinpxkcm0iONP/59EoDg6w9otQwuL
 XqlvxeuiA7MJjYfGgmegIpcvc+e5fdeAVQ==
X-Google-Smtp-Source: AGHT+IF6N2Izw2nF3vePsJTPUJouBdWRvcJbC6a3ody6po/9rs7g48pgqmUEEakt0lUnEftWFjh+lw==
X-Received: by 2002:a05:6e02:1c2b:b0:35d:2f2e:f17 with SMTP id
 m11-20020a056e021c2b00b0035d2f2e0f17mr730649ilh.1.1704861373568; 
 Tue, 09 Jan 2024 20:36:13 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 ck11-20020a056e02370b00b00360882d77adsm1031419ilb.44.2024.01.09.20.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 20:36:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 21:36:11 -0700
Message-Id: <20240110043611.1074941-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704861373; x=1705466173; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IR2Z67bHVriTPsolppTZFD11gOzQ1IueyQI/wAwHtLU=;
 b=XzgYg9AjTc8OjvYraeQx+St3xcv4+mIx+REZQDtuWxPWOXUgy0Bm11ksxKyZYf6JTc
 H1ePG7hSInZ3QQD0HtGRKrRX8GfWgMDS8Q8HOCcdTHz/yzgaBZVxN2K3s9KYyrK89/jn
 I0a7WuuIYGIOjyidk/F5cKaZFMjuIXCgPISkOUTVxZmwleNjVGNN5vhJgj10kslsNfnw
 Ce5qkCCtbZG+caGPWlaWGqjAdp83PkRhM7s/YAnQ7hxQi8DEleRRM+nlqzOxXOZyrV/F
 g4N6qCreznSH+V88vXA3uiY2rR/rPc3IGajV277hffDH/oQX9zpAfa6Ny0XaRTsWhKXq
 L05g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XzgYg9Aj
Subject: [Buildroot] [PATCH 1/1] package/python-pip: bump to version 23.3.2
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
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index 9518c9d8b8..d2cc649b01 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5  f0c9fba61e9d9badcc9921062e993d84  pip-23.3.1.tar.gz
-sha256  1fcaa041308d01f14575f6d0d2ea4b75a3e2871fe4f9c694976f908768e14174  pip-23.3.1.tar.gz
+md5  38dd5f7ab301167df063405c7fc16c84  pip-23.3.2.tar.gz
+sha256  7fd9972f96db22c8077a1ee2691b172c8089b17a5652a44494a9ecb0d78f9149  pip-23.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 83a1631a2f..552b47eb7d 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 23.3.1
+PYTHON_PIP_VERSION = 23.3.2
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/1f/7f/4da15e07ccd11c84c1ccc8f6e24288d5e76c99441bf80e315b33542db951
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/b7/06/6b1ad0ae8f97d7a0d6f6ad640db10780578999e647a9593512ceb6f06469
 PYTHON_PIP_SETUP_TYPE = setuptools
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
