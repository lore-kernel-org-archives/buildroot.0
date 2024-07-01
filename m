Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D457C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 17:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26C4C6077E;
	Mon,  1 Jul 2024 17:38:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J2w7qXvE0tqO; Mon,  1 Jul 2024 17:38:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A20260AA4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A20260AA4;
	Mon,  1 Jul 2024 17:38:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D1301BF342
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 17:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B0B260AA4
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 17:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E5xpNzJi3CVh for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 17:38:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5802D607E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5802D607E4
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5802D607E4
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 17:38:18 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-7f3c878d6d4so135616139f.0
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 10:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719855497; x=1720460297;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pVakg8lsrrv4iHCPG8r99j/YnDGO2IUBAOcxdzM9WB8=;
 b=XlokcTXTeD+5cYAcuG0KMMXlYyPUqK5ZCnk8gN9556gbNwPOCili2o5zk5HMkAwQtd
 4f/Nw1gQR0hzdNEu5HkZfUhXLyjZv/NVo3xCgCIPLSO+RYUekhnz5uhzsfY0kAzfm5Bo
 BBNrfq+nb2/twfMIWT041bDVEuwgi+RZHbN5zcAY/p9vI8nhMWb9VX5UndseZaoiN92f
 SFPOZ+s+mKE51QaaqRWbWI2VUSO6bp/4XITm+hWmEl41gTHSjoGZBSNCNRIKhrnor/UG
 g9cxUNaUUZASuuGwF1jvTdQMgq9EKODMju9PIlS1LfT+JIi27WPzEsKyOL/5ljJ/ho61
 veOQ==
X-Gm-Message-State: AOJu0YzB2p27YtV5DSBtxWnl2oJ8V/zk2xvrVJ72Ja4FPeFUj3ey5HHX
 HyBoJLJhtSVzj65uGOKMXe0c1wbGxRXriYO4tBFWXkWPuFowUvLm/Qn+Tw==
X-Google-Smtp-Source: AGHT+IFKsJqp216WFk8FyS6P1rKsMsgkgvnFVYYgNpsCIcOO6+KomdQaXBZYRXeJDuJbwmNhcKWRqg==
X-Received: by 2002:a6b:4f12:0:b0:7f3:d924:8612 with SMTP id
 ca18e2360f4ac-7f62ee86a33mr777215039f.15.1719855496962; 
 Mon, 01 Jul 2024 10:38:16 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4bb73f96e89sm2251451173.117.2024.07.01.10.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 10:38:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 11:38:13 -0600
Message-Id: <20240701173815.1725948-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719855497; x=1720460297; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pVakg8lsrrv4iHCPG8r99j/YnDGO2IUBAOcxdzM9WB8=;
 b=KsiDniHfslchFj04d/rJBUOpv+3V05ngEUZe7wtASK3MjAY8HIGDCavCRC8JFvZupp
 wZABqL/Sa3rEQUS1fV4dijKoL1pM3FoImgkzzULbvrUyvhf88mmQDDjNm0HdvhqyUxIb
 IhiYIK9oGp/muYRSlJo4z4oKsxl1auTKvKCoelVN7GWCH3pZuWjbz9nzNP3WP70KeNLx
 s8cST63opBWB5dcDZtjYbZyz3wscnJb6iX+CDgzAzJtOiv/ni+yDG3BnxC+YtFFrWS+s
 r/SfpBtpyTcLGCknruS9VRkxyp/eyabC7FK9jzCZ1rVzZxB9XeAX88XoJEi7qAC9C7vg
 I78w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KsiDniHf
Subject: [Buildroot] [PATCH 1/3] package/python-starlette: bump to version
 0.37.2
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index 03d77cf5be..f04aaea7c0 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  0a1e026d653dc448ae07f47eefe1dc8b  starlette-0.36.3.tar.gz
-sha256  90a671733cfb35771d8cc605e0b679d23b992f8dcfad48cc60b38cb29aeb7080  starlette-0.36.3.tar.gz
+md5  b0ba8178dd4bf2cdff53c8702212be52  starlette-0.37.2.tar.gz
+sha256  9af890290133b79fc3db55474ade20f6220a364a0402e0b556e7cd5e1e093823  starlette-0.37.2.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index 9d137f5f5a..af2c2d4ac7 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 0.36.3
+PYTHON_STARLETTE_VERSION = 0.37.2
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/be/47/1bba49d42d63f4453f0a64a20acbf2d0bd2f5a8cde6a166ee66c074a08f8
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/61/b5/6bceb93ff20bd7ca36e6f7c540581abb18f53130fabb30ba526e26fd819b
 PYTHON_STARLETTE_SETUP_TYPE = pep517
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
