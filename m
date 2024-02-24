Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59928C48BF6
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 13:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD3F940025;
	Sat, 24 Feb 2024 13:57:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FdjYcnC5hxdS; Sat, 24 Feb 2024 13:57:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7B72400D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7B72400D7;
	Sat, 24 Feb 2024 13:57:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E03C1BF27C
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 13:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86F94400D7
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 13:57:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jwx2_MGmGXiu for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 13:57:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0457F40025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0457F40025
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0457F40025
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 13:57:21 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33d509ab80eso664408f8f.3
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 05:57:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708783039; x=1709387839;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HgJKH2pGcABkrgrKaj9hMUa+EElfB4XB48zTlVZnlYc=;
 b=w18CduAL8mdcr9FsUw5J2WD/HsCka1P10az6E2MhQDh2Z1J7+cBuvTIX6npNuH3UoV
 /dwqmhlCoZfLJRk2NjDJfewt0SQf8Ah7UXIXw3K3BnPmpzlG4hWr1GCWbTKmXxeVHx6O
 X//uymMC2h8MqWGDn5cb+4zS91irOP45rjrwu7jbiq0vt64gb4Qi/tADuMTuQCv0g5Nx
 kKP37zY3b+yQf0lTewYaFlRdcQiComd0oQawegyDA4woLWZmOvLp+zZ2BMGsC0Qr2+lf
 Qy8dYP/AEil8XDHDUVCA3v0zBG0CWzxqtp/quYlfM7v7KCA8fTSHk7ZV1t9tiMvhLEKp
 x9KQ==
X-Gm-Message-State: AOJu0Yx1aylcubPsoTO74EJKjyrtIE83bFgdomAzCeAzT8Z/2pJ96qke
 TWq9sAs84cDyAi1EIHGWgjvF7B8s/EvftpCZnoSUXcDhvIfCCS+HU+n6yp4K
X-Google-Smtp-Source: AGHT+IGd1g6TwyZs3O7wtsn097AwI0QUqMHOC7tVuDCB9lPkRG/3we/ZcNEzRCJQt8Kd4PSVX4GGyg==
X-Received: by 2002:adf:ee83:0:b0:33d:3ee3:cc11 with SMTP id
 b3-20020adfee83000000b0033d3ee3cc11mr1505701wro.47.1708783038552; 
 Sat, 24 Feb 2024 05:57:18 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 co22-20020a0560000a1600b0033d96b4efbasm2287702wrb.21.2024.02.24.05.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Feb 2024 05:57:18 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 14:57:17 +0100
Message-ID: <20240224135717.635374-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708783039; x=1709387839; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HgJKH2pGcABkrgrKaj9hMUa+EElfB4XB48zTlVZnlYc=;
 b=JlKU4we8oyr98hXxkTe+9zbDTig5einO3BCBObf7cQJOV0az3gDtUTdPMXt7JoIx7q
 Q4iyM3cHdwl2nfdAwCeLio4B29l5Kd70GvRG6x7xN9D5D1FZBpPmMMqmhlnL+z8q4zFK
 8i3ykbhq7zOKwEHIjg5Cg/G6HzMIHqNTPqN0FVzlBzrvEUygnRwK69imYFEFg+VhyENv
 Oe0Nf/QW17yoLbZMi6jj+21ubn0BdKRtxjcaC/9Gy0d6thSleh9799nxBhMQD1lQ4NLZ
 vniaUNfulzj4TDEXGlTjaeuCXuIH05xVRXS9FZ8GsaKG4Mei1vMOf/Ia7isumu3NW5n9
 Ufjw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JlKU4we8
Subject: [Buildroot] [PATCH 1/1] package/prboom: fix build with autoconf >=
 2.72
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set ac_cv_type_gid_t=yes to avoid the following build failure raised
since bump of autoconf to version 2.72 in commit
524f3536029dace3ce9aa154d3ca4685582e1955:

In file included from i_network.c:37:
../../config.h:207:15: error: two or more data types in declaration specifiers
  207 | #define gid_t int
      |               ^~~

Fixes: 524f3536029dace3ce9aa154d3ca4685582e1955
 - http://autobuild.buildroot.org/results/0d74517129130e6f26dc8c8aacae175ed8bd4b54

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/prboom/prboom.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/prboom/prboom.mk b/package/prboom/prboom.mk
index 36692d29a3..c1ba05ff70 100644
--- a/package/prboom/prboom.mk
+++ b/package/prboom/prboom.mk
@@ -6,7 +6,7 @@
 
 PRBOOM_VERSION = 2.5.0
 PRBOOM_SITE = http://downloads.sourceforge.net/project/prboom/prboom%20stable/$(PRBOOM_VERSION)
-PRBOOM_CONF_ENV = ac_cv_type_uid_t=yes
+PRBOOM_CONF_ENV = ac_cv_type_gid_t=yes ac_cv_type_uid_t=yes
 PRBOOM_DEPENDENCIES = sdl sdl_net sdl_mixer
 PRBOOM_LICENSE = GPL-2.0+
 PRBOOM_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
