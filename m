Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFA6C001DF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 13:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4D3740260;
	Tue, 25 Jul 2023 13:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4D3740260
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NMUWIcsZ1AmG; Tue, 25 Jul 2023 13:08:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98BE54094B;
	Tue, 25 Jul 2023 13:08:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98BE54094B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A8471BF317
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43E3981F86
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:08:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43E3981F86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4_4AAzKGDM-O for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 13:08:12 +0000 (UTC)
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 654EA81F08
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 13:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 654EA81F08
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-785ccf19489so278827239f.3
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 06:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690290491; x=1690895291;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R/ZyoGjfC7Cn5MAcp6ufn+3LEGjcXaFOlfoX8+oHo9o=;
 b=R00Mi/f9BnqWTKZVNgKvLcOs5EBy2s59mnhgpbAlmI9/2xwtRFes1xw6Mc9KtmQF9U
 Lyl9DFD4Wp3xF+JlpoPCf9AZd4V0nwrzq11kDLX2dCITBUUp5ES4UyZXu8rIl2yZvQ+x
 1dE4ueTZt3L8pMSHYiwddyQzttzb8KXHEwezSMIFatGTAWL6m+QAGKfaacv0By4giF9X
 xPn3Rh8WM+wXUoMc64VPekLonyJLBOdQwCJkWh2kBL2uklHPb+3w+cFc4JmNNfYt0igC
 qOhhdb5vVUa7pkICz3DHH9Pxzc1cldP6dd1RN2BPL6/Imhn/OuBTQO44Ke/rpwqUq0+C
 h78w==
X-Gm-Message-State: ABy/qLZeh5tOV9OX6R9v0aXz47T+CcppwFm/dwf+6s4EfiplR9PcHVtV
 6CdWWIKO0XrSYSNcofEZuDvT5PT2t8s=
X-Google-Smtp-Source: APBJJlF/dWDYe+09hTe0gFProcgQp/Vfigf9uj/mUjQUkGSXC+EbynXONp2oA+a21MQiTJVEYjSIew==
X-Received: by 2002:a05:6602:2010:b0:787:1a8f:1d08 with SMTP id
 y16-20020a056602201000b007871a8f1d08mr2776531iod.15.1690290490899; 
 Tue, 25 Jul 2023 06:08:10 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-134.hlrn.qwest.net.
 [71.33.156.134]) by smtp.gmail.com with ESMTPSA id
 cg7-20020a0566381bc700b0042baffe832fsm3694211jab.101.2023.07.25.06.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 06:08:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 07:08:07 -0600
Message-Id: <20230725130807.127107-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690290491; x=1690895291;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R/ZyoGjfC7Cn5MAcp6ufn+3LEGjcXaFOlfoX8+oHo9o=;
 b=naY+nPooOpOEGJ7eqbpsAPUmhuRVjoPsNQQIrbnwE8WmUfqEQQrc87qjBiLypjvZEa
 i4juADTOdLLAQRvoXB7ztjczfxduCQAvhXrfpUzp2ODw8mmL1cXmWnqoHMuVqDe0gNn7
 MmwR4JT5AOPBf6gLJb34SDEGFRXcmamHvvwxv839H73vkKQ7QVA6jS2HBtX0pTxuYuUW
 rpyaa9GY7chraGTpLwGvKnDCCMC4pYhYaBpQ2Bu+Q5Z6ruh/9eVt/HTHkG92Ug+hm71q
 KdcL6dW8c0DZuYNlxjfLwmrCj0U6LKnQ7Wr+EyFlh4UOPtxzEA5C2RnP/bhRynr96Ijy
 KdxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=naY+nPoo
Subject: [Buildroot] [PATCH 1/1] package/python-aioconsole: bump to version
 0.6.2
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

License hash changed due to formatting change:
https://github.com/vxgmichel/aioconsole/commit/2b7fbb2a73f94154d6b10cf695c681fa1fdcf263

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aioconsole/python-aioconsole.hash | 6 +++---
 package/python-aioconsole/python-aioconsole.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aioconsole/python-aioconsole.hash b/package/python-aioconsole/python-aioconsole.hash
index 8770d55932..b8237ed76c 100644
--- a/package/python-aioconsole/python-aioconsole.hash
+++ b/package/python-aioconsole/python-aioconsole.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioconsole/json
-md5  3e58234291434cb33cbb6396323918ad  aioconsole-0.6.1.tar.gz
-sha256  520313bc5d7ed6bea3baf072ce7e622479afd67c01b3fdcc076bc528da354f6f  aioconsole-0.6.1.tar.gz
+md5  0f7e4db85113d1ffdc5f0fa1dc0a37de  aioconsole-0.6.2.tar.gz
+sha256  bac11286f1062613d2523ceee1ba81c676cd269812b865b66b907448a7b5f63e  aioconsole-0.6.2.tar.gz
 # Locally computed sha256 checksums
-sha256  fe3eea6c599e23a00c08c5f5cb2320c30adc8f8687db5fcec9b79a662c53ff6b  LICENSE
+sha256  e1c0ad728983d8a57335e52cf1064f1affd1d454173d8cebd3ed8b4a72b48704  LICENSE
diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
index 5641254f5d..602564c290 100644
--- a/package/python-aioconsole/python-aioconsole.mk
+++ b/package/python-aioconsole/python-aioconsole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCONSOLE_VERSION = 0.6.1
+PYTHON_AIOCONSOLE_VERSION = 0.6.2
 PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
-PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/27/a2/4bbeecceb6786a058e92469686ae1b7d3a616b3f5b99e00b96c3064349e2
+PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/5f/14/e5c634fad6a95ffd602fbbd1aa107f05a8ffb79d33ec0d0477f3b137f8a9
 PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
 PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
 PYTHON_AIOCONSOLE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
