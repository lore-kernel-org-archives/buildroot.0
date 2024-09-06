Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08051E6FE41
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 18:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 153C340515;
	Fri,  6 Sep 2024 18:48:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mXv1yXPq2wWv; Fri,  6 Sep 2024 18:48:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F314F404F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F314F404F5;
	Fri,  6 Sep 2024 18:48:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C0041BF309
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2868E40151
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jr7yfR0ubMgV for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 18:48:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 06A77401D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06A77401D5
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06A77401D5
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 18:48:03 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-829f7911eecso102407539f.1
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 11:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725648482; x=1726253282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+HPab5V8zJxyjnMzJ1vFuokX3ThiDSjFD9P/bl2PxgU=;
 b=Imzkp9Q8W5921IDhuAla3LbYqW+aclFyv6+CauB48yv+NlnJYHfKMzOU0IfYLiZOWo
 V1WVUA6f9VuLx57bnAMvT1a8DWHPsbFZ6Y1CgDd30bdxYvpuNcZ/ZFFXR73VSywtXjw0
 1pOULRNUwE9sfTE3GAreRZioYV8Yy5YBAV2UIUOLOM/knFTzr/JSpf56pW33wbYwVjox
 TdXfTMhU/AoV+Rh3o+4MFMGK5Y0jpbLBcfbPu2qSKsw21Q0W99dXfi5x2GqidYyN8UA1
 te8Z/S8XhQDrRyRPlYENCAyK9QPIgAWqLZPMAy9yJk1Bo57DA3Q0NqkoXroyubf3Vvsg
 V3Fw==
X-Gm-Message-State: AOJu0YydzcEcbXdZHbSUHmwtvUy5OH4nzz0E2JJfsUgv7Vkh/5ik+KZi
 dwyBezOg0yYbuCIe7Z3IFERyonv1ao6N5hpnizD85hiw+xaI/aaeAZlK0w==
X-Google-Smtp-Source: AGHT+IGyrE3L9yA37IDH193MyLFRvIdUK4rD7g0uIbfVS1Ql69e7eWybWkDG9unRzo2Fk10fA6/D6A==
X-Received: by 2002:a05:6e02:1a45:b0:39d:2507:6abd with SMTP id
 e9e14a558f8ab-3a052254035mr29999225ab.13.1725648482063; 
 Fri, 06 Sep 2024 11:48:02 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ced2dcdf66sm4176539173.33.2024.09.06.11.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 11:48:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 12:47:56 -0600
Message-Id: <20240906184756.1166732-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240906184756.1166732-1-james.hilliard1@gmail.com>
References: <20240906184756.1166732-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725648482; x=1726253282; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+HPab5V8zJxyjnMzJ1vFuokX3ThiDSjFD9P/bl2PxgU=;
 b=a5fh9iHJtePMYyWsexqvSkeXmaHQGujfi8S7Xq9UN/kLVunJZj1/GHitvRcQCDkhwe
 YZgELZ5pDFaYchPKCjjPHtLjaop6aeuwi2/rNUc76g3NhgAd1kPwCmIrNxqjn/70+0eo
 BBfX6p3MUMIwuRti2e56sdI2jGRljfAlk8pUNn9s1EiW4HXeTW5aQwNGFjVKW3b5RPfI
 nIF+msPbWRxJPFKSacS5Gy8HTg0XZnYETnRAbSdd9vGxy2RZ5GbvNEXiZ2wXXC/x2ksK
 e5L/+v8GAsJhJGLf5EjE6HUxzPJMUCtTUZBuwY9TIs6H2Rtg8L+VPzLYK32t0sI9o+sq
 Kn1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a5fh9iHJ
Subject: [Buildroot] [PATCH 2/2] package/python-pydantic: bump to version
 2.9.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-tzdata runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydantic/Config.in            | 1 +
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic/Config.in b/package/python-pydantic/Config.in
index e9cd2e6780..029f86450e 100644
--- a/package/python-pydantic/Config.in
+++ b/package/python-pydantic/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_PYDANTIC
 	select BR2_PACKAGE_PYTHON_ANNOTATED_TYPES # runtime
 	select BR2_PACKAGE_PYTHON_PYDANTIC_CORE # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	select BR2_PACKAGE_PYTHON_TZDATA # runtime
 	help
 	  Data validation and settings management using python 3.6
 	  type hinting.
diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index 6127dcaf37..fd8d16dbb1 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  940d760de174d3567d4f5be28fd215f5  pydantic-2.8.2.tar.gz
-sha256  6f62c13d067b0755ad1c21a34bdd06c0c12625a22b0fc09c6b149816604f7c2a  pydantic-2.8.2.tar.gz
+md5  f328e2d6c3d511a81e358aac6a8636b6  pydantic-2.9.0.tar.gz
+sha256  c7a8a9fdf7d100afa49647eae340e2d23efa382466a8d177efcd1381e9be5598  pydantic-2.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index c549970db9..828658af19 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 2.8.2
+PYTHON_PYDANTIC_VERSION = 2.9.0
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/8c/99/d0a5dca411e0a017762258013ba9905cd6e7baa9a3fd1fe8b6529472902e
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/f6/8f/3b9f7a38caa3fa0bcb3cea7ee9958e89a9a6efc0e6f51fd6096f24cac140
 PYTHON_PYDANTIC_SETUP_TYPE = pep517
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
