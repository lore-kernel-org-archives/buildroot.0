Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0797C3065A
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 18:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 833018145C;
	Mon,  1 Jul 2024 18:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S4NO6hGcgm6S; Mon,  1 Jul 2024 18:54:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78324816E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78324816E3;
	Mon,  1 Jul 2024 18:54:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10F881BF33C
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 18:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A443404DC
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 18:54:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1fDAVaamGrZ6 for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 18:54:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C6025404D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6025404D2
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6025404D2
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 18:54:51 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7f3d6785665so113846139f.1
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 11:54:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719860090; x=1720464890;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jtVuxMZjl3984yI/e5dUBhNUmiltMFfnPkHhdMeOI8U=;
 b=prRMSdkx/CalC/Yn8puTMeFz5/FbkHqug/DcpPGwVDEf3wK0fUHqpQtWAtwIgPlRP+
 82kfdblaGWaOPrkoqQEo+GOUjq2e3uT4FRIqepJZAkKUfzfa/f9GBula+1c/Esgf4meC
 X8I5UcC+wBO9uARozBW3kWq5Uaax4YoH4Dle3HT2YkMt2mUB5fefedizu3aa8uCR/Qtb
 95XyvUNuiQTOJnUAfdxlGYh/R8ViGm9zpumZILk+JzvWQNXXjqwsFQPe2eiK+dULVmiq
 MSwsJRqK0W2tnTECTrbAM4TVWWj7gM3dzYc5sOce/TA/OvaZi6AkfMIPEyAPiOsBMPdW
 o4WA==
X-Gm-Message-State: AOJu0Yz0OBGpmdcr6Yx8GnkyplQd9VvnFf9azFTvMRCORA3cmOIVBPhP
 cwrLR0mYlfHGOYDeQSwklTwQOUf7gFgSLmj9/eKy9T7mhcnqIkuThbobvQ==
X-Google-Smtp-Source: AGHT+IG6taJ1sgnzFisqRs9ccRm/4lcEf9JR/LtyqzKqXPe6eqEsiR2rJUo1zOEptXoOQ2htYCCcLg==
X-Received: by 2002:a05:6602:2358:b0:7f6:369f:262c with SMTP id
 ca18e2360f4ac-7f6369f328bmr603979439f.10.1719860090550; 
 Mon, 01 Jul 2024 11:54:50 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4bb73bb3680sm2316313173.2.2024.07.01.11.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 11:54:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 12:54:49 -0600
Message-Id: <20240701185449.1755932-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719860090; x=1720464890; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jtVuxMZjl3984yI/e5dUBhNUmiltMFfnPkHhdMeOI8U=;
 b=f7r9zQgYRuTp6yCXIkQbfhVMHVjPz+7o6B5Fv/Whrfsx9UFuDKYPdMx0ZHeVysgQhj
 pLcqxSbLqP2cfVH2o88p1LpkXInFAz4VSe7V0D8CFOodutKZJzsWmqM1Kmz3+SI70R/s
 jsUOyzPv52ZPziHIMJ7fW34zi3xAwn6p8Y58OSxg5FevK6EGd0WMfuBs/ec72EyEvLM3
 uTBZYDEpEiQccMIZnqBB+FWPQEfm5xMqVA29tDQ0kTRl4gGueOhVrOOYuOQg+oGvU6At
 8AWXd8wWVV76LqTaA9522qoWA1XzK3yhr0YUJZzU3IgJ9yvyrVWHZWTqev8c7mD3Q0gz
 t/sA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=f7r9zQgY
Subject: [Buildroot] [PATCH 1/1] package/python-markupsafe: bump to version
 2.1.5
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
 package/python-markupsafe/python-markupsafe.hash | 4 ++--
 package/python-markupsafe/python-markupsafe.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markupsafe/python-markupsafe.hash b/package/python-markupsafe/python-markupsafe.hash
index ec357a83ce..c6f9cd4702 100644
--- a/package/python-markupsafe/python-markupsafe.hash
+++ b/package/python-markupsafe/python-markupsafe.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markupsafe/json
-md5  ca33f119bd0551ce15837f58bb180214  MarkupSafe-2.1.3.tar.gz
-sha256  af598ed32d6ae86f1b747b82783958b1a4ab8f617b06fe68795c7f026abbdcad  MarkupSafe-2.1.3.tar.gz
+md5  8fe7227653f2fb9b1ffe7f9f2058998a  MarkupSafe-2.1.5.tar.gz
+sha256  d283d37a890ba4c1ae73ffadf8046435c76e7bc2247bbb63c00bd1a709c6544b  MarkupSafe-2.1.5.tar.gz
 # Locally computed sha256 checksums
 sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
diff --git a/package/python-markupsafe/python-markupsafe.mk b/package/python-markupsafe/python-markupsafe.mk
index 0dca997f87..b54a77365f 100644
--- a/package/python-markupsafe/python-markupsafe.mk
+++ b/package/python-markupsafe/python-markupsafe.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKUPSAFE_VERSION = 2.1.3
+PYTHON_MARKUPSAFE_VERSION = 2.1.5
 PYTHON_MARKUPSAFE_SOURCE = MarkupSafe-$(PYTHON_MARKUPSAFE_VERSION).tar.gz
-PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/6d/7c/59a3248f411813f8ccba92a55feaac4bf360d29e2ff05ee7d8e1ef2d7dbf
+PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/87/5b/aae44c6655f3801e81aa3eef09dbbf012431987ba564d7231722f68df02d
 PYTHON_MARKUPSAFE_SETUP_TYPE = setuptools
 PYTHON_MARKUPSAFE_LICENSE = BSD-3-Clause
 PYTHON_MARKUPSAFE_LICENSE_FILES = LICENSE.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
