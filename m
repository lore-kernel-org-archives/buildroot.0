Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EC1C46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 10:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EB3E60B48;
	Sat,  6 Jan 2024 10:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EB3E60B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vbggk22UQyWj; Sat,  6 Jan 2024 10:15:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4F1060B0D;
	Sat,  6 Jan 2024 10:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4F1060B0D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13D821BF3A6
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 10:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEDD842147
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 10:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEDD842147
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uNfuoJxWI2H4 for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 10:15:12 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E680F41E76
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 10:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E680F41E76
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40d8909a6feso4315175e9.2
 for <buildroot@buildroot.org>; Sat, 06 Jan 2024 02:15:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704536109; x=1705140909;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=trKEEcM3/7UsUwwGBM2/P+2Njd1imOBKRSx0wMpvirY=;
 b=gJeNB0fkAezsPsSeegMzmjpXN0D9kcOt+kOpCpu9ZlTlfgL9TQbuAi7ME4LhRzp34K
 BjdN1ZD1k6KP+S79iVM/bWm6wni1tctQukw9wi/9L7m4CUa3BeaiQENtdBgVaXamqkAb
 QvmnI1/lhGykwsAskrzojoOdMf6FtsYkfTMHMgIu6hQzH6+6+71A9LMJozu1dyzJ6SyX
 ypba9oNCfcNbzdDFhvv/1WxACHVBFaTRoHnZS43R4+Cb7bqyxhJvGsvTfEqzoNvzgLAs
 xDuud9flKTCl3MEra/e8gKMq7JwK7Scr1XxrmkAMAuIeA3XM4vnYSPVDqK5yNGjSs9bc
 9r2g==
X-Gm-Message-State: AOJu0YzMIJkGsB2j8aGIXnhxNgr45GTk2OH6NHwyBYny94JfugeR7jDy
 oZ+ODqdaaN4//uxKqiEWjRejdEt/ITA=
X-Google-Smtp-Source: AGHT+IFkANwrczaESGi+GBxQqK4DnKW+IvoySbEJ7dUeZuhiCace9JJtzd/gDXIZvsTTjMdRJPy90g==
X-Received: by 2002:a05:600c:6b17:b0:40d:85d5:40e1 with SMTP id
 jn23-20020a05600c6b1700b0040d85d540e1mr246501wmb.211.1704536108874; 
 Sat, 06 Jan 2024 02:15:08 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 i1-20020adfefc1000000b00337464bf71bsm3076501wrp.39.2024.01.06.02.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 02:15:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jan 2024 11:15:04 +0100
Message-ID: <20240106101504.527255-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704536109; x=1705140909; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=trKEEcM3/7UsUwwGBM2/P+2Njd1imOBKRSx0wMpvirY=;
 b=d6gvBJZrFW58j3Mcijow1+C11eqAF2MNnAjGT+SCginZ6XaJZb0Q01ktErLM9n3Vir
 fWVHFoq7hqGENWqpvDDs+YH4M8YvKLTY5+L2OMqLFl/Aa1gCruTACnt6zltvpKdfBiSs
 fhwsHCqfjNYeeP/nXwrat7g69YsaUQCSf6nxY26k/wkNjtxRTfVy/VL0qFXc9DWDa/qF
 hYBBb+IgrjDqLUHUTcP6c2dCGAplS/WAfTN+j4kCPSWPoQ+ZsIRDaQDE2n+GhnrCvHDm
 k7iUqvNeJFSSTu/KRpLQVO2yqTimcjIs9ncHY8B6GygHgc25E+b1YjSPqnXyYsLqKNZ0
 Y2Gw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=d6gvBJZr
Subject: [Buildroot] [PATCH 1/1] package/uftp: security bump to version 5.0.3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update site to avoid redirections (HSTS, etc.)

Version 5.0.3 - 12/17/2023
  A memory leak fix in the prior version wasn't applied correctly, resulting
    in an invalid memory access causing a crash.  Bug fixed.

Version 5.0.2 - 11/8/2023
  Fixed bug that caused crash when a CLIENT_KEY arrived out of order
  Fixed option handling on Windows when an argument is missing

https://sourceforge.net/projects/uftp-multicast/files/Changes.txt/download

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/uftp/uftp.hash | 2 +-
 package/uftp/uftp.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uftp/uftp.hash b/package/uftp/uftp.hash
index e47cba9394..d4d3450d1a 100644
--- a/package/uftp/uftp.hash
+++ b/package/uftp/uftp.hash
@@ -1,3 +1,3 @@
 # Locally computed sha256
-sha256  f0435fbc8e9ffa125e05600cb6c7fc933d7d587f5bae41b257267be4f2ce0e61  uftp-5.0.1.tar.gz
+sha256  cb8668c19b1f10bc63a16ffa893e205dc3ec86361037d477d8003260ebc40080  uftp-5.0.3.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.txt
diff --git a/package/uftp/uftp.mk b/package/uftp/uftp.mk
index ce865c20ec..3dcd8646c0 100644
--- a/package/uftp/uftp.mk
+++ b/package/uftp/uftp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-UFTP_VERSION = 5.0.1
-UFTP_SITE = http://sourceforge.net/projects/uftp-multicast/files/source-tar
+UFTP_VERSION = 5.0.3
+UFTP_SITE = https://downloads.sourceforge.net/project/uftp-multicast/source-tar
 UFTP_LICENSE = GPL-3.0+
 UFTP_LICENSE_FILES = LICENSE.txt
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
