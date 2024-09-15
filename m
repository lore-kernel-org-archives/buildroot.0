Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3D9C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 07:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17A3881E9F;
	Sun, 15 Sep 2024 07:40:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dLZMZcy-zdNj; Sun, 15 Sep 2024 07:40:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28B8181EA0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28B8181EA0;
	Sun, 15 Sep 2024 07:40:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA8391BF282
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9E1481EA0
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GOf-jERD5NAW for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 07:40:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AFE1F81E9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFE1F81E9F
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFE1F81E9F
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 07:40:41 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-82ce1cd2026so117921739f.3
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 00:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726386040; x=1726990840;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PSpTDAMt2d1IRQe8677qk9jm9aHhyBBc3S/IisbJwNI=;
 b=gpuYKrOySlMIgJB1n8HMO4K7cx2nRokMZsSamUPjCJljZ9wXy3wf40O0xBe8ad07QQ
 uKzwvkilAtnWyjL3lSnooNxm+7KvC+tyXrGgDq40LTQTj4+xQptiXuAjvF/l5DN7Xgzz
 KQMa/pB0QBsIjTC70Vql3JZU8qcH5P8cVVqNVGitF12kKGk6qGOoNLtcFnZJEiMuZImH
 IBIgUELP0KBVYEIkn1HR27w6W36rIDbsCK7Fxw+JP5VBZMe4E/W3RWWYFm+Y9XXLhhI2
 WQv2qF47rutf08hSA9uhXLZe44c5f8X6hyNM/KXEyeeC4MJiIMxfjdjKnXTAN/zRJbkd
 777Q==
X-Gm-Message-State: AOJu0Ywm7ePQMI7jDdl+x3S8+kqZk58tZMe/xwhyCpevtd61SivuPoCf
 klI5cI7VZGP12nOMeMS+EOiCB8OHMsT8Ltw3+6icjzL/U/T8cIQAEGKPNw==
X-Google-Smtp-Source: AGHT+IGYA8QgOnWNa3mf3oniGjAjbBsu1bQpx7OOOg3nu31sYxzzn4lePgdoMKHBB2HNcBQsX7Megw==
X-Received: by 2002:a05:6e02:b2f:b0:3a0:8059:54e5 with SMTP id
 e9e14a558f8ab-3a0848f867fmr114049395ab.13.1726386040279; 
 Sun, 15 Sep 2024 00:40:40 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ebf484asm813578173.33.2024.09.15.00.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 00:40:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 01:40:37 -0600
Message-Id: <20240915074037.1553687-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726386040; x=1726990840; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PSpTDAMt2d1IRQe8677qk9jm9aHhyBBc3S/IisbJwNI=;
 b=IDN2s4i2y4fPvvlj3bJV58/XwZU9ViUDR3FPQt8Pl2H6wc+GMrq8gFHs6p4zqfJlmV
 H39thHFm9uWdYYerh6xOYS7etTrjmqq56FMCn2QySA0gFpaaOi2YvrWwDNluYDAqhQ6W
 fr9FaZrZEv1XaI2EXmARv237bmORahFcFaGRFhzfqu5Z+8Vx033eiewRNX6ce/xRx2Qp
 q7zLpYBZ9t42WPr1HwoPAiEGl3Vgp+AY4ltHK+6ixTtUlrXfcSRd+MvsfpY9ABt7uExa
 js5908uVI24jnjw54vXRxB+rtfoytzN7/pR8Lpg/yI8aeWKsvghMkELgp21Y30vQ5ueJ
 AHsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IDN2s4i2
Subject: [Buildroot] [PATCH 1/1] package/python-grpcio-reflection: bump to
 version 1.66.1
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
 .../python-grpcio-reflection/python-grpcio-reflection.hash  | 4 ++--
 .../python-grpcio-reflection/python-grpcio-reflection.mk    | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.hash b/package/python-grpcio-reflection/python-grpcio-reflection.hash
index d17087d4bb..756884db1c 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.hash
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio-reflection/json
-md5  f93b042f8092cf1818f249518668a78a  grpcio-reflection-1.60.0.tar.gz
-sha256  3f6c0c73ba8f20d1420c5e72fc4dd0389fac346ed8fb32a28e6e1967b44fff35  grpcio-reflection-1.60.0.tar.gz
+md5  1e431e1e665891fe5bf985f1772ad05d  grpcio_reflection-1.66.1.tar.gz
+sha256  dbc39d2ccce82bf13046b145b97bc9542b3b26419a848ae64a5b72634ded14ca  grpcio_reflection-1.66.1.tar.gz
 # Locally computed sha256 checksums
 sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.mk b/package/python-grpcio-reflection/python-grpcio-reflection.mk
index b3d2fdffa8..d51316c250 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.mk
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_REFLECTION_VERSION = 1.60.0
-PYTHON_GRPCIO_REFLECTION_SOURCE = grpcio-reflection-$(PYTHON_GRPCIO_REFLECTION_VERSION).tar.gz
-PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/33/3a/e257225b8fd9f05d2af3e363459f0d074ca684438667892ea3215e2162ca
+PYTHON_GRPCIO_REFLECTION_VERSION = 1.66.1
+PYTHON_GRPCIO_REFLECTION_SOURCE = grpcio_reflection-$(PYTHON_GRPCIO_REFLECTION_VERSION).tar.gz
+PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/f1/1c/8930a313a4cd60198921cedd4f6c2c88c282280780eb41995ddd980d6de9
 PYTHON_GRPCIO_REFLECTION_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_REFLECTION_LICENSE = Apache-2.0
 PYTHON_GRPCIO_REFLECTION_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
