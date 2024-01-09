Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC74C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 06:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9EE141E2F;
	Tue,  9 Jan 2024 06:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9EE141E2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7H76YFiw5rH9; Tue,  9 Jan 2024 06:04:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3B0A41BCD;
	Tue,  9 Jan 2024 06:04:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3B0A41BCD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D65E01BF3D8
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 06:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B067460ADE
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 06:04:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B067460ADE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ih2P5uEQKJ6P for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 06:04:10 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFD9D60A74
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 06:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFD9D60A74
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7bedd61c587so6628239f.2
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 22:04:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704780248; x=1705385048;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VCZHA6Kqbf3guvLTKyjJ88bHkzBVEb4w1Cwx1bs0hsY=;
 b=VtcwQ5icr0LYqlfpJAbJHYRQkkk6LLPB1/r5EJmjZaBEbhA39xg+M5l6cz5plLPYJu
 e92pCvgRB8BMVOFQNjYSzTOzJZvTwXb4RbBJQqkHVsFSAd4TQXkH1KYJj/BdZgFHVxc6
 4YV7uU0YDeAUJvgMaE8kH/Nud5NkUfobhII4HMwnl7RWHlXAeTaJpgJPgwNpbum6SGir
 6j3yGqG+9f5mn7o101hRMXveTW/e1kdvOeZnj00FS0K3mQuIsVgifeCpwfF8dINvXhtf
 uEyIiZZPUjVobCKw+ly1YnoRPIJghcNedGSRUAW8KQOjUtQZFAni3r6gs9uTMv9PpSZj
 zrfw==
X-Gm-Message-State: AOJu0Yz/KJNdpd+VdMUwyY2qEnWPGA5OOqKWLFqSleW61vMH4jDwSG4z
 cOGo9gRPYvRuU70VSmJofeYrrJz2ttpduQ==
X-Google-Smtp-Source: AGHT+IFlqW7HYVkuKqUY2jnhCG2G17x4haGDnzv51culyq3/FgTFikTWe6L44wcXGE6np8h8XIHMPg==
X-Received: by 2002:a05:6e02:1909:b0:35f:f3f1:dcdc with SMTP id
 w9-20020a056e02190900b0035ff3f1dcdcmr6454645ilu.52.1704780248607; 
 Mon, 08 Jan 2024 22:04:08 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 cv11-20020a056638498b00b0046e17359621sm436817jab.161.2024.01.08.22.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 22:04:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 23:04:06 -0700
Message-Id: <20240109060406.3976484-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704780248; x=1705385048; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VCZHA6Kqbf3guvLTKyjJ88bHkzBVEb4w1Cwx1bs0hsY=;
 b=j62iySSTgnWBzbncmhVQ3Y4tVLSYbRsZ0LwLZRbNg0sNB0d/SStRURK97reW1Nu/n2
 zG2b3g+pV3Iz4XQRDPDQPasT03m/9v16DGdYbMrDlfA9wCmIWvx2f9TwbDkAYtmJkh6A
 agzN2tp2G/fPnG/p2J8bsMyYSLY3rR88xzYBis86ifL65MAQkH+E2dAE6f/aV3UkJ5U1
 35T57YuwcmdSFSNgL4ZnpujxoAeiQDr4WNeETpM178aFnLmUtkAxFOnajXNDBX0oR9mP
 +KLlovJCU7hYKDO3y99oVUWM+lkFbsxBjvRYN3jV/+C8luaT7BxsYX2Zidpj3WweJUOG
 E9Lw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=j62iySST
Subject: [Buildroot] [PATCH 1/1] package/python-colorlog: bump to version
 6.8.0
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
Cc: Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-colorlog/python-colorlog.hash | 4 ++--
 package/python-colorlog/python-colorlog.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-colorlog/python-colorlog.hash b/package/python-colorlog/python-colorlog.hash
index f4d0dd4c0e..9df94b19ba 100644
--- a/package/python-colorlog/python-colorlog.hash
+++ b/package/python-colorlog/python-colorlog.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/colorlog/json
-md5  80b79f7824d39d4f3b11c75d1cba094e  colorlog-6.7.0.tar.gz
-sha256  bd94bd21c1e13fac7bd3153f4bc3a7dc0eb0974b8bc2fdf1a989e474f6e582e5  colorlog-6.7.0.tar.gz
+md5  805e982037ba071d3d42c3d53cf73fd8  colorlog-6.8.0.tar.gz
+sha256  fbb6fdf9d5685f2517f388fb29bb27d54e8654dd31f58bc2a3b217e967a95ca6  colorlog-6.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b1d9082bc483623fd59fc7279b457f0e40d942a76426cde257239e04dfe4125a  LICENSE
diff --git a/package/python-colorlog/python-colorlog.mk b/package/python-colorlog/python-colorlog.mk
index 12a1c8ec77..f96318ce5a 100644
--- a/package/python-colorlog/python-colorlog.mk
+++ b/package/python-colorlog/python-colorlog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_COLORLOG_VERSION = 6.7.0
+PYTHON_COLORLOG_VERSION = 6.8.0
 PYTHON_COLORLOG_SOURCE = colorlog-$(PYTHON_COLORLOG_VERSION).tar.gz
-PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/78/6b/4e5481ddcdb9c255b2715f54c863629f1543e97bc8c309d1c5c131ad14f2
+PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/1f/b0/e4e3850d43f5429f9e53404056d705117fbb8a4d9e755425e762a9f68317
 PYTHON_COLORLOG_SETUP_TYPE = setuptools
 PYTHON_COLORLOG_LICENSE = MIT
 PYTHON_COLORLOG_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
