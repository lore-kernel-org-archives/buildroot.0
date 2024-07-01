Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7C2C3065A
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 17:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A7A360AC0;
	Mon,  1 Jul 2024 17:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kKuta3ulWH_s; Mon,  1 Jul 2024 17:58:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32B7C60AB9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32B7C60AB9;
	Mon,  1 Jul 2024 17:58:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A408B1BF3A1
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 17:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D4CC400F2
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 17:58:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kAuDqwRwOB8c for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 17:58:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 59E22402E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59E22402E3
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59E22402E3
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 17:58:25 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-7f3ca6869d1so133665939f.0
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 10:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719856704; x=1720461504;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NxAJfEVOT6B893HAqr963PhqfaRqyGLwPkvAOSFLOGk=;
 b=gvTwmOnXchKTlRm3Uo0IvxzaxU2bJlE+K/+eZWeP4EB5KVOiJy0C+mQSLv1fNAvq2T
 hN51/NsycUuaStsvVbRYbWHqEqgBcSfwdH9iMTlsRbAO46SfocTQBIB61exnxv6PDBi7
 SA6nPpsfnWMG+QSAzXbUxFfXP884PVhDDS3K8rRgIoT0rnyLzv0bPJUNUEwhOYqNSOJ2
 wf3MUIso1r9/lajPzOLyjXQGou8BlHcjsL9IKOMXQTJpgpVUxTgLiOsB+sgZD+66faea
 bWi7aLqHAZrND7mYEflk+BMGvBGDm4TVV8JyBYFFvhEwpVzMIunf5gZV3DCX4MEyi1pG
 DUgA==
X-Gm-Message-State: AOJu0Yzynm9gfLvnt+DDw+lxSmLGr4SYj2weKEInCiFICdkVSORPU6Vt
 FTgWTg0g2qtep+4cyY7dcQos0pVEzGl1wrZjnMQxkQMKvdXyqec/7dismQ==
X-Google-Smtp-Source: AGHT+IE4ms56142TcGjkTN7TTR40fHXCzvtH9URuqguzlRBVN6fa8trL3XQER4QH7KpTvKnq+80LWA==
X-Received: by 2002:a5d:8418:0:b0:7f6:2c16:149a with SMTP id
 ca18e2360f4ac-7f62ee6e7c0mr745744339f.13.1719856703895; 
 Mon, 01 Jul 2024 10:58:23 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-7f61d2097desm211652939f.54.2024.07.01.10.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 10:58:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 11:58:21 -0600
Message-Id: <20240701175821.1731317-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719856704; x=1720461504; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NxAJfEVOT6B893HAqr963PhqfaRqyGLwPkvAOSFLOGk=;
 b=Z1KPhIDdW2F0IOveuY30IvWQrvUtsnqlORMCROSUma1muRfaXlw5hgDIrSmO8IgsBi
 6gljbiHsyaX5LGsm7dXFj27sjVE0+/ZHT81b5Y2GspgURx/IGPKo/pVIuYaJT/821Oko
 GYaC5W+SDabGqDWTvMOF8by/x5/fMS80GkEh+aVcYMUh19osnn9cDyEzONkb4pcEcfkR
 qKkWR6piveXlMUVwnRdL+gHBX5osc8nx+J2ZD+ZLScBHpGeOtE8plIoTZqtr3t4y+Dka
 CLtNhWnXvV9CEV/cc5/x+gntbhHC7BpN865ey4X9v2zoNltDrW8H5nh+PHUEkjXWwZtU
 K2dQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Z1KPhIDd
Subject: [Buildroot] [PATCH 1/1] package/python-httpcore: bump to version
 1.0.5
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
 package/python-httpcore/python-httpcore.hash | 4 ++--
 package/python-httpcore/python-httpcore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-httpcore/python-httpcore.hash b/package/python-httpcore/python-httpcore.hash
index 1623573b65..e773374c05 100644
--- a/package/python-httpcore/python-httpcore.hash
+++ b/package/python-httpcore/python-httpcore.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httpcore/json
-md5  155fbd7794ce7351b607d408cb8182bf  httpcore-1.0.2.tar.gz
-sha256  9fc092e4799b26174648e54b74ed5f683132a464e95643b226e00c2ed2fa6535  httpcore-1.0.2.tar.gz
+md5  17916ce84db1c0705af60a61bbec9061  httpcore-1.0.5.tar.gz
+sha256  34a38e2f9291467ee3b44e89dd52615370e152954ba21721378a87b2960f7a61  httpcore-1.0.5.tar.gz
 # Locally computed sha256 checksums
 sha256  fdcb59154c74cbaba16a11242f7740bea9f23d6feb5547917d8c5f94a80392a5  LICENSE.md
diff --git a/package/python-httpcore/python-httpcore.mk b/package/python-httpcore/python-httpcore.mk
index f1b3b810d7..ae29d8dc8a 100644
--- a/package/python-httpcore/python-httpcore.mk
+++ b/package/python-httpcore/python-httpcore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPCORE_VERSION = 1.0.2
+PYTHON_HTTPCORE_VERSION = 1.0.5
 PYTHON_HTTPCORE_SOURCE = httpcore-$(PYTHON_HTTPCORE_VERSION).tar.gz
-PYTHON_HTTPCORE_SITE = https://files.pythonhosted.org/packages/18/56/78a38490b834fa0942cbe6d39bd8a7fd76316e8940319305a98d2b320366
+PYTHON_HTTPCORE_SITE = https://files.pythonhosted.org/packages/17/b0/5e8b8674f8d203335a62fdfcfa0d11ebe09e23613c3391033cbba35f7926
 PYTHON_HTTPCORE_SETUP_TYPE = pep517
 PYTHON_HTTPCORE_LICENSE = BSD-3-Clause
 PYTHON_HTTPCORE_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
