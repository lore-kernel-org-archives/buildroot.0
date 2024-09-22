Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19951CF9C68
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 07:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C765812BE;
	Sun, 22 Sep 2024 07:35:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QW4izLev-nUg; Sun, 22 Sep 2024 07:35:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31ADB812C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31ADB812C0;
	Sun, 22 Sep 2024 07:35:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 041101BF3FB
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 07:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E71C860643
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 07:35:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WXdn1HlzUjcq for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 07:35:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CEF5B6062D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEF5B6062D
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CEF5B6062D
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 07:35:48 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3a098a478c4so11049125ab.1
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 00:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726990547; x=1727595347;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1OuiBlyB4Gok7zJ2deyAZ1qD+E1DHpDxAKi/znEP2yw=;
 b=qJEXvNW5ohj1c1J3STv9OrEnxYdYJD/zxPXi81meqJ9FxGRUTNrPejh0QBvl43gd/9
 +UW3dIi+b/2tWfpNs0XdsJ0Mi4Qui94/CfqSNe+y7IgrFLm3EXNHLviPpwVH1cgILjGA
 dcrCLUDH99NjzokZYd7QMPnMrNuzoqP9VhlfW7T6qj8nN4axSSgj5y92uLiCmu1PHPq8
 Kzt4LuytP67UNoHHbwpObmAV3HodtqnSznqRbaLKUz04tTjS5lI6QHstlcRk7+85YO0x
 gmnNzXjGpDogNKRu8SIFZuEGK2MXt5fhwUXeOXkSHG8OJn2V9ZQ59q65SAAYUo9qgylW
 1l8Q==
X-Gm-Message-State: AOJu0Yxx5rnt7m1HJyN+5VSvaIzJPonzHXvuxMMmzRCA3GhJf/RwMkR+
 T8TKUyzmQB9xnM+eUzb7k2zT/CYD0oS0lq6L0/ZzVl3vIDJI8RSYqhRmmQ==
X-Google-Smtp-Source: AGHT+IEWpqcJQGKMncZbP16FrvSe85pl5lmrPIX4KW1S0MgOZAbPvQ5KXZwd+bjCeYYOgJfx7GlkDw==
X-Received: by 2002:a05:6e02:1a63:b0:3a0:9f85:d74e with SMTP id
 e9e14a558f8ab-3a0c8d0ba04mr70156215ab.16.1726990547485; 
 Sun, 22 Sep 2024 00:35:47 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e10b83sm53269155ab.31.2024.09.22.00.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 00:35:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 01:35:45 -0600
Message-Id: <20240922073545.1001216-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726990547; x=1727595347; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1OuiBlyB4Gok7zJ2deyAZ1qD+E1DHpDxAKi/znEP2yw=;
 b=XbHwBg7WvMm514PJ5q2VwOJhCHoHnGE2+kvu2a+PJ5GK2yxaKIyXLVXPnN7a24Satf
 /DUtrH3m6pwuvHA+zhIBPDwOkCR9AQ2stmgNdEp/lHh3QPMn19ErnvSOMxyeGIg3xLHe
 YbNPFJxhVDC5NgY0KiVDrFm0ZAmztEXMgdXP5u3iTPmeORP5wrtbP1GaH9iBod0Hz9QC
 ndAcI8UHZJM0udaCMK7GyyHHmBw/wTVkK3fBp6gnLchsIvIlx2LAELQjj2vHUXfHbP1P
 wFIKhyafLByfgiPlGoy6iGxrlHLXg8NvNuNstsY6raesFXG1rbLIqpLRNhXtdqUl6S5x
 vOgQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XbHwBg7W
Subject: [Buildroot] [PATCH 1/1] package/python-zope-interface: bump to
 version 7.0.3
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

Drop no longer required python-setuptools runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-zope-interface/Config.in                  | 1 -
 package/python-zope-interface/python-zope-interface.hash | 4 ++--
 package/python-zope-interface/python-zope-interface.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-zope-interface/Config.in b/package/python-zope-interface/Config.in
index 17f7aed0d9..89da056d6f 100644
--- a/package/python-zope-interface/Config.in
+++ b/package/python-zope-interface/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_ZOPE_INTERFACE
 	bool "python-zope-interface"
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	help
 	  This package provides an implementation of "object
 	  interfaces" for Python. Interfaces are a mechanism for
diff --git a/package/python-zope-interface/python-zope-interface.hash b/package/python-zope-interface/python-zope-interface.hash
index 7052f77899..940ee595d5 100644
--- a/package/python-zope-interface/python-zope-interface.hash
+++ b/package/python-zope-interface/python-zope-interface.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zope-interface/json
-md5  5a383d71156ce6f89f59a86d957a8d65  zope.interface-5.5.2.tar.gz
-sha256  bfee1f3ff62143819499e348f5b8a7f3aa0259f9aca5e0ddae7391d059dce671  zope.interface-5.5.2.tar.gz
+md5  fd1cadffe80b9a1702636826c30136f0  zope.interface-7.0.3.tar.gz
+sha256  cd2690d4b08ec9eaf47a85914fe513062b20da78d10d6d789a792c0b20307fb1  zope.interface-7.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
diff --git a/package/python-zope-interface/python-zope-interface.mk b/package/python-zope-interface/python-zope-interface.mk
index 2bada3a7d4..60cde26122 100644
--- a/package/python-zope-interface/python-zope-interface.mk
+++ b/package/python-zope-interface/python-zope-interface.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPE_INTERFACE_VERSION = 5.5.2
+PYTHON_ZOPE_INTERFACE_VERSION = 7.0.3
 PYTHON_ZOPE_INTERFACE_SOURCE = zope.interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
-PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/38/6f/fbfb7dde38be7e5644bb342c4c7cdc444cd5e2ffbd70d091263b3858a8cb
+PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/c8/83/7de03efae7fc9a4ec64301d86e29a324f32fe395022e3a5b1a79e376668e
 PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
 PYTHON_ZOPE_INTERFACE_LICENSE = ZPL-2.1
 PYTHON_ZOPE_INTERFACE_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
