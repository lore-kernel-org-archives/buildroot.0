Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8633BC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 08:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A1154190B;
	Tue,  9 Jan 2024 08:14:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A1154190B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S5W0x4eAYQrJ; Tue,  9 Jan 2024 08:14:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6363941907;
	Tue,  9 Jan 2024 08:14:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6363941907
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A13F1BF2F4
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 08:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42A0460EC7
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 08:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42A0460EC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A_y5XUxu76Sj for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 08:14:42 +0000 (UTC)
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3EC6060BB4
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 08:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EC6060BB4
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3606dda206aso16175095ab.3
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 00:14:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704788081; x=1705392881;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FAFmf44KrN545TkW7N9reRsYC4UPdDAHO2ZVM+DUDmA=;
 b=GxyImDlYuZihjsZDyFHv84mYBa167tgqxh9SQNBYsbg89bNZQ3c6sqRa43ia8PN8UC
 42/wMQvNMCKslaFNWEdNM9WBGHCd7mZ9FjdoG9QPNj94+T6rVk4tPt5nKbl1PKENVOBv
 f06ZnCi7kfOQdZjsEmPBtkLmr0gue2VNGHJnkz48tldBbioO+2Ps496wWNFi8SP5A3ba
 SDVgb9veNzMeFPXSw/A0eQxNWnKVMjR6E/RjnCAbeQXq4aHYvvaVWRMtRZDEOuHZlsWO
 pNKyzNm1DSAlLcFXq5j+Z0cbup+WppR6hfoJhRirSDFdi5LoQx2H81b2lRpOoryCD2TY
 KrfA==
X-Gm-Message-State: AOJu0Yw66on0CrsUfJ75sbIboktdj3jhqK8WToRWb+9fUGowby1xL3HJ
 x7RV15x5NuJLUQFkbgrl0efKyqckh2V/Iw==
X-Google-Smtp-Source: AGHT+IFxw9QtWbli1uANdYRDQdvlVK8bYKNUnBSqC3oQJ/Ph7LyS0yxi7BF+Yk3cKJU2ukgtukByJA==
X-Received: by 2002:a05:6e02:214f:b0:360:8e4:4f78 with SMTP id
 d15-20020a056e02214f00b0036008e44f78mr7807835ilv.15.1704788080927; 
 Tue, 09 Jan 2024 00:14:40 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 k9-20020a056638370900b0046e121aa412sm509168jav.43.2024.01.09.00.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 00:14:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 01:14:38 -0700
Message-Id: <20240109081438.4068105-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704788081; x=1705392881; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FAFmf44KrN545TkW7N9reRsYC4UPdDAHO2ZVM+DUDmA=;
 b=VD+tHjbJD/ZIVh985bGxObGGUh6LsVisIs8t0i5wj2bMQ+lWXCWxIsqwRvvvygnl84
 L0LVrsVHlE9e7cXv5GXE7dhr8uLxvU0/6SVj/JW5dJmr+uUvWFLu7PlVbpzvgy6OhWyp
 /lFPOLhYXL4Rj06mRuVpUcSPO8faiViClHPiAbjO5ocApVueUetA37kfPZj07z0QynIk
 jzhOn9213KqnpLNc9qGI623j4tA37YW8Rw0jfCybufGEKUlfUnLvXDP3LA2/S41Y4/el
 T19Zbx4DRzcIpVNahuEDu4PqTWHgabunBZK6ZKNzLXEE3nu5/x+gyY/AihpqWWmhjoc8
 pvaA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VD+tHjbJ
Subject: [Buildroot] [PATCH 1/1] package/python-httpx: bump to version 0.26.0
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
 package/python-httpx/python-httpx.hash | 4 ++--
 package/python-httpx/python-httpx.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-httpx/python-httpx.hash b/package/python-httpx/python-httpx.hash
index fc4a68cf51..26e39fcc6d 100644
--- a/package/python-httpx/python-httpx.hash
+++ b/package/python-httpx/python-httpx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httpx/json
-md5  f4dcf1002b2116c634a53534ce9d6776  httpx-0.25.2.tar.gz
-sha256  8b8fcaa0c8ea7b05edd69a094e63a2094c4efcb48129fb757361bc423c0ad9e8  httpx-0.25.2.tar.gz
+md5  3785c8a8930a7c7280206f79c170658f  httpx-0.26.0.tar.gz
+sha256  451b55c30d5185ea6b23c2c793abf9bb237d2a7dfb901ced6ff69ad37ec1dfaf  httpx-0.26.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec59d544f12b5f539a3a716fd321ac58ccd8030b465221f2c880200cdf28d8d  LICENSE.md
diff --git a/package/python-httpx/python-httpx.mk b/package/python-httpx/python-httpx.mk
index 88166ad242..cbc9c9298b 100644
--- a/package/python-httpx/python-httpx.mk
+++ b/package/python-httpx/python-httpx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPX_VERSION = 0.25.2
+PYTHON_HTTPX_VERSION = 0.26.0
 PYTHON_HTTPX_SOURCE = httpx-$(PYTHON_HTTPX_VERSION).tar.gz
-PYTHON_HTTPX_SITE = https://files.pythonhosted.org/packages/8c/23/911d93a022979d3ea295f659fbe7edb07b3f4561a477e83b3a6d0e0c914e
+PYTHON_HTTPX_SITE = https://files.pythonhosted.org/packages/bd/26/2dc654950920f499bd062a211071925533f821ccdca04fa0c2fd914d5d06
 PYTHON_HTTPX_SETUP_TYPE = pep517
 PYTHON_HTTPX_LICENSE = BSD-3-Clause
 PYTHON_HTTPX_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
