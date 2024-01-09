Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA03C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 08:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8924418F9;
	Tue,  9 Jan 2024 08:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8924418F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2EZfgLvMfLZC; Tue,  9 Jan 2024 08:05:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35165418CD;
	Tue,  9 Jan 2024 08:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35165418CD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E33321BF2F4
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 08:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5D7C60ED9
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 08:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5D7C60ED9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ep5bgoJvElGe for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 08:05:50 +0000 (UTC)
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D595660EC7
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 08:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D595660EC7
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3608402ab93so11953895ab.0
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 00:05:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704787548; x=1705392348;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xIng+rauCx1AZeuwvyvMZRuyIqUfucMKLeaXPdijTcY=;
 b=oQtZmFCOIpAqN1WjckQSQIMo6AQur6CIiyOnOhiVs0q0cQH47hXuCK35DhN6Km0T1G
 vIYqZ+Lx3v/tgV5nc1SpoIFhrHTHQf2vQCynl/k5cTzub9/gV82no4zh4mUEizBNNBNS
 xwEyEVbV+0+BBkykfE4NWFYaoEO3J/bBvONYQaWYv8amH5fjgejGPnt5Qv/Dq6SPFcAW
 tGBzo5HEqOe9EHf/p/c3k8acSnFDBZh6DiOBWDol+q94TaUP2ke4C2gnP6p7CnetD5IR
 FgFWSUnU3oMAt0ahXGZBavCjTczK2q+m97MvAOMCzIaVdpGEHLsH12hvqqjrYInlH0GH
 DkWQ==
X-Gm-Message-State: AOJu0YwxZmczfVzeQIPHMskunPTWBdRrz2sWWg+dxZniTN3lo9/k6rym
 wbBflrjSrkd9Z/T4997aT7r3XXr18PO6aw==
X-Google-Smtp-Source: AGHT+IHd+FyhGlrKFrJIBIRdtqIONsc9rBFuAsYs8mVw78PApy4G1EhVk5/lE+ZgynATqjrG7AzMBg==
X-Received: by 2002:a05:6e02:1445:b0:360:7bff:df56 with SMTP id
 p5-20020a056e02144500b003607bffdf56mr6217998ilo.22.1704787548452; 
 Tue, 09 Jan 2024 00:05:48 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 bc4-20020a0566383cc400b0046e3cdfc9dbsm77721jab.166.2024.01.09.00.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 00:05:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 01:05:46 -0700
Message-Id: <20240109080546.4062850-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704787548; x=1705392348; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xIng+rauCx1AZeuwvyvMZRuyIqUfucMKLeaXPdijTcY=;
 b=loFDeDo27aHO9kF51FtDHZ9lKKc9RNAntQP4vkivnTGc/ymFTSMLgErEqwPdabr1Cl
 dG6RlMI1V8MMhXnTGn88NUr5jYarRyAmY0gk9kTqZRghpwtdgSO+/5CvH7FWWxvdTHfb
 YxPLPl4Z1QRiJKiByGCWvEzO2Lt563f8h28R7qp619XRDalPAGuyRFtzcUnTa3lcgKmW
 xyHu3lTpSStC3SB3szUnQXaMnGdldZpA3zeL+5WhPE2QOZbHeFOXQTy2liO48CfGRKAu
 dEnSdszp3iEqTRN5lVVGY9bwU8wvxjjeimvQJqErAg1lUUCKz7zoDiESrR3yqnhmYa17
 EPLA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=loFDeDo2
Subject: [Buildroot] [PATCH 1/1] package/python-hatchling: bump to version
 1.21.0
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
 package/python-hatchling/python-hatchling.hash | 4 ++--
 package/python-hatchling/python-hatchling.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hatchling/python-hatchling.hash b/package/python-hatchling/python-hatchling.hash
index ebb412d197..e1798e882c 100644
--- a/package/python-hatchling/python-hatchling.hash
+++ b/package/python-hatchling/python-hatchling.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hatchling/json
-md5  43f7203cacb6c3c178b93149b8a8151d  hatchling-1.18.0.tar.gz
-sha256  50e99c3110ce0afc3f7bdbadff1c71c17758e476731c27607940cfa6686489ca  hatchling-1.18.0.tar.gz
+md5  21e5e7ed5fa6dd0618c5b66eb847f370  hatchling-1.21.0.tar.gz
+sha256  5c086772357a50723b825fd5da5278ac7e3697cdf7797d07541a6c90b6ff754c  hatchling-1.21.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7f143a8127ad4873862d70854b5bd2abd0085aa73e64fd2b08704a3b9f5c07fc  LICENSE.txt
diff --git a/package/python-hatchling/python-hatchling.mk b/package/python-hatchling/python-hatchling.mk
index f13e6d3e28..d1ed4d23c2 100644
--- a/package/python-hatchling/python-hatchling.mk
+++ b/package/python-hatchling/python-hatchling.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HATCHLING_VERSION = 1.18.0
+PYTHON_HATCHLING_VERSION = 1.21.0
 PYTHON_HATCHLING_SOURCE = hatchling-$(PYTHON_HATCHLING_VERSION).tar.gz
-PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/e3/57/87da2c5adc173950ebe9f1acce4d5f2cd0a960783992fd4879a899a0b637
+PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/fd/4a/8196e79c0d6e5eb10436dd2fcccc889a76af6ecf9bc35f87408159497d4d
 PYTHON_HATCHLING_LICENSE = MIT
 PYTHON_HATCHLING_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCHLING_SETUP_TYPE = pep517
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
