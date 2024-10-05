Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19071CFB43F
	for <buildroot@archiver.kernel.org>; Sat,  5 Oct 2024 20:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1CAA606A3;
	Sat,  5 Oct 2024 20:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wKukB6JZBPWE; Sat,  5 Oct 2024 20:56:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1FAF606BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1FAF606BE;
	Sat,  5 Oct 2024 20:56:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8EA8C1BF5A5
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 20:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FCF280A6F
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 20:56:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GLVNVW5RUBwn for <buildroot@lists.busybox.net>;
 Sat,  5 Oct 2024 20:56:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::933; helo=mail-ua1-x933.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 76F2F809EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76F2F809EC
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76F2F809EC
 for <buildroot@buildroot.org>; Sat,  5 Oct 2024 20:56:30 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-84e8a29c9d5so2272088241.1
 for <buildroot@buildroot.org>; Sat, 05 Oct 2024 13:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728161788; x=1728766588;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nZaDJlA4SfmuYK9Strjiax8XPxOOn1zFrozX5//mapE=;
 b=sSZwsTbILG9pky2cNUGwatam9tf41yFTRA8+7PVP6/OGup+RBWHUGROrzbbj8swFoB
 /MOiap8nF7B0/cQRcPdw9u6axOC14O9HZIBSUiH/ZntyHBRID0UgZrirbCV0HZax2Ray
 rKUfTm2EGOQRE/BURvywUhMDuqw2SSdqSt2Xoma/RpY+ejzebVhU+p95ESyIgPs3ZZJX
 dwXX+CUCZOsXm3EzIAvT/TZVeQWuDt5cWSPjyj8WgRRzSLrK+YHaQqpvPy5J6TliG1Tu
 /PyfvqZXSGFOasSIp3cVfuykbAyXMfEsKY/eds17v7O6FwIsHtXKfNQfyEk/OS+zOYFm
 WAOg==
X-Gm-Message-State: AOJu0YwodmNxWsZjsW9e2JhrMCwGotWsoN6giloMKlTRBKqFcKc4wQJk
 a77F0XjsvqQnhsCjwKJ/r/AA2Mwha1WAhPksivGWOsv0lqi+P+0y/rX+9/SO
X-Google-Smtp-Source: AGHT+IEtIGxIeCi4MGYBMXHzPgnFyKLEb7+QSw7W2aIXgltXUiD9gc1O/Ikc3+iwiFDUU6aY4HVR+g==
X-Received: by 2002:a05:6102:1611:b0:4a3:bbc1:7ee1 with SMTP id
 ada2fe7eead31-4a405cc0b27mr4561777137.3.1728161788206; 
 Sat, 05 Oct 2024 13:56:28 -0700 (PDT)
Received: from gilles-Precision-3571.lan
 ([2605:59c0:14b7:4a10:cd3b:1b9b:5d1e:f72d])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4a412eafcd5sm483500137.33.2024.10.05.13.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2024 13:56:26 -0700 (PDT)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Oct 2024 16:56:05 -0400
Message-ID: <20241005205607.222164-1-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728161788; x=1728766588; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nZaDJlA4SfmuYK9Strjiax8XPxOOn1zFrozX5//mapE=;
 b=GH2MW31TXfiWZqdaNkgxvWmnjGAZLsYpzHwAZRIPNSDt9Cu74fZxQRWXPlHXGwXUUt
 G0oYC2NytSJo2btFXSkhimBs53wOXw/e45pooDlu+5XnwSCLkBPZEUVpGnxCYS9m7Ysj
 S7aOe8FdeyJ0kIi3UUCRSIbJG9vrRgjSMFvaHlLjFbUrPcbminykmL5LxqcS9vYX650G
 q5kzQKQvLaR+ecEc0oFqq1ZUKS91PHSuc5GdmETM8CntkvOuP8iDI7mTLjik0nm/tyIQ
 hn2IVyERk/AZ7C9p0fHnTXP2de9PFuqrGIeudVbld+BBGMda5sKDQJMz0pKQ97otdCEG
 yv5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GH2MW31T
Subject: [Buildroot] [PATCH] package/opencl-clhpp: bump to version 2024.05.08
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change log:
https://github.com/KhronosGroup/OpenCL-CLHPP/releases/tag/v2024.05.08

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/opencl-clhpp/opencl-clhpp.hash | 2 +-
 package/opencl-clhpp/opencl-clhpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opencl-clhpp/opencl-clhpp.hash b/package/opencl-clhpp/opencl-clhpp.hash
index 3f038d6340..184444a53a 100644
--- a/package/opencl-clhpp/opencl-clhpp.hash
+++ b/package/opencl-clhpp/opencl-clhpp.hash
@@ -1,3 +1,3 @@
 # Locally Computed
-sha256  9106700634e79cfa0935ebd67197f64689ced24c42da702acf18fa8435bd8a82  opencl-clhpp-2023.12.14.tar.gz
+sha256  22921fd23ca72a21ac5592861d64e7ea53cd8a705fccd73905911f8489519a0b  opencl-clhpp-2024.05.08.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/opencl-clhpp/opencl-clhpp.mk b/package/opencl-clhpp/opencl-clhpp.mk
index 93c25d0d66..2b5d5afa4b 100644
--- a/package/opencl-clhpp/opencl-clhpp.mk
+++ b/package/opencl-clhpp/opencl-clhpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCL_CLHPP_VERSION = 2023.12.14
+OPENCL_CLHPP_VERSION = 2024.05.08
 OPENCL_CLHPP_SITE = $(call github,KhronosGroup,OpenCL-CLHPP,v$(OPENCL_CLHPP_VERSION))
 OPENCL_CLHPP_LICENSE = Apache-2.0
 OPENCL_CLHPP_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
