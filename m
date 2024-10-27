Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B117ED1358A
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 22:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53C49405BA;
	Sun, 27 Oct 2024 22:56:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lHihweYxF4Qx; Sun, 27 Oct 2024 22:56:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 064ED405B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 064ED405B1;
	Sun, 27 Oct 2024 22:56:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E8115971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 22:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D594F404D3
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 22:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sghM5mDGryNu for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 22:56:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A31E240566
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A31E240566
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A31E240566
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 22:56:13 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-83aff992087so145215639f.3
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 15:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730069772; x=1730674572;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/rQWjcMIV4oWTOpagiALv6AEpbxRD81uyekPfaWjLIU=;
 b=rkz1bQjkRDDEegOTuRokwfjaT2YPPY5Dtkis/5fjado4wqiyF5s1+U+Ja9hgLQxTwy
 JHZXI4bCBoZMQy/b1Sd+6iWyZ6dUQv2bIV3rTmZGHdVqRHuX45yQAyMLK8fH+ATULGk2
 u6GfzFZ2duWr9CAsMJJlAF0YiAFkO7Wjqb6kbn2zl3g5XoskQ+DiKupvwHuV7OaY6aQZ
 cv5stEMIF9Ymzuz1prz6qIbcSRzDgWJ5ikzGeWJ5jtAiTwXrK1v+d66NJ/mziIYwOiV/
 NudLmojCqfrqdzzrtmeSZJajPqbXb02X8vx1O5dKuMH3E8LAn17pvl3Ysf0fPQXNd0fs
 jO+A==
X-Gm-Message-State: AOJu0YxE7abOoLBdIU9Bytxv23BOLfJ2DkcXjH5hXEkEns6wgyEAO2OK
 KBQtV7rGjR1SPwn8NLYBNLqkVW4V9NcfVjJKDCM/R+/QIYYKFIEf/2xZ1A==
X-Google-Smtp-Source: AGHT+IFf2D+QWNhFKoLDEDPP4SYQFMdNikh23jF03swLdD4A2UpS293txGIQqnTKdwvRwsXXHEDSRA==
X-Received: by 2002:a05:6602:1656:b0:834:d7b6:4fea with SMTP id
 ca18e2360f4ac-83b1c3e9fcemr394677139f.6.1730069772372; 
 Sun, 27 Oct 2024 15:56:12 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83b137c96b6sm124771139f.5.2024.10.27.15.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 15:56:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 16:56:10 -0600
Message-Id: <20241027225610.3869106-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730069772; x=1730674572; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/rQWjcMIV4oWTOpagiALv6AEpbxRD81uyekPfaWjLIU=;
 b=IZf+9HJDfPSlWGeNdMvyEUX7Hkvs3TYOphbDXMozauYOb7mPzNcALp1R8POSQBoDMv
 MJLO/lhOwMlkX4rHW0TI8GrXI65rdIbxm3FHn+oPx8o1k38xQCTJo1YJUAd0RQUq62XS
 b719QVvN8vFQxWUntUPoQ8E4ncRB7I9OcdJ0YyO5eAmAyXCnB/E8RnB0CODOkIkIZZ+Y
 kZTilz6Rgb47OdW+w91esldR/doRB6N3FFGDPGVLGc7zGJHQxFZTNZV5672hTvqBrGzt
 1F9GkZzLrm6hM0HG+TeLCpZYT16xajL6ikaAhgktS6PyzQToGdH818s4FDnIPcSdXTHy
 n+gA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IZf+9HJD
Subject: [Buildroot] [PATCH 1/1] package/python-keyring: bump to version
 25.5.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-keyring/python-keyring.hash | 4 ++--
 package/python-keyring/python-keyring.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-keyring/python-keyring.hash b/package/python-keyring/python-keyring.hash
index e45e108055..ddbe52fb35 100644
--- a/package/python-keyring/python-keyring.hash
+++ b/package/python-keyring/python-keyring.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/keyring/json
-md5  18421ba10fcf6af96586aa0761cc667d  keyring-25.4.1.tar.gz
-sha256  b07ebc55f3e8ed86ac81dd31ef14e81ace9dd9c3d4b5d77a6e9a2016d0d71a1b  keyring-25.4.1.tar.gz
+md5  abbca9e5a78bdb506d3ba0bfa3fe3642  keyring-25.5.0.tar.gz
+sha256  4c753b3ec91717fe713c4edd522d625889d8973a349b0e582622f49766de58e6  keyring-25.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
index dff2d19e0c..1972f5f6de 100644
--- a/package/python-keyring/python-keyring.mk
+++ b/package/python-keyring/python-keyring.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_KEYRING_VERSION = 25.4.1
+PYTHON_KEYRING_VERSION = 25.5.0
 PYTHON_KEYRING_SOURCE = keyring-$(PYTHON_KEYRING_VERSION).tar.gz
-PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/a5/1c/2bdbcfd5d59dc6274ffb175bc29aa07ecbfab196830e0cfbde7bd861a2ea
+PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/f6/24/64447b13df6a0e2797b586dad715766d756c932ce8ace7f67bd384d76ae0
 PYTHON_KEYRING_SETUP_TYPE = setuptools
 PYTHON_KEYRING_LICENSE = MIT
 PYTHON_KEYRING_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
