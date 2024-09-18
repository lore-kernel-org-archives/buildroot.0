Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F76CDD55C
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 20:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC072400F5;
	Wed, 18 Sep 2024 20:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNt4hQsfMghe; Wed, 18 Sep 2024 20:42:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AA5B40364
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AA5B40364;
	Wed, 18 Sep 2024 20:42:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9BC4F1BF30C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6790A40364
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:42:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wnmxz44U1agT for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 20:42:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 28643400F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28643400F5
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28643400F5
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 20:42:41 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-829f7911eecso8522439f.1
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 13:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726692161; x=1727296961;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pmiJbu69ghuBelT/rVfwyD4piOGCmpP0hw+q3FoW78k=;
 b=KZ32tNlwnlLfsZpTVOgT3QPHoxclAH67WMh+1OBHW3kp/NgBEh5nRMSz/llQyP0Ud8
 Bh66Gj83U2OjJVCDTVlxAAzXonCw2uFWHE1IyDx6TDqgbs0qQqP4nYdWvAQmOBYc0mK+
 5BSOQ7mnOm8fi4naUsY6ytHW1pAPwLpIKirPtYb2nWDjLjFTXaLSw0DF2RpPPTUGmlRG
 opedKBuDXxtLMrLrSuGKriueoOPiDliXCQFSuiOVfyAMIVLVHb08yZZ29QNUqKea7nsk
 7CGx/DHgoIK5+uW9R6pj5JyGMbRezNo6AhRN0Wve5aEPyv5bnt09MdXoNh3QJVpZ0Ags
 wswQ==
X-Gm-Message-State: AOJu0Ywdpt19Dndx47HQM8BWj2gF+EV2QHKPBx6P6FJ0Y9J8JoO/Jhmx
 3wL2ZBYK1Dku1OL0IZrnVAND1JYQ0QthCIEcQ67/IbAb0HrKRcWnXPiIYOG/
X-Google-Smtp-Source: AGHT+IGa7gR0THY99b3TA1gxz7A0FKPhguHpMlTURAnW+k5oMEH8VjK+V8bx3JDxRti6B1nZZYvllg==
X-Received: by 2002:a05:6602:3f82:b0:82c:5c76:bd48 with SMTP id
 ca18e2360f4ac-82d1f996cafmr2456353539f.16.1726692160655; 
 Wed, 18 Sep 2024 13:42:40 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-831e9697887sm86429439f.1.2024.09.18.13.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 13:42:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 14:42:38 -0600
Message-Id: <20240918204238.430403-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726692161; x=1727296961; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pmiJbu69ghuBelT/rVfwyD4piOGCmpP0hw+q3FoW78k=;
 b=G5e/R3sVIRalhieenI+acDUBIJJ/4cWnykOpCfQCbJyysCW7RgkZK90yf4kGPmGq0K
 nph0Oy4Cf3J7NYkTiUU1TDw3WNoFFdXviDXSWNRi0QRkthrJUi4Wp07iSdWxpTQh4LPW
 PK8S2FqIjhf1AF2nH6GpjzXWiyRmmyt4dia5u9DnsNmP090Pq+ouM2As4ai3p3rTmf6p
 lm+bbHx7xLK4fjogT7HkRHBM725I7tEkCu4piual6QFvV8tWRLjTYqnoXcna8Nx23KOT
 MJrIpBWXz8KPl9vb5Pjwqx4ULSdrgyfkigzQ3/o9BUbyb3/e1F6RjWGdE81LStQ3YV9w
 I+HQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=G5e/R3sV
Subject: [Buildroot] [PATCH 1/1] package/python-pytest: bump to version 8.3.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pytest/python-pytest.hash | 4 ++--
 package/python-pytest/python-pytest.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest/python-pytest.hash b/package/python-pytest/python-pytest.hash
index 1d5a874238..15ac04a6ea 100644
--- a/package/python-pytest/python-pytest.hash
+++ b/package/python-pytest/python-pytest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest/json
-md5  6a85eccffeb0fa15c104f408d82ce7fa  pytest-8.1.1.tar.gz
-sha256  ac978141a75948948817d360297b7aae0fcb9d6ff6bc9ec6d514b85d5a65c044  pytest-8.1.1.tar.gz
+md5  71466867181a5a7aefdb298b7146bcad  pytest-8.3.3.tar.gz
+sha256  70b98107bd648308a7952b06e6ca9a50bc660be218d53c257cc1fc94fda10181  pytest-8.3.3.tar.gz
 # Locally computed sha256 checksums
 sha256  ca836a5f9ecca3b2f350230faa20a48fb8b145653b5568d784862df864706b9b  LICENSE
diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
index 90dc91b654..256b6954f0 100644
--- a/package/python-pytest/python-pytest.mk
+++ b/package/python-pytest/python-pytest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_VERSION = 8.1.1
+PYTHON_PYTEST_VERSION = 8.3.3
 PYTHON_PYTEST_SOURCE = pytest-$(PYTHON_PYTEST_VERSION).tar.gz
-PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/30/b7/7d44bbc04c531dcc753056920e0988032e5871ac674b5a84cb979de6e7af
+PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/8b/6c/62bbd536103af674e227c41a8f3dcd022d591f6eed5facb5a0f31ee33bbc
 PYTHON_PYTEST_SETUP_TYPE = setuptools
 PYTHON_PYTEST_LICENSE = MIT
 PYTHON_PYTEST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
