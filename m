Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA05D5E37A
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 19:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE95380F35;
	Sat,  9 Nov 2024 19:02:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8lda9yWfkGoE; Sat,  9 Nov 2024 19:02:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADAE780EF4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADAE780EF4;
	Sat,  9 Nov 2024 19:02:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD5B5D8F
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 19:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE6AE403CE
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 19:02:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8bBqJ5aa0wPl for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 19:02:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A431F403B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A431F403B4
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A431F403B4
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 19:02:32 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-83b2a41b81cso122357839f.0
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 11:02:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731178951; x=1731783751;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+GVbj2GHkzFZmeCNfUGPTvDg5u2o+Z7TmHjOOGlqsVQ=;
 b=Ny/HbzrxQ7hMAb9xQglVyAHJOD4D1uAUkwckBoY+d8Tc/HXwZJ0PoC7dvHydHVd/jf
 UdHEvYrOB6vcnpIetIwWpR7RxSHKmwjLwjPVOU4qI+SPP4rS+Tpw9gDUkIEv2S5D/LxA
 PqsqK523z8FHiSpwN3gFIuzkXqhKxctLIqtpNdHt/TyR5HS/omBw1vqSWycrv0H1vVl6
 7MIoBgphClBloL7D11b5Mpdb5knMdvo4ZZJfHHYQ341oaE0YQJaSOE9gcWfVHcG/b2Fz
 WNhxXpfll2veQkmw46WPfIXaSOApLICvUOpFL5Fg6axOmbyb1k4P5KvknsEbYTYI+6z6
 RQLg==
X-Gm-Message-State: AOJu0YzMxErrU9BxZP+0yWxsdeBuf9UuYGSY6UlokD9RahcG2k14LYQ5
 cYyuV3CJotk6I7sOe4zpr+91/O4+o1eKSHyaEXJ2IatHReCb5pRA/7M12A==
X-Google-Smtp-Source: AGHT+IFAER6wpsqriNx+Sm4pXnvX3bgAgRxAqEiNdSwWXCzPdhd/17njbAqVyVVzcmL8qklks5vrbg==
X-Received: by 2002:a05:6602:1403:b0:83b:2c8e:ba with SMTP id
 ca18e2360f4ac-83e03370619mr848922539f.14.1731178951401; 
 Sat, 09 Nov 2024 11:02:31 -0800 (PST)
Received: from james-x399.localdomain (71-33-148-91.hlrn.qwest.net.
 [71.33.148.91]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de787d6d15sm450115173.82.2024.11.09.11.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 11:02:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Nov 2024 12:02:29 -0700
Message-Id: <20241109190229.776096-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731178951; x=1731783751; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+GVbj2GHkzFZmeCNfUGPTvDg5u2o+Z7TmHjOOGlqsVQ=;
 b=CR8emZsX9Ee5DGDO9vi2l+sF1nQD8oa1p+f77JXt44u3NCzD8M7MDf6ol2AjDYXtn/
 tf8uJeHU2k3lYgZ2oCcU/gUN/ccDY2yBd+qb4Rn7Fc7uGLnwQw/sNNN8QwMsc87t3XGy
 SNeRmLq102jQFLFp7X3Fy01LINgIBn+cbK1Bl3twnHxS/jdi3T2Mk+w20pq8HgzXURwI
 raC6Ye6A+yFBAI7Es+DQb5LkYR3CVV81Tsg4jPPe955qnOfsnOTlMdUPFZbBxiHcq/ls
 cQLSA/+eFxQmz/DuPUakbYq26JPw/IjVgAM2hDB62NT99WqMMFPWhPTt1iCAupcIMtWq
 8M3w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CR8emZsX
Subject: [Buildroot] [PATCH 1/1] package/python-pysnmp: bump to version
 7.1.13
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
 package/python-pysnmp/python-pysnmp.hash | 4 ++--
 package/python-pysnmp/python-pysnmp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pysnmp/python-pysnmp.hash b/package/python-pysnmp/python-pysnmp.hash
index 050d92b70d..1081f44512 100644
--- a/package/python-pysnmp/python-pysnmp.hash
+++ b/package/python-pysnmp/python-pysnmp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysnmp/json
-md5  801dca4e3d0b58aeece4fa3be83b3cca  pysnmp-7.1.8.tar.gz
-sha256  03d88f0ba21e0357ad58c9566d369dd6123b5b628840f91001d40c0f5b658933  pysnmp-7.1.8.tar.gz
+md5  ce0165cfb056a1c71f6b4fe73044cae9  pysnmp-7.1.13.tar.gz
+sha256  535b275e6703e37d5a65328ee32ece2d28c876482f83de781785b550b1f5cfe3  pysnmp-7.1.13.tar.gz
 # Locally computed sha256 checksums
 sha256  4954453957449b5e6f797d070f4d91024dceb3e056c99d72350795b71db0fc70  LICENSE.rst
diff --git a/package/python-pysnmp/python-pysnmp.mk b/package/python-pysnmp/python-pysnmp.mk
index 2703833ffa..a1d03f785c 100644
--- a/package/python-pysnmp/python-pysnmp.mk
+++ b/package/python-pysnmp/python-pysnmp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSNMP_VERSION = 7.1.8
+PYTHON_PYSNMP_VERSION = 7.1.13
 PYTHON_PYSNMP_SOURCE = pysnmp-$(PYTHON_PYSNMP_VERSION).tar.gz
-PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/e9/af/f9e379bd9e607fd289b6cef13d633667c4d213f8c1519a86f61eed09731f
+PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/d2/de/b766b1dc85e02c99835e05518d5efe9b2f1c875d406079584b4799d02db9
 PYTHON_PYSNMP_SETUP_TYPE = poetry
 PYTHON_PYSNMP_LICENSE = BSD-2-Clause
 PYTHON_PYSNMP_LICENSE_FILES = LICENSE.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
