Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21693D1358A
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 23:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E29F381116;
	Sun, 27 Oct 2024 23:06:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xg9CNcSi2cvg; Sun, 27 Oct 2024 23:06:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED3B081119
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED3B081119;
	Sun, 27 Oct 2024 23:06:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10DE4AEE
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F16AE403A4
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:06:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hns_EJIZ3Pnm for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 23:06:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D771E403A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D771E403A5
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D771E403A5
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:06:40 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3a398638ff9so14049295ab.3
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 16:06:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730070400; x=1730675200;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wgJ1kX5Y41TTZ955SazfmTqLp8kR6Ls4n3Z14mV533I=;
 b=OZqK6OIoysXjERutg53LEz+hcxxFkyMQ0lZSZuK+dBzMBehDi0iJMttuQL8ebd2ljR
 8cp156QCvk8gL0Ztrez9yRC/iLGuimG+icPpVPX+fOqF27fcWRBLbjQxJy7QR0XFHDCZ
 PrUm5mfQjBH2iPdD6oZ5m83CHLC9UtO+/RSsk8QL/ycYQLxFL68RVcgeg/se2ZyPpLFt
 wm//O0kVR3D/Vo/0W9fWetQXXu1KdDb2YlsqAWTtyoH9w954sU+IMG7EH9bUwXY7x+5c
 Ri8EQ/GSS2MM7u+Qppvgb6eDBL5BX3EvMXtvFJSxTNQ0RB99VoM6UpP/HpcGHQYQQnjq
 gLbQ==
X-Gm-Message-State: AOJu0Yy9d5j6qqJHpFZCvJ+IUFLDQOW7NSicCsKGAr8sarB41KNJW9hX
 o6Pr4MUjM99IOEv8PIDhAaAlbD3YzPmQaPATxy3PCqOvN97oKb+Yn5bqJQ==
X-Google-Smtp-Source: AGHT+IH1gA7LhNp6cBMoGRX/vUbm8/4bXK9a9qbOjA5LJ8SkcawAdrgOKP24c+I04XkFk4hN3aRiwg==
X-Received: by 2002:a05:6e02:20e8:b0:3a3:41cf:f594 with SMTP id
 e9e14a558f8ab-3a4ed2b06d5mr48257625ab.12.1730070399683; 
 Sun, 27 Oct 2024 16:06:39 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc7261831csm1338786173.58.2024.10.27.16.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 16:06:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 17:06:38 -0600
Message-Id: <20241027230638.3874630-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730070400; x=1730675200; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wgJ1kX5Y41TTZ955SazfmTqLp8kR6Ls4n3Z14mV533I=;
 b=M0VFr9zcEsS6HHxydvYulNyh1fSIPa/SuhGrLJHIoeuSoz6WeiTBGyhcwccDDl15Ql
 WC0SYsfWVdaNjhFOpWDJZnKHwqz2n2aZmJ+8fynzcftgsOR1+T4cY4lD3KRGp2FUQX2L
 a7/oUxRrv+mEB8xbJRL8Y8uMuWVNYNW2dH+qCKO835U2qV+2t6vDytvmCazL8pbJN7mU
 plkUGfXM4qRpvfYVZ04GZJf+Em/kDag9vkiVk2Seds7snLXhLLGQvSR4rLC7sOAv1nUv
 IWSIip4hjE5Zwz+AaO7RhN1pP0uA0RLhrCdKCv5xRNyPs7Ds2xO9GSFUeNuUp3utcUFN
 yxmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=M0VFr9zc
Subject: [Buildroot] [PATCH 1/1] package/python-pyproject-metadata: bump to
 version 0.9.0
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
 .../python-pyproject-metadata/python-pyproject-metadata.hash  | 4 ++--
 .../python-pyproject-metadata/python-pyproject-metadata.mk    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyproject-metadata/python-pyproject-metadata.hash b/package/python-pyproject-metadata/python-pyproject-metadata.hash
index 093be17e75..90f51c8c28 100644
--- a/package/python-pyproject-metadata/python-pyproject-metadata.hash
+++ b/package/python-pyproject-metadata/python-pyproject-metadata.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyproject-metadata/json
-md5  fdaf264fe130f45ba830222b95c556fa  pyproject_metadata-0.8.1.tar.gz
-sha256  e6b494d4fbac8007ed0efd3a08df067bb28a299fb113b885ce77e492ad1f0600  pyproject_metadata-0.8.1.tar.gz
+md5  d947b3c632f4aee9cf23bb5950ac02f9  pyproject_metadata-0.9.0.tar.gz
+sha256  8511c00a4cad96686af6a6b4143433298beb96105a9379afdc9b0328f4f260c9  pyproject_metadata-0.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pyproject-metadata/python-pyproject-metadata.mk b/package/python-pyproject-metadata/python-pyproject-metadata.mk
index 08d2b4bda4..7429ba8af3 100644
--- a/package/python-pyproject-metadata/python-pyproject-metadata.mk
+++ b/package/python-pyproject-metadata/python-pyproject-metadata.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPROJECT_METADATA_VERSION = 0.8.1
+PYTHON_PYPROJECT_METADATA_VERSION = 0.9.0
 PYTHON_PYPROJECT_METADATA_SOURCE = pyproject_metadata-$(PYTHON_PYPROJECT_METADATA_VERSION).tar.gz
-PYTHON_PYPROJECT_METADATA_SITE = https://files.pythonhosted.org/packages/fa/24/47dc876eacddcf7125fe59cd26b064530c7e58655dae87f6928bf47aabaf
+PYTHON_PYPROJECT_METADATA_SITE = https://files.pythonhosted.org/packages/c0/79/406a9f56c435caaaca4a1c66397e4f63ecd48a72a6c4fc1d9ecdaac66acb
 PYTHON_PYPROJECT_METADATA_SETUP_TYPE = flit
 PYTHON_PYPROJECT_METADATA_LICENSE = MIT
 PYTHON_PYPROJECT_METADATA_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
