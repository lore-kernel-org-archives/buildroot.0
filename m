Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C3FC5B549
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 17:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 437CE83C91;
	Sat, 31 May 2025 17:26:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mby_O_3sl7sJ; Sat, 31 May 2025 17:26:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 567D283D59
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 567D283D59;
	Sat, 31 May 2025 17:26:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5397C117
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50F4583D59
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:26:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TwB9ecrdqlrP for <buildroot@buildroot.org>;
 Sat, 31 May 2025 17:26:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B3D5083C91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3D5083C91
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3D5083C91
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:26:11 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.114.90]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJE27-1ua36w2BHH-00RQBJ; Sat, 31
 May 2025 19:26:09 +0200
To: buildroot@buildroot.org
Date: Sat, 31 May 2025 19:25:49 +0200
Message-ID: <20250531172549.2664496-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250531172549.2664496-1-fiona.klute@gmx.de>
References: <20250531172549.2664496-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:42T2a9C/0Q/zZh3CUeoasRjUsjKWBiiYhrTo7ESbYIYpyPm54M9
 j3qvtcaBBoNOoKXxpFwgzrhTLlFDrj0ImrWS3QEGHaBhU+KAlKeha0Ks3yf2pbAxma3q+HG
 E5WNTNSvQ4nJEKfMo9ehJjDyFgCZJ4j+19QRwyDTnqEw088HI3AHODLCifZAs7S1ekZ+4jY
 LM7LMkKzWkx6DxRPtD+VQ==
UI-OutboundReport: notjunk:1;M01:P0:NEPHv/P6o8s=;RKHC0s+Sd6rDhboIMUxXCJ4r6WD
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1748712369; x=1749317169; i=fiona.klute@gmx.de;
 bh=4rbTYW7XFWjXY5D4ON2wMgAHTsCOaP8p1ogij3csfWo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ikek4Z/hTTRJ8M+MAPDE4av8takI53B+1MvBIF4RJ+yk73rIlVDM1SvC1PSnuW19
 JTuXi5PVa8toGqbDVZ7a7C55YBSHN8qa14+aftpzhJhsx5ieOkO5sO2YbOxykfkti
 k+8TnaCJTekB0dqV/UA4mq7cShbIX6l0VO2NSycBB29FR95wOdEdxtgawQcrhVjup
 QWdacVWBdDIt29q9jampmjhjDvcLvooO8AKtOSZDQwOCjq+41FJBnWVZP49D6YN92
 BEWqaoj9lvmTuLuosg/Drl/DhQhW7XuMBYL6HY+xgmN05USQCr+RXKIgiNuzs6FrF
 JRLGxDgC/pYdAuOyCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=ikek4Z/h
