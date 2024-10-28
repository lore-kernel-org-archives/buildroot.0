Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF83D1358F
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 01:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 618AE60BF8;
	Mon, 28 Oct 2024 01:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A8OYFG03PdDs; Mon, 28 Oct 2024 01:07:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E05760BE8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E05760BE8;
	Mon, 28 Oct 2024 01:07:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 96DA21DAA
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 823F560BBD
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:07:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ZZoM2TkhTPb for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 01:07:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 93A5060BE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93A5060BE8
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93A5060BE8
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:07:42 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-83ac05206c9so140830839f.3
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:07:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730077661; x=1730682461;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HWi63md0xnsW2G0qgQWdMSi12bQyxxJ7AIDWVOoVl64=;
 b=jIMiNOlYDG5vlN2G4e1xeWl6JipvOanKZbMerfnFrkfGn9ANgDV6o7ueLwNb77rsft
 JUkmfMa5+1WIDow2NojGxcm7L1QtxdiLoPB327PFUa/l+YETxtIwDMiStk0MftsJq4dX
 7Z+JO19I+SBPXJ4wTvg5aw8H756mM2T4r6OLUo1cyz6YeYs7r9dGl+Ss2UvnYy7opMCm
 GR0dQKCIyQy71FMJgcljpcohVNQ101GAl3oTRXKaVmz7BMZbY0uti1s53Q9GI9Kjhgm7
 pfW6CCeXRf2Nb8OEI+3r2wkBvl2MJEhC4DcrNbGDeo6Y8sbHEAk8bc3H61RYGJMyOtmd
 jywQ==
X-Gm-Message-State: AOJu0Yz3zKLD7E8JFR+2tjh12w+LQlcXAfJDftTAZe+5+dKZmlQxkqy9
 kuMOuiU6j0xsZX47vn0G9FEASgKp0ZJ6kILRE9ofj5uURg9fS3kUeNDrZA==
X-Google-Smtp-Source: AGHT+IH++1EYDyJfFzBjVK/t0Ucy4w91htglJpybeWz8cFR9qXsK8ivH5DWx0mvEJOLKCGrCFyAIdQ==
X-Received: by 2002:a05:6602:60c6:b0:83a:a82b:f855 with SMTP id
 ca18e2360f4ac-83b1c4ba8acmr555407139f.9.1730077661103; 
 Sun, 27 Oct 2024 18:07:41 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc7277f96asm1381765173.126.2024.10.27.18.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 18:07:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 19:07:39 -0600
Message-Id: <20241028010739.4125650-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730077661; x=1730682461; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HWi63md0xnsW2G0qgQWdMSi12bQyxxJ7AIDWVOoVl64=;
 b=k5/ORnJ+4vaKpn2iDXhl7MNjti7ucWEdhJfnBS+fl+mFnMN1ZN8PKpg1cQtlgKr/2y
 xvV6dJ3ZicOQQrs5dGOUl1Hu4qHSW1PuOcpqCvngYf5GHQscvbzuQ5V2tJoECGv6s0WZ
 VP4GyYyS0Qbb+VMZuhjXjlhBvIyl8L3E1Mr0xrcnVJwhaOVSuf58pTXv7PtvQYcqDfOg
 JHpMIWA4zWzF00SYBglFfdDzLhQbmoFir0+u3U7HpVSvaLZvCcaNq6n2Y4FHpIDJm4Pg
 Gf3X+fe5lYyrM2wC8DXQgYyectKAbLvT7pRhZFWiAb+jf5nyeSyYOouBkykzF++EoMlo
 8xNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=k5/ORnJ+
Subject: [Buildroot] [PATCH 1/1] package/python-werkzeug: bump to version
 3.0.6
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-werkzeug/python-werkzeug.hash | 4 ++--
 package/python-werkzeug/python-werkzeug.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
index 31972eacf2..8060e78a35 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/werkzeug/json
-md5  c69f88f79e8b84d77abd262558ccd8fa  werkzeug-3.0.4.tar.gz
-sha256  34f2371506b250df4d4f84bfe7b0921e4762525762bbd936614909fe25cd7306  werkzeug-3.0.4.tar.gz
+md5  0d13f3dbe9b08aecdebe3d9b61cc58aa  werkzeug-3.0.6.tar.gz
+sha256  a8dd59d4de28ca70471a34cba79bed5f7ef2e036a76b3ab0835474246eb41f8d  werkzeug-3.0.6.tar.gz
 # Locally computed sha256 checksums
 sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.txt
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index fa3d3cfd37..1e2567fc64 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 3.0.4
+PYTHON_WERKZEUG_VERSION = 3.0.6
 PYTHON_WERKZEUG_SOURCE = werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
-PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/0f/e2/6dbcaab07560909ff8f654d3a2e5a60552d937c909455211b1b36d7101dc
+PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/d4/f9/0ba83eaa0df9b9e9d1efeb2ea351d0677c37d41ee5d0f91e98423c7281c9
 PYTHON_WERKZEUG_SETUP_TYPE = flit
 PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
 PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
