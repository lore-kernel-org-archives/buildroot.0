Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D19CC4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 15:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFBC760D88;
	Fri, 10 Nov 2023 15:58:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFBC760D88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s5HAs0VFGuVQ; Fri, 10 Nov 2023 15:58:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1C296174F;
	Fri, 10 Nov 2023 15:58:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1C296174F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F7321BF37B
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 15:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 761E342038
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 15:58:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 761E342038
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1JWgT6MsvTF4 for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 15:58:32 +0000 (UTC)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93EA742244
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 15:58:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93EA742244
Received: by mail-pf1-x441.google.com with SMTP id
 d2e1a72fcca58-6c396ef9a3dso2060363b3a.1
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 07:58:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699631911; x=1700236711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4RxTYYAZVetyVk5yuYIjwnXPFOf6P4LCrZZujCJE/kc=;
 b=ByCr1xnVJsWHBBByGNqDIYg5hxr7mKX67MspZQ7Qzkti5yVr5DoWSQFr2h61r4kFAY
 Jv74nwdNRCkSE8IgCj8RW4RQnMpfZWsWUB4qEiptQM27E3scBXWJvPQwR2bCsgEV1T82
 mQNVfI/VHYg6wVm2/Bk2vf1hAGdtlGYEyAVL1/xOwaiblIKe2Ha4sjVlqff4Czc9d3YQ
 B6xlxhID16LlYursY3ZvWclloKCzSNmbOq2v03K0iKEvwoSmgfHip58iDc8nKuC0+9FA
 DMTVCN0k0f27XLuOMuo1XbTOTcMc2uVq5bx+oi9oJFFeJKHop5Zi8DnFbVbmW69rJk+Y
 uA/g==
X-Gm-Message-State: AOJu0YzS+jRsEfQ+qZuiByQ7kZHIZAAh5KM2smymNeEJGZZm5p5RIk8R
 DOmDOiL3Hm24WS4eXQ2lLpmuyixTlQoswY2MyvYSAQRmM48=
X-Google-Smtp-Source: AGHT+IHaV9xuPgwIWdKOMrIBN6JxHAoyLnHiV9L1fOXukh4bpYo6kg7PpgaWAcmqTxgn4TRmH57jvQ==
X-Received: by 2002:a05:6a21:7185:b0:181:1cfa:4106 with SMTP id
 wq5-20020a056a21718500b001811cfa4106mr10576926pzb.62.1699631911576; 
 Fri, 10 Nov 2023 07:58:31 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.106])
 by smtp.gmail.com with ESMTPSA id
 p55-20020a056a0026f700b006c2d53e0b5fsm12796153pfw.57.2023.11.10.07.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 07:58:30 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 08:58:20 -0700
Message-ID: <20231110155826.10416-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231110155826.10416-1-adam.duskett@amarulasolutions.com>
References: <20231110155826.10416-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699631911; x=1700236711;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4RxTYYAZVetyVk5yuYIjwnXPFOf6P4LCrZZujCJE/kc=;
 b=DVWC7437TXs2ud8j0TkYol3X00sQW3386WT4PY6brMacy62sN3j51QDia8+7Tb1nQ0
 gBdL7agU3uMhqdebEqwrUbDha+CK+EUIwOum/FJTI1MTQF+73/qtF3YThK0/MwZyYgM3
 zyXdrWOpW2Ub6LkqjxmBbbGRmptsKMLqjzgU8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=DVWC7437
Subject: [Buildroot] [PATCH v3 1/7] package/python-systemd: bump version to
 235
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove the "# Should be kept in sync with $(SYSTEMD_VERSION)" line from
python-systemd.mk, as this package is not updated on a regular basis and does
not keep up to date with systemd.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Remove the "# Should be kept in sync with $(SYSTEMD_VERSION)" line.

 package/python-systemd/python-systemd.hash | 4 ++--
 package/python-systemd/python-systemd.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-systemd/python-systemd.hash b/package/python-systemd/python-systemd.hash
index 789b48590d..6cc6639218 100644
--- a/package/python-systemd/python-systemd.hash
+++ b/package/python-systemd/python-systemd.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/systemd-python/
-md5  5071ea5bcb976186e92a3f5e75df221d  systemd-python-234.tar.gz
+md5  93f3ca09f35719ca6a4edd1d62d38dd4  systemd-python-235.tar.gz
 # Locally computed
-sha256  fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7  systemd-python-234.tar.gz
+sha256  4e57f39797fd5d9e2d22b8806a252d7c0106c936039d1e71c8c6b8008e695c0a  systemd-python-235.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.txt
diff --git a/package/python-systemd/python-systemd.mk b/package/python-systemd/python-systemd.mk
index 3ccfd57ce5..fdc5d7e278 100644
--- a/package/python-systemd/python-systemd.mk
+++ b/package/python-systemd/python-systemd.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_SYSTEMD_VERSION = 234 # Should be kept in sync with $(SYSTEMD_VERSION)
+PYTHON_SYSTEMD_VERSION = 235
 PYTHON_SYSTEMD_SOURCE = systemd-python-$(PYTHON_SYSTEMD_VERSION).tar.gz
-PYTHON_SYSTEMD_SITE = https://pypi.python.org/packages/e8/a8/00ba0f605837a8f69523e6c3a4fb14675a6430c163f836540129c50b3aef
-PYTHON_SYSTEMD_SETUP_TYPE = distutils
+PYTHON_SYSTEMD_SITE = https://files.pythonhosted.org/packages/10/9e/ab4458e00367223bda2dd7ccf0849a72235ee3e29b36dce732685d9b7ad9
+PYTHON_SYSTEMD_SETUP_TYPE = setuptools
 PYTHON_SYSTEMD_LICENSE = LGPL-2.1
 PYTHON_SYSTEMD_LICENSE_FILES = LICENSE.txt
 PYTHON_SYSTEMD_DEPENDENCIES = systemd # To be able to link against libsystemd
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