Subject: [Buildroot] [PATCH next 2/2] package/python-{dunamai,
 poetry-dynamic-versioning}: remove packages
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Both packages where added as host-only dependencies to build
package/python-aiomqtt, and are not used by any other package. With
aiomqtt switching to hatchling they are not needed any more.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
I certainly don't mind these packages staying if anyone else has a use
for them, otherwise I think it's best to remove them to minimize
maintenance effort. Without the dependency from aiomqtt I won't notice
if they break.

 DEVELOPERS                                     |  2 --
 package/python-dunamai/python-dunamai.hash     |  5 -----
 package/python-dunamai/python-dunamai.mk       | 15 ---------------
 .../python-poetry-dynamic-versioning.hash      |  5 -----
 .../python-poetry-dynamic-versioning.mk        | 18 ------------------
 5 files changed, 45 deletions(-)
 delete mode 100644 package/python-dunamai/python-dunamai.hash
 delete mode 100644 package/python-dunamai/python-dunamai.mk
 delete mode 100644 package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.hash
 delete mode 100644 package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d471b9ab6f..665b74ff53 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1115,8 +1115,6 @@ N:	Fiona Klute <fiona.klute@gmx.de>
 F:	package/*/S*
 F:	package/panel-mipi-dbi-firmware/
 F:	package/python-aiomqtt/
-F:	package/python-dunamai/
-F:	package/python-poetry-dynamic-versioning/
 F:	package/python-pyasynchat/
 F:	package/python-pyasyncore/
 F:	support/testing/tests/package/sample_python_networkmanager_goi.py
diff --git a/package/python-dunamai/python-dunamai.hash b/package/python-dunamai/python-dunamai.hash
deleted file mode 100644
index 9c0fcc1810..0000000000
--- a/package/python-dunamai/python-dunamai.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/dunamai/json
-md5  5aa5f8aa470a4e8f67430b1a8a6ff801  dunamai-1.23.0.tar.gz
-sha256  a163746de7ea5acb6dacdab3a6ad621ebc612ed1e528aaa8beedb8887fccd2c4  dunamai-1.23.0.tar.gz
-# Locally computed sha256 checksums
-sha256  cd75c5564078e3aadf662a9df3d23430f4705dfeedebbd0ebbeef53998ad94a8  LICENSE
diff --git a/package/python-dunamai/python-dunamai.mk b/package/python-dunamai/python-dunamai.mk
deleted file mode 100644
index ba422f5b2f..0000000000
--- a/package/python-dunamai/python-dunamai.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# python-dunamai
-#
-################################################################################
-
-PYTHON_DUNAMAI_VERSION = 1.23.0
-PYTHON_DUNAMAI_SOURCE = dunamai-$(PYTHON_DUNAMAI_VERSION).tar.gz
-PYTHON_DUNAMAI_SITE = https://files.pythonhosted.org/packages/06/4e/a5c8c337a1d9ac0384298ade02d322741fb5998041a5ea74d1cd2a4a1d47
-PYTHON_DUNAMAI_SETUP_TYPE = poetry
-PYTHON_DUNAMAI_LICENSE = MIT
-PYTHON_DUNAMAI_LICENSE_FILES = LICENSE
-HOST_PYTHON_DUNAMAI_DEPENDENCIES = host-python-packaging
-
-$(eval $(host-python-package))
diff --git a/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.hash b/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.hash
deleted file mode 100644
index 7e0675cabb..0000000000
--- a/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/poetry-dynamic-versioning/json
-md5  d3d35766974dc0e040d73f7dcc15cc5f  poetry_dynamic_versioning-1.6.0.tar.gz
-sha256  568b728eeb7b2c4a3b818565bbaffc2128bde68ad037152d464b92975f45ce70  poetry_dynamic_versioning-1.6.0.tar.gz
-# Locally computed sha256 checksums
-sha256  cd75c5564078e3aadf662a9df3d23430f4705dfeedebbd0ebbeef53998ad94a8  LICENSE
diff --git a/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk b/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk
deleted file mode 100644
index 6ff596bca2..0000000000
--- a/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# python-poetry-dynamic-versioning
-#
-################################################################################
-
-PYTHON_POETRY_DYNAMIC_VERSIONING_VERSION = 1.6.0
-PYTHON_POETRY_DYNAMIC_VERSIONING_SOURCE = poetry_dynamic_versioning-$(PYTHON_POETRY_DYNAMIC_VERSIONING_VERSION).tar.gz
-PYTHON_POETRY_DYNAMIC_VERSIONING_SITE = https://files.pythonhosted.org/packages/d3/f9/97b14cae52513ee028f1e81aad8a44e3a8f5a5d47570b48219431e131989
-PYTHON_POETRY_DYNAMIC_VERSIONING_SETUP_TYPE = poetry
-PYTHON_POETRY_DYNAMIC_VERSIONING_LICENSE = MIT
-PYTHON_POETRY_DYNAMIC_VERSIONING_LICENSE_FILES = LICENSE
-HOST_PYTHON_POETRY_DYNAMIC_VERSIONING_DEPENDENCIES = \
-	host-python-dunamai \
-	host-python-jinja2 \
-	host-python-tomlkit
-
-$(eval $(host-python-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
