Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58636C47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 21:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5671403FF;
	Sun,  7 Jan 2024 21:06:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5671403FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8c2RHTZZFVWa; Sun,  7 Jan 2024 21:06:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CDA140453;
	Sun,  7 Jan 2024 21:06:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CDA140453
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 191C21BF381
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 21:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCD6A40453
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 21:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCD6A40453
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RPy7ZUVNPTed for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 21:06:49 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DFB19403FF
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 21:06:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFB19403FF
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7b7fe0ae57bso82733039f.0
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 13:06:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704661607; x=1705266407;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BKpVYu0l6o9sDqVPhSBN8nNpAvcE3MEykwGLE+dS7F8=;
 b=HS4Zmx+imb/cI+iXO2WnrlNiwfeu+iNpEtt1lJjAHx+BXxzVs4YAdlg0q93sWNIS6p
 EgUEG2g2MIKJo88zzmK6CEc631cEp5NkW5kYcCvqesCis86AFA9ZUQLPVinQa4DgBhX3
 1qj1RWxhXyQG2T/3lhS+6RZVmKWDYmvb8KeeO7QC0Q+VCKnSowD88UMicHWVsLpkyQlm
 Ux1Zru+mvzO80+wBfnBG6UYCbY2rusWD15/QTvtroKfEzqrdMYI2/omn8KtGbw74wX9A
 QTmMJTJXpW5rSqGdisUphpvRB2MKTZQueWIi6VsqVThf7hT3w6uZMx6WXwn6J6tXnb1K
 C4lg==
X-Gm-Message-State: AOJu0YwiUXcjuuu1OyzlnrVIPE4xPKm7M8cBSG/AHuOm+l1cDV4sYSLX
 FcoWLsh/ys5DNd+2xyUvxV+uRkOhUXHjVQ==
X-Google-Smtp-Source: AGHT+IErtzk12g7h7QgqQ1tpmWWpQBSBfT2brVCfopmVWep3UnXzzDvJeZvrnbsUcDQV95z5imIhag==
X-Received: by 2002:a05:6602:3299:b0:7ba:a93a:db4e with SMTP id
 d25-20020a056602329900b007baa93adb4emr3972038ioz.2.1704661607216; 
 Sun, 07 Jan 2024 13:06:47 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 m30-20020a056638409e00b0046e29fcd2adsm39386jam.160.2024.01.07.13.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 13:06:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jan 2024 14:06:45 -0700
Message-Id: <20240107210645.3318474-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704661607; x=1705266407; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BKpVYu0l6o9sDqVPhSBN8nNpAvcE3MEykwGLE+dS7F8=;
 b=bZPqkJ351w/hIzhmTF8EW7D96zGtMXpvm9dY8+2xDlyBCeFtORX+F9ZqvMggtvggsz
 irXUnNFOxH/q5yn1ibrECEHu9Gl2XYoG1l/8vMa9aSm/udU/o6xAzIzJdW8wWQmQM6V+
 t+i499YWZN1bahPSiyBzJwmF0sJnj1bnO84UejNjtzJ737b7h5Df+sp3LAIm3AU5ntc7
 OAJyuYxQ32iKMU4IVauiYpXhbO3nvZePINEvwraE2GqfND6rh0ZSZv9S529PuMUmovML
 6DVT6C/LW3RA3q39QoOdRw3rrj25Ml4/6lcBmGv2dGanUyEbF0tybeopGh8aesXO9i99
 Qd0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bZPqkJ35
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-debugtoolbar: bump
 to version 0.6.1
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

License hash changed due to new line removal:
https://github.com/aio-libs/aiohttp-debugtoolbar/commit/449550e9c70f17be7b679b90cc3dda2cc90c61e1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-aiohttp-debugtoolbar.hash                        | 6 +++---
 .../python-aiohttp-debugtoolbar.mk                          | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.hash b/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.hash
index 3cd9462d72..441574bbe2 100644
--- a/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.hash
+++ b/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp_debugtoolbar/json
-md5  496734057cb413d7a49a52a817802dbb  aiohttp-debugtoolbar-0.6.0.tar.gz
-sha256  ec231661133b40136608d39dfb688e7ea0c3d47b6ae6dee52d5bf24ceb9e4d45  aiohttp-debugtoolbar-0.6.0.tar.gz
+md5  3be0e457798dbd301f4cfe8da43166d4  aiohttp-debugtoolbar-0.6.1.tar.gz
+sha256  cd7ae54c600db7ae7d9dc3404b81f95209a6367df1d59e13ea20f9926e36e001  aiohttp-debugtoolbar-0.6.1.tar.gz
 # Locally computed sha256 checksums
-sha256  94d638be2cb4f186cc62bb567455837757547c15f1b350863aaf05a38843b542  LICENSE
+sha256  dd064918c2da830f543f6b34b699efd423c2ad82fdbda15c25214410fcd3f84b  LICENSE
diff --git a/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.mk b/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.mk
index 319d20ffc5..8eb38e86cc 100644
--- a/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.mk
+++ b/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_DEBUGTOOLBAR_VERSION = 0.6.0
+PYTHON_AIOHTTP_DEBUGTOOLBAR_VERSION = 0.6.1
 PYTHON_AIOHTTP_DEBUGTOOLBAR_SOURCE = aiohttp-debugtoolbar-$(PYTHON_AIOHTTP_DEBUGTOOLBAR_VERSION).tar.gz
-PYTHON_AIOHTTP_DEBUGTOOLBAR_SITE = https://files.pythonhosted.org/packages/3f/dd/5121417dfbeb4661673afa5c8708f1539889d0e54b1509a6fdf66705efc5
+PYTHON_AIOHTTP_DEBUGTOOLBAR_SITE = https://files.pythonhosted.org/packages/bd/72/cd80c0d1d425d5ef50e5b23553040e8d9fa5de5714208d3d18ae8806b6de
 PYTHON_AIOHTTP_DEBUGTOOLBAR_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_DEBUGTOOLBAR_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_DEBUGTOOLBAR_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
