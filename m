Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E638C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 08:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A57F440259;
	Tue,  9 Jan 2024 08:22:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A57F440259
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nL7zkRuDf6IS; Tue,  9 Jan 2024 08:22:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4C454005E;
	Tue,  9 Jan 2024 08:22:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4C454005E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B90AC1BF2F4
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 08:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 917F341902
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 08:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 917F341902
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dUdTDF-UPki4 for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 08:22:47 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B93B9418CF
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 08:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B93B9418CF
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7bee8f7df35so710839f.3
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 00:22:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704788566; x=1705393366;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kGo3as/P9IhZErs2SqRjNmQ2flFS1dKStd2nDKEoPVA=;
 b=VPYcUS1dMOLmX7EFu3g2TxaUGRyxaTRAy1zkitQ8JEQ3MkW8fd+9X2sBVq33DKtL/6
 chyYZe/+C98LHtm6Ygrp9H9/1XyLzw37UjpTGLb1L6Cj5px3bqxLS8ojyp9yQkw8DgFN
 DX/e6AdihOwXGu95rVpq5i5iCRmklCtkBN7hUwALVzMX8Cx6ILgPL9AeM4CC0kGOp6Hv
 tU7MLKGpddRlgd7GRtk9ANQr+5P7C7/PyR++AX5Avs2gbZrQuQJbJrLqGE8sGIrRhFRY
 gIqBGj6zVbiIgs8UbRLJ3MsiHz+k7ImB/zSQQFLntyzVYzx2YIQB1N4/XWPuR7r0WO+9
 Ow+A==
X-Gm-Message-State: AOJu0YxlKFKz2YEO25GRaoRIya2LQNU6us/QqtCt6bVZjln0NpZG7Pbp
 gRFGLScgH3wErOH9ZxS66ocP1ISYGHgqcA==
X-Google-Smtp-Source: AGHT+IGZ6D/xMM6sd4o1EQkQXh4LBufTmshcNvzHDeZeMJT6x4vm4fHLg8TJQls3W1ouckeYDakJMA==
X-Received: by 2002:a6b:7505:0:b0:7be:d8f9:9bc7 with SMTP id
 l5-20020a6b7505000000b007bed8f99bc7mr764161ioh.30.1704788566496; 
 Tue, 09 Jan 2024 00:22:46 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 y129-20020a6bc887000000b007bee386f29csm108903iof.20.2024.01.09.00.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 00:22:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 01:22:44 -0700
Message-Id: <20240109082244.4072761-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704788566; x=1705393366; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kGo3as/P9IhZErs2SqRjNmQ2flFS1dKStd2nDKEoPVA=;
 b=Ib2LJQLdydzFqVmG3gB+5Gk4KNjZjm3y4mCnxPV7OOivkWAbmK2RAzmMI4kurDnwty
 HtO77XCyXV85A2Qk6QWOj9YdOdBZrMDVUPx+QYbjVkfKfvLPBXqobtaXEqYhtppypvoP
 GIS+vVZ5llW4syFrtKietG9293fal9rDklf2KxYFH1ATQ2DIKcPAhKgUXjEbi+eqYpOA
 NMfLeEdArISjq0C3eI5COF2FeAy0PfuFlBkxATJoJ0SxgDlcIGv1FK4JkQDhAroSBOPT
 ZmS2sfnSPIq4aF4BfRkyuwnhCZNG6Tf7jXDgEoidNxy6DFdPB+R3sXeRLwGQp7Pvnf8X
 johA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ib2LJQLd
Subject: [Buildroot] [PATCH 1/1] package/python-idna: bump to version 3.6
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

License file hash changed due to year update:
https://github.com/kjd/idna/commit/89cd0612146a50a720e5aef8f040ca8ed4c6274b

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-idna/python-idna.hash | 6 +++---
 package/python-idna/python-idna.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-idna/python-idna.hash b/package/python-idna/python-idna.hash
index 3a758a6eac..5e6ac716a2 100644
--- a/package/python-idna/python-idna.hash
+++ b/package/python-idna/python-idna.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/idna/json
-md5  13ea24e076212b6baae1135a116d1e0e  idna-3.4.tar.gz
-sha256  814f528e8dead7d329833b91c5faa87d60bf71824cd12a7530b5526063d02cb4  idna-3.4.tar.gz
+md5  70f4beef4feb196ac64b75a93271f53c  idna-3.6.tar.gz
+sha256  9ecdbbd083b06798ae1e86adcbfe8ab1479cf864e4ee30fe4e46a003d12491ca  idna-3.6.tar.gz
 # Locally computed sha256 checksums
-sha256  a2d6e4d940bd24dbe7b9645cde19a9792cc51db7ae0d5acd301ac860caa3e836  LICENSE.md
+sha256  cb2faf0ca18c6d387ec7cb66f321939fba6e67e9dac09d31477cb9d8d3fe6899  LICENSE.md
diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index 3976cb1518..eb92432bd3 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IDNA_VERSION = 3.4
+PYTHON_IDNA_VERSION = 3.6
 PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
-PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/8b/e1/43beb3d38dba6cb420cefa297822eac205a277ab43e5ba5d5c46faf96438
+PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/bf/3f/ea4b9117521a1e9c50344b909be7886dd00a519552724809bb1f486986c2
 PYTHON_IDNA_LICENSE = BSD-3-Clause
 PYTHON_IDNA_LICENSE_FILES = LICENSE.md
 PYTHON_IDNA_SETUP_TYPE = flit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
