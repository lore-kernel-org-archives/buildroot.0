Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A613ECF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 06:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBA714011C;
	Sun, 22 Sep 2024 06:10:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wW_JZj6wVr_6; Sun, 22 Sep 2024 06:10:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83BEA402E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83BEA402E4;
	Sun, 22 Sep 2024 06:10:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CA721BF575
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 585A2402E4
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:10:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I7VjXAxk6T6w for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 06:10:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E3F44011C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E3F44011C
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E3F44011C
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 06:10:42 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-39f526fd19bso12435465ab.1
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 23:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726985442; x=1727590242;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DRdEij34MdSBcrnQtp/PEYZDyCNEsI4lMew7BJT15oM=;
 b=VmllcySaBCR8lqEj4c+DIaWTAYf+tumQETKywGElC3/e+0fgDj9PEo4bjqmM2/F/p/
 7JuYnwKuy9KXu0ujHhAg1ayH0Wlq/Z40EubKy9h/+kVun0n+V7+zlHdffPq+vYCLz3O4
 gVH43zma13X33NIU55OQ1+a+nQJDJh58xLsFX/ACyWwlfxYvUOtZV7PnBnqL8w3BABjS
 EhQwcIHmFm+DZb7gbTPHq4iycWs2EQb29K6pTcBba/bCHagSW8XLGBv0fKXX2Uol6xnb
 yuuxRwI7MQvwiO2bNDbYtmLPxMy7mEzNzcbWP/Kp9kHqFqc+BmxOTWMkAFV5+AMNyMAU
 ERLQ==
X-Gm-Message-State: AOJu0YyeNShxRKINrFJTfpzyEEX6TEOPqUHfiMg3PVNtvo+Fad9urTtM
 a5J3IuaI2O+8y8/O8G1mx4uyjwuy94w3F7dhs89nyGuXyHhbYQo3YKjNLw==
X-Google-Smtp-Source: AGHT+IEwQQG15i5pjYFaYBooNStySuBo4WoSX17dLlqnW7FUtI0ItooU3SXQA2UO5UX/wz0Ti3jSJw==
X-Received: by 2002:a92:c261:0:b0:3a0:4d72:7f5e with SMTP id
 e9e14a558f8ab-3a0c8ca4694mr72447665ab.7.1726985441683; 
 Sat, 21 Sep 2024 23:10:41 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec3d1dbsm4499009173.81.2024.09.21.23.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 23:10:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 00:10:39 -0600
Message-Id: <20240922061039.958914-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726985442; x=1727590242; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DRdEij34MdSBcrnQtp/PEYZDyCNEsI4lMew7BJT15oM=;
 b=kSkIDyByYJi+A9pTALbEa/8SG84DnNX2B1yzD+ya/Wq7kqky/aWRZPIcUVGYbzpzex
 7CCu1cFCwBoIIDdyP7IzM9LHvQG78wG6Jzqg6+QsUtQcJIXv/pS+B2LtvdINFP9SkwIm
 4vP50KdLKuNs+FLLWEQWDZSmM8o782v8itTo/574Ptfguq0C3UcpH8c98uNJvAsMP9i+
 28070nDuQGUcnzvr5udGrakqN2hmrRb6nluwlclj/xeIRA0YjZc2s3iVI4kl8putXLjv
 tjvFz4Imyakgw+025lTtlPI5hSdEI//nn5Beo5t0T22WkbxuH5feA9kPhc/xJQSuW6Y7
 fDBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kSkIDyBy
Subject: [Buildroot] [PATCH 1/1] package/python-urwid: bump to version 2.6.15
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-typing-extensions runtime dependency.

Add new python-wcwidth runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-urwid/Config.in         | 2 ++
 package/python-urwid/python-urwid.hash | 4 ++--
 package/python-urwid/python-urwid.mk   | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-urwid/Config.in b/package/python-urwid/Config.in
index f584a9258d..573d71f1c9 100644
--- a/package/python-urwid/Config.in
+++ b/package/python-urwid/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_URWID
 	bool "python-urwid"
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	select BR2_PACKAGE_PYTHON_WCWIDTH # runtime
 	help
 	  Urwid is a console user interface library for Python
 
diff --git a/package/python-urwid/python-urwid.hash b/package/python-urwid/python-urwid.hash
index aad6f6f672..4804555b22 100644
--- a/package/python-urwid/python-urwid.hash
+++ b/package/python-urwid/python-urwid.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urwid/json
-md5  324cf0f877a5bc7b7d2de7d7f36b13ee  urwid-2.6.10.tar.gz
-sha256  ae33355c414c13214e541d3634f3c8a0bfb373914e62ffbcf2fa863527706321  urwid-2.6.10.tar.gz
+md5  73e4171e00a673afbc1eb32eaf7d31e0  urwid-2.6.15.tar.gz
+sha256  9ecc57330d88c8d9663ffd7092a681674c03ff794b6330ccfef479af7aa9671b  urwid-2.6.15.tar.gz
 # Locally computed sha256 checksums
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/python-urwid/python-urwid.mk b/package/python-urwid/python-urwid.mk
index d7943a8b5c..66b067a20c 100644
--- a/package/python-urwid/python-urwid.mk
+++ b/package/python-urwid/python-urwid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URWID_VERSION = 2.6.10
+PYTHON_URWID_VERSION = 2.6.15
 PYTHON_URWID_SOURCE = urwid-$(PYTHON_URWID_VERSION).tar.gz
-PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/8e/74/8c2082f2b07a72ff5d2438447c13a70f0cbede73584e0a262c166a30785c
+PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/85/b7/516b0bbb7dd9fc313c6443b35d86b6f91b3baa83d2c4016e4d8e0df5a5e3
 PYTHON_URWID_LICENSE = LGPL-2.1+
 PYTHON_URWID_LICENSE_FILES = COPYING
 PYTHON_URWID_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
