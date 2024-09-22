Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3D3CF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 04:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37E88605FD;
	Sun, 22 Sep 2024 04:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tQdZz1HONaya; Sun, 22 Sep 2024 04:10:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CE1F6060B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CE1F6060B;
	Sun, 22 Sep 2024 04:10:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E023D1BF263
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 04:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF7E28131E
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 04:10:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mdWI4963w890 for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 04:10:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D0E1981314
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0E1981314
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0E1981314
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 04:10:41 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-82fa0ccb0cdso141117139f.3
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 21:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726978240; x=1727583040;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8rmyr6mDOO0zcB52XbgRjuIKTN8NDYlHOcqUc3++amQ=;
 b=DYpWbBFml/tg086ZWBGoz0aA2RvoLlXT8vgOVxf9wC7Cdc8lK31qThgzK0fT5iHCTj
 eqoB7NMYqsgOH9rwd1aaI62Za9Hv9GkJ/9wW+eJMtN5lMozlymwes2QzPm7ixtt3XEvQ
 hJkwfkT20Hr+Mi9xo1kTnO/+ZySaK/AD+s8Hevd5BhWutf9f0SPSMM4hEsgI1OubzzBX
 WR32Z2vuWsfrTZrs3qfYRqHeoXLDDJyho4BVkR5j5sO3PDVjiOwISTWXRicTKJZzw0rB
 UPynk+HAROAE/hIPeqW0Evk1WcVgpNpLtAgh8dJB0e/0VxR1iIzLl+KguDZxKytAa55M
 WQNw==
X-Gm-Message-State: AOJu0Yxiuw4kwUrH7a5t0xMB8ZV1/SL69xkWBoaMaum6JFgLDD2tW2IO
 SyeCxiCeGIauSFXIRQkxl04wug4F/froZmGBhTEoKHrSyoPZNWyco+f1yw==
X-Google-Smtp-Source: AGHT+IGjYaPJfXZFOW8sUHBGazQpHmneviThm380uFscTIDUUh3NyF1QwO4pvey8DsnNJ7xE1UfDVw==
X-Received: by 2002:a05:6e02:1686:b0:3a0:915d:a4a7 with SMTP id
 e9e14a558f8ab-3a0c8c8c9b0mr68313435ab.2.1726978240242; 
 Sat, 21 Sep 2024 21:10:40 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e1b5efsm51962935ab.40.2024.09.21.21.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 21:10:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 22:10:38 -0600
Message-Id: <20240922041038.922743-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726978240; x=1727583040; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8rmyr6mDOO0zcB52XbgRjuIKTN8NDYlHOcqUc3++amQ=;
 b=OOBbouI+mgjeYDpr/2APatJ0Ko9+3kGSmvvo1DMXBy3qZPEGL3oFAM6xwBj40XBns3
 HUUseZKkNQOCNCf7bX0ej2+w/XF2lxOEPnV/nnFZ1DUqwzer+2JeiiJPReM19RttRmZZ
 sE9/qRoJ8y075BgF1sY896S5S9X8xb8balAg3FPDtBI7WdRgNdePjz61qCBDNYTk5NqR
 ucS4GS/u/puRc6QRqCFj0D5e5Ck9MUrbvzd8n8iWoF4Xp85CGTTYogAOWvznVKUSiNTM
 BaljqB4rwl73IQYlyrZ0o6kKGBtQqAgzm062FKnxpCMMsF5bU/4S2V0HaqIfyLS6JwbE
 a9Rw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OOBbouI+
Subject: [Buildroot] [PATCH 1/1] package/python-traitlets: bump to version
 5.14.3
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
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to rename/reformat:
https://github.com/ipython/traitlets/commit/1f4dc18c611622b89f46c8d92252551446c107e8

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-traitlets/python-traitlets.hash | 6 +++---
 package/python-traitlets/python-traitlets.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-traitlets/python-traitlets.hash b/package/python-traitlets/python-traitlets.hash
index 80fa8d4d44..56fc569436 100644
--- a/package/python-traitlets/python-traitlets.hash
+++ b/package/python-traitlets/python-traitlets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/traitlets/json
-md5  95b21c721316bbc06922df9d97af5158  traitlets-5.8.0.tar.gz
-sha256  6cc57d6dc28c85d5365961726ffd19b538739347749e13ebe34e03323a0e8f84  traitlets-5.8.0.tar.gz
+md5  f6e6529cca4cbe3299e3f07ce24d3fdc  traitlets-5.14.3.tar.gz
+sha256  9ed0579d3502c94b4b3732ac120375cda96f923114522847de4b3bb98b96b6b7  traitlets-5.14.3.tar.gz
 # Locally computed sha256 checksums
-sha256  3dcd47086529bf178cf7d10f35a8c188a1e9710391acecceef700898a4cf099b  COPYING.md
+sha256  2f51727d9063b54856773cb51388bdb79f2936ee4a1b692ef553d8c4201311ab  LICENSE
diff --git a/package/python-traitlets/python-traitlets.mk b/package/python-traitlets/python-traitlets.mk
index 7054557a48..f8a5e2d95d 100644
--- a/package/python-traitlets/python-traitlets.mk
+++ b/package/python-traitlets/python-traitlets.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_TRAITLETS_VERSION = 5.8.0
+PYTHON_TRAITLETS_VERSION = 5.14.3
 PYTHON_TRAITLETS_SOURCE = traitlets-$(PYTHON_TRAITLETS_VERSION).tar.gz
-PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/56/48/0eb99357330a02974d537be8e4096bc58cfac1089e3153570119ccea7a40
+PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/eb/79/72064e6a701c2183016abbbfedaba506d81e30e232a68c9f0d6f6fcd1574
 PYTHON_TRAITLETS_LICENSE = BSD-3-Clause
-PYTHON_TRAITLETS_LICENSE_FILES = COPYING.md
+PYTHON_TRAITLETS_LICENSE_FILES = LICENSE
 PYTHON_TRAITLETS_SETUP_TYPE = pep517
 PYTHON_TRAITLETS_DEPENDENCIES = host-python-hatchling
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
