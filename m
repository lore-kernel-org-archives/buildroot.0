Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73D4C0015E
	for <buildroot@archiver.kernel.org>; Fri, 23 Jun 2023 06:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA1AE60B51;
	Fri, 23 Jun 2023 06:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA1AE60B51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G_xHLMWxVxAK; Fri, 23 Jun 2023 06:33:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 061A360B2D;
	Fri, 23 Jun 2023 06:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 061A360B2D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F12091BF41C
 for <buildroot@lists.busybox.net>; Fri, 23 Jun 2023 06:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C952A41FDA
 for <buildroot@lists.busybox.net>; Fri, 23 Jun 2023 06:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C952A41FDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZW_-bxgTD6LN for <buildroot@lists.busybox.net>;
 Fri, 23 Jun 2023 06:33:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD42D41FD5
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD42D41FD5
 for <buildroot@buildroot.org>; Fri, 23 Jun 2023 06:33:49 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-780cdb2aa01so8144839f.0
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 23:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687502028; x=1690094028;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cg0jiOqjAUnUnDGHv/KIYiMRe392x2gD4VhgwJ+Dml8=;
 b=UzKhRo6szWE5V0DBMunvbNGEoZlPHCMjz8rkcmqGxyh2oA7w9p+fuJiSm1aOiNTEFM
 ijAMEAJZE+N+Dd5ThgmgTFi22aaV/oYOfNK+JoF6H/Ret0HLmjISWV7kGPmP5+t0AQy/
 XhsUNBkFuiod6kYcqVpLU2JlctOxIJMuoSmGwSOchLxdnP4WToGhp3MicJyOmLGriCoM
 /FYps/b9Xq/ruzrUXwPAF+9yyKi5g7qhNwq1+3/BdA6mrca4iFLlQv21jhok7CRfRkg2
 hcPSYmj2NjUZ/ftccdRS4gsIdHu2PuRrctbRMxgk5eXFKQM//WH79JJJso0rjXZI3NlZ
 rNbg==
X-Gm-Message-State: AC+VfDwsMbFYWVidq1+gyY7VQGyxzzIuWp4mstyUzdEW4K5CoGnkNo9d
 a5bg+Kzkzul7gzqGXeEYCBm7tJ5bgUU=
X-Google-Smtp-Source: ACHHUZ4mKgxKACskXr82i2WPYwoG/qvTytJTp4CGRYryiKvFLJ8TXd9zmDBkVidzk0yaLQkPvqoPXg==
X-Received: by 2002:a6b:1449:0:b0:780:cc8f:aa8c with SMTP id
 70-20020a6b1449000000b00780cc8faa8cmr2692560iou.10.1687502028543; 
 Thu, 22 Jun 2023 23:33:48 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-17.hlrn.qwest.net.
 [71.218.252.17]) by smtp.gmail.com with ESMTPSA id
 m17-20020a5e8d11000000b00780a5e27a27sm2296382ioj.7.2023.06.22.23.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 23:33:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Jun 2023 00:33:44 -0600
Message-Id: <20230623063344.46379-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687502028; x=1690094028;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cg0jiOqjAUnUnDGHv/KIYiMRe392x2gD4VhgwJ+Dml8=;
 b=Uy6b4JFAw9t/MBJatINttsoqma+F9IWKOgjT0NPS3AXAoBsQ/JfrJkoHHCc3KN0e1d
 XFL7grhYyqspuwTpIOWcIRy0f9fq+Vv37fsYyZFFByuVlqB+KPQINOiwG5VLMJPEDN/5
 Xbm6izWcilvDUvL6y/Nymd9gPSGJbv7xJx3SDFotwxK4kRHxM6QETpq3mTX8N7jjiijC
 aHHaBmvePfEgN6kH2qOat+audG8R5m0rnFrPNBIHgJv5mhYQtfhhB4s42oDOShiF++GB
 AKlbGB4FlQcyEWRNCEvV/KpI+RqVFaXJJIBkUcwMBXvpw502XNmkEEUp95yOVx05NP+Z
 9XOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Uy6b4JFA
Subject: [Buildroot] [PATCH 1/1] package/python-wheel: new host package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This will be required for upcoming setuptools pep517 support.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-wheel/python-wheel.hash |  5 +++++
 package/python-wheel/python-wheel.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-wheel/python-wheel.hash
 create mode 100644 package/python-wheel/python-wheel.mk

diff --git a/package/python-wheel/python-wheel.hash b/package/python-wheel/python-wheel.hash
new file mode 100644
index 0000000000..377a85c8fd
--- /dev/null
+++ b/package/python-wheel/python-wheel.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/wheel/json
+md5  ec5004c46d1905da98bb5bc1a10ddd21  wheel-0.40.0.tar.gz
+sha256  cd1196f3faee2b31968d626e1731c94f99cbdb67cf5a46e4f5656cbee7738873  wheel-0.40.0.tar.gz
+# Locally computed sha256 checksums
+sha256  30c23618679108f3e8ea1d2a658c7ca417bdfc891c98ef1a89fa4ff0c9828654  LICENSE.txt
diff --git a/package/python-wheel/python-wheel.mk b/package/python-wheel/python-wheel.mk
new file mode 100644
index 0000000000..159598fd1e
--- /dev/null
+++ b/package/python-wheel/python-wheel.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-wheel
+#
+################################################################################
+
+PYTHON_WHEEL_VERSION = 0.40.0
+PYTHON_WHEEL_SOURCE = wheel-$(PYTHON_WHEEL_VERSION).tar.gz
+PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/fc/ef/0335f7217dd1e8096a9e8383e1d472aa14717878ffe07c4772e68b6e8735
+PYTHON_WHEEL_SETUP_TYPE = flit
+PYTHON_WHEEL_LICENSE = MIT
+PYTHON_WHEEL_LICENSE_FILES = LICENSE.txt
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
